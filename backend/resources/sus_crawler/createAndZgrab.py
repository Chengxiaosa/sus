
from cmath import log
from concurrent.futures import ThreadPoolExecutor
# from multiprocessing.dummy import Pool as ThreadPool
import multiprocessing as mp
import csv
from multiprocessing import pool 
import uuid
import sys
import time
import os

from sklearn.metrics import jaccard_score
sys.path.append("./backend/resources/sus_crawler")
from log_sus import Log
from urllib import parse
import traceback
from getFromDns import getIP
sys.path.append("./backend")
from db import DB
from configSys import config
sys.path.append("./backend/resources")
from all_in_one import all_in_one
from crawler.crawler import crawler
from zgrabP import run_zgrab,read_result_new, run_zgrab_new

Result_DIR = config['result_dir']
FILE_DIR = os.path.dirname(os.path.abspath(__file__))

logger=Log()
class  OP():
    def __init__(self) :
        self.manager = mp.Manager
        # 为什么这里一开始声明的时候没有括号 使用的时候要加括号？
        self.actionList = self.manager().list()
        # 下面这里应该传入crawler_id进来
    def joiningList(self,suid,domain,father_id,cluster_id):
        # time.sleep(0.1)
        # 入库的时候需要得到IP 
        ip = getIP(domain)                    
        self.actionList.append((suid,domain,father_id,ip,cluster_id))        
    def flow(self,resultUrls,father_id,cluster_id):
        pool = mp.Pool(40)
        # 这一方法和
        # 第一个是id，第二个是url
        tasks_lst = [ (resultUrl[0],resultUrl[1],father_id,cluster_id)for resultUrl in resultUrls]   
        pool.starmap(self.joiningList, tasks_lst)        
        pool.close()
        pool.join()
def insert_result(results,flag=False):
    db = DB()
    original_sql_query = 'insert into fraud_crawler_sustainable (crawler_id,target_url,task_create_time,sus_flag,father_id,ip,cluster_id) values (%s,%s,now(),1,%s,%s,%s);'
    db.executemany(original_sql_query, results)
    db.close()
def insertAction(domain,fatherID,clusterID):
    insert_sqls = []    
    uid = str(uuid.uuid4())
    suid = ''.join(uid.split('-'))
    # 入库的时候需要得到IP 
    ip = getIP(domain)
    insert_sqls.append('insert into fraud_crawler_sustainable (crawler_id,target_url,task_create_time,sus_flag,father_id,ip,cluster_id) values ("{}","{}",now(),1,"{}","{}",{});'.format(suid,domain,fatherID,ip,clusterID))    
    db1 = DB()
    db1.execute(insert_sqls)          
    db1.close()     
def startInsertAction(z):
    insertAction(z[0],z[1],z[2])


def createAndZgrab():
    db = DB()
    domains = set()
    # select targets
    # 选择库中所有价值flag为0的
    rows = db.fetch("select crawler_id, target_url,cluster_id from fraud_crawler_sustainable where value_flag = 0  ORDER BY task_create_time ASC;")

    db.close()
    # 进行域名生成
    # extract domains
    update_sqls = []
    rows_num= 0 
    for crawler_id_int, target_url ,cluster_id in rows:
        crawler_id = str(crawler_id_int)
        logger.info('当前处理的crawler_id: '+str(crawler_id))        
        rows_num = rows_num + 1 
        if rows_num == 5:
            break
        # if target_url.startswith('https'):
        #  domains |= extract_https_domain(crawler_id)
        # 先对他进行一下爬取 
        tmp = list()
        # 1存的是单个的
        update_sqls.append(( 'UPDATE fraud_crawler_sustainable set value_flag=1  where crawler_id ="{}";'.format(crawler_id)))
        update_sqls1= []
        update_sqls1.append(( 'UPDATE fraud_crawler_sustainable set value_flag=1  where crawler_id ="{}";'.format(crawler_id)))
        rs = parse.urlparse(target_url)
        # 这里实现的是一个避免重复生成的过程
        thisDomain = rs.netloc or rs.path

        tmp.append([thisDomain,crawler_id])
        # logger.info('开启爬虫crawler_id: '+crawler_id)               

        # # crawler(tmp, set()) 
        # logger.info('结束爬虫crawler_id: '+crawler_id)              
        list_path = Result_DIR+'/crawler/crawler_result/'+crawler_id+'/'
        # 判断爬虫是否成功：    
        if not os.path.isdir(list_path):     
            db = DB()
            db.execute(update_sqls1)          
            db.close() 
            continue
        else:   
            insert_sqls = []
            try:        
                # 可持续爬虫不需要中间的结果 只需要记录下来活得就可以
                dict = all_in_one(thisDomain)
                # 写入possible中使用zgrab进行扫描 -zgrab 需要txt进行一个扫描
                
                filepath = list_path+'Possible.txt'
                fd = open(filepath, mode='w', encoding='utf-8')
                for i in dict.keys():
                    for d in dict[i]:
                                url =d
                                fd.write(url)
                                fd.write('\n')     
                fd.close() 
                # zgrab进行扫描
                logger.debug("run_zgrab_new:"+thisDomain)
                run_zgrab_new(thisDomain,crawler_id)              
                urls443,urls80 = read_result_new(thisDomain,crawler_id) 
                resultUrls443 = ['https://'+i for i in list(urls443)]
                resultUrls80 = ['http://'+i for i in list(urls80)]                
                resultUrlsList =  resultUrls443+resultUrls80
                resultUrls = set(resultUrlsList)
                # 先获得数据库中最大的ID 
                db = DB()
                rows_max = db.fetch("select Max(crawler_id) crawler_id from fraud_crawler_sustainable;")                
                maxid = rows_max[0][0]
                db.close()                
                # 在这里分配ID号
                resultUrls = list()
                result_num = 0 
                for item in resultUrlsList:
                    result_num= result_num+1
                    item_crawler_id = maxid +result_num
                    item_url = item
                    resultUrls.append((item_crawler_id,item_url))
                logger.info("开始生成插入语句，长度:"+str(len(resultUrls)))
                op = OP()
                op.flow(resultUrls,crawler_id,cluster_id)
                logger.info("完成生成插入语句，长度:"+str(len(resultUrls)))                                  
                # with ThreadPoolExecutor(max_workers=5) as pool:
                #     pool.map(insertAction, actionList)       
                logger.info("开始执行插入语句:"+str(len(resultUrls)))    
                insert_result(op.actionList)          
                logger.info("完成执行插入语句:"+str(len(resultUrls)))                                  
                db = DB()                
                db.execute(update_sqls1)      
                db.close()                
                                                      
            except Exception as e:
                logger.debug("异常")
                logger.debug(sys.exc_info()[0:2]) # 打印错误类型，错误值
                logger.debug(traceback.extract_tb(sys.exc_info()[2])) #出错位置
    db = DB()
    db.execute(update_sqls)      
    logger.debug("更新数据库状态value为1")       
    db.close()
    
if __name__ == '__main__':
    createAndZgrab()