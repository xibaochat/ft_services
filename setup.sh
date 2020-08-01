export SCRIPTS_PATH="./scripts/"
export OUTPUT_FUNCS="$SCRIPTS_PATH/output_func.sh"



source $OUTPUT_FUNCS

simple_output "Starting ${BLUE}ft_services${NC} setup"

simple_output "Installing binaries"
#$SCRIPTS_PATH/binaries_installation.sh

simple_output "Installing addons"
#$SCRIPTS_PATH/addons_installation.sh

eval $(minikube docker-env)
kubectl delete configmaps,deploy,svc,job,pods,pv,pvc --all

kubectl create configmap grafana-config --from-file=influxdb-datasource.yaml=grafana/config/influxdb-datasource.yaml --from-file=dashboards.yaml=grafana/config/dashboards.yaml --from-file=analysis-server.json=grafana/config/analysis-server.json
simple_output "Deploying applications"

$SCRIPTS_PATH/app_deployements.sh
