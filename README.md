# Ft_Services

## How to access website with self-signed certificate

1. Get load-balancer IP
2. curl -k https://LOAD_BALANCER_IP

## how to access ftp with self-signed certificate
1. add to config file "set ssl:verify-certificate false"
MAC: ~/.brew/etc/lftp.conf
linux: /etc/lftp.conf

## Access dashboard
minikube dashboard --url
