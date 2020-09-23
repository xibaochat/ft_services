influxd &

sleep 10

#use identifier "admin" defined in secret as the administator
influx -execute "CREATE USER \"$INFLUXDB_ADMIN_USER\" WITH PASSWORD '$INFLUXDB_ADMIN_PASSWORD' WITH ALL PRIVILEGES"

#create user "user"
influx -username $INFLUXDB_ADMIN_USER -password $INFLUXDB_ADMIN_PASSWORD -execute "CREATE USER \"$INFLUXDB_USER\" WITH PASSWORD '$INFLUXDB_USER_PASSWORD'"

#create database "bao"
influx  -username $INFLUXDB_ADMIN_USER -password $INFLUXDB_ADMIN_PASSWORD -execute 'create database bao'

#let "user" access database "bao"
influx -username $INFLUXDB_ADMIN_USER -password $INFLUXDB_ADMIN_PASSWORD -execute "GRANT ALL ON bao TO \"user\""
