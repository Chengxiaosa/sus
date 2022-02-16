import json, requests

import dns.resolver
from urllib import parse
dns_resolver = dns.resolver.Resolver()
dns_resolver.nameservers = ['114.114.114.114', '223.5.5.5', '223.6.6.6']

from collections import Counter
# 根据ip，使用pdns技术，获取其他相关dns
def get_domain_from_secrank(ip):
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
    
    return domains, ips

class Slash24:

    def __init__(self, prefix):
        self.prefix = prefix
        self.collected = set()

    def __str__(self):
        return '{}.0/24'.format(self.prefix)

    def get_possible_ips(self):
        possible_ips = set(range(255)) - self.collected

        return ['{}.{}'.format(self.prefix, ip) for ip in possible_ips]


class Slash24Factory:
    def __init__(self):
        self.slash_24 = {}


    def get_slash_24(self, ip):
        parts = ip.split('.')
        prefix = '.'.join(parts[:3:])
        suffix = parts[-1]

        if prefix not in self.slash_24.keys():
            self.slash_24[prefix] = Slash24(prefix)

        self.slash_24[prefix].collected.add(suffix)

    def count(self):
        count_dict = {key: len(value.collected) for key, value in self.slash_24.items()}

        c = Counter(count_dict)
        
        return [i for i, j in c.most_common()]

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

# 主入口
def get_from_subnet_all_in_one(fraud_input_domain):
    # fraud_input_domain = "www.wm5218.com"
    rs = parse.urlparse(fraud_input_domain)
    A, CNAME, NS = query_domain(rs.netloc or rs.path)
    factory = Slash24Factory()
    
    for ip in A:
        factory.get_slash_24(ip)

    domains = set()

    ips = set()

    for prefix in factory.count():
        slash24 = factory.slash_24[prefix]

        possible_ips = slash24.get_possible_ips()
        ips |= set(possible_ips)

        for ip in ips:
            newdomains, newips = get_domain_from_secrank(ip)
            domains |= newdomains
            # ips |= newips
            # if len(domains) > 20 | len(ips) > 20:
            #     break
        # if len(domains) > 20 | len(ips) > 20:
          #   break

    # if len(domains) > 20:
      #   domains = set(list(domains)[0:20])
    # if len(ips) > 20:
      #   ips = set(list(ips)[0:20])
    return domains, ips
