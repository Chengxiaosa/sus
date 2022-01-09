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
from .crawler.crawler import generate_crawler, crawler
from .judgeHIS.predict import get_results_by_domain
from urllib import parse

class CrawlerResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.url = request.args.get("url")

    def get(self):
        rs = parse.urlparse(self.url)
        thisDomain = rs.netloc or rs.path
        if thisDomain == 'hjc965.com':
            return

        if thisDomain == 'xxmh99.vip':
            return

        domains, ips = generate_crawler(rs.netloc or rs.path)
        crawler(domains, ips)
