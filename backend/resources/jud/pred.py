# -*- coding: UTF-8 -*-
import sys
import os
import json
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import sequence
from pref import create_tokenizer, parse_html

FILE_DIR = os.path.dirname(os.path.abspath(__file__))
PARENT_DIR = FILE_DIR[:FILE_DIR.rindex('/')]

benign_category = [('alexa', -2), ('corner_case', -1)]
malicious_category = [('uncategory', 0), ('bocai', 1), ('daikuan', 2),
                      ('licai', 3), ('maochong', 4), ('zhibojian', 5), ('shuadan', 6)]
ml_maxlen = 5000
mul_maxlen = 20000


def predict_x(X, correct_domains, error_domains, bin_model_path=FILE_DIR + "/judge/models/bin_model_xxi",
              mul_model_path=FILE_DIR + "/judge/models/mul_model_vii"):

    final_results = {}
    final_results.update({"error_domains": error_domains})

    mul_model = load_model(mul_model_path)
    bin_model = load_model(bin_model_path)
    x_reald_world = sequence.pad_sequences(
        X, maxlen=ml_maxlen, padding="post", truncating="post")
    bin_results = bin_model.predict(x_reald_world)
    # print(bin_results)
    x_reald_world = sequence.pad_sequences(
        X, maxlen=mul_maxlen, padding="post", truncating="post")
    mul_results = mul_model.predict(x_reald_world)
    # print(mul_results)
    good_domains = []
    bad_domains = {}
    uncertain_domains = []

    for i in range(len(X)):
        result = {}
        if bin_results[i][0] >= 0.9:
            good_domains.append(correct_domains[i])
        elif bin_results[i][1] >= 0.8:
            max_score = mul_results[i].max()
            max_category_id = mul_results[i].argmax()
            # result.update({"mul_cat": max_category_id})
            # result.update({"mul_score": max_score})
            bad_domains.update({correct_domains[i]: int(max_category_id)})

        else:
            uncertain_domains.append(correct_domains[i])   # hard to judge
    final_results.update({"good_domains": good_domains})
    final_results.update({"bad_domains": bad_domains})
    final_results.update({"uncertain_domains": uncertain_domains})

    return final_results


'''
def get_vectors_and_domains(path, tokenizer_path=FILE_DIR + "/keywords.json"):
    tokenizer = create_tokenizer(tokenizer_path)
    vectors = []
    domains = os.listdir(path)
    for domain in domains:
        html_path = path+"/"+domain+"/"+"page.html"
        vec = parse_html(tokenizer, html_path)
        vectors.append(vec)
    return vectors, domains
'''

# 这里的思路是 运行的时候把向量返回
# 一方面这样的开销会不会台大？
# 还是先不想先跑下来
#  
def get_vectors_and_domains(target_domain, tokenizer_path=FILE_DIR + "/keywords.json"):
    tokenizer = create_tokenizer(tokenizer_path)
    dom_file = open(PARENT_DIR+"/crawler/crawler_result/" +
                    target_domain+"/possible.json", 'r')
    doms = json.load(dom_file)
    vectors = []
    correct_domains = []
    error_domains = []
    for i in doms.keys():
        for domain in doms[i]:
            filename = PARENT_DIR+"/crawler/crawler_result/" + domain
            if os.path.isdir(filename):
                html_path = filename + "/page.html"
                vec = parse_html(tokenizer, html_path)
                vectors.append(vec)
                correct_domains.append(domain)
            else:
                error_domains.append(domain)
    return vectors, correct_domains, error_domains


def get_results_by_domain(domain):
    vectors, correct_domains, error_domains = get_vectors_and_domains(domain)
    results = predict_x(vectors, correct_domains, error_domains)
    results_file_name = PARENT_DIR+"/crawler/crawler_result/" + \
        domain+"/relevantdomain.json"
    with open(results_file_name, 'w') as file_obj:
        json.dump(results, file_obj)
    return results


if __name__ == '__main__':
    '''
    crawler_id = sys.argv[1]
    print(FILE_DIR + "/keywords.json")
    tokenizer = create_tokenizer(FILE_DIR + "/keywords.json")
    vec = parse_html(
        tokenizer, "/home/yuzhexuan/crawler_result/"+crawler_id+"/page.html")
    X = []
    X.append(vec)

    X, domains = get_vectors_and_domains(
        "/home/xuezhuoyi/backend/resources/crawler/crawler_result")
    result = predict_x(X, domains, './judge/models/bin_model_xxi',
                       './judge/models/mul_model_vii')
    print(result)
    '''
    print(get_results_by_domain("hjc965.com"))
