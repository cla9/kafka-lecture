#!/bin/sh

$HOME/kafka_2.13-3.5.0/bin/kafka-leader-election.sh --bootstrap-server localhost:9092,localhost:9094,localhost:9096 --topic test-topic --election-type PREFERRED --partition 0
