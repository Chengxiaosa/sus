# -*- coding: utf-8 -*-
from flask import current_app, abort
from flask_restful import Resource
from flask_restful.reqparse import RequestParser
from common import *
from flask import Flask, request, jsonify
import json, random, string
import os
from datetime import datetime
class HeadResource(Resource):

    def __init__(self):
        self.parser = RequestParser()

    def get(self):
        mock_data = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_x.json')
        with open(mock_data) as f:
            data = json.load(f)
        mock_data1 = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_city.json')
        with open(mock_data1) as f:
            data1 = json.load(f)

        totalSite = data['totalSite']
        totalApp = data['totalApp']
        dailySite = data['dailySite']
        print(dailySite)
        dailyApp = data['dailyApp']
        rankTLD = data['rankTLD'][0:5]

        rankIP = []
        for i in range(5):
            element = {"city": data1["foreign_cityData"][i]['cityName'],
                       "ipNum": data1["foreign_cityData"][i]['number']}
            rankIP.append(element)

        server = {
            "cpu": random.uniform(0.1,0.5),
            "memory": random.uniform(0.1,0.5),
            "bandwidth": 100,
            "request": random.randint(1000,2000),
            "diskRate": random.randint(1,5)
            }
        dailyData = data['dailyDataHome']
        
        now = datetime.now()
        start = now.strftime("%Y-%m-%d") + ' 00:00:00'
        end = now.strftime("%Y-%m-%d %H:%M:%S")
        lenth = 8
        random_date_list = randomDateList(start, end, lenth)
        # "2021-06-04 03:20:28"

        for i in range(len(dailyData)):
            # dailyData[i]['date'] = random_date_list[i]
            dailyData[i]['date'] = "2021-08-30 03:20:28"
        rankPaymentChannel = data['rankPaymentChannel']
        rankBank = data['rankBank']
        hostProvider = data['hostProvider']
        rankAsAtIp = data['rankAsAtIp']
        dict = {
            "totalSite": totalSite,
            "totalApp": totalApp,
            "dailySite": dailySite,
            "dailyApp": dailyApp,
            "rankTLD": rankTLD,
            "rankIP": rankIP,
            "server": server,
            "dailyData": dailyData,
            "rankPaymentChannel": rankPaymentChannel,
            "rankBank": rankBank,
            "hostProvider": hostProvider,
            "rankAsAtIp": rankAsAtIp
            }
        return jsonify(dict)
