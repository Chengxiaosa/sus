# -*- coding: utf-8 -*-
from resources.judgeResource import judgeResource
from flask import Blueprint
from flask_restful import Api
from resources import head, exploit, statistics, daily_finding, map, find, judgeResource, scrap, initSitesResource,  cluster, total,daily,network,server
# APIv1是什么固定的用法么 是这个py文件的名称
api_v1 = Blueprint('api_v1', __name__)

api = Api(api_v1)
api.add_resource(daily_finding.DailyResource, '/dailyfinding')
api.add_resource(initSitesResource.initSitesResource, '/initSites')
api.add_resource(map.MapResource, '/map')
api.add_resource(exploit.CurrentResource, '/exploit/current')
api.add_resource(scrap.CrawlerResource, '/crawler')
api.add_resource(cluster.ClusterResource, '/findClusterByid')
api.add_resource(total.TotalResource, '/total')
api.add_resource(daily.DailyResource1, '/daily')
api.add_resource(server.ServerResource, '/server')
api.add_resource(network.ASResource, '/network/AS')
api.add_resource(network.TldResource, '/network/tld')
api.add_resource(network.CityResource, '/network/city')
api.add_resource(network.CountryResource, '/network/country')
api.add_resource(network.IndustryResource, '/network/industry')
api.add_resource(network.RegistrarResource, '/network/registrar')
api.add_resource(exploit.AppResource, '/exploit/findAppByPath')
api.add_resource(exploit.SitesResource, '/exploit/findSitesByDomain')
api.add_resource(find.FindResource, '/findSitesByUrl')
api.add_resource(find.FindResourceFromBoom, '/findSitesByUrlFromBoom')
api.add_resource(find.FindResourceFromCert, '/findSitesByUrlFromCert')
api.add_resource(find.FindResourceFromDns, '/findSitesByUrlFromDns')
api.add_resource(find.FindResourceFromSubnet, '/findSitesByUrlFromSubnet')
api.add_resource(find.FindResourceCrawler, '/findSitesCrawler')
api.add_resource(judgeResource.judgeResource, '/judge')
api.add_resource(judgeResource.activityCrawler, '/activityCrawler')

