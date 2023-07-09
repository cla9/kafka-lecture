#! /bin/bash

kafkacat -b $SERVER_IP:9092 -P -H nick-name=$NICK_NAME -t game
