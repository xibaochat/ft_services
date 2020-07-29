kubectl create serviceaccount telegraf
kubectl apply -f telegraf/cluster_role.yaml -f  telegraf/cluster_role_binding.yaml

docker build telegraf -t telegraf:00

kubectl apply -f  telegraf/telegraf_deploy.yaml
