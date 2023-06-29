#!/bin/sh
SIGNAL=${SIGNAL:-TERM}
PROPERTY="kraft/server_$1.properties"
PIDS=$(ps -Af | grep -i $PROPERTY | grep java | grep -v grep | awk '{print $2}')

echo "broker-$1 pid : $PIDS is down"
kill -s $SIGNAL $PIDS
