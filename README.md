# Ft_Services

## Correction

### Nginx_ssh

1. Get load-balancer IP
```
export NGINX_LB_IP=`kubectl get services  nginx --output jsonpath='{.status.loadBalancer.ingress[0].ip}'`
```
2. Ckeck HTTPS redirection
```
curl http://$NGINX_LB_IP
```
3. Actually check website
```
curl -k https://$NGINX_LB_IP > cat.html
case $(uname -s) in
	Darwin*) open cat.html;;
	Linux*) xdg-open cat.html;;
esac
```

### Dashboard
```
minikube dashboard --url
```

### FTPs Server

1. Install lftp
2. Modify confing to support self-signed certificate
add to config file "set ssl:verify-certificate false"
```
case $(uname -s) in
	Darwin*) LFTP_CONFIG_FILE=~/.brew/etc/lftp.conf;;
	Linux*) LFTP_CONFIG_FILE=/etc/lftp.conf;;
esac
echo "set ssl:verify-certificate false" >> $LFTP_CONFIG_FILE
```
3. Get FTP load-balancer
```
export LFTP_LB_IP=`kubectl get services  ftps-service --output jsonpath='{.status.loadBalancer.ingress[0].ip}'`
```
4. Connect to server (password="bao")
```
lftp -u maobe $LFTP_LB_IP
```

### Wordpress

1. Get load-balancer IP
```
export WP_LB_IP="`kubectl get services  baobe-service-http --output jsonpath='{.status.loadBalancer.ingress[0].ip}'`:5050"
```
2.
