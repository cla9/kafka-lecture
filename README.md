# Kafa 기본 환경 구성

## 카프카 프로그램 및 Kafkacat 설치

```
sh 01_install_kafka.sh
```

## Kafka 환경 설정

```
source 02_set_environment_P.sh

Enter your nick name : **[실습시 개인별로 사용할 unique한 nick-name 입력]**
Enter an IP address : **[실습 당시 IP 주소 제공]**

```

환경설정 Shell 파일 수행시에는 **source** 명령어를 통해 수행해야한다.
그 이유는 sh 혹은 ./ 로 Shell 파일을 실행 시킬 경우 자식 shell로 동작하지만, 환경 설정의 경우 부모 shell의 설정을 변경시켜야 되기 때문이다.


```
sh check_enviroment.sh

위 명령어 수행 결과 nick-name, server-ip, kafka-home에 결과 출력되면 정상
```

## Kafka 자원 초기화

```
source 03_cleanup_P.sh
```

위 명령어는 ~/.bashrc에 등록된 SERVER_IP 그리고 NICK_NAME 등의 환경변수를 제거하고, self 실습을 통해 기동한 Kafka Cluster를 모두 종료한다.