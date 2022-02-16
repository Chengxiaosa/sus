import sys
sys.path.append("./backend/resources/sus_crawler")
from log_sus import Log
from crawlerAll import crawlerAll
from judgeAll import judgeAll
from createAndZgrab import createAndZgrab
from multiprocessing import Pool  
logger = Log()
if __name__ == '__main__':
    while True:
        logger.info("开始运行生成相关衍生")        
        parallel_size  = 4 
        # with Pool(processes=parallel_size) as pool:
        #     logger.warning(f"start {parallel_size} process!")
        #     for  i in range(4):
        #         results = pool.apply_async(createAndZgrab, args=())
        #     pool.close()
        #     pool.join()        
        # 开并发会对重复的数据进行操作 应该做一个分组切割
        createAndZgrab()
        logger.info("完成运行生成相关衍生")
        crawlerAll_flag = 0
        while True:
            logger.info("开始crawlerAll")                    
            crawlerAll_flag =  crawlerAll()
            logger.info("完成crawlerAll")
            if crawlerAll_flag ==1:
                break