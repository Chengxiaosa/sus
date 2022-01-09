# -*- coding: utf-8 -*-

import logging.handlers
from flask_script import Manager
from app import create_app
from config import config

app = create_app(config)

manager = Manager(app)

@manager.command
def run():
    """
    生产模式启动命令函数
    To use: python3 manager.py run
    """
    print("111111")
    app.logger.setLevel(app.config.get('LOG_LEVEL', logging.INFO))
    app.run(host='0.0.0.0',port=5001, debug = False)


@manager.command
def debug():
    """
    debug模式启动命令函数
    To use: python3 manager.py debug
    """
    app.logger.setLevel(logging.DEBUG)
    app.run(host='0.0.0.0',port=5001, debug = True)


if __name__ == '__main__':
    # manager.debug()
    print("1111")
    manager.run()
