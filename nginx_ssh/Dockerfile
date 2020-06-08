FROM alpine:latest

RUN	apk update
RUN apk add nginx openssh

COPY src/sshd_conf /etc/ssh/sshd_config
RUN ssh-keygen -A
RUN mkdir /root/.ssh
COPY id.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

RUN adduser -D -g 'www' www
WORKDIR /www
RUN chown -R www:www /var/lib/nginx
RUN	chown -R www:www /www
COPY src/my_nginx.conf /etc/nginx/nginx.conf
COPY src/index.html  /www/index.html
COPY src/demarre_nginx_sshd_server /root/
RUN echo "root:`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`"|chpasswd

CMD ash /root/demarre_nginx_sshd_server
