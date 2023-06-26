#!/bin/sh

export BASE=$(pwd)
$HOME/kafka_2.13-3.5.0/bin/kafka-reassign-partitions.sh --bootstrap-server localhost:9092,localhost:9094,localhost:9096 --reassignment-json-file $BASE/json/14_reassign_partition_manual.json --execute
