# -*- coding: utf-8 -*-
from flask import current_app, abort
from flask_restful import Resource
from flask_restful.reqparse import RequestParser
from common import *
from flask import Flask, request, jsonify
import json, random, string
import os
from datetime import datetime

class ASResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        # self.asName = ""
        # # AS名称
        # self.ipNum = ""
        # self.domainNum = "" 
        # # 域名数
        # self.industry = ""
        # # AS行业类型
    def get(self):
        mock_data = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_x.json')
        with open(mock_data) as f:
            data = json.load(f)
        mock_data1 = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_city.json')
        with open(mock_data1) as f:
            data1 = json.load(f)
        # ######################读取模拟数据
        AS = []
        AS = data['rankAsAtIp']


        dict = {
            "AS":AS
                    }
        return jsonify(dict)

class TldResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        # self.tldName = ""
        # self.tldNumber = ""
    def get(self):
        mock_data = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_x.json')
        with open(mock_data) as f:
            data = json.load(f)
        mock_data1 = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_city.json')
        with open(mock_data1) as f:
            data1 = json.load(f)
        # ######################读取模拟数据
        # tld = []
        # for i in range(10):
        #     element = {
        #         "tldName" :"",
        #         "tldNumber" :"",
        #     }
        #     tld.append(element)
        tld = []
        rankTLD = data['rankTLD']
        for i in range(len(rankTLD)):
            tmp = {
                "tld":rankTLD[i]['domain'],
                "number":rankTLD[i]['domainNum']
            }
            tld.append(tmp)

        dict = {
            "tld":tld
                    }
        return jsonify(dict)

class RegistrarResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.registrar = ""
        self.number = ""
        self.proportion = ""
    def get(self):
        mock_data = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_x.json')
        with open(mock_data) as f:
            data = json.load(f)
        mock_data1 = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_city.json')
        with open(mock_data1) as f:
            data1 = json.load(f)
        # ######################读取模拟数据
        registrar = data['domainAtRegistrarAbroad']

        dict = {
            "registrar":registrar
                    }
        return jsonify(dict)

class IndustryResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.registrar = ""
        self.number = ""
        self.proportion = ""
    def get(self):
        mock_data = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_x.json')
        with open(mock_data) as f:
            data = json.load(f)
        mock_data1 = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_city.json')
        with open(mock_data1) as f:
            data1 = json.load(f)
        # ######################读取模拟数据
        industry = data['asIndustry']

        dict = {
            "industry":industry
                    }
        return jsonify(dict)

class CityResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.cityIpNum = ""
        self.long = ""
        self.lat = ""
        self.cityIpNumHis = ""
        self.cityIpNumToday = ""
    def get(self):
        mock_data = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_x.json')
        with open(mock_data) as f:
            data = json.load(f)
        mock_data1 = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_city.json')
        with open(mock_data1) as f:
            data1 = json.load(f)
        # ######################读取模拟数据
        city = []
        for i in range(10):
            element = {"city": data1["foreign_cityData"][i]['cityName'],
            "ipNum": data1["foreign_cityData"][i]['number']}
            city.append(element)
        # for i in range(10):
        #     element = {
        #         "cityIpNum" :"",
        #         "long" :"",
        #         "lat":"",
        #         "cityIpNumHis":"",
        #         "cityIpNumToday":""
        #     }
        #     city.append(element)

        dict = {
            "city":city
                    }
        return jsonify(dict)

class CountryResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        # self.cuntryIpNum = ""
        # self.long = ""
        # self.lat = ""
        # self.countryIpNumHis = ""
        # self.countryIpNumToday = ""
    def get(self):
        mock_data = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_x.json')
        with open(mock_data) as f:
            data = json.load(f)
        mock_data1 = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_city.json')
        with open(mock_data1) as f:
            data1 = json.load(f)
        # ######################读取模拟数据
        city = []
        for i in range(10):
            element = {
                "cuntryIpNum" :"",
                "long" :"",
                "lat":"",
                "countryIpNumHis":"",
                "countryIpNumToday":""
            }
            city.append(element)
        dict = {
            city:city
                    }
        return jsonify(dict)
        

        