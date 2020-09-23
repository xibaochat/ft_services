docker build ./srcs/phpmyadmin -t pma:00

kubectl apply -f ./srcs/phpmyadmin/manifest/pma_deploy.yaml

kubectl apply -f ./srcs/phpmyadmin/manifest/pma_svc.yaml
