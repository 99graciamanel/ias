FROM python:3.9.7-buster

COPY . /application
WORKDIR /application
RUN pip install -r requirements.txt
EXPOSE 8000
CMD python3 iasWeb/manage.py runserver 0.0.0.0:8000
