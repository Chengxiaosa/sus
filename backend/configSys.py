import os

config = {
    'mysql': {
        'host': 'ml.a0ab.com',
        'port': 3306,
        'user': 'fraud',
        'password': 'N0_fr@ud',
        'database': 'fraud_detection_v2'
    },
    # 'mongo': {
    #     'host': 'ml.a0ab.com',
    #     'port': 27017,
    #     'user': 'fraud',
    #     'password': 'N0_fr@ud',
    #     'database': 'fraud_detection'
    # },
    'mongo': {
        'host': '10.176.36.10',
        'port': 27017,
        'user': 'mongo_domain_admin',
        'password': 'mongo_domain_admin',
        'database': 'auto_scripts'
    },    
    'redis': {
        'port': 16379,
        'host': '10.176.36.25'
    },
    'seaweedfs':'/home/syang/seaweedfs/data/mount/work_of_scam/webpage/',
    'result_dir':'/mnt/hard_disk/new/'

}

