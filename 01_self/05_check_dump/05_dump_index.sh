#! /bin/bash

$KAFKA_HOME/bin/kafka-run-class.sh kafka.tools.DumpLogSegments --deep-iteration --print-data-log --files /tmp/kraft-combined-logs-1/test-topic-log-0/00000000000000000000.index 