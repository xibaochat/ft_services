docker build ftps/ -t ftps:00
kubectl apply -f  ftps/manifest/ftps_deploy.yaml
kubectl apply -f  ftps/manifest/ftps_service.yaml
