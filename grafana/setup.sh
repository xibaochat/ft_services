docker build ./grafana/ -t grafana:00

kubectl apply -f grafana/deployment.yaml
kubectl apply -f grafana/service.yaml
