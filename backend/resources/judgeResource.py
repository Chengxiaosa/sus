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
from .all_in_one import all_in_one
from .crawler.crawler import crawler
from .judgeHIS.predict import get_results_by_domain
from urllib import parse
import sys
sys.path.append("./backend")
from configSys import config
import time
FILE_DIR = os.path.dirname(os.path.abspath(__file__))
Result_DIR = config['result_dir']

class judgeResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.url = request.args.get("url")

    def get(self):
        rs = parse.urlparse(self.url)
        print("===========================")
        print(rs.netloc or rs.path)

        # thisDomain = rs.netloc or rs.path
        # if thisDomain == 'hjc965.com':
        #     # time.sleep(5)
        #     with open(FILE_DIR+"/judge_mock1.json", 'r') as f:
        #         this_mock = json.load(f)
        #         return this_mock

        # if thisDomain == 'xxmh99.vip':
        #     # time.sleep(5)
        #     with open(FILE_DIR+"/judge_mock2.json", 'r') as f:
        #         this_mock = json.load(f)
        #         return this_mock


        pre_results=get_results_by_domain(rs.netloc or rs.path)

        # with open(FILE_DIR+"/judge_mock2.json", 'w') as f:
        #     json.dump(pre_results, f)

        return jsonify(pre_results)

class activityCrawler(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.url = request.args.get("url")

    def get(self):
        rs = parse.urlparse(self.url)
        # print("===========================")
        # print(rs.netloc or rs.path)
        target_domain = rs.netloc or rs.path

        nameOfFile = ['boom','cert','dns','subnet']
        for i in range(4):
            print(Result_DIR)
            # Result_DIR + '/crawler/crawler_result/' + thisDomain + "/boompossible.json"
            # print(Result_DIR+'/crawler/crawler_result/' +target_domain+"/"+nameOfFile[i]+"possible.json")
            dom_file = open(Result_DIR+'/crawler/crawler_result/' +target_domain+"/"+nameOfFile[i]+'possible.json', 'r')
            doms = json.load(dom_file)        
            for i in doms.keys():
                    if i!="screenshot":
                        crawler(doms[i], set())                
        # with open(FILE_DIR+"/judge_mock2.json", 'w') as f:
        #     json.dump(pre_results, f)

        return        