FROM python:3.9.7-buster

COPY . /application
WORKDIR /application
RUN apt update && apt install -y wait-for-it
RUN pip install -r requirements.txt
EXPOSE 8000
CMD wait-for-it $POSTGRES_HOST:$POSTGRES_PORT -t 3600 && \ 
    python3 iasWeb/manage.py migrate && \
    python3 iasWeb/manage.py runserver 0.0.0.0:8000
