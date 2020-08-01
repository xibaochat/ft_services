kubectl apply -f grafana/grafana_secret.yaml

kubectl apply -f grafana/grafana-service.yaml

kubectl create configmap grafana-config \
		--from-file=influxdb-datasource.yaml=grafana/config/influxdb-datasource.yaml \
		--from-file=dashboards.yaml=grafana/config/dashboards.yaml \
		--from-file=analysis-server.json=grafana/config/analysis-server.json

docker build ./grafana -t grafana:00

kubectl apply -f grafana/grafana-deployment.yaml
