## DOKCER BUILD

FROM alpine:latest

#########
# BASICS
RUN apt update && apt dist-upgrade -yy


#######
# MySQL
RUN apt install mariadb-server -yy

# Database
COPY srcs/wordpress/wordpress_database.sql /root/wordpress_database.sql
RUN /etc/init.d/mysql start && mysql <  /root/wordpress_database.sql
RUN rm -f /root/wordpress_database.sql

COPY srcs/wordpress/wordpress_tables.sql /root/wordpress_tables.sql
RUN /etc/init.d/mysql start && mysql < /root/wordpress_tables.sql
RUN rm -f /root/wordpress_tables.sql

### DOCKER RUN
CMD /etc/init.d/mysql start && \
	tail -f /var/log/nginx/access.log
