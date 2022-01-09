from log import Log
import random
import json
import os
import schedule
import time

from db import DB
from config import config
from util import get_today, get_yesterday, get_nday_before

logger = Log()

def add_task_to_redis(key, sql):
    db = DB()
    redis = db.get_redis()

    current_length = redis.llen(key)
    logger.info('{}:{}'.format(key,current_length))

    if current_length == 0:
        logger.info('now add {}'.format(key))
        rows = db.fetch(sql)
        rows = [(i,j) for i,j in rows]
        random.shuffle(rows)

        if key == 'fraud_crawler':
            for crawler_id, target_url in rows:
                task = {"crawler_id": crawler_id, "target_url": target_url}
                redis.lpush(key, json.dumps(task))
        elif key == 'fraud_crawler_result':
            for crawler_id, target_url in rows:
                if os.path.exists('{path}{id}'.format(path=config['seaweedfs'],id=crawler_id)):
                    redis.lpush(key, crawler_id)
                else:
                    print(f'{crawler_id} err')
        current_length = redis.llen(key)
        logger.info('{}:{}'.format(key,current_length))
    db.close()

def add_crawler_task():
    key = "fraud_crawler"
    # 疑似有问题
    sql = "select crawler_id, target_url from fraud_crawler_event where (web_status_code is null or web_status_code=-1) and crawler_id > 8734306 and task_create_time > '{}';".format(get_nday_before(1))
    add_task_to_redis(key, sql)

def add_judge_task():
    key = "fraud_crawler_result"
    sql = "select crawler_id, target_url from fraud_crawler_event where web_status_code=200 and ml_fraud is null and task_finish_time > '2020-11-30 00:00:00';"
    add_task_to_redis(key, sql)

if __name__ == "__main__":
    add_crawler_task()
    add_judge_task()

    schedule.every(5).minutes.do(add_crawler_task)
    schedule.every(5).minutes.do(add_judge_task)

    while True:
        schedule.run_pending()
        # time.sleep(1)