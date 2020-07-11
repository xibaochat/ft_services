FROM alpine:3.11

RUN apk update

RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils

#wordpress
COPY wordpress_database.sql /root/
COPY wordpress_tables.sql /root/

#phpmyadmin
COPY pma_database.sql /root/
COPY pma_tables.sql /root/

COPY demarre_mysql.sh /root

CMD mysql_install_db --user=mysql --ldata=/var/lib/mysql && \
	ash /root/demarre_mysql.sh && \
	sleep 10 && \
	mysql < /root/wordpress_database.sql && \
	mysql < /root/wordpress_tables.sql && \
	mysql < /root/pma_database.sql && \
    mysql < /root/pma_tables.sql
