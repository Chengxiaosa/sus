from flask import current_app, abort
from flask_restful import Resource
from flask_restful.reqparse import RequestParser
from common import *
from flask import Flask, request, jsonify
import json
import random
import string
import os
FILE_DIR = os.path.dirname(os.path.abspath(__file__))
class initSitesResource(Resource):

    def __init__(self):
        self.parser = RequestParser()

    def get(self):
        dom_file = open(FILE_DIR+"/already.json", 'r')
        doms = json.load(dom_file)

        return jsonify(doms)
