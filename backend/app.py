# -*- coding: utf-8 -*-
import string
from flask import Flask
from hashids import Hashids
from flask_cors import CORS

# app = Flask(__name__)
app = Flask(__name__, static_folder='../', static_url_path='')

CORS(app,supports_credentials = True)

hash_ids = Hashids(salt='hvwptlmj129d5quf', min_length=8, alphabet=string.ascii_lowercase + string.digits)

# 保留flask原生异常处理
handle_exception = app.handle_exception
handle_user_exception = app.handle_user_exception

def _access_control(response):
    """
    解决跨域请求
    """
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET,HEAD,PUT,PATCH,POST,DELETE'
    response.headers['Access-Control-Allow-Headers'] = 'Content-Type'
    response.headers['Access-Control-Max-Age'] = 86400
    return response


def create_app(config):
    """
    创建app
    """
    # 添加配置
    app.config.from_object(config)
    # 解决跨域
    app.after_request(_access_control)
    # 注册蓝图
    from routes import api_v1
    app.register_blueprint(api_v1, url_prefix='/')
    # 使用flask原生异常处理程序
    app.handle_exception = handle_exception
    app.handle_user_exception = handle_user_exception
    return app
