
import csv 
import uuid
import sys
import os
from urllib import parse
import logging
import traceback
sys.path.append("./backend")
from db import DB
from configSys import config
sys.path.append("./backend/resources")
from all_in_one import all_in_one
from crawler.crawler import crawler
from zgrabP import run_zgrab,read_result_new, run_zgrab_new

Result_DIR = config['result_dir']
FILE_DIR = os.path.dirname(os.path.abspath(__file__))

# 动态爬去所有状态为1的 将其状态设置为2 
def crawlerAll():
    db = DB()
    domains = set()
    crawlerAll_flag = 1
    # select targets
    # 选择库中所有价值flag为0的
    rows = db.fetch("select crawler_id, target_url from fraud_crawler_sustainable where sus_flag = 1 ;")
    db.close()    
    # 进行域名生成
    # extract domains
    tmp = set()    
    insert_sqls = [] 
    num = 0 
    try:   
        # 这里面就是两个形参 不具备字典作用
        for crawler_id,target_url in rows:
            num = num+1
            # 进行动态爬虫
            tmp.add(target_url)
            insert_sqls.append( 'UPDATE fraud_crawler_sustainable set sus_flag=2  where crawler_id ="{}";'.format(crawler_id))      
            if num >20 :
                crawlerAll_flag = 0 
                break
        crawler(tmp, set())           
        # 结束完了之后 将 状态为1 设置为状态为2

    except:
        logging.debug("更新爬虫状态异常")
        logging.debug(sys.exc_info()[0:2]) # 打印错误类型，错误值
        logging.debug(traceback.extract_tb(sys.exc_info()[2])) #出错位置        
    db = DB()        
    db.execute(insert_sqls)    
    # logging.debug("更新数据库状态为2成功")    
    print("更新数据库状态为2成功")
    logging.debug(len(insert_sqls))    
    print(len(insert_sqls))
    db.close()    
    return crawlerAll_flag    

if __name__ == '__main__':
    crawlerAll()
