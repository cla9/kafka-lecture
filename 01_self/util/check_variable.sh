#! /bin/bash

if [ -z "$KAFKA_HOME" ] ; then
  echo "Please set KAFKA_HOME environment"
  exit 1
fi