source $OUTPUT_FUNCS

cmd_exists()
{
  command -v "$@" >/dev/null 2>&1
}
install_minikube () {
	if cmd_exists "minikube"
	then
		sub_simple_output "Minikube is already installed"
		minikube status > /dev/null
		if  [ $? -gt 0 ]
		then
			minikube start
		fi
	else
		sub_simple_output "Installing Minikube"
		curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 \
			&& chmod +x minikube
		mv minikube $HOME/.brew/bin/
		minikube start
	fi
}

install_kubectl() {
	if cmd_exists "kubectl"
	then
		sub_simple_output "kubectl is already installed"
	else
		sub_simple_output "Installing kubectl"
		curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl"
		chmod +x ./kubectl
		mv ./kubectl $HOME/.brew/bin/
	fi
}

install_minikube
install_kubectl
