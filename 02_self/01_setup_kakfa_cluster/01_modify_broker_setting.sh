 #! /bin/bash
cp $KAFKA_HOME/config/kraft/server.properties $KAFKA_HOME/config/kraft/server_1.properties
cp $KAFKA_HOME/config/kraft/server.properties $KAFKA_HOME/config/kraft/server_2.properties
cp $KAFKA_HOME/config/kraft/server.properties $KAFKA_HOME/config/kraft/server_3.properties

#node id 변경
sed -i "s/node.id=1/node.id=2/g" $KAFKA_HOME/config/kraft/server_2.properties
sed -i "s/node.id=1/node.id=3/g" $KAFKA_HOME/config/kraft/server_3.properties

#quorum voters 추가
sed -i "s/controller.quorum.voters=1@localhost:9093/controller.quorum.voters=1@localhost:9093,2@localhost:9095,3@localhost:9097/g" $KAFKA_HOME/config/kraft/server_1.properties
sed -i "s/controller.quorum.voters=1@localhost:9093/controller.quorum.voters=1@localhost:9093,2@localhost:9095,3@localhost:9097/g" $KAFKA_HOME/config/kraft/server_2.properties
sed -i "s/controller.quorum.voters=1@localhost:9093/controller.quorum.voters=1@localhost:9093,2@localhost:9095,3@localhost:9097/g" $KAFKA_HOME/config/kraft/server_3.properties


#listeners 변경
sed -i "s%listeners=PLAINTEXT://:9092,CONTROLLER://:9093%listeners=PLAINTEXT://:9094,CONTROLLER://:9095%g" $KAFKA_HOME/config/kraft/server_2.properties
sed -i "s%listeners=PLAINTEXT://:9092,CONTROLLER://:9093%listeners=PLAINTEXT://:9096,CONTROLLER://:9097%g" $KAFKA_HOME/config/kraft/server_3.properties

#advertised listeners 변경
sed -i "s%advertised.listeners=PLAINTEXT://localhost:9092%advertised.listeners=PLAINTEXT://localhost:9094%g" $KAFKA_HOME/config/kraft/server_2.properties
sed -i "s%advertised.listeners=PLAINTEXT://localhost:9092%advertised.listeners=PLAINTEXT://localhost:9096%g" $KAFKA_HOME/config/kraft/server_3.properties

#log.dirs 변경
sed -i "s%log.dirs=/tmp/kraft-combined-logs%log.dirs=/tmp/kraft-combined-logs-1%g" $KAFKA_HOME/config/kraft/server_1.properties
sed -i "s%log.dirs=/tmp/kraft-combined-logs%log.dirs=/tmp/kraft-combined-logs-2%g" $KAFKA_HOME/config/kraft/server_2.properties
sed -i "s%log.dirs=/tmp/kraft-combined-logs%log.dirs=/tmp/kraft-combined-logs-3%g" $KAFKA_HOME/config/kraft/server_3.properties
