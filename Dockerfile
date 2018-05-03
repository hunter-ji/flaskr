FROM python:latest

LABEL maintainer "Kuari <kuari@justmylife.cc>"

RUN mkdir /web && \
    pip install flask \
    flask-cache \
    flask_script \
    flask_migrate \
    flask-sqlalchemy \
    pymysql \
    requests \
    tornado

#Open 5000 port
EXPOSE 5000

CMD python /web/run.py
