---
title: Docker docker-compose
layout: post
tags:
  - Docker
permalink: /docker/docker-compose
---
#### docker-compose install

```bash
sudo apt install docker-compose
```

#### Hub에서 최신 이미지 다운로드
```bash
docker-compose pull {서비스 이름}
```

#### 컨테이너 올리기

- yaml대로 image와 container 생성 및 `docker run`

```bash
docker-compose up {서비스 이름}
docker-compose up —force-recreate —build -d {서비스 이름} # 기존 올라가 있는 내용 덮어 씌우기
```

#### 컨테이너 삭제

- 컨테이너 삭제, 네트워크와 익명 볼륨 삭제(옵션 지정의 경우)
- 모든 리소스 제거하고 클린 상태로 돌아갈때 사용

```bash
docker-compose down
```
```bash
docker-compose down -v # 익명볼륨 삭제
```

#### 컨테이너 중지

- 컨테이너 중지, 파일 설정등 유지
- 일시적으로 중지 해야 할때 사용

```bash
docker-compose stop {서비스 이름}
```

#### 컨테이너 재시작

- `docker-compsoe stop` 으로 멈춘 컨테이너 시작

```bash
docker-compose start {서비스 이름}
```

#### 컨테이너 제거

- `docker-compose stop` 으로 멈춘 컨테이너 삭제
- 멈춰있지 않으면 rm 명령어를 사용 불가

```
docker-compose rm
```

### docker-compose.yml 예제
```yml
version: '3.8'

services:
  api-initial: # 서비스 이름
    image: devtaehoon/initial:latest # 구동 할때 쓰이는 이미지
    container_name: api-initial # docker container 이름
    environment: # 환경변수
      TZ: Asia/Seoul
    networks: # network 설정
      - taehoon_network # container에 사용 될 네트워크
    volumes: # volume 설정
      - api-initial:/logs # 사용할 volume 이름과 container 내부 연결 위치
    ports: # 포트 설정 
      - "8081:8081" # ex)8081포트로 요청 오면 container 내부 8081로 연결
    restart: always # 서비스 자동 실행 

networks: #docker network 생성
  taehoon_network: # network 이름
    external: true # 이미 정의 된 네트워크

volumes: # docker volume 생성
  api-initial: # volume 이름
    driver: local # 위치
```