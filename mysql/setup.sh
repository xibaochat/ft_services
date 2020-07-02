kubectl apply -f mysql/volume/mysql_pv.yaml

kubectl apply -f mysql/volume/mysql_pvc.yaml

docker build mysql/backup -t mysql_backup:00

kubectl apply -f mysql/backup/mysql_backup_pod.yaml

docker build mysql -t mysql:00

kubectl apply -f mysql/manifest/mysql_deploy.yaml

kubectl apply -f mysql/manifest/mysql_service.yaml
