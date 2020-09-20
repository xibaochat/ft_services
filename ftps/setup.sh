kubectl apply -f  ftps/manifest/ftps_service.yaml

sleep 10

LOADBALANCER_IP=`kubectl get services  ftps-service --output jsonpath='{.status.loadBalancer.ingress[0].ip}'`
sed -i'.original' -e 's|LOADBALANCER_IP|'"$LOADBALANCER_IP"'|g' ftps/src/ftps_conf

docker build ftps/ -t ftps:00
kubectl apply -f  ftps/manifest/ftps_deploy.yaml
