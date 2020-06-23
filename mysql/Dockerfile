FROM alpine:latest

RUN apk update
RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils
RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql

COPY src/wordpress_database.sql /root/wordpress_database.sql

COPY src/demarre_mysql.sh /root

RUN  ash /root/demarre_mysql.sh && sleep 10 && mysql < /root/wordpress_database.sql

COPY src/wordpress_tables.sql /root/wordpress_tables.sql

RUN	 ash /root/demarre_mysql.sh && sleep 10 && mysql <  /root/wordpress_tables.sql

RUN rm -f /root/wordpress_database.sql  /root/demarre_mysql.sh

CMD exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@
