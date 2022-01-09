import sys
sys.path.append("..") 
from db import DB
from log import Log
from multiprocessing import Pool
from config import config
import time
from judge.util_html import create_tokenizer, parse_html
import json

logger = Log()

def prefetch(batch_size):
    db = DB()
    file_base_path = config['seaweedfs']
    loop_cnt = 0
    tokenizer = create_tokenizer("../keywords.json")
    target_key = "mul_ml_source"
    while True:
        time.sleep(1)
        try:
            tasks = [x.decode('utf-8') for x in db.batchpop('fraud_crawler_result',batch_size)]
            logger.info(f"fetch {len(tasks)} from redis with key fraud_crawler_result")
            for crawler_id in tasks:
                vec = parse_html(tokenizer, file_base_path+str(crawler_id)+'/page.html')
                vec = [int(i) for i in vec]
                data = {'cid':crawler_id, 'vec': vec}
                db.push(target_key,json.dumps(data))
                logger.info("push to {} with len {}".format(target_key,len(vec)))
        except Exception as e:
            print(e)
        finally:
            loop_cnt += 1
            logger.info(f"loop cnt {loop_cnt}")
    db.close_redis()

if __name__ == '__main__':
    if not sys.argv[1].isnumeric():
        # push some data to fraud_crawler_result
        db = DB()
        rows = db.fetch(
            'select crawler_id, target_url from fraud_crawler_event where ml_fraud=1 and ml_fraud_test_time > "2021-03-01 00:00:00" and ml_fraud_test_time < "2021-03-28 00:00:00" and ml_multi_fraud is not null;')
        key_name = 'fraud_crawler_result'
        logger.info(len(rows))
        logger.warning(f'before push redis  {db.len(key_name)}')
        for crawler_id, url in rows:
            db.push(key_name, crawler_id)
        logger.warning(f'after push redis  {db.len(key_name)}')
        exit()
    parallel_size = int(sys.argv[1])
    batch_size = int(sys.argv[2])
    with Pool(processes=parallel_size) as pool:
        logger.warning(f"start {parallel_size} process!")

        tasks_lst = [ (batch_size,) for i in range(parallel_size)]
        results = pool.starmap(prefetch, tasks_lst)

        pool.close()
        pool.join()