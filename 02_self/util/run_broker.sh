 #! /bin/bash

if [ $# -ne 1 ]; then
  echo "Please insert postive node Id"
  exit 1
fi

export LOG_DIR=$KAFKA_HOME/logs/server_$1
$KAFKA_HOME/bin/kafka-server-start.sh -daemon $KAFKA_HOME/config/kraft/server_$1.properties