---
title: Redis 설정(DockerCompose 예제)
layout: post
permalink: /redis/docker-compose
tags:
  - Redis
---
### 1. docker-compose.yml

```yaml
version: '3.8'

services:
  redis:
    image: redis:6.0.20
    container_name: redis
    environment:
      REDIS_REPLICATION_MODE: master
      REDIS_PASSWORD: "****"
    networks:
      - taehoon_network
    volumes:
      - redis_data:/data
    ports:
      - "6379:6379"
    restart: always
    command: >
      sh -c "chown redis:redis /etc && chmod 755 /etc &&
             redis-server --requirepass $$REDIS_PASSWORD"

networks:
  taehoon_network:
    external: true
```

### 2. REDIS_PASSWORD
- 패스워드를 설정하지 않고 사용 하다가 해킹 당한 경험이 있음.
- 도커는 패스워드를 설정하지 않아도 사용이 가능함.
- command에 퍼미션에 설정을 해주지 않으면  
  REDIS_PASSWORD 설정이 불가하기 때문에 커맨드 넣는것을 추천