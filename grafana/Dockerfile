FROM alpine:3.11

RUN apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache && \
	mkdir -p /usr/share/grafana/conf/provisioning/datasources/ && \
	mkdir -p /usr/share/grafana/conf/provisioning/dashboards/

COPY source.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/

COPY dashboard.json /var/lib/grafana/dashboards/
COPY custom.ini /etc/grafana.ini

WORKDIR /usr/share/grafana

CMD /usr/sbin/grafana-server --config=/etc/grafana.ini
