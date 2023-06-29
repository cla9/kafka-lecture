#!/bin/sh
cat ./dummy.json | $KAFKA_HOME/bin/kafka-console-producer.sh --topic test-topic-log --bootstrap-server localhost:9092,localhost:9094,localhost:9096