FROM python:latest

LABEL maintainer "Kuari <kuari@justmylife.cc>"

RUN mkdir /web && \
    pip install flask \
    flask-cache \
    flask_script \
    flask_migrate \
    flask-sqlalchemy \
    flask_mail \
    pymysql \
    requests \
    pyquery \
    tornado

ENV QT_QPA_PLATFORM=offscreen

RUN pip install pdfkit \
    && apt-get update && apt-get install wkhtmltopdf -y \
    && mkdir /usr/lib/x86_64-linux-gnu/fonts

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN rm -rf /var/lib/apt/lists/*

ADD ./msyhbd.ttc /usr/lib/x86_64-linux-gnu/fonts/

CMD python /web/main.py
