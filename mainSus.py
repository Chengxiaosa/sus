import sys
sys.path.append("./backend/resources/sus_crawler")
import logging
from crawlerAll import crawlerAll
from judgeAll import judgeAll
from createAndZgrab import createAndZgrab

if __name__ == '__main__':
    while True:
        createAndZgrab()
        logging.debug("完成createAndZgrab()")
        crawlerAll_flag = 0
        while True:
            crawlerAll_flag =  crawlerAll()
            logging.debug("完成crawlerAll")
            judgeAll()
            logging.debug("完成judgeAll()")
            if crawlerAll_flag ==1:
                break