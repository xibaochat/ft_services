#create conf
kubectl create configmap telegraf-config --from-file=./srcs/telegraf/telegraf.toml
