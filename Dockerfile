FROM python:latest
RUN mkdir /web && \
    pip install flask flask-cache requests pdfkit
RUN apt-get update && apt-get install wkhtmltopdf -y
CMD python /web/flaskr.py
