from urllib import parse
from pythonping import ping

list = []

def replace_char(old_string, char, index):
    '''
    字符串按索引位置替换字符
    '''
    old_string = str(old_string)
    # 新的字符串 = 老字符串[:要替换的索引位置] + 替换成的目标字符 + 老字符串[要替换的索引位置+1:]
    new_string = old_string[:index] + char + old_string[index+1:]
    list.append(new_string)
    return new_string

def add_char(old_string, char, index):
    '''
    将字符串按索引位置添加字符
    '''
    old_string = str(old_string)
    # 新的字符串 = 老字符串[:要替换的索引位置] + 替换成的目标字符 + 老字符串[要替换的索引位置+1:]
    new_string = old_string[:index] + char + old_string[index:]
    return new_string

def get_from_boom_all_in_one(fraud_input_domain):
    list.clear()
    char_small = [chr(i) for i in range(97,123)]
    rs = parse.urlparse(fraud_input_domain).netloc
    if rs == '':
        rs = parse.urlparse(fraud_input_domain).path
    
    length = 0
    try:
        length = rs.rindex('.')
    except ValueError:
        return []

    for k in range(length):
        i = length - k
        if rs[i]=='w':
            continue
        if rs[i]=='.':
            continue
        if rs[i].isalpha():
            for j in range(26):
                replace_char(rs, char_small[j], i)
                if len(list) >= 20:
                    break
        if rs[i].isdigit():
            for j in range(10):
                replace_char(rs, str(j), i)
                if len(list) >= 20:
                    break
        if len(list) >= 20:
            break
    return set(list)

# # generate_list("https://qc66888.com")
# generate_list("www.619322.com")
# all_domains = set()
# for domain in list:
#     try:
#         ping(domain, timeout=1)
#     except BaseException:
#         print("ping fail: " + domain)
#     else:
#         print("ping success: " + domain)
#         all_domains.add(domain)
# print(all_domains)