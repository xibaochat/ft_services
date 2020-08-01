FROM alpine:3.11

RUN apk update

RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils
COPY my.cnf /etc/mysql/my.cnf

# TELEGRAF
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.5-static_linux_amd64.tar.gz
RUN tar -xf telegraf-1.14.5-static_linux_amd64.tar.gz
RUN mv telegraf/telegraf /usr/local/bin/

CMD telegraf -config /root/telegraf.toml & cd '/usr' && /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
