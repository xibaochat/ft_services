kubectl apply -f ./srcs/mysql/volume/mysql_pv.yaml

kubectl apply -f ./srcs/mysql/volume/mysql_pvc.yaml

BAOBE_COM_SVC_IP=$(kubectl get svc baobe-service-http -o=jsonpath='{.status.loadBalancer.ingress[0].ip}')

docker build --build-arg BAOBE_COM_SVC_IP=$BAOBE_COM_SVC_IP ./srcs/mysql/backup -t mysql_backup:00

kubectl apply -f ./srcs/mysql/backup/mysql_backup_pod.yaml

sleep 10

docker build ./srcs/mysql -t mysql:00

kubectl apply -f ./srcs/mysql/manifest/mysql_deploy.yaml

kubectl apply -f ./srcs/mysql/manifest/mysql_service.yaml
