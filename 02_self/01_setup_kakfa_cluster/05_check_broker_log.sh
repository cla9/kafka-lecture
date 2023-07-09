#!/bin/sh
bash ../util/check_variable.sh

if [ $# -ne 1 ]; then
  echo "Please insert postive offset number"
  exit 1
fi

tail -f $KAFKAH_HOME/logs/server_$1/server.log