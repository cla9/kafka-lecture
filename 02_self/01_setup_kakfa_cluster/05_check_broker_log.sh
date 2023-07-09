#! /bin/bash
bash ../util/check_variable.sh

# Get offset from user
read -p "Enter Node id: " NODE

if [[ ! $NODE =~ ^[1-3]$ ]]; then  
  echo "Please insert postive node id(1~3)"
  exit 1
fi

tail -f $KAFKA_HOME/logs/server_$NODE/server.log