docker build srcs/baobe_com -t  baobe:00

kubectl apply -f srcs/baobe_com/manifest/baobe_deploy.yaml

kubectl apply -f srcs/baobe_com/manifest/baobe_service.yaml
