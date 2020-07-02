echo $PWD

docker build nginx_ssh -t  nginx_ssh:00

kubectl apply -f nginx_ssh/manifest/nginx_deploy.yaml

kubectl apply -f nginx_ssh/manifest/nginx_service.yaml
