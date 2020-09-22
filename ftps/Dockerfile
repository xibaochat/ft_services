FROM alpine:latest

RUN apk update
RUN apk add vsftpd openssl supervisor
RUN	mkdir /srv/ftp
RUN	chown nobody:nogroup /srv/ftp
#add user to be used by ftp
RUN	adduser -D -g cats maobe
#set ftp user(maobe) password
RUN	echo "maobe:bao" |chpasswd
#ssl certificate
COPY src/cert_infos.txt /tmp
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt < /tmp/cert_infos.txt
RUN rm -f /tmp/cert_infos.txt

COPY src/ftps_conf /etc/vsftpd/vsftpd.conf
ARG LOADBALANCER_IP
RUN sed -i 's|LOADBALANCER_IP|'"$LOADBALANCER_IP"'|g' /etc/vsftpd/vsftpd.conf

RUN touch /var/log/vsftpd.log && chown maobe: /var/log/vsftpd.log

# TELEGRAF
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.5-static_linux_amd64.tar.gz
RUN tar -xf telegraf-1.14.5-static_linux_amd64.tar.gz
RUN mv telegraf/telegraf /usr/local/bin/
COPY telegraf.toml /root/
COPY src/supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
