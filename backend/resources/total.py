# -*- coding: utf-8 -*-
from flask import current_app, abort
from flask_restful import Resource
from flask_restful.reqparse import RequestParser
from common import *
from flask import Flask, request, jsonify
import json, random, string
import os
from datetime import datetime

class TotalResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.totalSeed = 9999
        # 种子数量
        self.totalScanSite = 12345
        # 累计扫描可疑网站
        self.totalApp = 5678
        # 累计发现诈骗APP数量
        self.totalSite= 2345
        # 累计发现诈骗网站数量
        self.totalScanApp =  3259
        # 累计扫描APP数量
    def get(self):
        dict = {
            "totalSeed":self.totalSeed ,
            "totalScanSite":self.totalScanSite ,
            "totalApp":self.totalApp ,
            "totalSite":self.totalSite ,
            "totalScanApp":self.totalScanApp ,
                    }
        return jsonify(dict)