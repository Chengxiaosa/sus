# -*- coding: utf-8 -*-
from flask import current_app, abort
from flask_restful import Resource
from flask_restful.reqparse import RequestParser
from common import *
from flask import Flask, request, jsonify
import json, random, string
import os
class StatisticsResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        # self.area = int(request.args.get("area"))
        self.area = request.args.get("area")

    def get(self):
        mock_data = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_x.json')
        with open(mock_data) as f:
            data = json.load(f)
        mock_data1 = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_city.json')
        with open(mock_data1) as f:
            data1 = json.load(f)

        asIndustry = data['asIndustry']
        domainAtRegistrar = []
        seedNum = data['seedNum']
        avgSeedNum = data['avgSeedNum']
        foundSites = data['totalSite']
        foundApps = data['totalApp']

        rankAsAtIp = data['rankAsAtIp']
        rankTLD = data['rankTLD']
        tldDistribution = []
        for i in range(len(rankTLD)):
            tmp = {
                "tld":rankTLD[i]['domain'],
                "number":rankTLD[i]['domainNum']
            }
            tldDistribution.append(tmp)

        rankIpCity = []
        if self.area == '2':
            for i in range(10):
                element = {"city": data1["domestic_cityData"][i]['cityName'],
                           "ipNum": data1["domestic_cityData"][i]['number']}
                rankIpCity.append(element)
        else:
            for i in range(10):
                element = {"city": data1["foreign_cityData"][i]['cityName'],
                           "ipNum": data1["foreign_cityData"][i]['number']}
                rankIpCity.append(element)

        if self.area == '1' or self.area == '3':
            domainAtRegistrar = data['domainAtRegistrarAbroad']
        else:
            domainAtRegistrar = data['domainAtRegistrarHome']

        dict = {
            "rankAsAtIp": rankAsAtIp,
            "asIndustry": asIndustry,
            "tldDistribution": tldDistribution,
            "rankIpCity": rankIpCity,
            "domainAtRegistrar": domainAtRegistrar,
            "seedNum": seedNum,
            "avgSeedNum": avgSeedNum,
            "foundSites": foundSites,
            "foundApps": foundApps
        }
        return jsonify(dict)
