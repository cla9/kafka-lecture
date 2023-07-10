# Kafa 기본 환경 구성

##

강의 중 실습은 총 2번 진행되며, 01_shared, 02_self 폴더에 각 실습에 대한 스크립트가 모두 제공된다.


최초 codespace 기동 시에는 Kafka 관련 프로그램 및 환경 설정이 필요하다.
설정 방법은 아래 내용을 참고한다.


<br>


## Kafka 프로그램 및 Kafkacat 설치

```
./01_install_kafka.sh
```

<br>

## Kafka 환경 설정

```
source 02_set_environment_P.sh

Enter your nick name : ※[실습시 개인별로 사용할 unique한 nick-name 입력]
Enter an IP address : ※[실습 당시 IP 주소 제공]

```
<br>

환경설정 Shell 파일 수행시에는 **source** 명령어를 통해 수행해야한다.
그 이유는 sh 혹은 ./ 로 Shell 파일을 실행 시킬 경우 자식 Shell로 동작하지만, 환경 설정의 경우 부모 Shell의 설정을 변경시켜야 되기 때문이다.

<br>

```
./check_enviroment.sh

위 명령어 수행 결과 nick-name, server-ip, kafka-home 모두 출력되면 정상
```

<br>

## Kafka 자원 초기화

```
source 03_cleanup_P.sh
```

<br>
위 명령어는 ~/.bashrc에 등록된 SERVER_IP 그리고 NICK_NAME 등의 환경변수를 제거하고, self 실습을 통해 기동한 Kafka Cluster를 모두 종료한다.

<br>
초기화 명령어는 모든 실습이 끝난 이후 codespace를 종료하기 전 한번만 실행한다.