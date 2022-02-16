import dns.resolver
import requests, json
from urllib import parse
dns_resolver = dns.resolver.Resolver()
dns_resolver.nameservers = ['114.114.114.114', '223.5.5.5', '223.6.6.6']

# 根据已有域名（确认是诈骗网站），解析ip地址
def query_domain(domain):
    try:
        A = dns_resolver.resolve(domain, 'A')
        A = [i.to_text() for i in A]
        # print(A[0])
    except:
        A = []
    
    try:
        CNAME = dns_resolver.resolve(domain, 'CNAME')
        CNAME = [i.to_text() for i in CNAME]
        # print(CNAME)
    except:
        CNAME = []
    
    try:
        NS = dns_resolver.resolve(domain, 'NS')
        NS = [i.to_text() for i in NS]
        # print(NS)
    except:
        NS = []
    try:
        MX = dns_resolver.resolve(domain, 'MX')
        MX = [i.to_text() for i in MX]
        # print(MX)
    except:
        MX = []            

    return A, CNAME, NS,MX 

def getIP(domain):
    rs = parse.urlparse(domain).netloc
    if rs == '':
        rs = parse.urlparse(domain).path
    A, CNAME, NS,MX = query_domain(rs)
    if A :
        return A[0]
    else :
        result = ''
    return result

def to_int(ip):
    i=0
    summ=0
    for num in ip.split('.')[::-1]:
        summ =summ+ int(num) * 256**i
        i += 1
    return summ

if __name__ == '__main__':
    domain = "www.qq.com"
    rs = parse.urlparse(domain).netloc
    if rs == '':
        rs = parse.urlparse(domain).path
    query_domain(rs)
    


