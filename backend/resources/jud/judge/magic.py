import sys 
sys.path.append("..")
from pathlib import Path
import json
from judge.util_html import read_list_from_suffix
import sys
from sklearn.model_selection import train_test_split
from tensorflow.keras.callbacks import EarlyStopping
from tensorflow.keras.preprocessing import sequence
from sklearn.metrics import accuracy_score,recall_score,precision_score,f1_score
from judge.text_cnn import TextCNN
import numpy as np
from log import Log
import tensorflow as tf
import tensorflow.keras.backend as K
from tensorflow.keras.models import load_model
from collections import defaultdict,Counter
from tensorflow.keras.utils import to_categorical
import os
import datetime
import pymysql
import time
from db import DB

logger = Log()

benign_category = [('alexa', -2), ('corner_case', -1)]
malicious_category = [('uncategory', 0), ('bocai', 1), ('daikuan', 2), ('licai', 3), ('maochong', 4),('zhibojian',5)]

def insert_result(results,multi=False):
    db = DB()
    if multi:
        original_sql_query = 'UPDATE fraud_crawler_event set ml_multi_fraud=%s, ml_multi_fraud_time=now() where crawler_id = %s;'
    else:
        original_sql_query = 'UPDATE fraud_crawler_event set ml_fraud=%s, ml_fraud_test_time=now() where crawler_id = %s;'
    db.executemany(original_sql_query, results)
    db.close()

def fetch_dir_vector_with_label(base_path, label_to_be_attached,path=False):
    X = list()
    y = list()
    paths = list()
    lst = read_list_from_suffix(base_path, 'tags')[:]
    for idx in lst:
        result = list()
        open_path = str(idx)
        with open(open_path) as fin:
            result = [int(x) for x in fin.read().split('\n')]
        if len(result) < 50:
            continue
        X.append(result)
        y.append(label_to_be_attached)
        paths.append(str(idx).replace("tags","png"))
    return X, y, paths

def fetch_task_vector(redis_key, batch_size):
    db = DB()
    vectors, crawler_ids,json_strs = list(), list(), list()
    too_short_list = list()
    redis_data = db.batchpop(redis_key, batch_size)
    print(db.len(redis_key))
    while len(redis_data) < 1000:
        time.sleep(100)
        print(db.len(redis_key))
        redis_data += db.batchpop(redis_key, batch_size)
    logger.info(f"prepare to predict {len(redis_data)} cases")

    for byte_data in redis_data:
        json_data = json.loads(byte_data.decode('utf-8'))
        vec = json_data['vec']
        crawler_id = json_data['cid']
        if len(vec) < 50:
            too_short_list.append(crawler_id)
            continue
        json_strs.append(json_data)
        vectors.append(vec)
        crawler_ids.append(crawler_id)
    logger.info(f"fetch {len(vectors)} normal length samples")
    db.close()
    return vectors, crawler_ids, json_strs, too_short_list

def focal_loss(alpha=0.75, gamma=2.0):
    def focal_loss_fixed(y_true, y_pred):
        ones = K.ones_like(y_true)
        alpha_t = y_true*alpha + (ones-y_true)*(1-alpha)
        p_t = y_true*y_pred + (ones-y_true)*(ones-y_pred) + K.epsilon()
        focal_loss = -alpha_t * K.pow((ones-p_t),gamma) * K.log(p_t)
    return focal_loss_fixed

def class_weight_func(y_train):
    count_res = dict(Counter(y_train))
    print(count_res)
    for key in count_res.keys():
        count_res[key] = round(len(y_train) / count_res[key], 2)
    return count_res

def train(X,y, maxlen, epochs, model_name, max_features, embedding_dims, batch_size):
    x_train, x_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
    print(len(x_train), 'train sequences')
    print(len(x_test), 'test sequences')
    class_weight=class_weight_func(y_train)

    print('Pad sequences (samples x time)...')
    x_train = sequence.pad_sequences(x_train, maxlen=maxlen,padding="post",truncating="post")
    x_test = sequence.pad_sequences(x_test, maxlen=maxlen,padding="post",truncating="post")
    y_train = to_categorical(y_train)
    y_test = to_categorical(y_test)
    print('x_train shape:', x_train.shape)
    print('x_test shape:', x_test.shape)

    print('Build model...')
    model = TextCNN(maxlen, max_features, embedding_dims, class_num=max(y) + 1)
    model.compile('adam', 'binary_crossentropy', metrics=['accuracy'])
#loss=focal_loss(gamma=1, alpha=0.75)
    print('Train...')
    early_stopping = EarlyStopping(monitor='val_accuracy', patience=3, mode='max')
    model.fit(x_train, y_train,batch_size=batch_size,epochs=epochs,callbacks=[early_stopping],validation_data=(x_test, y_test),class_weight=class_weight)
    model.save(model_name)
    return model

def train_bin(sample_category,mal_case_dir,ben_case_dir, maxlen, epochs, model_name, max_features, embedding_dims, batch_size):
    X, y = list(), list()
    for cat, label in sample_category:
        if label >= 0:
            Xt, yt, _ = fetch_dir_vector_with_label(mal_case_dir + cat, 1)
            X = X + Xt
            y = y + yt
        else:
            Xt, yt, _ = fetch_dir_vector_with_label(ben_case_dir + cat, 0)
            X = X + Xt
            y = y + yt
    return train(X,y,maxlen, epochs, model_name, max_features, embedding_dims, batch_size)

def train_mul(malicious_category,mal_case_dir,  maxlen, epochs, model_name, max_features, embedding_dims, batch_size):
    X, y = list(), list()
    for cat, label in malicious_category:
        Xt, yt, _ = fetch_dir_vector_with_label(mal_case_dir + cat, label)
        X = X + Xt
        y = y + yt
    return train(X,y,maxlen, epochs, model_name, max_features, embedding_dims, batch_size)

def predict_init(debug_png_dir, sample_category):
    __import__("shutil").rmtree(debug_png_dir)
    sample_category=["1_alexa","0_alexa","1_fraud","0_fraud","fail_0","fail_1","fail","alexa","fraud",'0_uncategory','0_licai','1_bocai','1_uncategory','fail_1','1_licai','2_daikuan','2_bocai','fail_2','3_licai','3_bocai','3_uncategory','fail_3','4_maochong', '5_zhibojian', 'fail_5']
    for category_name in sample_category:
        sample_dir = Path(debug_png_dir + category_name)
        if not sample_dir.exists():
            sample_dir.mkdir(parents=True)

def predict(debug_mode, model, sample_category, maxlen, result_dir, predict_batch_size):
    logger.info('Predict...')
    x_reald_world, cid_reald_world, json_strs, too_short_list = fetch_task_vector('ml_source', predict_batch_size)
    if len(cid_reald_world) == 0:
        return
    x_reald_world = sequence.pad_sequences(x_reald_world, maxlen=maxlen,padding="post",truncating="post")
    predict_results = model.predict(x_reald_world)
    result_cnt = defaultdict(int)
    ml_results = [(-1, x) for x in too_short_list]
    mul_num = 0
    db = DB()
    for idx, predict_result in enumerate(predict_results):
        max_category_id = np.argmax(predict_result)
        score = predict_result[max_category_id]
        if score > 0.8 or max_category_id == 0:
            target_category_name = sample_category[max_category_id][0]
            ml_decision = max_category_id
        else:
            print(f'fail {score}')
            target_category_name = 'fail'
            ml_decision = -1

        result_cnt[target_category_name] += 1
        cid = cid_reald_world[idx]
        ml_results.append((int(ml_decision), cid))

        if debug_mode and idx % 20 == 0:
            cmd = 'cp /home/syang/seaweedfs/data/mount/work_of_scam/webpage/{}/screenshot.png {}{}/{}-{:.2f}.png'.format(
                cid, result_dir, target_category_name, cid, score)
            os.system(cmd)
        if not debug_mode and int(ml_decision) == 1:
            json_str = json_strs[idx]
            db.push('mul_ml_source', json_str)
            mul_num += 1
    db.close()

    logger.warning(result_cnt)
    insert_result(ml_results)
    return mul_num

def predict_mul(debug_mode,model, sample_category, maxlen, result_dir, mul_num):
    logger.info('Predict multiple...')
    x_reald_world, cid_reald_world, _, _ = fetch_task_vector('mul_ml_source', mul_num)
    if len(cid_reald_world) == 0:
        return
    x_reald_world = sequence.pad_sequences(x_reald_world, maxlen=maxlen,padding="post",truncating="post")
    predict_results = model.predict(x_reald_world)
    result_cnt = defaultdict(int)
    mul_ml_results = list()

    db = DB()
    for idx, predict_result in enumerate(predict_results):
        max_category_id = np.argmax(predict_result)
        score = predict_result[max_category_id]
        if score > 0.8:
            target_category_name = sample_category[max_category_id][0]
            ml_decision = max_category_id
        else:
            print(f'fail {score}')
            target_category_name = 'fail'
            ml_decision = -1

        result_cnt[target_category_name] += 1
        cid = cid_reald_world[idx]
        mul_ml_results.append((int(ml_decision), cid))

        if debug_mode and idx % 20 == 0:
            cmd = 'cp /home/syang/seaweedfs/data/mount/work_of_scam/webpage/{}/screenshot.png {}{}/{}-{:.2f}.png'.format(
                cid, result_dir, target_category_name, cid, score)
            os.system(cmd)
    db.close()

    logger.warning(result_cnt)
    insert_result(mul_ml_results,True)

def evaluate(debug_mode, model, source_category,sample_category, maxlen, evaluate_dir,result_dir):
    logger.info('Predict...')
    X, y, paths = list(), list(), list()
    for cat, label in source_category:
        targetLabel = 1 if label > 0 else 0
        Xt, yt,patht = fetch_dir_vector_with_label(mal_case_dir + cat, label,True)
        X = X + Xt
        y = y + yt
        paths = paths + patht

    x_reald_world = sequence.pad_sequences(X, maxlen=maxlen,padding="post",truncating="post")
    predict_results = model.predict(x_reald_world)
    result_cnt = defaultdict(int)
    ml_results = list()

    db = DB()
    y_preds = list()
    for idx, predict_result in enumerate(predict_results):
        max_category_id = np.argmax(predict_result)
        score = predict_result[max_category_id]
        y_preds.append(max_category_id)

        if score > 0.75:
            # move to target
            target_category_name = "{}_{}".format(y[idx],sample_category[max_category_id][0])
            ml_decision = max_category_id
        else:
            print(f'fail {score}')
            # move to GG
            target_category_name = "fail_{}".format(y[idx])
            ml_decision = -1

        result_cnt[target_category_name] += 1
        cur_path = paths[idx]
        cid = str(cur_path).split("/")[-1]

        cmd = 'cp {} {}{}/{}-{:.2f}.png'.format(cur_path, result_dir, target_category_name, cid, score)
        os.system(cmd)

    db.close()

    acc = accuracy_score(y,y_preds)
    precision = precision_score(y,y_preds,average='weighted')
    recall = recall_score(y, y_preds,average='weighted')
    f1score = f1_score(y,y_preds,average='weighted')

    print("{} - {} - {} - {}".format(acc,precision,recall,f1score))

    logger.warning(result_cnt)
if __name__ == '__main__':

    config = tf.compat.v1.ConfigProto(log_device_placement=False)
    # config.gpu_options.per_process_gpu_memory_fraction = 0.7  # 每个GPU现存上届控制在70%以内
    config.gpu_options.allow_growth = True  # on demand
    session = tf.compat.v1.Session(config=config)
    tf.compat.v1.keras.backend.set_session(session)

    ml_maxlen = 5000
    mul_maxlen = 20000
    predict_batch_size = 1000
    epochs = 20
    max_features = 8000
    batch_size = 32
    embedding_dims = 300
    debug_mode = False
    if len(sys.argv) == 2 and sys.argv[1] == '-d':
        debug_mode = True

    # Train
    mal_case_dir = '/home/miniwmy/samples/groundtruth/'  # malicious case dir
    ben_case_dir = '/home/miniwmy/samples/benign_sample/' # benign case dir

    bin_model_name = "models/bin_model_xvii"
    mul_model_name = "models/mul_model_iv"
    bin_fname = os.getcwd()+"/"+bin_model_name
    if os.path.isdir(bin_fname):
        logger.warning('start to READ bin model')
        bin_model = load_model(bin_model_name)
        logger.warning('successfully READ bin model')
    else:
        logger.warning('start to retrain bin model')
        bin_model = train_bin(benign_category + malicious_category, mal_case_dir,ben_case_dir, maxlen, epochs, bin_model_name, max_features, embedding_dims, batch_size)
        logger.warning('successfully retrain bin model')
    mul_fname = os.getcwd()+"/"+mul_model_name
    if os.path.isdir(mul_fname):
        logger.warning('start to READ mul model')
        mul_model = load_model(mul_model_name)
        logger.warning('successfully READ mul model')
    else:
        logger.warning('start to retrain mul model')
        mul_model = train_mul(malicious_category,mal_case_dir, mul_maxlen, epochs, mul_model_name, max_features, embedding_dims, batch_size)
        logger.warning('successfully retrain mul model')
        
    # predict
    debug_png_dir = '/home/miniwmy/samples/ml_result/'  # path to save the screenshot of websites for debug

    predict_category = [('alexa', 0), ('fraud', 1)]
    predict_init(debug_png_dir, predict_category)  # make dirs for debug

    thread_start = time.time()
    loop_cnt = 0
    #evaluate(debug_mode,mul_model,malicious_category,malicious_category,mul_maxlen,mal_case_dir,debug_png_dir)
    while True:
        loop_start = time.time()
        mul_num = predict(True, bin_model, predict_category, maxlen, debug_png_dir, predict_batch_size)
        predict_mul(debug_mode,mul_model,malicious_category,mul_maxlen,debug_png_dir,mul_num)
        
        loop_seconds = time.time() - loop_start
        thread_seconds = time.time() - thread_start

        logger.warning(
            f'thread has run {loop_cnt} loops {str(datetime.timedelta(seconds=int(loop_seconds)))} {str(datetime.timedelta(seconds=int(thread_seconds)))}')
        loop_cnt += 1
