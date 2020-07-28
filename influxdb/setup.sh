kubectl apply -f influxdb/configMap.yaml

kubectl apply -f influxdb/influxdb_secret.yaml

kubectl apply -f influxdb/influxdb_job/influxdb_pv.yaml

kubectl apply -f influxdb/influxdb_job/influxdb_pvc.yaml

docker build influxdb/influxdb_job -t influxdb_job:00

kubectl apply -f influxdb/influxdb_job/influxdb_job.yaml

sleep 20

docker build influxdb -t influxdb:00

kubectl apply -f influxdb/influxdb_deploy.yaml

kubectl apply -f influxdb/influxdb_service.yaml
