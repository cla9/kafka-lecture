#!/bin/sh
SIGNAL=${SIGNAL:-TERM}
PIDS=$(ps -Af | grep -i 'kraft/server_1.properties' | grep java | grep -v grep | awk '{print $2}')

echo "broker pid : $PIDS"
kill -s $SIGNAL $PIDS
