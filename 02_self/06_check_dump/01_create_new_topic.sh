#!/bin/sh
$KAFKA_HOME/bin/kafka-topics.sh --bootstrap-server localhost:9092,localhost:9094,localhost:9096 --topic test-topic-log --partitions 1 --replication-factor 3 --create --config index.interval.bytes=500
