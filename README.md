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
2. Modify config file to support self-signed certificate
```
case $(uname -s) in
	Darwin*) LFTP_CONFIG_FILE=~/.brew/etc/lftp.conf;;
	Linux*) LFTP_CONFIG_FILE=/etc/lftp.conf;;
esac
echo "set ssl:verify-certificate false" >> $LFTP_CONFIG_FILE
```

* If on Linux you get a permission denied, add the line manually in your config file.
```
sudo vi $LFTP_CONFIG_FILE
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

1. Get Loadbalancer IP
```
export WP_LB_IP="`kubectl get services  baobe-service-http --output jsonpath='{.status.loadBalancer.ingress[0].ip}'`:5050"
```
2. Access website
```
bash <<< "
case $(uname -s) in
    Darwin*) open -a safari http://$WP_LB_IP;;
    Linux*) firefox http://$WP_LB_IP;;
esac"
```
3. Check available users: (to connect access http://$WP_LB_IP/wp-login.php)
```
# Admin user:
login: meilv
password: new-password

# Basic user I
login: 42_user
password: secretpassword

# Basic user II
login: junko
password: secretpassword
```

### PhpMyAdmin
1. Get Loadbalancer IP
```
export PMA_LB_IP="`kubectl get services pma-service --output jsonpath='{.status.loadBalancer.ingress[0].ip}'`:5000"
```
2. Access website
```
bash <<< "
case $(uname -s) in
    Darwin*) open -a safari http://$PMA_LB_IP;;
    Linux*) firefox http://$PMA_LB_IP;;
esac"
```
3. Check available users: (to connect access http://$WP_LB_IP/wp-login.php)
```
# Admin user:
login: sammy
password: Xibaochat!

# PMA User
login: pma
password: Xibaochat!

```
4. Check wordpress database is linked to PMA
```
1. Update password for every user
UPDATE wp_users set user_pass = MD5('badpassword');
2. Check you can login to wordpress with the new password
```


### Grafana

* dashboard source: https://grafana.com/grafana/dashboards?search=kubernetes&dataSource=influxdb

1. Get Loadbalancer IP
```
export GRAFANA_LB_IP="`kubectl get services grafana-svc --output jsonpath='{.status.loadBalancer.ingress[0].ip}'`:3000"
```
2. Access website
```
bash <<< "
case $(uname -s) in
    Darwin*) open -a safari http://$GRAFANA_LB_IP;;
    Linux*) firefox http://$GRAFANA_LB_IP;;
esac"
```
3. Check available users:
```
# Admin user:
login: admin
password: kraken
```
