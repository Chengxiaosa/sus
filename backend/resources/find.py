from flask import current_app, abort
from flask_restful import Resource
from flask_restful.reqparse import RequestParser
from common import *
from flask import Flask, request, jsonify
import json
import random
import string
import os
from datetime import datetime
from .all_in_one import all_in_one, all_in_one_BOOM, all_in_one_DNS, all_in_one_cert, all_in_one_subnet
from .crawler.crawler import crawler
from .judgeHIS.predict import get_results_by_domain
from urllib import parse
from .zgrabP import run_zgrab,read_result
import time
import sys
from multiprocessing import Pool
sys.path.append("./backend")
from configSys import config
FILE_DIR = os.path.dirname(os.path.abspath(__file__))
Result_DIR = config['result_dir']
class FindResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.url = request.args.get("url")

    def get(self):
        # 这个方法中根据返回值的几个类型 返回相应的JSON
        # read了一个josn文件
        # file_dir  print(FILE_DIR)
        # 前台输入乱顺序数字会报错 
        print(FILE_DIR)
        dom_file = open(FILE_DIR+"/already.json", 'r')
        doms = json.load(dom_file)

        tmp = set()
        rs = parse.urlparse(self.url)
        # 这里实现的是一个避免重复生成的过程
        thisDomain = rs.netloc or rs.path
        print(thisDomain)
        if thisDomain not in doms["initSites"]:
            doms["initSites"].append(thisDomain)

        # if thisDomain == 'hjc965.com':
        #     # 前台卡的原因 写了个5秒钟
        #     # time.sleep(5)
        #     with open(FILE_DIR+"/find_mock1.json", 'r') as f:
        #         print(FILE_DIR)
        #         this_mock = json.load(f)
        #         return this_mock

        # if thisDomain == 'xxmh99.vip':
        #     # time.sleep(5)
        #     with open(FILE_DIR+"/find_mock2.json", 'r') as f:
        #         this_mock = json.load(f)
        #         return this_mock

        tmp.add(thisDomain)
        crawler(tmp, set())
        dict = all_in_one(self.url)

        if not dict['screenshot'] == 'none':
            with open(FILE_DIR+"/already.json", 'w') as f:
                json.dump(doms, f)
                
        # return jsonify(dict)
        # crawler(domains, ips)
        # pre_results=get_results_by_domain(rs.netloc)
        # dict = {'domains': list(domains), "ips": list(ips)}
        # dict.update(pre_results)

    

        # with open(FILE_DIR+"/find_mock2.json", 'w') as f:
        #     json.dump(dict, f)

        return jsonify(dict)


class FindResourceFromBoom(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.url = request.args.get("url")

    def get(self):
        # 这个方法中根据返回值的几个类型 返回相应的JSON
        # read了一个josn文件
        # file_dir  print(FILE_DIR)
        # 前台输入乱顺序数字会报错 
        print(FILE_DIR)
        dom_file = open(FILE_DIR+"/already.json", 'r')
        doms = json.load(dom_file)
        
        tmp = set()
        rs = parse.urlparse(self.url)
        thisDomain = rs.netloc or rs.path
        print(thisDomain)
        if thisDomain not in doms["initSites"]:
            doms["initSites"].append(thisDomain)

        tmp.add(thisDomain)
        list_path = Result_DIR+'/crawler/crawler_result/'+thisDomain+'/'
        dict = all_in_one_BOOM(self.url)
        # 写一个叫做BOOM 的txt文件在result文件夹下？存储所有的可疑域名并并记录数字
        filepath = list_path+'boomPossible.txt'
        print(dict["domains_from_boom"])
        fd = open(filepath, mode='w', encoding='utf-8')
        for d in dict["domains_from_boom"]:
                    url =d
                    print(url)
                    fd.write(url)
                    fd.write('\n')     
        fd.close()                       

        #使用zgrab进行扫描，扫描活着的 并存储到BOOM_alive中去，这个地方去扫描肯定是一个多线程的扫描
        run_zgrab(thisDomain,4)
        # 读取扫描过后的文件看看活着的有几个？
        resultUrls = read_result(thisDomain,4)
        dict['totalNum'] = len(dict["domains_from_boom"])
        dict['reaultNum'] = len(resultUrls)
        #返回给前台两个数字
        # 动态扫描 第二个参数为空
        # 这里他去哪里找到possible？
        # 先耦合以下
        dict1 = {
        "domains_from_boom": list(resultUrls)}
        try:
            with open(Result_DIR + '/crawler/crawler_result/' + thisDomain + "/boompossible.json", 'w') as f:
                json.dump(dict1, f)
        except BaseException as e:
            print(e)
        return jsonify(dict)

class FindResourceFromCert(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.url = request.args.get("url")

    def get(self):
        # 这个方法中根据返回值的几个类型 返回相应的JSON
        # read了一个josn文件
        # file_dir  print(FILE_DIR)
        # 前台输入乱顺序数字会报错 
        print(FILE_DIR)
        dom_file = open(FILE_DIR+"/already.json", 'r')
        doms = json.load(dom_file)

        tmp = set()
        rs = parse.urlparse(self.url)
        # 这里实现的是一个避免重复生成的过程
        thisDomain = rs.netloc or rs.path
        print(thisDomain)
        if thisDomain not in doms["initSites"]:
            doms["initSites"].append(thisDomain)

        tmp.add(thisDomain)
        dict = all_in_one_cert(self.url)
        list_path = Result_DIR+'/crawler/crawler_result/'+thisDomain+'/'
        # 写一个叫做BOOM 的txt文件在result文件夹下？存储所有的可疑域名并并记录数字
        filepath = list_path+'certPossible.txt'
        print(dict["domains_from_cert"])
        fd = open(filepath, mode='w', encoding='utf-8')
        for d in dict["domains_from_cert"]:
                    url =d
                    print(url)
                    fd.write(url)
                    fd.write('\n')     
        fd.close()                       

        #使用zgrab进行扫描，扫描活着的 并存储到BOOM_alive中去，这个地方去扫描肯定是一个多线程的扫描
        run_zgrab(thisDomain,2)
        # 读取扫描过后的文件看看活着的有几个？
        resultUrls = read_result(thisDomain,2)
        dict['totalNum'] = len(dict["domains_from_cert"])
        dict['reaultNum'] = len(resultUrls)
        #返回给前台两个数字
        # 这里他去哪里找到possible？
        # 先耦合以下
        dict1 = {
        "domains_from_cert": list(resultUrls)}
        try:
            with open(Result_DIR + '/crawler/crawler_result/' + thisDomain + "/certpossible.json", 'w') as f:
                json.dump(dict1, f)
        except BaseException as e:
            print(e)
        
        return jsonify(dict)        


class FindResourceFromDns(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.url = request.args.get("url")

    def get(self):
        # 这个方法中根据返回值的几个类型 返回相应的JSON
        # read了一个josn文件
        # file_dir  print(FILE_DIR)
        # 前台输入乱顺序数字会报错 
        print(FILE_DIR)
        dom_file = open(FILE_DIR+"/already.json", 'r')
        doms = json.load(dom_file)

        tmp = set()
        rs = parse.urlparse(self.url)
        # 这里实现的是一个避免重复生成的过程
        thisDomain = rs.netloc or rs.path
        print(thisDomain)
        if thisDomain not in doms["initSites"]:
            doms["initSites"].append(thisDomain)

        tmp.add(thisDomain)
        dict = all_in_one_DNS(self.url)

        list_path = Result_DIR+'/crawler/crawler_result/'+thisDomain+'/'
        # 写一个叫做BOOM 的txt文件在result文件夹下？存储所有的可疑域名并并记录数字
        filepath = list_path+'dnsPossible.txt'
        print(dict["domains_from_dns"])
        fd = open(filepath, mode='w', encoding='utf-8')
        for d in dict["domains_from_dns"]:
                    url =d
                    print(url)
                    fd.write(url)
                    fd.write('\n')     
        fd.close()                       

        #使用zgrab进行扫描，扫描活着的 并存储到BOOM_alive中去，这个地方去扫描肯定是一个多线程的扫描
        run_zgrab(thisDomain,1)
        # 读取扫描过后的文件看看活着的有几个？
        resultUrls = read_result(thisDomain,1)
        dict['totalNum'] = len(dict["domains_from_dns"])
        dict['reaultNum'] = len(resultUrls)
        #返回给前台两个数字
        # 这里他去哪里找到possible？
        # 先耦合以下
        dict1 = {
        "domains_from_dns": list(resultUrls)}
        try:
            with open(Result_DIR + '/crawler/crawler_result/' + thisDomain + "/dnspossible.json", 'w') as f:
                json.dump(dict1, f)
        except BaseException as e:
            print(e)
        
        return jsonify(dict)


class FindResourceFromSubnet(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.url = request.args.get("url")

    def get(self):
        # 这个方法中根据返回值的几个类型 返回相应的JSON
        # read了一个josn文件
        # file_dir  print(FILE_DIR)
        # 前台输入乱顺序数字会报错 
        print(FILE_DIR)
        dom_file = open(FILE_DIR+"/already.json", 'r')
        doms = json.load(dom_file)

        tmp = set()
        rs = parse.urlparse(self.url)
        # 这里实现的是一个避免重复生成的过程
        thisDomain = rs.netloc or rs.path
        print(thisDomain)
        if thisDomain not in doms["initSites"]:
            doms["initSites"].append(thisDomain)

        tmp.add(thisDomain)
        dict = all_in_one_subnet(self.url)
        

        list_path = Result_DIR+'/crawler/crawler_result/'+thisDomain+'/'
        # 写一个叫做BOOM 的txt文件在result文件夹下？存储所有的可疑域名并并记录数字
        filepath = list_path+'subnetPossible.txt'
        print(dict["domains_from_subnet"])
        fd = open(filepath, mode='w', encoding='utf-8')
        for d in dict["domains_from_subnet"]:
                    url =d
                    print(url)
                    fd.write(url)
                    fd.write('\n')     
        fd.close()                       

        #使用zgrab进行扫描，扫描活着的 并存储到BOOM_alive中去，这个地方去扫描肯定是一个多线程的扫描
        run_zgrab(thisDomain,3)
        # 读取扫描过后的文件看看活着的有几个？
        resultUrls = read_result(thisDomain,3)
        dict['totalNum'] = len(dict["domains_from_subnet"])
        dict['reaultNum'] = len(resultUrls)
        #返回给前台两个数字
        # 这里他去哪里找到possible？
        # 先耦合以下
        dict1 = {
        "domains_from_subnet": list(resultUrls)}
        try:
            with open(Result_DIR + '/crawler/crawler_result/' + thisDomain + "/subnetpossible.json", 'w') as f:
                json.dump(dict1, f)
        except BaseException as e:
            print(e)
        return jsonify(dict)               

class FindResourceCrawler(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.url = request.args.get("url")

    def get(self):
        # 这个方法中根据返回值的几个类型 返回相应的JSON
        # read了一个josn文件
        # file_dir  print(FILE_DIR)
        # 前台输入乱顺序数字会报错 
        print(FILE_DIR)
        dom_file = open(FILE_DIR+"/already.json", 'r')
        doms = json.load(dom_file)
        tmp = set()
        rs = parse.urlparse(self.url)
        # 这里实现的是一个避免重复生成的过程
        thisDomain = rs.netloc or rs.path
        print(thisDomain)
        if thisDomain not in doms["initSites"]:
            doms["initSites"].append(thisDomain)

        tmp.add(thisDomain)
        crawler(tmp, set())
        dict = {
            "screenshot": "http://10.177.35.156/fontend/src/crawler/crawler_result/"+thisDomain+"/screenshot.png",}        

        if not dict['screenshot'] == 'none':
            with open(FILE_DIR+"/already.json", 'w') as f:
                json.dump(doms, f)
                

        return jsonify(dict)                        