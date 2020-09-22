FROM alpine:latest

RUN	apk update
RUN apk add nginx openssh openssl supervisor

#SSH
COPY src/sshd_conf /etc/ssh/sshd_config
RUN ssh-keygen -A
RUN mkdir /root/.ssh
COPY id.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

#NGINX
RUN adduser -D -g 'www' www
WORKDIR /www
RUN chown -R www:www /var/lib/nginx
RUN	chown -R www:www /www
COPY src/index.html  /www/index.html
RUN echo "root:`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`"|chpasswd

# Generate SSL Certificate
COPY ./src/cert_infos.txt /root
RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt < /root/cert_infos.txt
RUN rm -f /root/cert_infos.txt

# TELEGRAF
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.5-static_linux_amd64.tar.gz
RUN tar -xf telegraf-1.14.5-static_linux_amd64.tar.gz
RUN mv telegraf/telegraf /usr/local/bin/

#NGINX CONF
COPY src/my_nginx.conf /etc/nginx/nginx.conf
ARG LOADBALANCER_IP
RUN sed  -i 's|LOADBALANCER_IP|'"$LOADBALANCER_IP"'|g' /etc/nginx/nginx.conf

COPY src/supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
