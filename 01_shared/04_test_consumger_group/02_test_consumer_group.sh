 #! /bin/bash

bash ../util/check_variable.sh

kafkacat -b $SERVER_IP:9092 -G $NICK_NAME consumer-group-test -q -o end