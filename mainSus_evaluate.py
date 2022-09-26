import sys
sys.path.append("./backend/resources/sus_crawler")
from log_sus import Log
from crawlerAll import crawlerAll
from judgeAll import judgeAll
from createAndZgrab import createAndZgrab
from multiprocessing import Pool  
logger = Log()
if __name__ == '__main__':
    print("开始")
    judgeAll()
    print("完成judgeAll()")