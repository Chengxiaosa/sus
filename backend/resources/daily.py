# -*- coding: utf-8 -*-
from flask import current_app, abort
from flask_restful import Resource
from flask_restful.reqparse import RequestParser
from common import *
from flask import Flask, request, jsonify
import json, random, string
import os
from datetime import datetime

class DailyResource1(Resource):

    def __init__(self):
        self.parser = RequestParser()
    def get(self):
        mock_data = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_x.json')
        with open(mock_data) as f:
            data = json.load(f)
        mock_data1 = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_city.json')
        with open(mock_data1) as f:
            data1 = json.load(f)
        dailySiteNum = 4578
        dailySites = []
        dailyScanSite = 4578
        dailySites = data['dailyDataHome']

        dict = {
            "dailySiteNum":dailySiteNum ,
            "dailySites":dailySites,
            "dailyScanSite":dailyScanSite,
                    }
        return jsonify(dict)