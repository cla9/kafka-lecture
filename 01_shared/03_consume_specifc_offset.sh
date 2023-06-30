 #! /bin/bash

bash ./util/check_variable.sh

if [ $# -ne 1 ]; then
  echo "Please insert postive offset number"
  exit 1
fi

$KAFKA_HOME/bin/kafka-console-consumer.sh --topic kafka-consumer-test --bootstrap-server $SERVER_IP:9092 --offset $1 --partition 0
