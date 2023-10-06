#! /bin/bash

if [ -z "$NICK_NAME" ] || [ -z "$SERVER_IP" ]; then
  echo "Please set NICK_NAME or SERVER_IP"
  exit 1
fi

