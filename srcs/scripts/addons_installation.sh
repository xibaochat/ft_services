source $OUTPUT_FUNCS

sub_simple_output "Enable Dashboard"

minikube addons enable dashboard > /dev/null

sub_simple_output "Enable Metallb"

minikube addons enable metallb > /dev/null

sleep 10
#create metallb config map
bash srcs/metallb/setup.sh
