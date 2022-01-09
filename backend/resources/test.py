from cert_all_in_one import get_from_cert_all_in_one
from dns_all_in_one import get_from_dns_all_in_one
from subnet_all_in_one import get_from_subnet_all_in_one
from boom_all_in_one import get_from_boom_all_in_one
from pythonping import ping
import json, os
from urllib import parse
def all_in_one_test(url):
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

    # 从DNS获取（60个）
    domains_from_dns, ips_from_dns = get_from_dns_all_in_one(fraud_input_domain)
    count += len(domains_from_dns)
    count += len(ips_from_dns)
    all_domains |= domains_from_dns
    all_ips |= ips_from_dns

    # 子网（20个）
    domains_from_subnet, ips_from_subnet = get_from_subnet_all_in_one(fraud_input_domain)
    count += len(domains_from_subnet)
    count += len(ips_from_subnet)
    all_domains |= domains_from_subnet
    all_ips |= ips_from_subnet

    # BOOM（20个）
    domains_from_boom = get_from_boom_all_in_one(fraud_input_domain)
    print(domains_from_boom)
    count += len(domains_from_boom)
    all_domains |= domains_from_boom

    # domains_from_subnet, ips_from_subnet = get_from_subnet_all_in_one(fraud_input_domain)

    print(len(all_domains))
    print(count)

    FILE_DIR = os.path.dirname(os.path.abspath(__file__))
    rs = parse.urlparse(fraud_input_domain)

    dict = {'domains_from_cert': list(domains_from_cert), 
        'domains_from_dns': list(domains_from_dns), 
        "ips_from_dns": list(ips_from_dns),
        "domains_from_subnet": list(domains_from_subnet),
        "ips_from_subnet": list(ips_from_subnet),
        "domains_from_boom": list(domains_from_boom)}

    os.makedirs(FILE_DIR + '/crawler/test/' + rs.netloc)
    with open(FILE_DIR + '/crawler/test/' + rs.netloc + "/possible.json", 'w') as f:
        json.dump(dict, f)

    return dict

# fraud_domains = ['https://abc.mrbaixing.cn/']

# fraud_domains = ['https://www.jiasheng16.com']

# fraud_domains = ['https://197052.cn/']

# fraud_domains = ['https://129743.cn/']

# fraud_domains = ['https://adm333.com']

# fraud_domains = ['https://www.40220b.com/']

# fraud_domains = ['https://toucai11i.com/']

# fraud_domains = ['https://toucai44l.com/']

# fraud_domains = ['https://www.15888.com/']

fraud_domains = ['https://440019.com/']
for i in fraud_domains:
    all_in_one_test(i)