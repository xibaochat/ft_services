FROM alpine:latest

RUN apk update
RUN apk add vsftpd openssl
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
RUN touch /var/log/vsftpd.log && chown maobe: /var/log/vsftpd.log

CMD vsftpd /etc/vsftpd/vsftpd.conf && tail -f /var/log/vsftpd.log
