# -*- coding: UTF-8 -*-
import sys
import os
import json
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import sequence
from .prefetch import create_tokenizer, parse_html
sys.path.append("./backend")
from configSys import config
FILE_DIR = os.path.dirname(os.path.abspath(__file__))
PARENT_DIR = FILE_DIR[:FILE_DIR.rindex('/')]
Result_DIR = config['result_dir']

benign_category = [('alexa', -2), ('corner_case', -1)]
malicious_category = [('uncategory', 0), ('bocai', 1), ('daikuan', 2),
                      ('licai', 3), ('maochong', 4), ('zhibojian', 5), ('shuadan', 6)]
ml_maxlen = 5000
mul_maxlen = 20000


def predict_x(X, correct_domains, error_domains, bin_model_path=FILE_DIR + "/models/bin_model_xxiiii",
              mul_model_path=FILE_DIR + "/models/mul_model_viiii"):

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
        if(i == 0):
            if bin_results[i][0] >= 0.9:
                type = -1
            else:
                type = mul_results[i].argmax()
            final_results.update({"seed_domain_type": int(type)})
        else:
            if bin_results[i][0] >= 0.9:
                good_domains.append(correct_domains[i-1])
            elif bin_results[i][1] >= 0.8:
                max_score = mul_results[i].max()
                # 这个分类ID的定义在哪里？
                max_category_id = mul_results[i].argmax()
                # result.update({"mul_cat": max_category_id})
                # result.update({"mul_score": max_score})
                bad_domains.update({correct_domains[i-1]: int(max_category_id)})
            else:
                uncertain_domains.append(correct_domains[i-1])   # hard to judge
    final_results.update({"good_domains": good_domains})
    final_results.update({"bad_domains": bad_domains})
    final_results.update({"uncertain_domains": uncertain_domains})

    return final_results

def predict_x_from_one(X, correct_domains, error_domains, bin_model_path=FILE_DIR + "/models/bin_model_xxiiii",
              mul_model_path=FILE_DIR + "/models/mul_model_viiii"):

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
        print(bin_results[i][0] )
        print(bin_results[i][1])
        if bin_results[i][0] >= 0.9:
            good_domains.append(correct_domains[i-1])
        elif bin_results[i][1] >= 0.8:
            max_score = mul_results[i].max()
            # 这个分类ID的定义在哪里？
            max_category_id = mul_results[i].argmax()
            # result.update({"mul_cat": max_category_id})
            # result.update({"mul_score": max_score})
            bad_domains.update({correct_domains[i-1]: int(max_category_id)})
        else:
            uncertain_domains.append(correct_domains[i-1])   # hard to judge
    final_results.update({"good_domains": good_domains})
    final_results.update({"bad_domains": bad_domains})
    final_results.update({"uncertain_domains": uncertain_domains})

    return final_results    




def get_vectors_and_domains(target_domain, tokenizer_path=FILE_DIR + "/keywords.json"):
    # 这里面的地址都要换一下
    tokenizer = create_tokenizer(tokenizer_path)

    correct_domains = []
    error_domains = []    
    vectors = []
    filename = Result_DIR+"/crawler/crawler_result/" + target_domain
    html_path = filename + "/page.html"
    vec = parse_html(tokenizer, html_path)
    vectors.append(vec)
    nameOfFile = ['boom','cert','dns','subnet']
    for i in range(4):    
        dom_file = open(Result_DIR+'/crawler/crawler_result/' +target_domain+"/"+nameOfFile[i]+'possible.json', 'r')
        doms = json.load(dom_file)    

        for i in doms.keys():
            if i!="screenshot":
                for domain in doms[i]:
                    filename = Result_DIR+"/crawler/crawler_result/" + domain
                    if os.path.isdir(filename):
                        html_path = filename + "/page.html"
                        vec = parse_html(tokenizer, html_path)
                        vectors.append(vec)
                        correct_domains.append(domain)
                    else:
                        error_domains.append(domain)
    return vectors, correct_domains, error_domains

def get_vector_from_one(target_domain, tokenizer_path=FILE_DIR + "/keywords.json"):
    tokenizer = create_tokenizer(tokenizer_path)

    correct_domains = []
    error_domains = []    
    vectors = []
    filename = Result_DIR+"/crawler/crawler_result/" + target_domain
    html_path = filename + "/page.html"    
    if os.path.isdir(filename):
        html_path = filename + "/page.html"
        vec = parse_html(tokenizer, html_path)
        if len(vec) < 50:
            error_domains.append(target_domain)
        else:        
            vectors.append(vec)
            correct_domains.append(target_domain)
    else:
        error_domains.append(target_domain)

    
    return vectors, correct_domains, error_domains


def get_results_by_domain(domain):
    vectors, correct_domains, error_domains = get_vectors_and_domains(domain)
    results = predict_x(vectors, correct_domains, error_domains)
    print(results)
    results_file_name = Result_DIR+"/crawler/crawler_result/" + \
        domain+"/relevantdomain.json"
    with open(results_file_name, 'w') as file_obj:
        json.dump(results, file_obj)
    return results


def get_result_from_one(domain):
    vectors, correct_domains, error_domains= get_vector_from_one(domain)
    results = {}
    if vectors :
        results = predict_x_from_one(vectors, correct_domains, error_domains)
        print(results)
        return results
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
