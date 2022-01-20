
import csv 
import uuid
import sys
import os
from urllib import parse
import traceback
import whois
from numpy.lib.function_base import insert
from initCity import  Ip2Int
sys.path.append("./backend")
from db import DB
from configSys import config
sys.path.append("./backend/resources")
from all_in_one import all_in_one
from crawler.crawler import crawler
from zgrabP import run_zgrab,read_result_new, run_zgrab_new
from judgeHIS.predict import get_result_from_one
import logging
logging.basicConfig(filename='std.log', filemode='w', format='%(name)s - %(levelname)s - %(message)s',level=logging.DEBUG)

Result_DIR = config['result_dir']
FILE_DIR = os.path.dirname(os.path.abspath(__file__))

def hitCity(ip):
    ipInt = Ip2Int(ip)
    db = DB()
    rows_city = db.fetch("select ip_from,ip_to ,country_name,city_name,latitude,longitude from ip2location_db11 where ip_from <{} and ip_to>{};".format(ipInt,ipInt))    
    # 
    row_city = list()
    if rows_city:
        row_city = rows_city[0]
    else:
        return
    # 判断重复      
    rows_city_already = db.fetch("select hit_num,city_name,latitude,longitude from fraud_sus_city where  city_name = '{}';".format(row_city[3]))
    insert_sqls = []    
    if rows_city_already:   
        row_city_already = list()   
        row_city_already = rows_city_already[0]        
        insert_sqls.append( 'UPDATE fraud_sus_city set hit_num={} where city_name ="{}";'.format(row_city_already[0]+1,row_city_already[1]))  
    else:           
        insert_sqls.append('insert into fraud_sus_city (country_name,city_name,latitude,longitude,hit_num) values ("{}","{}",{},{},1);'.format(row_city[2],row_city[3],row_city[4],row_city[5]))    
        print(insert_sqls[0])
    db.execute(insert_sqls)
    db.close()

def hitHegistrar(domain):
    # 用来统计注册商
    # 先查询到
    domain = whois.whois(domain)
    registrar =  domain['registrar']
    db = DB()
    # 
    if not registrar:
        return
    # 判断重复      
    rows_whois_already = db.fetch("select hit_num,registrar from fraud_sus_whois where  registrar = '{}';".format(registrar))
    insert_sqls = []
    if rows_whois_already:
        row_whois_already = list()
        row_whois_already = rows_whois_already[0]        
        insert_sqls.append( 'UPDATE fraud_sus_whois set hit_num={} where registrar ="{}";'.format(row_whois_already[0]+1,registrar))  
    else:           
        insert_sqls.append('insert into fraud_sus_whois(registrar,hit_num) values ("{}",1);'.format(registrar))    
    db.execute(insert_sqls)
    db.close()    

def hitAS(ip):
    # 用来统计AS情况
    ipInt = Ip2Int(ip)
    db = DB()

    rows_as = db.fetch("select `as` ,asn,cidr from ip2location_asn where ip_from <{} and ip_to>{};".format(ipInt,ipInt))    
    # print("select as,asn,cidr from ip2location_asn where ip_from <{};".format(ipInt,ipInt))
    # 
    row_as = list()
    if rows_as:
        row_as = rows_as[0]
    else:
        return
    # 判断重复      
    rows_as_already = db.fetch("select hit_num,cidr,`as`,asn from fraud_sus_asn where  asn = {};".format(row_as[1]))    
    insert_sqls = []
    if rows_as_already:
        row_as_already = list()
        row_as_already = rows_as_already[0]        
        insert_sqls.append( 'UPDATE fraud_sus_asn set hit_num={} where asn ="{}";'.format(row_as_already[0]+1,row_as_already[3]))  
    else:           
        insert_sqls.append('insert into fraud_sus_asn (cidr,asn,`as`,hit_num) values ("{}","{}","{}",1);'.format(row_as[2],row_as[1],row_as[0]))    
    db.execute(insert_sqls)
    db.close()



# 选择所有已经爬过的（状态是2的）去进行行为猜测
# 若是好的 则将结果设置成3
# 若是坏的 则将结果设置成4 并且将value_flag 设置为0
def judgeAll():
    db = DB()
    domains = set()
    # select targets
    # 选择库中所有价值flag为0的
    rows = db.fetch("select crawler_id, target_url,ip from fraud_crawler_sustainable where sus_flag = 2 and web_status_code = 200;")
    rows_already = db.fetch("select target_url from fraud_crawler_sustainable where value_flag = 0 OR value_flag=1;")
    db.close()
    # 进行域名生成
    # extract domains
    tmp = set()    
    insert_sqls = []    
    already_domain = []
    for item in rows_already:
        already_domain.append(item[0])
    # 这里面就是两个形参 不具备字典作用
    for crawler_id,target_url,ip in rows:
        # 预处理
        # 判断
        # 返回结果
        if not target_url in already_domain:
            try:
                result =  get_result_from_one(target_url)
                if result:
                    if result["bad_domains"] :
                        a= 0 
                        for i in  result["bad_domains"].keys():
                            a = result["bad_domains"][i]
                        # 这里首先 访问IP 入库的时候已经有IP 了
                        # 再进行城市查询 进行城市表的hit
                        try:
                            hitCity(ip)                 
                            hitHegistrar(target_url)
                            hitAS(ip)
                        except:
                            print('hit 异常')
                        # 再进行注册商表的hit
                        # 做AS的hit
                        # 这里就直接更新了 有就更新 
                        insert_sqls.append( 'UPDATE fraud_crawler_sustainable set sus_flag=4,value_flag = 0,ml_fraud={} where crawler_id ="{}";'.format(a,crawler_id))  
                        
                    else :
                        # 好的
                        insert_sqls.append( 'UPDATE fraud_crawler_sustainable set sus_flag=3  where crawler_id ="{}";'.format(crawler_id))                                     
                else :
                    # 爬失败的
                    insert_sqls.append( 'UPDATE fraud_crawler_sustainable set sus_flag=-1  where crawler_id ="{}";'.format(crawler_id))                             
            except:
                # logging.info("更新判断sql异常")    
                # logging.info(sys.exc_info()[0:2]) # 打印错误类型，错误值
                # logging.info(traceback.extract_tb(sys.exc_info()[2])) #出错位置                        
                print("更新判断sql异常")    
                insert_sqls.append( 'UPDATE fraud_crawler_sustainable set sus_flag=-1  where crawler_id ="{}";'.format(crawler_id))                 
                print(sys.exc_info()[0:2]) # 打印错误类型，错误值
                print(traceback.extract_tb(sys.exc_info()[2])) #出错位置
        else:            
            # 域名重复的
            insert_sqls.append( 'UPDATE fraud_crawler_sustainable set sus_flag=-2  where crawler_id ="{}";'.format(crawler_id))                                                   
    # 结束完了之后 将 状态为1 设置为状态为2

    print(len(insert_sqls))
    db = DB()    
    db.execute(insert_sqls)  
    logging.info("更新此状态成功3/4")  
    logging.info(len(insert_sqls))        
    db.close()

if __name__ == '__main__':
    judgeAll()