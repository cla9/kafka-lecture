#! /bin/bash

$KAFKA_HOME/bin/kafka-configs.sh --bootstrap-server localhost:9092,localhost:9094,localhost:9096 --entity-type topics --entity-name test-topic --describe