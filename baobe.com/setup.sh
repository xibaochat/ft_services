echo $PWD

docker build baobe.com -t  baobe:00

kubectl apply -f baobe/manifest/baobe_deploy.yaml

kubectl apply -f baobe/manifest/baobe_service.yaml
