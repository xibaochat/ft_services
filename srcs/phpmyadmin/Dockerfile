FROM alpine:3.11

RUN	apk update
RUN apk add nginx

RUN adduser -D -g 'www' www
RUN mkdir -p /var/lib/phpmyadmin/tmp
RUN chown -R nobody:nobody /var/lib/phpmyadmin/tmp
RUN chown -R www:www /var/lib/nginx

#add php
RUN apk add php7 php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-session php7-mbstring && \
mkdir -p /var/lib/phpmyadmin/tmp
COPY source_code /www/pma/
RUN	chown -R www:www /www
COPY my_nginx.conf /etc/nginx/nginx.conf
#https://github.com/Yavin/docker-alpine-php-fpm/blob/master/Dockerfile
COPY php-fpm.conf /etc/php7/php-fpm.conf

# TELEGRAF
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.5-static_linux_amd64.tar.gz
RUN tar -xf telegraf-1.14.5-static_linux_amd64.tar.gz
RUN mv telegraf/telegraf /usr/local/bin/

RUN apk add supervisor
COPY ./supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
