kubectl apply -f  ftps/manifest/ftps_service.yaml

sleep 10

LOADBALANCER_IP=`kubectl get services  ftps-service --output jsonpath='{.status.loadBalancer.ingress[0].ip}'`

docker build --build-arg LOADBALANCER_IP=$LOADBALANCER_IP ftps/ -t ftps:00
kubectl apply -f  ftps/manifest/ftps_deploy.yaml
