
import csv 
import uuid
import sys
import os
import logging
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
logging.basicConfig(filename='std.log', filemode='w', format='%(name)s - %(levelname)s - %(message)s',level=logging.DEBUG)

logger=logging.getLogger() 

#Now we are going to Set the threshold of logger to DEBUG 
logger.setLevel(logging.DEBUG)
# 终端Handler
consoleHandler = logging.StreamHandler()
consoleHandler.setLevel(logging.DEBUG)
# 文件Handler
fileHandler = logging.FileHandler('log.log', mode='w', encoding='UTF-8')
fileHandler.setLevel(logging.NOTSET)
# Formatter
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
consoleHandler.setFormatter(formatter)
fileHandler.setFormatter(formatter)
# 添加到Logger中
logger.addHandler(consoleHandler)
logger.addHandler(fileHandler)
    # 处理结束后将其价值设置为1
    # 进行域名生成对其分配UUID 
    # 对生成域名进行动态扫描找到80端口和443端口
    # 对生成的域名进行入库 状态设置成1 
    #  对所有状态为1 的进行动态扫描
    # 状态变成2 
    # 对所有状态为2的进行判断 
    # 如果是爬虫失败的情况设置成-1
    # 如果是

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
    for crawler_id, target_url ,cluster_id in rows:
        rows_num = rows_num + 1 
        if rows_num == 5:
            break
        # if target_url.startswith('https'):
        #  domains |= extract_https_domain(crawler_id)
        # 先对他进行一下爬取 
        tmp = set()
        # 1存的是单个的
        update_sqls.append(( 'UPDATE fraud_crawler_sustainable set value_flag=1  where crawler_id ="{}";'.format(crawler_id)))
        update_sqls1= []
        update_sqls1.append(( 'UPDATE fraud_crawler_sustainable set value_flag=1  where crawler_id ="{}";'.format(crawler_id)))
        rs = parse.urlparse(target_url)
        # 这里实现的是一个避免重复生成的过程
        thisDomain = rs.netloc or rs.path
        print(thisDomain)

        tmp.add(thisDomain)
        crawler(tmp, set()) 
        list_path = Result_DIR+'/crawler/crawler_result/'+thisDomain+'/'
        # 判断爬虫是否成功：    
        if not os.path.isdir(list_path):     
            db = DB()
            db.execute(update_sqls1)          
            db.close() 
            logger.debug("更新数据库状态执行为1")             
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
                run_zgrab_new(thisDomain)             
                resultUrls = read_result_new(thisDomain)
                # 进行 zgrab扫描
                # 先只扫描了443端口
                for i in resultUrls:
                    uid = str(uuid.uuid4())
                    suid = ''.join(uid.split('-'))
                    # 入库的时候需要得到IP 
                    ip = getIP(i)
                    insert_sqls.append('insert into fraud_crawler_sustainable (crawler_id,target_url,task_create_time,sus_flag,father_id,ip,cluster_id) values ("{}","{}",now(),1,"{}","{}",{});'.format(suid,i,crawler_id,ip,cluster_id))
                    # db.execute(insert_sqls)          
                logging.debug(len(insert_sqls))
                # 打包将原有的value_flag更新掉
                db = DB()
                db.execute(insert_sqls)          
                db.close() 
                logger.debug("更新数据库状态执行为1") 
                db.execute(update_sqls1)      
                logger.debug("更新数据库状态value为1")                                       
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