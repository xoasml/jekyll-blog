---
layout: post
title: Redis Key, List, Set, Hash
permalink: /redis/type
tags:
  - Redis
---
### 1. 키(Key)
- Redis에서 모든 데이터는 키와 값의 쌍으로 저장
- 키는 문자열 타입이며, 데이터를 고유하게 식별하는 데 사용
- 각 키는 하나의 데이터 구조(예: 문자열, 리스트, 셋, 해시 등)를 의미
  ```bash
  SET key1 "value"
  GET key1  # "value" 반환
  ```

### 2. 리스트(List)
- Redis 리스트는 문자열 요소의 컬렉션으로, 순서가 있으며 중복 허용됨 
- 리스트는 주로 스택 또는 큐로 사용됨
- Redis의 리스트는 양방향이므로 양 끝에서 요소를 추가하거나 제거할 수 있음

- **명령**
  - `LPUSH`: 리스트의 앞쪽에 요소 추가
  - `RPUSH`: 리스트의 뒤쪽에 요소 추가
  - `LPOP`: 리스트의 앞쪽에서 요소 제거
  - `RPOP`: 리스트의 뒤쪽에서 요소 제거
  - `LRANGE`: 리스트의 범위에 있는 요소 조회
  ```bash
  LPUSH mylist "world"
  RPUSH mylist "hello"
  LRANGE mylist 0 -1  # ["hello", "world"]
  ```

### 3. 셋(Set)
- Redis의 셋은 중복을 허용하지 않는 문자열 컬렉션
- 셋은 주로 데이터의 존재 여부를 빠르게 확인하거나 고유한 데이터를 관리할 때 사용

- **명령**
  - `SADD`: 셋에 요소 추가
  - `SREM`: 셋에서 요소 제거
  - `SMEMBERS`: 셋의 모든 요소 조회
  - `SISMEMBER`: 요소가 셋에 포함되어 있는지 확인
  ```bash
  SADD myset "hello"
  SADD myset "redis"
  SMEMBERS myset  # ["hello", "redis"]
  ```

### 4. 해시(Hash)
- Redis 해시는 필드와 값의 매핑을 저장하는데 사용
- 각 해시는 여러 필드를 가질 수 있으며, 각 필드는 유니크한 이름과 연결된 값(문자열)을 갖게됨
- 객체나 구조체를 저장할 때 유용

- **명령**
  - `HSET`: 해시에 필드와 값을 설정
  - `HGET`: 해시의 특정 필드 값을 가져옴
  - `HMSET`: 해시에 여러 필드와 값 설정
  - `HGETALL`: 해시의 모든 필드와 값을 조회

  ```bash
  HSET myhash field1 "Hello"
  HGET myhash field1  # "Hello"
  HSET myhash field2 "World"
  HGETALL myhash  # {"field1": "Hello", "field2": "World"}
  ```

