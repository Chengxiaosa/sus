#import requests, traceback, logging, random
#from retry import retry
import random
from random import choice

user_agent_list = [
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 "
    "(KHTML, like Gecko) Chrome/22.0.1207.1 Safari/537.1",
    "Mozilla/5.0 (X11; CrOS i686 2268.111.0) AppleWebKit/536.11 "
    "(KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11",
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.6 "
    "(KHTML, like Gecko) Chrome/20.0.1092.0 Safari/536.6",
    "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.6 "
    "(KHTML, like Gecko) Chrome/20.0.1090.0 Safari/536.6",
    "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.1 "
    "(KHTML, like Gecko) Chrome/19.77.34.5 Safari/537.1",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.5 "
    "(KHTML, like Gecko) Chrome/19.0.1084.9 Safari/536.5",
    "Mozilla/5.0 (Windows NT 6.0) AppleWebKit/536.5 "
    "(KHTML, like Gecko) Chrome/19.0.1084.36 Safari/536.5",
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 "
    "(KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
    "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.3 "
    "(KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
    "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 "
    "(KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3",
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 "
    "(KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3",
    "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 "
    "(KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 "
    "(KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
]

headers = {
    'Connection': 'close',
    "User-Agent": random.choice(user_agent_list)
}

domestic_citys = ['吉林延边', '江西上饶', '湖南株洲', '上海', '河南周口', '山东蓬莱', '广东珠海']

foreign_citys = ['中国香港', '美国洛杉矶', '美国芝加哥', '台湾台北', '日本东京', '广东深圳', '马来西亚吉隆坡', '印度德里']

domestic_provinces = ['上海', '北京', '吉林']

foreign_countries = ['哈萨克斯坦', '印度尼西亚', '美国', '英国', '芬兰']

countries = ['哈萨克斯坦', '印度尼西亚', '美国', '英国', '芬兰', '中国']

location_dicts = {'吉林延边': (42.909, 129.472), '台湾台北': (25.033, 121.565), '香港': (22.319, 114.169), '江西上饶': (28.455, 117.943), '澳门': (22.199, 113.544),
                  '湖南株洲': (27.828, 113.134), '上海': (31.230, 121.474), '河南周口': (33.626, 114.697), '山东蓬莱': (37.811, 120.759), '广东珠海': (22.271, 113.577),
                  '美国丹佛': (39.739, 255.01), '玻利维亚苏克雷': (-19.035, 294.741), '埃及开罗': (30.044, 31.236), '哈萨克斯坦': (48.020, 66.924), '美国西雅图': (47.606, 237.668),
                  '捷克卡罗维发利': (50.232, 12.872), '印度尼西亚': (-0.789, 113.921), '澳大利亚帕鲁': (-27.997, 145.847), '俄罗斯莫斯科': (55.756, 37.617), '英国伦敦': (51.507, 359.872),
                  '北京': (39.904, 116.407), '吉林': (43.152, 126.437), '美国': (37.090, 264.287), '英国': (55.378, 356.564), '芬兰': (61.924, 25.748),
                  '中国': (35.862, 104.195), '美国旧金山': (37.775, 237.581), '马来西亚吉隆坡': (3.139, 101.687), '美国洛杉矶': (34.052, 241.756), '日本东京': (35.68, 139.769),
                  '美国达拉斯': (32.777, 263.203), '南非约翰内斯堡': (-26.204, 28.047), '台湾': (23.698, 120.961), '日本': (36.205, 138.253), '中国香港': (22.319, 114.169),
                  '中国台北': (25.033, 121.565), '广东': (23.379, 113.763), '广东深圳': (22.543, 114.058), '广东龙华': (22.684, 114.035), '台湾高雄': (22.627, 120.301),
                  '浙江杭州': (30.274, 120.155), '广东广州': (23.129, 113.264),
                  '印度': (20.594, 78.963), '中国台湾': (23.698, 120.961), '香港中西区': (22.273, 114.150), '香港柴湾': (22.268, 114.236), '美国芝加哥': (41.878, 272.37),
                  '香港长沙湾': (22.336, 114.149), '美国圣荷西': (37.338, 238.114), '美国堪萨斯城': (39.01, 265.422), '香港油尖旺区': (22.312, 114.171), '文莱斯里巴加湾': (4.903, 114.94),
                  '台湾新北': (25.017, 121.463), '河南郑州': (34.747, 113.625), '山东济南': (36.651, 117.12), '湖北武汉': (30.593, 114.306),
                  '印度德里': (28.704, 77.102), '台湾糞箕湖': (24.677, 120.968),
                  }

"""
@retry(Exception, tries=2, delay=6)
def ip_map(ip):
    url = f"http://ip-api.com/json/{ip}?fields=61439&lang=zh-CN"
    response = requests.get(url=url, headers=headers, timeout=5).json()
    print(response)
    print(response['regionName'])
    return response
"""

def random_area_and_location(n, area, region, ranges):
    #area=1 全球 area=2 境内 area=3 境外
    #region=1 国家/省 region=2 城市
    res = []
    number = [random.randint(1, ranges) for i in range(n)]
    number.sort(reverse=True)
    if area == 1 and region == 1:
        randomlocations = random.sample(countries, n)
    elif area == 1 and region == 2:
        randomlocations = random.sample(domestic_citys + foreign_citys, n)
    elif area == 2 and region == 1:
        randomlocations = random.sample(domestic_provinces, n)
    elif area == 2 and region == 2:
        randomlocations = random.sample(domestic_citys, n)
    elif area == 3 and region == 1:
        randomlocations = random.sample(foreign_countries, n)
    else:
        randomlocations = random.sample(foreign_citys, n)
    for i in range(n):
        location = randomlocations[i]
        if (region == 2):
            element = {'cityName': location, 'number': number[i], 'long': location_dicts[location][1],
                       'lat': location_dicts[location][0]}
        else:
            element = {'countryName': location, 'number': number[i], 'long': location_dicts[location][1],
                       'lat': location_dicts[location][0]}
        res.append(element)
    return res

def random_address_and_location():
    address = choice(domestic_citys + foreign_citys)
    return address, location_dicts[address][1], location_dicts[address][0]
