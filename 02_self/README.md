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
bash 01_modify_broker_setting.sh
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
bash 02_set_cluster_id.sh
```

<br>

해당 Cluster를 구분하기 위한 Cluster UUID 생성 후 log.dirs 위치에 메타데이터 생성

<br>

4. Cluster 구동

```
bash 03_run_kafka_cluster.sh
```

<br>

Broker Cluster 구동 및 Log 디렉토리 지정
- Node 1(/home/workspace/kafka_2.13-3.5.0/logs/server_1)
- Node 2(/home/workspace/kafka_2.13-3.5.0/logs/server_2)
- Node 2(/home/workspace/kafka_2.13-3.5.0/logs/server_3)

<br>

5. 