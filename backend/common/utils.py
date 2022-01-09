# -*- coding: utf-8 -*-
import hashlib
import datetime
import random
from random import choice
import random
import time
from datetime import datetime

def strTimeProp(start, end, prop, frmt):
    stime = time.mktime(time.strptime(start, frmt))
    etime = time.mktime(time.strptime(end, frmt))
    ptime = stime + prop * (etime - stime)
    return int(ptime)

def randomTimestamp(start, end, frmt='%Y-%m-%d %H:%M:%S'):
    return strTimeProp(start, end, random.random(), frmt)

def randomDate(start, end, frmt='%Y-%m-%d %H:%M:%S'):
    return time.strftime(frmt, time.localtime(strTimeProp(start, end, random.random(), frmt)))

def randomTimestampList(start, end, n, frmt='%Y-%m-%d %H:%M:%S'):
    return [randomTimestamp(start, end, frmt) for _ in range(n)]

def randomDateList(start, end, n, frmt='%Y-%m-%d %H:%M:%S'):
    return [randomDate(start, end, frmt) for _ in range(n)]

def pretty_result(code, msg=None, data=None):
    if msg is None:
        msg = CODE_MSG_MAP.get(code)
    return {
        'code': code,
        'msg': msg,
        'data': data
    }

def hash_md5(data):
    md5 = hashlib.md5()
    md5.update(data)
    return md5.hexdigest()

banks = ['工商银行', '建设银行', '农业银行', '招商银行', '广发银行', '华夏银行', '兴业银行', '交通银行', '中信银行', '光大银行']
channels = ['微信支付', 'Apple Pay', '美团支付', 'Paypal', 'Samsung Pay', 'Google Pay']
citys = ['中国上海', '美国西雅图', '美国旧金山', '中国香港', '埃及开罗', '澳大利亚悉尼', '美国纽约',
         '中国吉林', '中国苏州', '英国利物浦', '英国伦敦', '法国巴黎', '法国法兰克福', '俄罗斯圣彼得堡', '俄罗斯莫斯科',
         '日本东京', '日本大阪', '泰国曼谷', '印度孟买']
TLDs = ['.com', '.name', '.vip', '.net', '.club', '.top', '.org', '.store', '.info', '.gov', '.xyz', '.eu']
ASs = ['BULL-HN', 'PRONEA', 'IMATRIX', 'ERI-AS', 'LBL', 'RKU', 'URS', 'RAND', 'ASOS-AS', 'TEAMNET']
registrar_home = ['万网', '西部数码', '新网互联', '易名中国', '商务中国', '三五互联', '米仓', '琥珀网']
registrar_abroad = ['Godaddy', 'Enom', 'TuCows', 'Gandi', 'Ipower', 'domainsite', 'namecheap', 'Netfirms', 'NetworkSolutions']
cities_home = ['上海', '澳门', '香港', '浙江温州', '浙江绍兴', '浙江杭州', '江苏苏州',
               '江苏连云港', '江苏泰州', '浙江台州', '山东青岛', '四川成都', '江西南昌',
               '广东珠海', '天津', '重庆', '台湾台北', '湖南长沙', '吉林延边']
citys_abroad = ['美国西雅图', '美国旧金山', '埃及开罗', '澳大利亚悉尼', '美国纽约',
         '英国利物浦', '英国伦敦', '法国巴黎', '法国法兰克福', '俄罗斯圣彼得堡', '俄罗斯莫斯科',
         '日本东京', '日本大阪', '泰国曼谷', '印度孟买']
screenshots = ['bet365.png', 'ggbet.png', 'raybet.png', 'yyfyyf.png']
names = ['赵子轩', '钱博文', '孙欣怡', '李梦琪', '周子萱',
         '吴文博', '郑天佑', '王可欣', '赵雨彤', '钱宇',
         '孙晨曦', '李涵', '周俊杰', '吴明轩', '郑浩', '欧阳睿']
families = ['Yibo', 'YiboWeb', 'Dcloud', 'Delight', 'Phoenix', 'lebo lbgame',
            'tian', 'xy0']
platforms = ['yt8.me', 'yt6.me', 'https://baidujump.app/eipeyipeyi/jump-248.html?rand=29421736',
             'https://fhapp168h.com/', 'https://www.lebogame.co/app.php?code=b4']

channel_icon_mapping = {'支付宝':'pay_zfb.png', '微信支付':'pay_wx.png', '银联支付':'pay_yl.png',
                        'QQ钱包':'pay_qq.png', 'Apple Pay':'pay_apple.png', '美团支付':'pay_meituan.png',
                        'Paypal':'pay_paypal.png', 'Samsung Pay':'pay_samsung.png', 'Google Pay':'pay_google.png', '云闪付':'pay_ysf.png'}
bank_icon_mapping = {'工商银行':'bank_gs.png', '建设银行':'bank_js.png', '农业银行':'bank_ny.png',
                     '招商银行':'bank_zs.png', '广发银行':'bank_gf.png', '华夏银行':'bank_hx.png',
                     '兴业银行':'bank_xy.png', '交通银行':'bank_jt.png', '中信银行':'bank_zx.png',
                     '光大银行':'bank_gd.png'}
host_providers = ['恒创科技', '腾讯云', '阿里巴巴香港', 'DNC Limited', '百度云']
host_providers_mapping = {'恒创科技':'14617', '腾讯云':'5513', '阿里巴巴香港':'5321', 'DNC Limited':'3269', '百度云':'2030'}
asnames_for_short = {'60 Market Square,P.O. Box 364':'EAGLENET-AP','Microsoft Corporation':'MSFT-CORP',
                    'Shenzhen Katherine Heng Technology Information Co., Ltd.':'SKHT-AS','NETSEC':'NETSEC',
                    'Google LLC':'GOOGLE','CNSERVERS LLC':'CNSERVERS','HUAWEI CLOUDS':'HWCLOUDS',
                    'Dimension Network & Communication Limited':'DNC-AS','Gigabit Hosting Sdn Bhd':'GIGABIT-MY',
                    'PEG TECH INC':'PEGTECHINC','Cloudflare, Inc.':'CLOUDFLARE','BGPNET Global ASN':'BCPL-SG',
                    'RBNET Co.,Ltd.':'RBNET','UCLOUD INFORMATION TECHNOLOGY (HK) LIMITED':'UCLOUD-HK'}
def mock_host_providers():
    numbered_host_providers = []
    for i in range(len(host_providers)):
        tmp = {
            "provider":host_providers[i],
            "number":host_providers_mapping[host_providers[i]]
        }
        numbered_host_providers.append(tmp)
    return numbered_host_providers

def random_family():
    return choice(families)

def random_platform():
    return choice(platforms)

def random_accounts(n):
    accounts = []
    persons = random.sample(names, n)
    for i in range(n):
        bank = choice(banks)
        tmp = {
            "accountNo":random.randint(1000000000000000000, 10000000000000000000),
            "bank": bank,
            "person": persons[i],
            "bankIcon": bank_icon_mapping[bank]
        }
        accounts.append(tmp)
    return accounts

def random_screenshot():
    return 'http://10.177.35.156:5000/static/' + choice(screenshots)

def random_home_registrar(n):
    return random.sample(registrar_home, n)

def random_abroad_registrar(n):
    return random.sample(registrar_abroad, n)

def random_banks(n):
    res = []
    number = [random.randrange(10000) for i in range(n)]
    number.sort(reverse=True)
    randomBanks = random.sample(banks, n)
    for i in range(n):
        element = {'bank': randomBanks[i], 'number': number[i], 'icon': bank_icon_mapping[randomBanks[i]]}
        res.append(element)
    return res

def random_channels(n):
    res = []
    number = [random.randrange(1000) for i in range(n)]
    number.sort(reverse=True)
    randomChannels = random.sample(channels, n)
    for i in range(n):
        if i==0:
            element = {'channel': '支付宝', 'number': 6520, 'icon': channel_icon_mapping['支付宝']}
        elif i==1:
            element = {'channel': '银联支付', 'number': 5212, 'icon': channel_icon_mapping['银联支付']}
        elif i==2:
            element = {'channel': 'QQ钱包', 'number': 4121, 'icon': channel_icon_mapping['QQ钱包']}
        elif i==3:
            element = {'channel': '云闪付', 'number': 3112, 'icon': channel_icon_mapping['云闪付']}
        else:
            element = {'channel': randomChannels[i], 'number': number[i], 'icon': channel_icon_mapping[randomChannels[i]]}
        res.append(element)
    return res

def random_city():
    return choice(citys)

def random_TLD():
    return choice(TLDs)

def random_city_and_ip(n, type):
    res = []
    number = [random.randrange(10000) for i in range(n)]
    number.sort(reverse=True)
    randomCities = []
    if type==1:
        randomCities = random.sample(citys, n)
    elif type==2:
        randomCities = random.sample(cities_home, n)
    else:
        randomCities = random.sample(citys_abroad, n)
    for i in range(n):
        element = {'city': randomCities[i], 'ipNum': number[i]}
        res.append(element)
    return res

def random_TLDs(n, type):
    res = []
    number = [random.randrange(2000) for i in range(n)]
    number.sort(reverse=True)
    randomTLDs = random.sample(TLDs, n)
    tmp = ""
    for i in range(n):
        if i==0:
            number[i] = 5201
        if i==0 and not randomTLDs[i]=='.com':
            tmp = randomTLDs[i]
            randomTLDs[i] = '.com'
        if not i==0 and randomTLDs[i]=='.com':
            randomTLDs[i] = tmp
        if type==1:
            element = {'domain': randomTLDs[i], 'domainNum': number[i]}
        else:
            element = {'tld': randomTLDs[i], 'number': number[i]}
        res.append(element)
    return res

def random_as_and_ip(n):
    res = []
    number = [random.randrange(10000) for i in range(n)]
    number.sort(reverse=True)
    randomASs = random.sample(ASs, n)
    for i in range(n):
        element = {'asName': randomASs[i], 'ipNum': number[i], 'domainNum': number[i]}
        res.append(element)
    return res

def random_array(n, a, b, c=0): # n=len(array)
    res = []


    # res = []
    # for i in range(n):
    #     if a=='bank':
    #         tmp = {a:random_bank(),
    #             b:random.randint(1,100)}
    #     elif a=='channel':
    #         tmp = {a:random_channel(),
    #             b:random.randint(1,100)}
    #     elif a=='city':
    #         tmp = {a:random_city(),
    #             b:random.randint(1,100)}
    #     elif a=='domain':
    #         tmp = {a:random_TLD(),
    #             b:random.randint(1,100)}
    #     # else:
    #     #     tmp = {a:''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(2,4))),
    #     #         b:random.randint(1,100)}
    #     if c:
    #         tmp[c] = random.randint(1,100)
    #     res.append(tmp)
    # return res

def random_url():
    url = "www."
    url += ''.join(random.sample('abcdefghijklmnopqrstuvwxyz',random.randint(5,12)))
    url += ".com"
    return url


# if __name__ == '__main__':
#     now = datetime.now()
#     end = now.strftime("%Y-%m-%d %H:%M:%S")
#     start = now.strftime("%Y-%m-%d") + ' 00:00:00'
#     lenth = 10
#     print(randomTimestamp(start, end))
#     print(randomDate(start,end))
#     print(randomTimestampList(start, end, lenth))
#     print(randomDateList(start, end, lenth))