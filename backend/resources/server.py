# -*- coding: utf-8 -*-

from flask import current_app, abort
from flask_restful import Resource
from flask_restful.reqparse import RequestParser
from common import *
from flask import Flask, request, jsonify
import json, random, string
import os
from datetime import datetime
import psutil
import re
import time
class ServerResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.before = psutil.net_io_counters().bytes_recv
        # self.cpu = ""
        # # CPU占用
        # self.memory = ""
        # # 内存占用
        # self.bandwidth = ""
        # # 带宽
        # self.request = ""
        # # 请求次数
        # self.diskRate = ""
        # # 磁盘速率
    def get(self):
        # 内存
        info = psutil.virtual_memory()
        memory = info.percent/100

        memory = "%.4f" % memory

        # cpu
        cpu = psutil.cpu_percent()/100

        cpu = "%.4f" % cpu

        # # 带宽
        # before = self.before
        # print("1")
        # print(before)
        # now = psutil.net_io_counters().bytes_recv
        # print(now)
        # delta = (now-before)/102400#变成K再除100，大致相当于多少M宽带。
        # print("2")
        # print(delta)
        # self.before = now
        # 请求数
        request = psutil.net_io_counters().packets_recv
        server = {
            "bandwidth":100,
            "cpu":cpu,
            "diskRate":"487",
            "memory":memory,
            "request":request,
        }
        dict = {
            "server":server
                    }
        return jsonify(dict)