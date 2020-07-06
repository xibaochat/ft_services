BASE_IP=$(minikube ip | cut -d '.' -f 1-3)

sed -i'.original' -e's/BASE_IP/'"${BASE_IP}"'/g' configMap.yaml

kubectl apply -f configMap.yaml
