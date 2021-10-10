FROM nginx:1.21-alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

RUN mkdir -p /etc/ssl/ias
COPY ./certs/web/cert.pem /etc/ssl/ias
COPY ./certs/web/key.pem /etc/ssl/ias
