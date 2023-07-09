#! /bin/bash

export BASE=$(pwd)
$KAFKA_HOME/bin/kafka-reassign-partitions.sh --bootstrap-server localhost:9092,localhost:9094,localhost:9096 --reassignment-json-file $BASE/reassign_partition_manual.json --execute
