---
title: Redis 터미널 명령
layout: post
tags:
  - Redis
permalink: /redis/terminal
---
### 1. Redis 서버에 접속하기

서버에 접속하려면, `redis-cli` 명령어 사용
이는 Redis의 명령줄 인터페이스 도구로 기본적으로 
`localhost`의 `6379` 포트에 연결을 시도
다른 호스트나 포트에 연결시에는 옵션 추가해서 접속 가능

기본 연결:
```bash
redis-cli
```

지정된 호스트와 포트로 연결:
```bash
redis-cli -h <hostname> -p <port>
```
예를 들어, 호스트가 `192.168.1.100`이고 포트가 `6380`인 경우:
```bash
redis-cli -h 192.168.1.100 -p 6380
```

### 2. 데이터 조회 및 명령 실행

- **키 설정 및 가져오기**:
    - 설정: `SET key value`
    - 가져오기: `GET key`
    ```bash
    SET mykey "Hello, Redis!"
    GET mykey
    ```

- **리스트에 데이터 추가 및 조회**:
    - 추가: `LPUSH mylist value`
    - 전체 리스트 조회: `LRANGE mylist 0 -1`
    ```bash
    LPUSH mylist "hello"
    LPUSH mylist "world"
    LRANGE mylist 0 -1
    ```
- **해시 설정 및 가져오기**:
    - 해시 설정: `HSET myhash field1 "Hello"`
    - 해시 값 가져오기: `HGET myhash field1`  
    ```bash
    HSET myhash field1 "Hello"
    HGET myhash field1
    ```

- **셋(집합)에 데이터 추가 및 조회**:
    - 추가: `SADD myset value1`
    - 조회: `SMEMBERS myset`
    ```bash
    SADD myset "Hello"
    SADD myset "Redis"
    SMEMBERS myset
    ```

### 3. 데이터 삭제 및 만료 설정

- **키 삭제**:
    ```bash
    DEL key
    ```

- **키의 만료 시간 설정** (예: 10초 후 만료):
    ```bash
    EXPIRE key 10
    ```

### 4. 보안 연결

보안이 설정된 Redis 서버(비밀번호가 설정된 경우)에 연결하려면, `AUTH` 명령어로 비밀번호를 입력:
```bash
AUTH yourpassword
```
