import argparse
import os
import pymysql
import random

from collections import Counter, defaultdict
from tldextract import extract

SRC = '/home/miniwmy/seaweedfs/data/mount/work_of_scam/webpage'

CONFIG = {
    "host": "ml.a0ab.com",
    "port": 3306,
    "user": "fraud",
    "password": "N0_fr@ud",
    "database": "fraud_detection_v2"
}


class DB:
    def __init__(self):
        pass

    def get_mysql(self):
        if not hasattr(self, '_mysql') or self._mysql == None or self._mysql._closed:
            self._mysql = pymysql.connect(**CONFIG)

        return self._mysql

    def close_mysql(self):
        if hasattr(self, '_mysql') and self._mysql != None:
            self._mysql.close()

    def fetch(self, sql):
        db = self.get_mysql()
        cur = db.cursor()
        rows = []
        try:
            cur.execute(sql)
            rows = cur.fetchall()
        except Exception as e:
            print(e)
        finally:
            cur.close()
        return rows


db = DB()
rst = db.fetch('select crawler_id, target_url from datacon_crawler_event where web_status_code=200')
domain2id = {}
for crawler_id, target_url in rst:
    domain = '.'.join([x for x in extract(target_url) if len(x) > 0])
    domain2id[domain] = crawler_id


def eval_result(path):
    d = defaultdict(list)
    with open(path, 'r') as f:
        lines = f.readlines()
        parts = [part.strip().split(',') for part in lines]
        for a,b,_ in parts:
            d[int(b)].append(a)
    return d


if '__main__' == __name__:
    print('python read_cluster.py -f result.csv -d test -i 13442 13443 -n 10')
    parser = argparse.ArgumentParser()
    parser.add_argument('-f', '--csv-file', type=str, help='csv file path')
    parser.add_argument('-d', '--dst-folders', type=str, default='./target', help='copy img dst folder')
    parser.add_argument('-i', '--cluster-ids', type=int, nargs='+', help='copy cluster')
    parser.add_argument('-n', '--num', type=int, default=10, help='number of copy')

    args = parser.parse_args()

    cluster = eval_result(args.csv_file)
    c = Counter({k:len(v) for k,v in cluster.items()})
    top_cluster_ids = sorted(list(c.most_common(100)), reverse=True, key=lambda x:x[1])
    sorted(top_cluster_ids)
    print(top_cluster_ids)

    if not os.path.exists(args.dst_folders):
        os.makedirs(args.dst_folders)

    for cluster_id in args.cluster_ids:
        cluster_id_path = os.path.join(args.dst_folders, str(cluster_id))
        if not os.path.exists(cluster_id_path):
            os.mkdir(cluster_id_path)

        domains = set([random.choice(cluster[cluster_id]) for _ in range(args.num)])
        for domain in domains:
            crawler_id = domain2id[domain]

            src = f'{SRC}/{crawler_id}/screenshot.png'
            dst = f'{cluster_id_path}/{crawler_id}.png'
            copy_cmd = f'cp {src} {dst}'
            os.system(copy_cmd)
