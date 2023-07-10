#! /bin/bash
curl -LO https://downloads.apache.org/kafka/3.5.0/kafka_2.13-3.5.0.tgz 
tar -xvf kafka_2.13-3.5.0.tgz -C $HOME

# kafkacat 설치
sudo apt update
sudo apt install kafkacat -y