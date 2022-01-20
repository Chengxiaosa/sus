# -*- coding: utf-8 -*-
from flask import current_app, abort
from flask_restful import Resource
from flask_restful.reqparse import RequestParser
from common import *
from flask import Flask, request, jsonify
import json, random, string
import os
class ClusterResource(Resource):

    def __init__(self):
        self.parser = RequestParser()
        self.clusterId = request.args.get("clusterId")

    def get(self):
        mock_data = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_x.json')
        with open(mock_data) as f:
            data = json.load(f)
        mock_data1 = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_city'+self.clusterId+'.json')
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
        for i in range(2):
            element = {"city": data1["domestic_cityData"][i]['cityName'],
                        "ipNum": data1["domestic_cityData"][i]['number']}
            rankIpCity.append(element)

        domainAtRegistrar = data['domainAtRegistrarAbroad']

        mock_data_cluster = os.path.join(os.path.dirname(__file__), 'mock_data/mock_data_cluster'+self.clusterId+'.json')
        print('mock_data/mock_data_cluster'+self.clusterId+'.json')

        with open(mock_data_cluster) as f:
            data_cluster = json.load(f)
        oh_my_domains = data_cluster["oh_my_domains"]
        cluster_main_screenshot = data_cluster["cluster_main_screenshot"]
        domain_type = data_cluster["seed_domain_type"]
        domain_type_list = ['未分类', '博彩', '贷款', '理财', '冒充', '直播间', '刷单']
        dns_ip_cluster = data_cluster["dns_ip_cluster"]
        ip_cluster = data_cluster["ip_cluster"]
        site_main_info = data_cluster["site_main_info"]

        dict = {
            "rankAsAtIp": rankAsAtIp,
            "asIndustry": asIndustry,
            "tldDistribution": tldDistribution,
            "rankIpCity": rankIpCity,
            "domainAtRegistrar": domainAtRegistrar,
            "seedNum": seedNum,
            "avgSeedNum": avgSeedNum,
            "foundSites": foundSites,
            "foundApps": foundApps,

            "oh_my_domains": oh_my_domains,
            "cluster_main_screenshot": cluster_main_screenshot,
            "domain_type": domain_type_list[domain_type],
            "dns_ip_cluster": dns_ip_cluster,
            "ip_cluster": ip_cluster,
            "site_main_info": site_main_info,
        }
        return jsonify(dict)

