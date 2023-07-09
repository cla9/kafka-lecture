 #! /bin/bash

bash ../util/check_variable.sh


if [ $# -ne 1 ]; then
  echo "Please insert postive partition number(0~1)"
  exit 1
fi

kafkacat -b $SERVER_IP:9092 -P -t consumer-group-test -p $1