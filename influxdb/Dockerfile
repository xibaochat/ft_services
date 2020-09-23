FROM alpine:3.11

RUN apk update
RUN apk add influxdb

# TELEGRAF
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.14.5-static_linux_amd64.tar.gz
RUN tar -xf telegraf-1.14.5-static_linux_amd64.tar.gz
RUN mv telegraf/telegraf /usr/local/bin/
COPY local_telegraf.toml /root/

#in the conf, needs to change URL as localhost
RUN apk add supervisor
COPY supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
