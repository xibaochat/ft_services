FROM alpine:3.11

RUN apk update

RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils
COPY my.cnf /etc/mysql/my.cnf

CMD cd '/usr' && /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
