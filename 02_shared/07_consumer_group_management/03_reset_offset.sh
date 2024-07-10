 #! /bin/bash

bash ../util/check_variable.sh

$KAFKA_HOME/bin/kafka-consumer-groups.sh --bootstrap-server $SERVER_IP:9092 --group $NICK_NAME --topic kafka-consumer-test --reset-offsets --to-latest --execute