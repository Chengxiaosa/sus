import sys 
sys.path.append("..") 
from backend.resources.system.db import DB
import numpy as np
import time
import os
import tensorflow as tf
from tensorflow.keras.preprocessing import sequence
from judge.util_html import read_list_from_suffix
from log import Log
import json
from collections import defaultdict
import datetime
from judge.encoder_decoder import Encoder_Decoder
from tensorflow.python.client import device_lib
import tensorflow.contrib.slim as slim

logger = Log()
benign_category = [('alexa', -2), ('corner_case', -1)]
malicious_category = [('uncategory', 0), ('bocai', 1), ('daikuan', 2), ('licai', 3), ('maochong', 4),('zhibojian',5)]

tfconfig = tf.ConfigProto(log_device_placement=False)
tfconfig.gpu_options.per_process_gpu_memory_fraction = 0.7  # 每个GPU现存上届控制在70%以内
tfconfig.gpu_options.allow_growth = True

max_len = 700
epochs = 20
batch_size = 32
rnn_size = 32
rnn_num_layers = 1
embedding_dim = 100
learning_rate = 0.001
vocab_size = 7089
display_step = 10
predict_batch_size = 1024

class EncoderDecoder(object):
    def model_inputs(self, batch_size):
        self.sources = tf.placeholder(shape=(batch_size, None), dtype=tf.int32, name='sources')
        self.sources_length = tf.placeholder(shape=(batch_size,), dtype=tf.int32, name='sources_length')
        self.targets = tf.placeholder(shape=(batch_size, None), dtype=tf.int32, name='targets')
        self.targets_length = tf.placeholder(shape=(batch_size,), dtype=tf.int32, name='targets_length')

    def __init__(self,model_name,vocab_size, batch_size, embedding_dim, rnn_size, teacher_forcing, beam_num, learning_rate):
        self.model_inputs(batch_size)
        with tf.variable_scope(model_name):
            with tf.variable_scope("encoder"):
                encoder_embedding = tf.Variable(tf.random_uniform([vocab_size, embedding_dim]), dtype=tf.float32, name='encoder_embedding')
                encoder_inputs_embedded = tf.nn.embedding_lookup(encoder_embedding, self.sources)
                gru_cells = tf.contrib.rnn.MultiRNNCell([tf.nn.rnn_cell.GRUCell(rnn_size)])
                encoder_outputs, encoder_states = tf.nn.dynamic_rnn(gru_cells, encoder_inputs_embedded, self.sources_length, dtype=tf.float32)
                encoder_states = encoder_states[0]

            with tf.variable_scope("decoder"):
                decoder_embedding = tf.Variable(tf.random_uniform([vocab_size, embedding_dim]), dtype=tf.float32, name='decoder_embedding')
                tokens_go = tf.ones([batch_size], dtype=tf.int32, name='tokens_GO') * 380 # GO = 380
                
                if teacher_forcing:
                    decoder_inputs = tf.concat([tf.reshape(tokens_go,[-1,1]), self.targets[:,:-1]], 1)
                    helper = tf.contrib.seq2seq.TrainingHelper(tf.nn.embedding_lookup(decoder_embedding, decoder_inputs), self.targets_length)
                else:
                    helper = tf.contrib.seq2seq.GreedyEmbeddingHelper(decoder_embedding, tokens_go, 390)
                    
                with tf.variable_scope("gru_cell"):
                    decoder_cell = tf.nn.rnn_cell.GRUCell(rnn_size)
                    if beam_num > 1:
                        tiled_encoder_outputs = tf.contrib.seq2seq.tile_batch(encoder_outputs, multiplier=beam_num)
                        tiled_sequence_length = tf.contrib.seq2seq.tile_batch(self.sources_length, multiplier=beam_num)
                        attention_mechanism = tf.contrib.seq2seq.BahdanauAttention(num_units=rnn_size, memory=tiled_encoder_outputs, memory_sequence_length=tiled_sequence_length)
                        decoder_cell = tf.contrib.seq2seq.AttentionWrapper(decoder_cell, attention_mechanism)
                        tiled_encoder_final_state = tf.contrib.seq2seq.tile_batch(encoder_states, multiplier=beam_num)
                        tiled_decoder_initial_state = decoder_cell.zero_state(batch_size=batch_size*beam_num, dtype=tf.float32).clone(cell_state=tiled_encoder_final_state)
                        decoder_initial_state = tiled_decoder_initial_state
                    else:
                        attention_mechanism = tf.contrib.seq2seq.BahdanauAttention(num_units=rnn_size, memory=encoder_outputs, memory_sequence_length=self.sources_length)
                        decoder_cell = tf.contrib.seq2seq.AttentionWrapper(decoder_cell, attention_mechanism)
                        decoder_initial_state = decoder_cell.zero_state(batch_size=batch_size, dtype=tf.float32).clone(cell_state=encoder_states)
                        
                if beam_num > 1:
                    decoder = tf.contrib.seq2seq.BeamSearchDecoder(decoder_cell, decoder_embedding, tokens_go, 390,  decoder_initial_state, beam_width=beam_num, output_layer=tf.layers.Dense(vocab_size))
                else:
                    decoder = tf.contrib.seq2seq.BasicDecoder(decoder_cell, helper, decoder_initial_state, output_layer=tf.layers.Dense(vocab_size))
                decoder_outputs, decoder_state, final_sequence_lengths = tf.contrib.seq2seq.dynamic_decode(decoder, maximum_iterations=tf.reduce_max(self.targets_length))
                
            if beam_num > 1:
                self.output = decoder_outputs.predicted_ids[:,:,0]
            else:	
                decoder_logits = decoder_outputs.rnn_output
                self.output = tf.argmax(decoder_logits, 2)
                sequence_mask = tf.sequence_mask(self.targets_length, dtype=tf.float32)
                self.loss = tf.contrib.seq2seq.sequence_loss(logits=decoder_logits, targets=self.targets, weights=sequence_mask)
                self.train_op = tf.train.AdamOptimizer(learning_rate=learning_rate).minimize(self.loss)

def insert_result(results):
    db = DB()
    original_sql_query = 'UPDATE fraud_crawler_event set ed_fraud=%s, ed_fraud_time=now() where crawler_id = %s;'
    db.executemany(original_sql_query, results)
    db.close()

def fetch_case(dir):
    case = list()
    lst = read_list_from_suffix(dir, 'tags')[:]
    for i in lst:
        with open(i) as fin:
            result = [int(x) for x in fin.read().split('\n')]
        case.append(result)
    return case

def fetch_task_vector(redis_key, batch_size):
    db = DB()
    vectors = list()
    crawler_ids = list()
    redis_data = db.batchpop(redis_key, batch_size)
    print(time.asctime(time.localtime(time.time())),db.len(redis_key))
    while len(redis_data) < predict_batch_size:
        time.sleep(100)
        print(time.asctime(time.localtime(time.time())), db.len(redis_key))
        redis_data += db.batchpop(redis_key, batch_size)
    logger.info(f"prepare to predict {len(redis_data)} cases")

    for byte_data in redis_data:
        json_data = json.loads(byte_data.decode('utf-8'))
        vec = json_data['vec']
        crawler_id = json_data['cid']
        vectors.append(vec)
        crawler_ids.append(crawler_id)
    logger.info(f"fetch {len(vectors)} normal length samples")
    db.close()
    return vectors, crawler_ids

def get_batches(sources, batch_size, max_len):
    print("source_lengths",len(sources),batch_size)
    for batch_i in range(0, len(sources)//batch_size):
        start_i = batch_i * batch_size
        sources_batch = sources[start_i:start_i + batch_size]
        targets_batch = list()
        for row in sources_batch:
            if len(row)>=max_len:
                targets_batch.append(row[:max_len-1]+[390])
            else: 
                targets_batch.append(row+[390])
        sources_batch = sequence.pad_sequences(sources_batch, maxlen=max_len, padding="post", truncating="post")
        targets_batch = sequence.pad_sequences(targets_batch, maxlen=max_len, padding="post", truncating="post")
        source_lengths = []
        for source in sources_batch:
            source_lengths.append(len(source))
        yield sources_batch,  source_lengths, targets_batch

def train(mal_case_dir, ben_case_dir, model_name, max_len):
    ben_case = list()
    mal_case = list()
    for cat, label in benign_category:
        ben_case = ben_case + fetch_case(ben_case_dir+cat)
    for cat, label in malicious_category:
        mal_case = mal_case + fetch_case(mal_case_dir+cat)

    logger.info('Build model ...')
    benign_model = EncoderDecoder("benign",vocab_size,batch_size,embedding_dim,rnn_size,True,1,learning_rate)
    malicious_model = EncoderDecoder("malicious",vocab_size,batch_size,embedding_dim,rnn_size,True,1,learning_rate)
    model_vars = tf.global_variables()
    slim.model_analyzer.analyze_vars(model_vars, print_info=True)
    logger.info('Train model ...')
    os.mkdir(model_name)
    try:
        with tf.Session(config=tfconfig) as sess:
            tf.summary.FileWriter('graph', sess.graph)
            saver = tf.train.Saver()
            sess.run(tf.global_variables_initializer())
            for epochs_i in range(epochs):
                for batch_i, (source_batch, sources_lengths, target_batch) in enumerate(get_batches(ben_case, batch_size, max_len)):
                    feed_dict = {benign_model.sources: source_batch, benign_model.sources_length: sources_lengths, benign_model.targets: target_batch, benign_model.targets_length: sources_lengths}
                    loss, _= sess.run([benign_model.loss,benign_model.train_op],feed_dict)
                    print("run",batch_i)
                    if batch_i % display_step == 0 and batch_i > 0:
                        batch_train = sess.run(benign_model.output,feed_dict)
                        print('Epoch {:>3} Batch {:>4}/{} - Loss: {:>6.4f}'.format(epochs_i, batch_i, len(ben_case) // batch_size, loss))
            saver.save(sess, model_name+"/benign")
        with tf.Session(config=tfconfig) as sess:
            tf.summary.FileWriter('graph', sess.graph)
            saver = tf.train.Saver()
            sess.run(tf.global_variables_initializer())
            for epochs_i in range(epochs):
                for batch_i, (source_batch, sources_lengths, target_batch) in enumerate(get_batches(mal_case, batch_size,max_len)):
                    feed_dict = {malicious_model.sources: source_batch, malicious_model.sources_length: sources_lengths, malicious_model.targets: target_batch, malicious_model.targets_length: sources_lengths}
                    loss, _= sess.run([malicious_model.loss,malicious_model.train_op],feed_dict)
                    if batch_i % display_step == 0 and batch_i > 0:
                        batch_train = sess.run(malicious_model.output,feed_dict)
                        print('Epoch {:>3} Batch {:>4}/{} - Loss: {:>6.4f}'.format(epochs_i, batch_i, len(mal_case) // batch_size, loss))
            saver.save(sess, model_name+"/malicious")
    except Exception as e:
        print(e)
        os.rmdir(model_name)

def cross_entropy(y, y_hat):
    y = y[0]
    y_hat = y_hat[0]
    delta = 1e-7
    return -np.sum(y_hat * np.log(y + delta))

def softmax(y):
    y_shift = y - np.max(y, axis=1, keepdims=True)
    y_exp = np.exp(y_shift)
    y_exp_sum = np.sum(y_exp, axis=1, keepdims=True)
    return y_exp / y_exp_sum

def avg_loss(mal_case_dir, ben_case_dir, ben_model, mal_model, ben_path,mal_path, max_len):
    ben_case = list()
    mal_case = list()
    for cat, label in benign_category:
        ben_case = ben_case + fetch_case(ben_case_dir+cat)
    for cat, label in malicious_category:
        mal_case = mal_case + fetch_case(mal_case_dir+cat)
    ben_result = list()
    mal_result = list()
    with tf.Session(config=tfconfig) as sess:
        saver = tf.train.Saver()
        saver.restore(sess, ben_path)
        for batch_i, (source_batch, sources_lengths, target_batch) in enumerate(get_batches(ben_case, batch_size,max_len)):
                feed_dict = {ben_model.sources: source_batch, ben_model.sources_length: sources_lengths, ben_model.targets: [[0]*max_len]*len(source_batch), ben_model.targets_length: [max_len]*len(source_batch)}
                predict_ben = sess.run(ben_model.output,feed_dict)
                ben_result.extend(predict_ben)
    with tf.Session(config=tfconfig) as sess:
        saver = tf.train.Saver()
        saver.restore(sess, mal_path)
        for batch_i, (source_batch, sources_lengths, target_batch) in enumerate(get_batches(mal_case, batch_size,max_len)):
                feed_dict = {mal_model.sources: source_batch, mal_model.sources_length: sources_lengths, mal_model.targets:[[0]*max_len]*len(source_batch), mal_model.targets_length: [max_len]*len(source_batch)}
                predict_mal = sess.run(mal_model.output,feed_dict)
                mal_result.extend(predict_mal)
    ben_case = sequence.pad_sequences(ben_case, maxlen=max_len, padding="post", truncating="post")
    mal_case = sequence.pad_sequences(mal_case,maxlen=max_len,padding="post",truncating="post")
    loss_ben = 0
    loss_mal = 0
    for i in range(len(ben_case)):
        ben_y = softmax([ben_result[i]])#np.array(ben_result[i]).reshape(-1,1)
        y_hat = softmax([ben_case[i]])#np.array(vectors[i])
        loss_ben += cross_entropy(ben_y,y_hat)
    logger.warning(f'avg ben loss:{loss_ben/len(ben_case)}')
    for i in range(len(mal_case)):
        mal_y = softmax([mal_result[i]])#np.array(mal_result[i]).reshape(-1,1)
        y_hat = softmax([mal_case[i]])#np.array(vectors[i])
        loss_mal += cross_entropy(mal_y,y_hat)
    logger.warning(f'avg mal loss:{loss_mal/len(mal_case)}')

def predict(ben_path,mal_path,ben_model,mal_model, predict_batch_size, max_len, sample_category):
    vectors, crawler_ids = fetch_task_vector('ed_source', predict_batch_size)
    if len(crawler_ids) == 0:
        return
    ben_result, mal_result = list(),list()
    with tf.Session(config=tfconfig) as sess:
        saver = tf.train.Saver()
        saver.restore(sess, ben_path)
        for batch_i, (source_batch, sources_lengths, target_batch) in enumerate(get_batches(vectors, batch_size,max_len)):
                feed_dict = {ben_model.sources: source_batch, ben_model.sources_length: sources_lengths, ben_model.targets: [[0]*max_len]*len(source_batch), ben_model.targets_length: [max_len]*len(source_batch)}
                predict_ben = sess.run(ben_model.output,feed_dict)
                ben_result.extend(predict_ben)
    with tf.Session(config=tfconfig) as sess:
        saver = tf.train.Saver()
        saver.restore(sess, mal_path)
        for batch_i, (source_batch, sources_lengths, target_batch) in enumerate(get_batches(vectors, batch_size,max_len)):
                feed_dict = {mal_model.sources: source_batch, mal_model.sources_length: sources_lengths, mal_model.targets:[[0]*max_len]*len(source_batch), mal_model.targets_length: [max_len]*len(source_batch)}
                predict_mal = sess.run(mal_model.output,feed_dict)
                mal_result.extend(predict_mal)
    
    # similarity - get y = [0,1,1,0]
    result_cnt = defaultdict(int)
    ml_results = list()
    db = DB()
    print("task:",len(crawler_ids),"ben:",len(ben_result),"mal:",len(mal_result))
    vectors = sequence.pad_sequences(vectors, maxlen=max_len, padding="post", truncating="post")
    for i in range(len(crawler_ids)):
        ben_y = softmax([ben_result[i]])[0]#np.array(ben_result[i]).reshape(-1,1)
        mal_y = softmax([mal_result[i]])[0]#np.array(mal_result[i]).reshape(-1,1)
        y_hat = softmax([vectors[i]])[0]#np.array(vectors[i])
        loss_ben = cross_entropy(ben_y,y_hat)
        loss_mal = cross_entropy(mal_y,y_hat)
        logger.info(f'crawler_id:{crawler_ids[i]},loss_ben:{loss_ben},loss_mal:{loss_mal}')
        pred = 1 if loss_ben > loss_mal else 0
        target_category_name = sample_category[pred][0]
        result_cnt[target_category_name] += 1
        ml_results.append((int(pred), crawler_ids[i]))
    
    db.close()
    logger.warning(result_cnt)
    insert_result(ml_results)

if __name__ == '__main__':
    mal_case_dir = '/home/miniwmy/samples/groundtruth/'  # malicious case dir
    ben_case_dir = '/home/miniwmy/samples/benign_sample/' # benign case dir

    model_name = "../models/bin_model_iv"
    
    if not os.path.isdir(os.getcwd()+"/"+model_name):
        train(mal_case_dir, ben_case_dir, model_name, max_len)

    ben_path = model_name+'/benign'
    mal_path = model_name+'/malicious'
    predict_category = [('alexa', 0), ('fraud', 1)]
    ben_model = EncoderDecoder("benign",vocab_size,batch_size,embedding_dim,rnn_size,False,3,learning_rate)
    mal_model = EncoderDecoder("malicious",vocab_size,batch_size,embedding_dim,rnn_size,False,3,learning_rate)
    thread_start = time.time()
    loop_cnt = 0
    avg_loss(mal_case_dir,ben_case_dir,ben_model,mal_model,ben_path,mal_path,max_len)
    while True:
        loop_start = time.time()
        predict(ben_path, mal_path,ben_model,mal_model,predict_batch_size,max_len,predict_category)
        loop_seconds = time.time() - loop_start
        thread_seconds = time.time() - thread_start
        logger.warning(
            f'thread has run {loop_cnt} loops {str(datetime.timedelta(seconds=int(loop_seconds)))} {str(datetime.timedelta(seconds=int(thread_seconds)))}')
        loop_cnt += 1