#! /bin/bash
$KAFKA_HOME/bin/kafka-metadata-quorum.sh --bootstrap-server localhost:9092,localhost:9094,localhost:9096 describe --replication
