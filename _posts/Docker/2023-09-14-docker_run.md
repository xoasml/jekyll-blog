---
title: Docker run
layout: post
tags:
  - Docker
permalink: docker/run
---
```bash
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

- **OPTIONS**: 컨테이너 실행에 대한 다양한 옵션을 설정합니다.
- **IMAGE**: 사용할 이미지의 이름입니다.
- **COMMAND**: 컨테이너 내에서 실행할 기본 명령어입니다.
- **ARG**: 기본 명령어에 전달할 인자입니다.

```bash
docker run -d --name nickName -e TZ=Asia/Seoul --network networkName -v volumeName:컨테이너데이터패스 -p 80:80
```

### 주요 옵션들

- `-d`, `--detach`: 백그라운드 모드에서 컨테이너를 실행합니다.
- `--name`: 컨테이너에 이름을 지정합니다.
- `-p`, `--publish`: 호스트와 컨테이너 간의 포트를 매핑합니다 (예: `-p 80:80`).
- `-v`, `--volume`: 호스트와 컨테이너 간의 볼륨을 마운트합니다 (예: `-v /host/path:/container/path`).
- `--rm`: 컨테이너가 정상적으로 종료될 때 자동으로 컨테이너를 삭제합니다.
- `-e`, `--env`: 컨테이너 내에서 환경변수를 설정합니다 (예: `-e MY_ENV=value`).
	- 타임존 설정 : `TZ=Asia/Seoul`
- `--env-file`: 파일로부터 환경변수를 읽어 컨테이너에 설정합니다.
- `--link`: 다른 컨테이너와 링크를 설정합니다 (비권장: 네트워크를 사용하는 것이 좋습니다).
- `--network`: 컨테이너가 연결될 네트워크를 지정합니다.
- `-it`: 상호작용 모드로 터미널을 할당합니다. 보통 컨테이너 내부에서 쉘을 사용하기 위해 사용됩니다.
- `--entrypoint`: 컨테이너의 기본 명령어를 덮어쓰기 위해 사용합니다.
- `--user`: 컨테이너 내에서 사용할 사용자 ID 또는 이름을 지정합니다.

---

### 예제 (MySql)
#### 1. 데이터 디렉토리

- **경로**: `/var/lib/mysql`
- **설명**: 이 경로는 MySQL의 데이터 파일을 저장하는 기본 디렉토리입니다. 컨테이너를 재시작하거나 업데이트할 때 데이터를 유지하려면 이 경로에 볼륨을 할당해야 합니다.

#### 2. 설정 파일

- **경로**: `/etc/mysql/my.cnf` (기본 설정 파일), `/etc/mysql/conf.d/` (추가 설정 파일을 위한 디렉토리)
- **설명**: MySQL 인스턴스의 구성을 조정하기 위해 설정 파일에 볼륨을 할당할 수 있습니다. 이를 통해 커스텀 설정을 적용하고, 설정 변경이 필요할 때 컨테이너를 재빌드하지 않고도 설정을 수정할 수 있습니다.

#### 3. 로그 파일

- **경로**: MySQL의 로그 파일 경로는 설정에 따라 다릅니다. 일반적으로 `/var/log/mysql/` 에 위치하지만, 로그 설정에 따라 달라질 수 있습니다.
- **설명**: 진단, 모니터링, 트러블슈팅을 위해 MySQL 로그 파일을 보존하는 것이 중요할 수 있습니다. 볼륨을 할당하면 로그 파일을 컨테이너 외부에서도 접근할 수 있게 됩니다.

#### docker run 예시
```zsh
docker run -d \
--name mysql \
-e TZ=Asia/Seoul \
-e MYSQL_ROOT_PASSWORD=**** \
--network local_network \
-v mysql-db:/var/lib/mysql \
-v mysql-conf:/etc/mysql/conf.d \
-v mysql-log:/var/log/mysql \
-p 3306:3306 \
이미지ID
```
#### Docker Compose 예시

MySQL 컨테이너에 대한 볼륨을 할당하는 Docker Compose 파일의 예시는 다음과 같습니다.
```yaml
version: '3.1'
services:
  db:
    image: mysql:5.7
    volumes:
      - mysql-db:/var/lib/mysql
      - mysql-conf:/etc/mysql/conf.d/custom.cnf
      - mysql-log:/var/log/mysql
    environment:
      MYSQL_ROOT_PASSWORD: example
volumes:
  mysql-db:
  mysql-conf:
  mysql-log:
```
