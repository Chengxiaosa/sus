import os
from subprocess import Popen
from multiprocessing import Pool
import json
import sys
import logging
sys.path.append("./backend")
from configSys import config
FILE_DIR = os.path.dirname(os.path.abspath(__file__))
Result_DIR = config['result_dir']

result_path = '/mnt/hard_disk/samples/boom_result/'
FILE_DIR = os.path.dirname(os.path.abspath(__file__))
protocal = 'https'
# ___________________________________________________
def run_zgrab(input,flag):
    list_path = Result_DIR+"crawler/crawler_result/"+input+"/"
    print (list_path)
    # 接下来开始扫描80 端口和443端口
    option = '--port=443 --use-https' if protocal == 'https' else '--port=80'
    # 拼接zgrab2的
    cmd = ''
    if flag == 1:
        print("zgrab dnsPossible")
        cmd = 'ulimit -n 102400 && cd  /usr/local/go/bin/pkg/mod/github.com/zmap/zgrab2&& cat '+list_path+'dnsPossible.txt | ./zgrab2 http '+option+' --user-agent="Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E233 MicroMessenger/6.3.15 NetType/WIFI Language/zh_CN" --timeout=60 --max-redirects=20 --output-file='+result_path+protocal+'/'+str(input)+'dns.json'
    elif flag ==2:
        print("zgrab certPossible")
        cmd = 'ulimit -n 102400 && cd  /usr/local/go/bin/pkg/mod/github.com/zmap/zgrab2&& cat '+list_path+'certPossible.txt | ./zgrab2 http '+option+' --user-agent="Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E233 MicroMessenger/6.3.15 NetType/WIFI Language/zh_CN" --timeout=60 --max-redirects=20 --output-file='+result_path+protocal+'/'+str(input)+'cert.json'
    elif flag ==3:
        print("zgrab subnetPossible")
        cmd = 'ulimit -n 102400 && cd  /usr/local/go/bin/pkg/mod/github.com/zmap/zgrab2&& cat '+list_path+'subnetPossible.txt | ./zgrab2 http '+option+' --user-agent="Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E233 MicroMessenger/6.3.15 NetType/WIFI Language/zh_CN" --timeout=60 --max-redirects=20 --output-file='+result_path+protocal+'/'+str(input)+'subnet.json'
    elif flag ==4:
        print("zgrab  boomPossible")
        cmd = 'ulimit -n 102400 && cd  /usr/local/go/bin/pkg/mod/github.com/zmap/zgrab2&& cat '+list_path+'boomPossible.txt | ./zgrab2 http '+option+' --user-agent="Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E233 MicroMessenger/6.3.15 NetType/WIFI Language/zh_CN" --timeout=60 --max-redirects=20 --output-file='+result_path+protocal+'/'+str(input)+'boom.json'

    p = Popen(cmd,shell=True)
    # 等待子进程终止
    p.wait()
    p.kill()

def run_zgrab_new(input):
    list_path = Result_DIR+"crawler/crawler_result/"+input+"/"
    logging.debug ("run_zgrab_new"+list_path)
    # 接下来开始扫描80 端口和443端口
    for i in range(2):
        if i == 0:
            # option = '--port=443 --use-https' if protocal == 'https' else '--port=80'
            option = '--port=443 --use-https'
        else:
            option = option = '--port=80 '
        # 拼接zgrab2的
        cmd = ''
        # if i ==0:
        #     cmd = 'ulimit -n 102400 && cd  /usr/local/go/bin/pkg/mod/github.com/zmap/zgrab2&& cat '+list_path+'Possible.txt | ./zgrab2 http '+option+' --user-agent="Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E233 MicroMessenger/6.3.15 NetType/WIFI Language/zh_CN" --timeout=60 --max-redirects=20 --output-file='+result_path+protocal+'/'+str(input)+'.json'
        # else:
        #     cmd = 'ulimit -n 102400 && cd  /usr/local/go/bin/pkg/mod/github.com/zmap/zgrab2&& cat '+list_path+'Possible.txt | ./zgrab2 http '+option+' --user-agent="Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E233 MicroMessenger/6.3.15 NetType/WIFI Language/zh_CN" --timeout=60 --max-redirects=20 --output-file='+result_path+protocal+'/'+str(input)+'1.json'
        if i ==0:
            logging.debug('zgrab-option'+option)            
            cmd = 'cd  /usr/local/go/bin/pkg/mod/github.com/zmap/zgrab2&& cat '+list_path+'Possible.txt | ./zgrab2 http '+option+' --user-agent="Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E233 MicroMessenger/6.3.15 NetType/WIFI Language/zh_CN" --timeout=60 --max-redirects=20 --output-file='+result_path+protocal+'/'+str(input)+'.json'
        else:
            logging.debug('zgrab-option'+option)  
            cmd = 'cd  /usr/local/go/bin/pkg/mod/github.com/zmap/zgrab2&& cat '+list_path+'Possible.txt | ./zgrab2 http '+option+' --user-agent="Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13E233 MicroMessenger/6.3.15 NetType/WIFI Language/zh_CN" --timeout=60 --max-redirects=20 --output-file='+result_path+protocal+'/'+str(input)+'1.json'        

        p = Popen(cmd,shell=True)
        # 等待子进程终止
        p.wait()
        p.kill()
        logging.debug('p.kill:'+str(i))          
 

def read_result(input,flag):
    urls = set()
    result_file_path = ''
    if flag ==1:
        result_file_path = result_path+protocal+'/'+str(input)+'dns.json'
    elif flag ==2:
        result_file_path = result_path+protocal+'/'+str(input)+'cert.json'
    elif flag ==3:
        result_file_path = result_path+protocal+'/'+str(input)+'subnet.json'
    elif flag ==4:
        result_file_path = result_path+protocal+'/'+str(input)+'boom.json'                
    result_file = open(result_file_path,"r",encoding='utf8')
    logging.debug("read "+result_file_path)
    count=0
    while True:
        buffer=result_file.read(1024*8192)
        if not buffer:
            break
        count+=buffer.count('\n')
    result_file.seek(0)
    for i in range(count):
        line = result_file.readline()
        line_result = json.loads(line)
        if line_result['data']['http']['result'] != {}:
            urls.add(line_result['domain'])
    return urls    


def read_result_new(input):
    urls = set()
    result_file_path = ''
    for i in range(2):
        if i ==0:
            result_file_path = result_path+protocal+'/'+str(input)+'.json'
        else:
            result_file_path = result_path+protocal+'/'+str(input)+'1.json'
        result_file = open(result_file_path,"r",encoding='utf8')
        logging.debug("read "+result_file_path)
        count=0
        while True:
            buffer=result_file.read(1024*8192)
            if not buffer:
                break
            count+=buffer.count('\n')
        result_file.seek(0)
        for i in range(count):
            line = result_file.readline()
            line_result = json.loads(line)
            if line_result['data']['http']['result'] != {}:
                urls.add(line_result['domain'])
        logging.debug("read_finish: "+str(i))                

    return urls    



