echo $PWD

kubectl apply -f nginx_ssh/manifest/nginx_service.yaml

sleep 10

LOADBALANCER_IP=`kubectl get services  nginx --output jsonpath='{.status.loadBalancer.ingress[0].ip}'`
sed -i'.original' -e 's|LOADBALANCER_IP|'"$LOADBALANCER_IP"'|g' nginx_ssh/src/my_nginx.conf
docker build nginx_ssh -t  nginx_ssh:00

kubectl apply -f nginx_ssh/manifest/nginx_deploy.yaml
