---
title: Docker 환경구축
layout: post
tags:
  - Docker
permalink: /docker/install
---


```text
MacOs, Window에서는 docker desktop을 받아서 설치 진행 추천
```

- Ubuntu 기준 Docker를 설치하는 과정

#### 1. 필요한 패키지 설치

- `apt` 패키지 관리자가 HTTPS를 통해 패키지를 받아올 수 있도록 필요한 패키지 설치

```bash
sudo apt update
```
```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

#### 2. Docker의 공식 GPG 키 추가

- Docker 패키지의 무결성을 검증하기 위해 Docker의 공식 GPG 키를 시스템에 추가

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

#### 3. Docker 저장소 추가

- Docker의 공식 APT 저장소를 시스템에 추가 및 Docker의 최신 버전 다운로드

```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

#### 4. Docker 설치
1. 패키지 데이터베이스를 업데이트
```bash
#1. 패키지 데이터베이스를 업데이트
sudo apt update
```
2. Docker를 설치
```bash
#2. Docker를 설치
sudo apt install docker-ce
```

#### 5. Docker 서비스 시작 및 자동 시작 설정

- 서비스가 설치 후 자동으로 시작하도록 설정, 시스템 부팅 시에도 시작하도록 설정

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

#### 6. Docker 그룹에 사용자 추가

- `sudo` 없이 Docker 명령어를 실행하려면 사용자를 Docker 그룹에 추가.
- *보안 문제 있을 수 있으니 주의*

```bash
sudo usermod -aG docker ${USER}
```

변경 사항을 적용하려면 로그아웃하고 다시 로그인

#### 7. Docker 설치 확인

- version 명령어 실행

```bash
docker version
```

- Docker 컨테이너를 실행

```bash
docker run hello-world
```

이 명령어는 Docker가 제대로 작동하는지 검증하는 데 사용되는 테스트 이미지를 실행

#### 8. docker-compose install

- docker-compose가 필요 하다면 명령어 실행

```bash
sudo apt install docker-compose
```