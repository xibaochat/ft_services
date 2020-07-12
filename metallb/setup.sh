BASE_IP=$(minikube ip | cut -d '.' -f 1-3)

sed -i'.original' -e's/BASE_IP/'"${BASE_IP}"'/g' metallb/configMap.yaml

kubectl apply -f metallb/configMap.yaml
