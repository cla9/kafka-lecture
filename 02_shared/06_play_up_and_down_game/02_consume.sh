#! /bin/bash

bash ../util/check_variable.sh

kafkacat -b $SERVER_IP:9092 -C -t $NICK_NAME -o end -q