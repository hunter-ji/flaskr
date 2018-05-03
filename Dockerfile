FROM python:latest

LABEL maintainer "Kuari <kuari@justmylife.cc>"

RUN apt-get update && \
    apt-get install nginx -y

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
EXPOSE 80
EXPOSE 443

CMD python /web/run.py && systemctl start nginx
