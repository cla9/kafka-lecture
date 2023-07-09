 #! /bin/bash

bash ../util/check_variable.sh

cat ./dummy.json | $KAFKA_HOME/bin/kafka-console-producer.sh --topic kafka-class --bootstrap-server $SERVER_IP:9092
