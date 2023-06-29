 #! /bin/bash

export LOG_DIR=$KAFKA_HOME/logs/server_$1
$KAFKA_HOME/bin/kafka-server-start.sh -daemon $KAFKA_HOME/config/kraft/server_$1.properties