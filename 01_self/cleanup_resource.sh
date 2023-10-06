#! /bin/sh


#shutdown all brokers
bash ./shutdown_broker.sh 1
bash ./shutdown_broker.sh 2
bash ./shutdown_broker.sh 3

#delete all logs
rm -rf /tmp/kraft-combined-logs-*

#delete server logs
rm -rf $KAFKA_HOME/logs/server_1
rm -rf $KAFKA_HOME/logs/server_2
rm -rf $KAFKA_HOME/logs/server_3