#!/bin/sh
$HOME/kafka_2.13-3.5.0/bin/kafka-topics.sh --bootstrap-server localhost:9092,localhost:9094,localhost:9096 --topic test-topic --partitions 3 --replication-factor 3 --create
