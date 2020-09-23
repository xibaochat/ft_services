kubectl apply -f srcs/grafana/grafana_secret.yaml

kubectl apply -f srcs/grafana/grafana-service.yaml

kubectl create configmap grafana-config \
		--from-file=influxdb-datasource.yaml=srcs/grafana/config/influxdb-datasource.yaml \
		--from-file=dashboards.yaml=srcs/grafana/config/dashboards.yaml \
		--from-file=analysis-server.json=srcs/grafana/config/analysis-server.json

docker build ./srcs/grafana -t grafana:00

kubectl apply -f ./srcs/grafana/grafana-deployment.yaml
