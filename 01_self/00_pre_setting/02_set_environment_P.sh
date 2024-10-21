#! /bin/bash

# KAFKA_HOME 환경변수 설정

if ! grep -q "KAFKA_HOME" ~/.bashrc ; then
     # Export the value to `.bashrc`  
     echo "export KAFKA_HOME=$HOME/kafka_2.13-3.8.0" >> ~/.bashrc
fi
# Source `.bashrc` to apply the changes
source ~/.bashrc 

# 환경변수 확인
echo "kafka-home : $KAFKA_HOME"
