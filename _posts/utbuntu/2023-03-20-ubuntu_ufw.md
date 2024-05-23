---
title: Ubuntu ufw(방화벽)
layout: post
tags:
  - Ubuntu
permalink: /ubuntu/ufw
---
### 1. UFW 상태 확인

UFW가 활성화되어 있는지 확인

```bash
sudo ufw status verbose
```

방화벽의 현재 상태와 규칙을 표시


### 2. SSH 포트(22) 열기 예제

SSH의 기본 포트인 22번을 열기 위해 다음 명령어를 실행

```bash
sudo ufw allow 22
```

또는 특정 프로토콜을 지정하여 포트를 열 수도 있음

``` bash
sudo ufw allow 22/tcp
```

이 명령어는 TCP 프로토콜을 사용하는 포트 22에 대한 접속을 허용


### 3. 방화벽 규칙 적용

변경사항을 적용하고 방화벽 규칙을 업데이트 하려면, UFW를 재시작

```bash
sudo ufw disable sudo ufw enable
```

모든 새로운 규칙이 적용되고, 방화벽 설정이 재설정


### 4. 설정 확인

설정이 제대로 적용되었는지 확인하기

```bash
sudo ufw status
```

이 명령어를 통해 포트 22가 목록에 "ALLOW"로 나타나는지 확인
외부에서 SSH 접속이 가능함을 의미


### 보안 팁

- 특정 IP 주소에서만 SSH 접속을 허용하고 싶다면, 다음과 같이 설정
    
```bash
sudo ufw allow from [특정 IP 주소] to any port 22
```
