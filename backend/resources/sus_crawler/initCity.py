import csv 
import uuid
import sys
import struct,socket
sys.path.append("./backend")
from db import DB
csvFile = open("/home/ch/dataBackUp/0105.csv", "r")
reader = csv.reader(csvFile)
from urllib import parse
def Ip2Int(ip):
    return struct.unpack("!L",socket.inet_aton(ip))[0]

def initCity():    

    # 建立空字典
    # 建一张表  用来 确定 库中出现过的CITY 
    # 先从 ip2location中 由IP_from  升序排列 挑选出 经纬度  国家名字 城市名字  
    #  先用一个数据结构存着  (国家,城市,次数)
    # 最后将这个数据结构入库 
    row_sus_city = list()
    city_already = list()
    db = DB()
    # ip通过dns得到的
    rows = db.fetch("select ip from fraud_crawler_sustainable where sus_flag = 4;")
    print(len(rows))
    db.close()
    countStar = 0 
    left_num =  0
    for item in rows:
        if not item[0]:
            continue
        ipInt = Ip2Int(item[0])    
        loop_flag = 0     
        l = 0 
        r = 2960
        while True :
            if loop_flag == 1:
                break
            if r >=l:
                mid = int(l + (r - l)/2)
                # 这里left的值取到极限是2960000
                db=DB()        
                rows1 = db.fetch("select ip_from,ip_to ,country_name,city_name,latitude,longitude from ip2location_db11 LIMIT {},1000".format(mid*1000))           
                db.close()        
                # 使用二分查找
                # 首先比较这1000个数据看看 是不是在这个里面
                # 还是慢 应该用二分法查找
                left_num = left_num+1000
                if rows1[0][0]<ipInt:
                    if rows1[999][1]>ipInt:
                        countStar = countStar +1
                        print(countStar)
                    else:
                        # 最大值小于目标
                        l = mid +1                
                        # print(str(rows1[0][0])+':'+str(ipInt)+':'+str(rows1[0][0]))                
                        continue          
                else:
                    # 最小值大于目标
                    r = mid -1
                    # print(str(rows1[0][0])+':'+str(ipInt)+':'+str(rows1[0][0]))                              
                    continue   
            else:
                break
            
            for item1 in rows1:
                if item1[0]< ipInt:
                    if item1[1]>ipInt:
                        # 国家
                        a = item1[2]
                        # 城市
                        b=item1[3]
                        # 经度
                        c = item1[4]
                        # 纬度
                        d = item1[5]
                        if not b in city_already:
                            city_already.append(item1[3])
                            e = 1
                            row_sus_city.append([a,b,c,d,e]) 
                            loop_flag = 1
                            break                                    
                        else:
                            numI = 0
                            for i in row_sus_city:
                                # numI = numI+1
                                if i[1] == b:
                                    i[4]=i[4]+1
                                    loop_flag = 1
                                    break
                            break
                    else:
                        continue
                        # print(str(item1[0])+':'+str(ipInt)+':'+str(item1[0]))                    
                else:
                    continue
                    # 不满足条件1
                    # print(str(item1[0])+':'+str(ipInt)+':'+str(item1[0]))          
    # 生成sql语句
    insert_sqls = []
    for item in row_sus_city :
        insert_sqls.append('insert into fraud_sus_city (country_name,city_name,latitude,longitude,hit_num) values ("{}","{}","{}","{}",{});'.format(item[0],item[1],item[2],item[3],item[4]))
    print(len(insert_sqls))
    db = DB()
    db.execute(insert_sqls)
    db.close()    

                

                        






