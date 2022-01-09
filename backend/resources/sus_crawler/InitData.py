import csv 
import uuid
import sys
sys.path.append("./backend")
from db import DB
csvFile = open("/home/ch/dataBackUp/0105.csv", "r")
reader = csv.reader(csvFile)
from urllib import parse
# 建立空字典
csv_domains = list()
x = slice(2)
i=0
# 用一个list记录当前家族号
family =  list()
for item in reader:
    # if not item[1] in family:
    #     print("不在")
    #     family.append(item[1])
    #     # key是domain，value是家族号
    #     # 拼接sql语句
    #     uid = str(uuid.uuid4())
    #     suid = ''.join(uid.split('-'))
    #     # item 0 域名 
    #     # 拼接成一个元组
    #     csv_domains.append((item[0],suid))
    #     i = i+ 1
    #     # if i == 20 :
    #     #     break
    print("不在")
    # family.append(item)
    domain = ""
    rs = parse.urlparse(item[0])
    # 这里实现的是一个避免重复生成的过程
    thisDomain = rs.netloc or rs.path    
    # key是domain，value是家族号
    # 拼接sql语句
    uid = str(uuid.uuid4())
    suid = ''.join(uid.split('-'))
    # item 0 域名 
    # 拼接成一个元组
    csv_domains.append((thisDomain,suid))
    i = i+ 1
    # if i == 20 :
    #     break        
cluster_id = 0
db = DB()
# 这个many用不到
# init_sql_query = 'UPDATE fraud_crawler_sustainable set target_url=%s, task_create_time=now() where crawler_id = %s;'
# db.executemany(init_sql_query, csv_domains)
insert_sqls = []
for data in csv_domains:
    cluster_id = cluster_id +1
    insert_sqls.append('insert into fraud_crawler_sustainable (crawler_id,target_url,task_create_time,value_flag,cluster_id) values ("{}","{}",now(),0,{});'.format(data[1],data[0],cluster_id))
print(len(insert_sqls))
db.execute(insert_sqls)
db.close()
csvFile.close()


