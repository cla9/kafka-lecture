#!/bin/sh

bash ../util/check_variable.sh

# Get partition number from user
read -p "Enter partition number: " PARTITION

if [[ ! $PARTITION =~ ^[0-1]$ ]]; then  
  echo "Please insert postive offset number(0~1)"
  exit 1
fi

kafkacat -b $SERVER_IP:9092 -P -t consumer-group-test -p $PARTITION