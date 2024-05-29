---
title: Docker Jib(Java 라이브러리)
tags:
  - Docker
layout: post
permalink: docker/jib
---
#### Jib
- 자바를 컨테이너 이미지로 빌드하고 배포하는데 편한 오픈소스 라이브러리 입니다.
- Dockerfile, Docker 데몬 없이 컨테이너 이미지를 만들 수 있습니다
  이를 통해 빌드 프로세스를 간소화 하고 CI/CD 파이프라인을 개선 할 수 있습니다.

#### build.gradle 예제

```Groovy

plugins {
  ...
  ...
  ...
  id 'com.google.cloud.tools.jib' version '3.4.0'
}


...

jib {
  from { /* BASE 이미지 */
    image = 'openjdk:17-jdk-alpine'
  }
  to {
	  image = 'docker.io/miroit/parking'

    tags = <TAG Name>
    /*EX) tags = ['1.0']*/
		auth { /* 아이디 비밀번호 */
      username = '허브아이디'
      password = '비밀번호' /* 발행 받은 토큰 적으면 됨 */
    }

  }
  container {
    entrypoint = ['java', '-Dspring.profiles.active=test', '-jar', 'test-docker-spring-boot-0.0.1-SNAPSHOT.jar']

    jvmFlags = ['-Xms512m', '-Xmx512m', '-Xdebug', '-XshowSettings:vm', '-XX:+UnlockExperimentalVMOptions', '-XX:+UseContainerSupport']
		ports = ['8080']

    environment = [SPRING_OUTPUT_ANSI_ENABLED: "ALWAYS"]
    labels = [version:project.version, name:project.name, group:project.group]

    creationTime = 'USE_CURRENT_TIMESTAMP'
    format = 'Docker'
  }
  extraDirectories {
    paths {
      path {
        from = file('build/libs')
      }
    }
  }
}
```

### 사용방법

1.`Gradle` > `build` > `bootjar` 실행
- 먼저 도커 이미지로 만들 프로젝트를 jar로 만들어 줍니다.
![](2.%20Areas/Blog/assets/images/Docker/jib/1.png)
2. `Gradle` > `build` > `jib` 실행
 - build.gradle에 설정된 내용에 따라 build와 push 가 진행 됩니다.
![](2.%20Areas/Blog/assets/images/Docker/jib/2.png)
- 서비스에 적용 하니 동료들 반응이 뜨겁습니다.