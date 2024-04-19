#!/bin/sh
#start python server
sh ./start_server.sh
#start influxdb and grafana docker containers
docker-compose up &>/dev/null &
#clone sample project
git clone https://github.com/jovchinnikova/performance-carina-demo
cd performance-carina-demo || exit
git checkout ios-performance
mvn clean install -DskipTests=true
#set up influxdb and grafana using ui
#update test project with needed information
#influxdb token, org, buket and host; python server host and port in testdata.properties
#app's bundle id and device info in config.properties
#run tests and explore the result using grafana and influx