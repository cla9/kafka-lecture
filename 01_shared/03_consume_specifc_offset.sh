 #! /bin/bash

bash ./util/check_variable.sh

# Get offset from user
read -p "Enter offset: " OFFSET

if [[ ! $OFFSET =~ ^[0-4]$ ]]; then  
  echo "Please insert postive offset number(0~4)"
  exit 1
fi

$KAFKA_HOME/bin/kafka-console-consumer.sh --topic kafka-consumer-test --bootstrap-server $SERVER_IP:9092 --offset $OFFSET --partition 0
