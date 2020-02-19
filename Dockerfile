FROM python

LABEL maintainer "Kuari <kuari@justmylife.cc>"

RUN pip install --upgrade pip \
    && pip install redis Flask flask_restful flask_sqlalchemy flask_cors flask-cli pymysql gunicorn

WORKDIR /app

EXPOSE 80

CMD gunicorn -w 5 -b 0.0.0.0:80 server:app
