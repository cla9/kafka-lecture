#!/bin/sh

# Cluster Id 생성
KAFKA_CLUSTER_ID="$($HOME/kafka_2.13-3.5.0/bin/kafka-storage.sh random-uuid)"

# Cluster Id 매핑
$HOME/kafka_2.13-3.5.0/bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c $HOME/kafka_2.13-3.5.0/config/kraft/server_1.properties
$HOME/kafka_2.13-3.5.0/bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c $HOME/kafka_2.13-3.5.0/config/kraft/server_2.properties
$HOME/kafka_2.13-3.5.0/bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c $HOME/kafka_2.13-3.5.0/config/kraft/server_3.properties



