docker build baobe_com -t  baobe:00

kubectl apply -f baobe_com/manifest/baobe_deploy.yaml

kubectl apply -f baobe_com/manifest/baobe_service.yaml
