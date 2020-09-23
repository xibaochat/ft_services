kubectl apply -f ./srcs/influxdb/configMap.yaml

kubectl apply -f ./srcs/influxdb/influxdb_secret.yaml

kubectl apply -f ./srcs/influxdb/influxdb_job/influxdb_pv.yaml

kubectl apply -f ./srcs/influxdb/influxdb_job/influxdb_pvc.yaml

docker build ./srcs/influxdb/influxdb_job -t influxdb_job:00

kubectl apply -f ./srcs/influxdb/influxdb_job/influxdb_job.yaml

sleep 30

docker build ./srcs/influxdb -t influxdb:00

kubectl apply -f ./srcs/influxdb/influxdb_deploy.yaml

kubectl apply -f ./srcs/influxdb/influxdb_service.yaml
