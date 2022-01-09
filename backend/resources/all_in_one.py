# from .cert_all_in_one import get_from_cert_all_in_one
# from .dns_all_in_one import get_from_dns_all_in_one
# from .subnet_all_in_one import get_from_subnet_all_in_one
# from .boom_all_in_one import get_from_boom_all_in_one

from cert_all_in_one import get_from_cert_all_in_one
from dns_all_in_one import get_from_dns_all_in_one
from subnet_all_in_one import get_from_subnet_all_in_one
from boom_all_in_one import get_from_boom_all_in_one
import logging
from pythonping import ping
import json, os
from urllib import parse
import traceback
import sys
# 
def all_in_one(url):
    # fraud_input_domain = "https://www.556bl.com"
    fraud_input_domain = url
    print(fraud_input_domain)
    all_domains = set()
    all_ips = set()
    count = 0
    domains_from_dns = list()
    domains_from_cert = list()
    domains_from_subnet = list()
    domains_from_boom = list()


    # 从证书获取（20个）
    try:
        domains_from_cert = get_from_cert_all_in_one(fraud_input_domain)
        count += len(domains_from_cert)
        all_domains |= domains_from_cert
    except Exception as e:
        logging.debug("证书异常")
        logging.debug(sys.exc_info()[0:2]) # 打印错误类型，错误值
        logging.debug(traceback.extract_tb(sys.exc_info()[2])) #出错位置                  

    # 从DNS获取（60个）
    try:
        domains_from_dns, ips_from_dns = get_from_dns_all_in_one(fraud_input_domain)
        count += len(domains_from_dns)
        count += len(ips_from_dns)
        all_domains |= domains_from_dns
        all_ips |= ips_from_dns
    except Exception as e:
        logging.debug("DNS异常")
        logging.debug(sys.exc_info()[0:2]) # 打印错误类型，错误值
        logging.debug(traceback.extract_tb(sys.exc_info()[2])) #出错位置                     

    # 子网（20个）
    try:
        domains_from_subnet, ips_from_subnet = get_from_subnet_all_in_one(fraud_input_domain)
        count += len(domains_from_subnet)
        count += len(ips_from_subnet)
        all_domains |= domains_from_subnet
        all_ips |= ips_from_subnet
    except Exception as e:
        logging.debug("子网异常")
        logging.debug(sys.exc_info()[0:2]) # 打印错误类型，错误值
        logging.debug(traceback.extract_tb(sys.exc_info()[2])) #出错位置                        
        

    # BOOM（20个）
    domains_from_boom = get_from_boom_all_in_one(fraud_input_domain)
    count += len(domains_from_boom)
    all_domains |= domains_from_boom

    # domains_from_subnet, ips_from_subnet = get_from_subnet_all_in_one(fraud_input_domain)

    print(len(all_domains))
    print(count)

    FILE_DIR = os.path.dirname(os.path.abspath(__file__))
    rs = parse.urlparse(fraud_input_domain)
    rsp = rs.netloc or rs.path  
    print(rsp)   
    dict = {
        'domains_from_cert': list(domains_from_cert), 
        'domains_from_dns': list(domains_from_dns), 
        # "ips_from_dns": list(ips_from_dns),
        "domains_from_subnet": list(domains_from_subnet),
        # "ips_from_subnet": list(ips_from_subnet),
        "domains_from_boom": list(domains_from_boom),
        }
    # 注释掉
    # try:
    #     with open(FILE_DIR + '/crawler/crawler_result/' + rsp + "/possible.json", 'w') as f:
    #         json.dump(dict, f)
    # except BaseException:
    #     return {"screenshot": "none"}

    return dict

    # all_domains |= domains_from_dns
    # all_domains |= domains_from_subnet
    # all_domains |= domains_from_cert
    # print(all_domains)

# all_in_one()

def all_in_one_cert(url):
    # fraud_input_domain = "https://www.556bl.com"
    fraud_input_domain = url
    print(fraud_input_domain)
    all_domains = set()
    all_ips = set()
    count = 0

    # 从证书获取（20个）
    domains_from_cert = get_from_cert_all_in_one(fraud_input_domain)
    count += len(domains_from_cert)
    all_domains |= domains_from_cert
    FILE_DIR = os.path.dirname(os.path.abspath(__file__))
    rs = parse.urlparse(fraud_input_domain)
    rsp = rs.netloc or rs.path  
    print(rsp)   
    dict = {'domains_from_cert': list(domains_from_cert), }
    return dict


def all_in_one_DNS(url):
    # fraud_input_domain = "https://www.556bl.com"
    fraud_input_domain = url
    print(fraud_input_domain)
    all_domains = set()
    all_ips = set()
    count = 0

    # 从DNS获取（60个）
    domains_from_dns, ips_from_dns = get_from_dns_all_in_one(fraud_input_domain)
    count += len(domains_from_dns)
    count += len(ips_from_dns)
    all_domains |= domains_from_dns
    all_ips |= ips_from_dns


    print(len(all_domains))
    print(count)

    FILE_DIR = os.path.dirname(os.path.abspath(__file__))
    rs = parse.urlparse(fraud_input_domain)
    rsp = rs.netloc or rs.path  
    print(rsp)   
    dict = {
        'domains_from_dns': list(domains_from_dns), 
        "ips_from_dns": list(ips_from_dns),

        "screenshot": "http://10.177.35.156:5001/backend/resources/crawler/crawler_result/"+rsp+"/screenshot.png",}

    return dict


def all_in_one_subnet(url):
    # fraud_input_domain = "https://www.556bl.com"
    fraud_input_domain = url
    print(fraud_input_domain)
    all_domains = set()
    all_ips = set()
    count = 0

    # 子网（20个）
    domains_from_subnet, ips_from_subnet = get_from_subnet_all_in_one(fraud_input_domain)
    count += len(domains_from_subnet)
    count += len(ips_from_subnet)
    all_domains |= domains_from_subnet
    all_ips |= ips_from_subnet


    # domains_from_subnet, ips_from_subnet = get_from_subnet_all_in_one(fraud_input_domain)

    print(len(all_domains))
    print(count)

    FILE_DIR = os.path.dirname(os.path.abspath(__file__))
    rs = parse.urlparse(fraud_input_domain)
    rsp = rs.netloc or rs.path  
    print(rsp)   
    dict = {
        "domains_from_subnet": list(domains_from_subnet),
        "ips_from_subnet": list(ips_from_subnet),}

    return dict

def all_in_one_BOOM(url):
    # fraud_input_domain = "https://www.556bl.com"
    fraud_input_domain = url
    print(fraud_input_domain)
    all_domains = set()
    all_ips = set()
    count = 0


    # BOOM（20个）
    domains_from_boom = get_from_boom_all_in_one(fraud_input_domain)
    count += len(domains_from_boom)
    all_domains |= domains_from_boom

    # domains_from_subnet, ips_from_subnet = get_from_subnet_all_in_one(fraud_input_domain)

    print(len(all_domains))
    print(count)

    FILE_DIR = os.path.dirname(os.path.abspath(__file__))
    rs = parse.urlparse(fraud_input_domain)
    rsp = rs.netloc or rs.path  
    print(rsp)   
    dict = {
        "domains_from_boom": list(domains_from_boom),
        }

    return dict
