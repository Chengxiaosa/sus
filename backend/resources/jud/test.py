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
from judge.pre_test import create_tokenizer, parse_html

logger = Log()

benign_category = [('alexa', -2), ('corner_case', -1)]
malicious_category = [('uncategory', 0), ('bocai', 1), ('daikuan', 2), ('licai', 3), ('maochong', 4),('zhibojian',5)]


def fetch_task_vector(redis_key, batch_size):
    db = DB()
    vectors, crawler_ids,json_strs = list(), list(), list()
    too_short_list = list()
    redis_data = db.range(redis_key, 0, 2)
    print(db.len(redis_key))
    '''while len(redis_data) < 1000:
        time.sleep(100)
        print(db.len(redis_key))
        redis_data += db.batchpop(redis_key, batch_size)
    logger.info(f"prepare to predict {len(redis_data)} cases")'''

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

def fetch_dir_vector_with_label(base_path, label_to_be_attached,path=False):
    X = list()
    y = list()
    paths = list()
    lst = read_list_from_suffix(base_path, 'tags')[:]
    lst = lst[1:5]
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

def train_bin(sample_category,mal_case_dir,ben_case_dir):
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
    return X, y

       
if __name__ == '__main__':
    crawler_id = sys.argv[1]
    config = tf.compat.v1.ConfigProto(log_device_placement=False)
    config.gpu_options.per_process_gpu_memory_fraction = 0.7  # 每个GPU现存上届控制在70%以内
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

    mal_case_dir = '/home/miniwmy/samples/groundtruth/'  # malicious case dir
    ben_case_dir = '/home/miniwmy/samples/benign_sample/' # benign case dir

    bin_model_name = "/home/miniwmy/fraud-detection/models/bin_model_xvi/"
    
    mul_model_name = "/home/miniwmy/Fraud-crawler-detection/judge/models/mul_model_vi/"
    mul_model = load_model(mul_model_name)
    bin_model = load_model(bin_model_name)

    category = [('maochong', 4)]
    X, y = train_bin(category, mal_case_dir, ben_case_dir)
    # print(X)

    tokenizer = create_tokenizer("./keywords.json")
    vec = parse_html(tokenizer, "/home/yuzhexuan/crawler_result/"+crawler_id+"/page.html")
    # print("vec")
    # print(vec)
    X=[]
    X.append(vec)

    x_reald_world = sequence.pad_sequences(X, maxlen=mul_maxlen,padding="post",truncating="post")
    print(x_reald_world)
    predict_results = mul_model.predict(x_reald_world)
    print(predict_results)
    x_reald_world = sequence.pad_sequences(X, maxlen=ml_maxlen,padding="post",truncating="post")
    predict_results = bin_model.predict(x_reald_world)
    print(predict_results)

    