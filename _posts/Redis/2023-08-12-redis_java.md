---
title: Redis Java 예제
tags:
  - Redis
permalink: /redis/java
layout: post
---
### 1. Gradle 설정

`build.gradle` 파일을 업데이트하여 필요한 의존성을 부여하고 Spring Data Redis 및 Lettuce 클라이언트(기본 Redis 클라이언트)를 사용

```gradle
plugins {
    id 'org.springframework.boot' version '3.0.0'
    id 'io.spring.dependency-management' version '1.0.15.RELEASE'
    id 'java'
}

group = 'com.example'
version = '0.1.0'
sourceCompatibility = '17'

repositories {
    mavenCentral()
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web'
    implementation 'org.springframework.boot:spring-boot-starter-data-redis'
    implementation 'io.lettuce:lettuce-core'

    testImplementation 'org.springframework.boot:spring-boot-starter-test'
}

test {
    useJUnitPlatform()
}
```

### 2. Redis 설정

Redis 연결 설정을 `application.yml` 파일에 추가

```yaml
# application.yml
spring:
  redis:
    host: localhost
    port: 6379
    client-type: lettuce
```
```properties 
# application.properties
spring.data.redis.host=175.113.200.48
spring.data.redis.port=6379
spring.data.redis.client-type=lettuce
```



### 3. Redis 데이터 액세스 객체 생성

Redis 데이터를 쉽게 저장하고 검색할 수 있도록 Spring Data Redis의 Repository를 활용 다음은 Redis에 데이터를 저장하고 조회하는 간단한 예제

```java
package com.hoon.api.utils.redis;  
  
import lombok.RequiredArgsConstructor;  
import org.springframework.data.redis.core.StringRedisTemplate;  
import org.springframework.data.redis.core.ValueOperations;  
import org.springframework.stereotype.Repository;  
  
@Repository  
@RequiredArgsConstructor  
public class RedisRepository {  
  
    private final StringRedisTemplate template;  
  
    public void setValue(String key, String value) {  
        ValueOperations<String, String> ops = this.template.opsForValue();  
        ops.set(key, value);  
    }  
  
    public String getValue(String key) {  
        ValueOperations<String, String> ops = this.template.opsForValue();  
        return ops.get(key);  
    }  
  
}
```

### 4. 컨트롤러 생성

Spring Boot 애플리케이션에서 Redis와 상호작용하는 REST API를 구현

```java
package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/redis")
public class RedisController {

    private final RedisRepository redisRepository;

    @Autowired
    public RedisController(RedisRepository redisRepository) {
        this.redisRepository = redisRepository;
    }

    @PostMapping("/set")
    public void setKeyValue(@RequestParam String key, @RequestParam String value) {
        redisRepository.setValue(key, value);
    }

    @GetMapping("/get")
    public String getKeyValue(@RequestParam String key) {
        return redisRepository.getValue(key);
    }
}
```

이 예제를 통해 Spring Boot 3에서 Redis를 사용하여 데이터를 저장하고 검색할 수 있게 됨