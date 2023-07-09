# KRaft 기반 Kafka Cluster 생성 및 내부구조 확인

> KRaft Cluster 내부 Controller 속성 확인 및 토픽 파티션 관리 방법 습득 목적

## 1. Kafka Cluster 생성

> KRaft Cluster 생성 및 Controller 정보 확인 목적


<br>

1. 실습 디렉토리 이동

```
cd 01_setup_kafka_cluster
```

<br>

2. Kafka Cluster Config 설정

```
./01_modify_broker_setting.sh
```

<br>

해당 스크립트는 기본 Kafka Broker Config를 3본 복제하여, Cluster 속성 지정함. 변경되는 속성은 다음과 같음

<br>

- Cluster Node Id 지정(1~3)
- Listener 지정
    - Node 1(localhost:9092)
    - Node 2(localhost:9094)
    - Node 3(localhost:9096)
- Advertised Listener 지정
    - Node 1(localhost:9093)
    - Node 2(localhost:9095)
    - Node 3(localhost:9097)
- Quorum Voertes 지정
- Log 저장 위치 지정
    - Node 1(/tmp/kraft-combined-logs-1)
    - Node 2(/tmp/kraft-combined-logs-2)
    - Node 3(/tmp/kraft-combined-logs-3)

<br>

3. Log 디렉토리에 Cluster 기본 설정 파일 생성

```
./02_set_cluster_id.sh
```

<br>

해당 Cluster를 구분하기 위한 Cluster UUID 생성 후 log.dirs 위치에 메타데이터 생성

<br>

4. Cluster 구동

```
./03_run_kafka_cluster.sh
```

<br>

Broker Cluster 구동 및 Log 디렉토리 지정
- Node 1(/home/workspace/kafka_2.13-3.5.0/logs/server_1)
- Node 2(/home/workspace/kafka_2.13-3.5.0/logs/server_2)
- Node 2(/home/workspace/kafka_2.13-3.5.0/logs/server_3)

<br>

5. controller 로그 확인

```
./04_check_controller_log.sh
```

<br>

Enter Node id: 1

<br>

※ Controller 로그 확인할 Node id를 입력(1~3)한다. 위 예시는 1번 Node의 Controller 로그를 확인하는 예제이다.
Controller 로그를 통해 리더 선출 완료 및 Broker가 Controller를 통해 접속 했음을 확인한다.

<br>

6. Broker 로그 확인

```
./05_check_broker_log.sh
```

<br>

Enter Node id: 1

<br>

※ Broker 로그 확인할 Node id를 입력(1~3)한다. 위 예시는 1번 Node의 Broker 로그를 확인하는 예제이다.
Broker 로그를 통해 Kafka Cluster가 완전히 기동 완료 되었음을 확인한다.

<br>

7. Controller 상태 확인

```
./06_check_controller.status.sh
```

<br>

어떤 Node가 현재 Leader이며, Leader Epoch는 무엇인지 현재 Lag가 발생한 Follower Controller 정보 확인 가능

<br>

8. Controller Replication 상세 정보 확인

```
./07_check_controller_replication.sh
```

<br>

Controller Pool에 해당하는 Controller들 간의 상태와 Timestamp, Lag 정보 확인 가능

<br>


### 1-1. 1번 실습 종료

<br>

1번 실습이 끝나면, 다음 실습을 위해 상위 디렉토리로 이동한다.

<br>

1. 상위 디렉토리 이동

```
cd ..
```

<br>

## 2. Topic 생성 및 파티션 정보 확인

> Partition 개수가 지정된 Topic 생성 및 생성 정보 확인 목적

<br>

1. 실습 디렉토리 이동

```
cd 02_topic
```

<br>

2. Topic 생성

```
./01_create_topic.sh
```

<br>

Partition 3개에 Replication Factor 3으로 지정되어 총 3개의 Partition Leader와 6개의 Follower로 구성된 Replica가 생성된다.

<br>

3. Topic 정보 확인

```
./02_describe_topic.sh
```

<br>

Topic Partition 갯수, Replication Factor 갯수 각 Partition 별 Leader 정보와 Replicas, Isr 정보 확인 가능

<br>

4. Topic 상세 설정 확인

```
./03_describe_topic_config.sh
```

<br>

해당 토픽에 지정된 설정 값 전부를 보여줌

<br>

5. Topic 설정 변경

```
./04_add_topic_config.sh
```

<br>

Topic에 지정된 설정 변경함. 위 코드는 index.interval.bytes 값을 기본 4096에서 1024로 변경하는 예제 프로그램

<br>

6. Dynamic Topic 변경 내용 확인

```
./05_describe_topic_dynamic_config.sh
```

<br>

동적으로 설정 변경된 값 확인 가능

<br>

7. Topic 설정 변경 내용 삭제

```
./06_remove_topic_config.sh
```

<br>

동적으로 설정 변경한 값 삭제함. 삭제하면 해당 값은 기본 값으로 변경됨

<br>

8. Topic 변경 삭제 후 Dynamic topic 변경 내용 확인

```
./05_describe_topic_dynamic_config.sh
```

<br>

동적으로 설정 변경 삭제한 이후 6번 과정 재수행하면, index.interval.bytes 변경 값이 기본 값으로 변경되었으므로 더 이상 조회되지 않음

<br>


### 2-1. 2번 실습 종료

<br>

2번 실습이 끝나면, 다음 실습을 위해 상위 디렉토리로 이동한다.

<br>

1. 상위 디렉토리 이동

```
cd ..
```

<br>

## 3. Preferred Leader Election 수행하기

> 임의로 Broker 중단 하여 Leader Skew 상황 만든 다음 수동으로 Preferred Leader Election 수행 목적

<br>

1. 실습 디렉토리 이동

```
cd 03_preferred_leader
```

<br>


2. 임의의 Broker Shutdown 시켜 파티션 리더 재선출

```
./01_shutdown_broker.sh 1
```

<br>

위 코드는 1번 Broker 및 Controller를 기동 중지하는 예제로써 프로그램 실행 시 인자로 node id를 전달하면 해당 인스턴스 종료됨

<br>

3. Topic 정보 확인

```
./describe_topic.sh
```

<br>

Broker 종료 이후 Topic 정보를 확인하면, Partition Leader 종료로 인하여 Leader 재선출이 일어남을 확인할 수 있음

<br>

4. 중지 시킨 Broker 재기동

```
./02_run_broker.sh 1
```

<br>

이전에 기동 중지했던 Broker를 다시 기동시킴

<br>

5. Topic 정보 확인

```
./describe_topic.sh
```

<br>

Broker 재기동 이후 Topic 정보를 확인하면, 재기동한 Broker가 Message를 따라잡으면 ISR에 포함되지만, 해당 Broker로 다시 Leader가 바뀌지는 않음

<br>

6. Preferred Leader Election 수행

```
./03_elect_preferred_leader.sh
```

<br>

Topic 최초 생성 시, 지정된 replicas에 가장 첫번째가 Preferred Leader임. 따라서 해당 Topic Partition에 대하여 Preferred Leader로 재선출하도록 요청할 수 있음. 요청 전달 시 json 포맷으로 Topic과 Partition 정보를 전달해야함

```
cat preferred_leader.json
```

<br>

7. Topic 정보 확인

```
./describe_topic.sh
```

<br>

Preferred Leader Election 수행 결과, Leader Skew 현상에서 벗어나서 균형잡힌 Partiton Leader 분배였던 초기 모습으로 돌아감 확인

<br>



### 3-1. 3번 실습 종료

<br>

3번 실습이 끝나면, 다음 실습을 위해 상위 디렉토리로 이동한다.

<br>

1. 상위 디렉토리 이동

```
cd ..
```

<br>

## 4. Partition Reassign 수동 실습하기

> 수동으로 Partition Reassign을 통해서 Broker Skew 상황 만들기 목적

<br>

1. 실습 디렉토리 이동

```
cd 04_reassign_partition
```

<br>



### 4-1. 4번 실습 종료

<br>

4번 실습이 끝나면, 다음 실습을 위해 상위 디렉토리로 이동한다.

<br>

1. 상위 디렉토리 이동

```
cd ..
```

<br>



## 5. Produce 내용 적재된 Log 파일 Dump 확인

> Log 및 index 적재 내용을 확인하여 실제 Disk에 저장되는 데이터 확인 목적

<br>

1. 실습 디렉토리 이동

```
cd 05_check_dump
```

<br>




## 6. Kafka Cluster 종료 및 환경변수 제거

```
cd 
```