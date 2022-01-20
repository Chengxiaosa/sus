import dns.resolver
import requests, json
import datetime
from urllib import parse
dns_resolver = dns.resolver.Resolver()
dns_resolver.nameservers = ['1.1.1.1', '8.8.8.8', '114.114.114.114', '223.5.5.5', '223.6.6.6']
import sys
sys.path.append("./backend")
from db import DB

# 根据已有域名（确认是诈骗网站），解析ip地址
def query_domain(domain):
    try:
        A = dns_resolver.resolve(domain, 'A')
        A = [i.to_text() for i in A]
    except:
        A = []
    
    try:
        CNAME = dns_resolver.resolve(domain, 'CNAME')
        CNAME = [i.to_text() for i in CNAME]
    except:
        CNAME = []
    
    try:
        NS = dns_resolver.resolve(domain, 'NS')
        NS = [i.to_text() for i in NS]
    except:
        NS = []

    return A, CNAME, NS

# 根据ip，使用pdns技术，获取其他相关dns
def get_domain_from_secrank(ip):
    db = DB()    
    mongo_db = db.get_mongo()
    auto_scripts = mongo_db['auto_scripts']
    domain_from_subnet = auto_scripts['domain_from_subnet']
    rows = domain_from_subnet.find({"ip": ip})    

    for item in rows:
        return set(item['domains']),set()    
    url = f"https://api.secrank.cn/flint/rdata/{ip}/28"

    headers = {'fdp-token': '02cae0198cb00f3e2ffc3a4b3d1a9e8e'}
    response = requests.get(url, headers=headers)

    data = json.loads(response.text)["data"]
    
    domains = set()
    ips = set()
    for item in data:
        # A类型DNS记录，将域名解析到ip地址
        if item['rrtype'] == 'A':
            domains.add(item['rrname'])
        item_ip = item['rdata'].strip(';')
        ips.add(item_ip)
    domain_from_subnet.insert_one({"ip": ip, "domains":list(domains), "datetime": datetime.datetime.now()})        
    return domains, ips

# 主入口
def get_from_dns_all_in_one(fraud_input_domain):
    # fraud_input_domain = "www.wm5218.com"
    rs = parse.urlparse(fraud_input_domain)
    A, CNAME, NS = query_domain(rs.netloc or rs.path)
    domains = set()
    ips = set()
    for ip in A:
        i = 15
        parts = ip.split('.')
        prefixm = '.'.join(parts[:3:])
        k = int(parts[-1])            
        while True:
            if  k > i:
                i  = i+ 16
            else:
                ip = '{}.{}'.format(prefixm, i) 
                break                
        newdomains, newips = get_domain_from_secrank(ip)
        ips |= newips
        domains |= newdomains
        if len(domains) > 60 | len(ips) > 60:
            break
    if len(domains) > 60:
        domains = set(list(domains)[0:60])
    if len(ips) > 60:
        ips = set(list(ips)[0:60])
    return domains, ips

