FROM alpine:3.11

RUN	apk update
RUN apk add nginx

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx

#add php
RUN apk add php7 php7-fpm php7-opcache php-json
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl

COPY source_code /www/wp/
RUN	chown -R www:www /www
COPY src/my_nginx.conf /etc/nginx/nginx.conf
#https://github.com/Yavin/docker-alpine-php-fpm/blob/master/Dockerfile
COPY src/php-fpm.conf /etc/php7/php-fpm.conf

# TELEGRAF
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.5-static_linux_amd64.tar.gz
RUN tar -xf telegraf-1.14.5-static_linux_amd64.tar.gz
RUN mv telegraf/telegraf /usr/local/bin/
COPY telegraf.toml /root/
CMD telegraf -config /root/telegraf.toml & php-fpm7 && nginx -g "daemon off;"
