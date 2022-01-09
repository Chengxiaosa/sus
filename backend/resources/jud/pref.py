# -*- coding: UTF-8 -*-
import json
import os
import sys
from pathlib import Path
from bs4 import BeautifulSoup
from bs4.element import Tag, NavigableString, Comment
from jieba import analyse
from tensorflow.python.keras.preprocessing.sequence import pad_sequences
from tensorflow.python.keras.preprocessing.text import Tokenizer
from log import Log
from tags import full_tags
import codecs

sys.stdout = codecs.getwriter("utf-8")(sys.stdout.detach())
logger = Log()


def read_list_from_suffix(path, suffix):
    if type(path) == str:
        path = Path(path)
    tag_paths = list(path.rglob('*.' + suffix))
    lst = [x for x in tag_paths]
    print('read {} files from dir {}'.format(len(lst), path))
    return lst


def read_file_robustly(path):
    rst = ''
    try:
        rst = open(path, 'r').read()  # .decode('gbk').encode('utf-8')
    except Exception as e:
        try:
            rst = open(path, 'r', encoding='gb18030').read()
        except Exception as e:
            try:
                rst = codecs.open(path, encoding='windows-1252',
                                  errors='ignore').read()
            except Exception as e:
                logger.warning('read fail')
    return rst


def dfs(node, result):
    result.append(f'<{node.name}>')
    for child in node.children:
        if isinstance(child, Tag):
            dfs(child, result)
        elif isinstance(child, Comment):
            result.append(f'<comment>')
    result.append(f'</{node.name}>')
    return


def parse_html_tags(path):
    html_content = read_file_robustly(path)
    if len(html_content) == 0:
        return [0]
    soup = BeautifulSoup(html_content, features='lxml')
    result_list = list()
    dfs(soup, result_list)
    labels = full_tags
    rst = []
    for label in result_list:
        if label in labels:
            rst.append(labels.index(label))
    return rst


def get_content(path):
    html_content = read_file_robustly(path)
    if len(html_content) == 0:
        return ""
    soup = BeautifulSoup(html_content, 'html.parser')
    text = soup.find_all(text=True)
    result = []
    for t in text:
        if str(t).startswith("<"):
            continue
        result.append(str(t).replace("\n", "").strip())
    return " ".join(result)


def create_tokenizer(filePath):
    str_list = []
    with open(filePath, "r", encoding="utf-8") as f:
        str_list = json.load(f)
    tokenizer = Tokenizer()
    tokenizer.fit_on_texts(str_list)
    logger.info("vocabulary size is {}".format(len(tokenizer.word_index) + 1))
    return tokenizer


def parse_html_content(tokenizer, path):
    content = get_content(path)
    keywords = analyse.textrank(
        content, 20, withWeight=False, allowPOS=('ns', 'n', 'vn'))
    encoded = tokenizer.texts_to_sequences([" ".join(keywords)])
    content_vector = pad_sequences(encoded, maxlen=20, padding='post')[0]
    return content_vector


def parse_html(tokenizer, path):
    content_vector = parse_html_content(tokenizer, path)
    tags_vector = parse_html_tags(path)
    vector = list(content_vector + 400)
    vector.extend(tags_vector)
    return vector


if __name__ == '__main__':
    # crawler_id = sys.argv[1]
    # file_base_path = '/home/syang/seaweedfs/data/mount/work_of_scam/webpage/'
    # 怎么获得当前目录

    tokenizer = create_tokenizer("./keywords.json")
    # vec = parse_html(tokenizer, file_base_path+str(crawler_id)+'/page.html')
    
    # vec = parse_html(tokenizer, "/home/miniwmy/samples/groundtruth/shuadan/5484.html")
    vec = parse_html(tokenizer, "/mnt/hard_disk/new/hjc965.com/page.html")
    print(vec)
