#! /bin/bash

export BASE=$(pwd)
$KAFKA_HOME/bin/kafka-leader-election.sh --bootstrap-server localhost:9092,localhost:9094,localhost:9096 --election-type PREFERRED  --path-to-json-file $BASE/preferred_leader.json
