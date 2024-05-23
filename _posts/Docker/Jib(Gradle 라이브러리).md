#### build.gradle

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
