#!/bin/sh

export BASE=$(pwd)
$HOME/kafka_2.13-3.5.0/bin/kafka-leader-election.sh --bootstrap-server localhost:9092,localhost:9094,localhost:9096 --election-type PREFERRED  --path-to-json-file $BASE/json/11_elect_preferred_leader.json
