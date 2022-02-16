import sys
sys.path.append("./backend")
from db import DB
db = DB()
domains = set()
# select targets
# 选择库中所有价值flag为0的
rows = db.fetch("select Max(crawler_id) crawler_id from fraud_crawler_sustainable;")
for item in rows:
    print(item[0])
db.close()