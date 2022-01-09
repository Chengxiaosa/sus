# -*- coding: utf-8 -*-
from flask import current_app, abort
from flask_restful import Resource
from flask_restful.reqparse import RequestParser
from common.ip_mapping import *
from flask import Flask, request, jsonify
import json, random, string
import os

class MapResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.area = request.args.get("area")

    def get(self):
        mock_data = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_city.json')
        with open(mock_data) as f:
            data = json.load(f)
        if self.area == '2':
            dict = {
                "countryData": data["domestic_countryData"],
                "cityData": data["domestic_cityData"]
            }
        else:
            dict = {
                "countryData": data["foreign_countryData"],
                "cityData": data["foreign_cityData"],
                "daliyCityData": data["daliyCityData"]
            }

        return jsonify(dict)
