from concurrent.futures import ThreadPoolExecutor
from multiprocessing import Pool
import json
import threading
import os
import logging

from all_in_one import all_in_one

FILE_DIR = os.path.dirname(os.path.abspath(__file__))
PARENT_DIR = FILE_DIR[:FILE_DIR.rindex('/')]


def generate_crawler(url):
    dom_file = open(PARENT_DIR+"/crawler/crawler_result/" +
                    url+"/possible.json", 'r')
    doms = json.load(dom_file)

    domains_from_cert = doms['domains_from_cert']
    domains_from_dns = doms['domains_from_dns']
    domains_from_subnet = doms['domains_from_subnet']
    domains_from_boom = doms['domains_from_boom']
    ips_from_dns = doms['ips_from_dns']
    ips_from_subnet = doms['ips_from_subnet']
    return domains_from_cert + domains_from_dns + domains_from_subnet + domains_from_boom, ips_from_dns + ips_from_subnet


def generate_cmd(crawler_prepare):
    # return [['./backend/resources/crawler/node-v14.17.0-linux-x64/bin/node',
    #          './backend/resources/crawler/crawler.js',
    #          url]
    #         for url in crawler_prepare]
    return [['node',
             './fontend/src/crawler/page_crawler.js',
             url]
            for url in crawler_prepare]            


def action(cmd):
    logging.debug('run cmd: {}'.format(' '.join(cmd)))
    # print('run cmd: {}'.format(' '.join(cmd)))
    os.system(' '.join(cmd))


def crawler(domains, ips):
    crawler_prepare = []
    for domain in domains:
        crawler_prepare.append(domain)
    for ip in ips:
        crawler_prepare.append(ip)

    crawler_cmd = generate_cmd(crawler_prepare)

    with ThreadPoolExecutor(max_workers=5) as pool:
        pool.map(action, crawler_cmd)
    # pool = Pool(processes=5)
    # pool.map(action, crawler_cmd)
    # pool.close()
    # pool.join()


'''
for test
if __name__ == '__main__':
    crawler('https://www.556bl.com')
'''
