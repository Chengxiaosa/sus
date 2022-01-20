import imp


import sys
import os
sys.path.append("./backend")
from db import DB
from configSys import config
Result_DIR = config['result_dir']
SRC = Result_DIR+'crawler/crawler_result'
cluster_id_path = '/home/ch/Scan/6'



if '__main__' == __name__:
    db = DB()    
    rows = db.fetch("select crawler_id, target_url from fraud_crawler_sustainable where sus_flag = 4 and web_status_code = 200;")    
    if not os.path.exists(cluster_id_path):
        os.makedirs(cluster_id_path)    
    for row in rows:
        id = row[0]
        url = row[1]
        src = f'{SRC}/{url}/screenshot.png'
        dst = f'{cluster_id_path}/"{url}".png'
        copy_cmd = f'cp {src} {dst}'
        os.system(copy_cmd)