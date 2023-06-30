#!/bin/sh
$KAFKA_HOME/bin/kafka-run-class.sh kafka.tools.DumpLogSegments --print-data-log --deep-iteration --files /tmp/kraft-combined-logs-1/test-topic-log-0/00000000000000000000.log 