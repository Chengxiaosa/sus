
import validators
import zoomeye.sdk as zoomeye

# from db import DB
from subprocess import check_output

from find.passive_dns_mod import get_domain_from_secrank
from find.util_find import get_id, update_db, insert_urls
import tldextract


def parse_ssl(ssl_info):
    ssl_urls = set()
    for line in ssl_info.split('\n'):
        line = line.strip()
        if line.startswith('Subject:'):
            domain = line.split('=')[-1]
            if validators.domain(domain):
                ssl_urls.add(f'https://{domain}')
        if line.startswith('DNS:'):
            dns_items = line.split(',')
            for dns_item in dns_items:
                domain = dns_item.replace('DNS:', '').strip()
                if validators.domain(domain):
                    ssl_urls.add(f'https://{domain}')
    return ssl_urls


def get_new_from_zoom_eye(item):
    urls = set()
    ip = item["ip"]
    if 'portinfo' in item.keys():
        service = item["portinfo"]["service"]
        port = item["portinfo"]["port"]

        domains, ips = get_domain_from_secrank(ip)
        domains.add(ip)

        if service == 'http' or service == 'https':
            if (service == 'http' and port == 80) or (service == 'https' and port == 443):
                for i in domains:
                    urls.add(f'{service}://{i}')
            else:
                for i in domains:
                    urls.add(f'{service}://{i}:{port}')
            '''
            if port == 8888:
                for i in domains:
                    urls.add(f'{service}://{i}')
            if service == 'https' and 'ssl' in item.keys():
                ssl_info = item['ssl']
                urls |= parse_ssl(ssl_info)
            '''

    return urls

# db = DB()


def get_from_zoomeye(keyword, after, before, scope):
    zm = zoomeye.ZoomEye(api_key='568fBDB4-78BD-5fF0F-d666-e75549325e2')
    # data = zm.dork_search('理财 中心+after:"2021-01-01"+before:"2021-05-21"')
    # print(data)

    for i in range(scope):
        print(keyword+"+\"after:\""+after+"\"+before:\""+before+"\"")
        data = zm.dork_search(keyword+"+\"after:\"" +
                              after+"\"+before:\""+before+"\"", page=i)
        urls = set()

        for item in data:
            urls |= get_new_from_zoom_eye(item)

        # update_db(urls,'heuristic')
        # insert_urls(urls,'heuristic')
        print("get", len(urls))
        print(urls)


if __name__ == "__main__":
    get_from_zoomeye('全屏 自动识别 图标 插件 联系 电话号码 启动 弹框 客服 颜色 设置 状态 模式', '2021-03-21', '2021-05-21', 1)
