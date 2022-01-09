
# from logging import getLogger
#  def getALogger():
#      logging.basicConfig(filename='std.log', filemode='w', format='%(name)s - %(levelname)s - %(message)s')

#     logger=logging.getLogger() 

#     #Now we are going to Set the threshold of logger to DEBUG 
#     logger.setLevel(logging.DEBUG)
#     # 终端Handler
#     consoleHandler = logging.StreamHandler()
#     consoleHandler.setLevel(logging.DEBUG)
#     # 文件Handler
#     fileHandler = logging.FileHandler('log.log', mode='w', encoding='UTF-8')
#     fileHandler.setLevel(logging.NOTSET)
#     # Formatter
#     formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
#     consoleHandler.setFormatter(formatter)
#     fileHandler.setFormatter(formatter)
#     # 添加到Logger中
#     logger.addHandler(consoleHandler)
#     logger.addHandler(fileHandler)