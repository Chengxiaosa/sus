from concurrent.futures import ThreadPoolExecutor
import json
import threading
import os
import time

# from resources.all_in_one import all_in_one

FILE_DIR = os.path.dirname(os.path.abspath(__file__))
PARENT_DIR = FILE_DIR[:FILE_DIR.rindex('/')]


def generate_crawler(url):
    dom_file = open(PARENT_DIR+"/crawler/test/" +
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
    return [['./node-v14.17.0-linux-x64/bin/node',
             './crawler.js',
             url]
            for url in crawler_prepare]


def action(cmd):
    print('run cmd: {}'.format(' '.join(cmd)))
    os.system(' '.join(cmd))


def crawler(domains, ips):
    crawler_prepare = []
    for domain in domains:
        crawler_prepare.append(domain)
    for ip in ips:
        crawler_prepare.append(ip)

    crawler_cmd = generate_cmd(crawler_prepare)

    with ThreadPoolExecutor(max_workers=20) as pool:
        pool.map(action, crawler_cmd)


'''
for test
'''
if __name__ == '__main__':
    start = time.time()
    domains, ips = generate_crawler('440019.com')
    crawler(domains, ips)
    end = time.time()
    print('--------Running time--------')
    print('%s seconds'%(end - start))
