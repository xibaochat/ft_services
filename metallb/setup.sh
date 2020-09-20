BASE_IP=$(minikube ip | cut -d '.' -f 1-3)

case "$(uname -s)" in
    Linux*)     sed -i 's/BASE_IP/'"${BASE_IP}"'/g' metallb/configMap.yaml;;
    Darwin*)    sed -i'.original' -e's/BASE_IP/'"${BASE_IP}"'/g' metallb/configMap.yaml;;
esac

kubectl apply -f metallb/configMap.yaml
