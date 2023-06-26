#!/bin/sh

export LOG_DIR=$HOME/kafka_2.13-3.5.0/logs/server_1
$HOME/kafka_2.13-3.5.0/bin/kafka-server-start.sh -daemon $HOME/kafka_2.13-3.5.0/config/kraft/server_1.properties
