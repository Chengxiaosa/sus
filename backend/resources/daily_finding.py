# -*- coding: utf-8 -*-
from flask import current_app, abort
from flask_restful import Resource
from flask_restful.reqparse import RequestParser
from common import *
from flask import Flask, request, jsonify
import json, random, string
import os
class DailyResource(Resource):

    def __init__(self):
        self.parser = RequestParser()

    def get(self):
        mock_data = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_x.json')
        with open(mock_data) as f:
            data = json.load(f)
        server = {
            "cpu": {
                "cpuProp":random.uniform(0.1,0.5),
                "cpuStatus":{
                    "live":random.randint(2,5),
                    "total":5
                }
            },
            "memory": {
                "memProp":random.uniform(0.1,0.5),
                "memStatus":{
                    "use":random.uniform(10.0,15.0),
                    "total":128
                }
            },
            "disk":{
                "diskProp":random.uniform(0.5,0.7),
                "diskSpeed":random.uniform(1.5,4.5)
            },
            "bandwidth": 100,
            "request": random.randint(1000,2000),
            "tx": random.uniform(0.8,3.5),
            "rx": random.uniform(3.0,10.0)
            }
        dailyData = data['dailyData']
        sitesByIpAndCert = []
        sitesByDomain = data['sitesByDomain']
        availableDomain = data['availableDomain']
        
        dict = {
            "server" : server,
            "dailyData" : dailyData,
            "sitesByIpAndCert":sitesByIpAndCert,
            "sitesByDomain":sitesByDomain,
            "availableDomain":availableDomain,
        }
        return jsonify(dict)

    def post(self):
        #todo
        return
