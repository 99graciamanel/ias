FROM nginx:1.21-alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

RUN mkdir -p /etc/ssl/ias
COPY ./certs/web/web.crt.pem /etc/ssl/ias
COPY ./certs/web/web.key.pem /etc/ssl/ias
COPY ./certs/web/keycloak.crt.pem /etc/ssl/ias
COPY ./certs/web/keycloak.key.pem /etc/ssl/ias
