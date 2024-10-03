FROM arm64v8/nginx:stable-alpine

ADD ./nginx/default.conf.template /etc/nginx/templates/default.conf.template
ADD ./nginx/fastcgi.conf /etc/nginx/fastcgi.conf
ADD ./nginx/certs /etc/nginx/certs/self-signed

RUN mkdir -p /var/www/html
