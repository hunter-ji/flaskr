FROM python

LABEL maintainer "Kuari <kuari@justmylife.cc>"

RUN pip install -i https://pypi.douban.com/simple --upgrade pip \
    && pip install redis Flask flask_restful flask_sqlalchemy flask_cors flask-cli pymysql gunicorn -i https://pypi.douban.com/simple

WORKDIR /app

EXPOSE 80

CMD gunicorn -w 5 -b 0.0.0.0:80 server:app
