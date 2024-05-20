---
title: ssh
layout: post
tags:
  - Ubuntu
permalink: /ubuntu/ssh
---
### 1. SSH 설치
- **Linux**: 대부분의 Linux 시스템에서는 SSH가 기본적으로 설치되어 있지만, 설치되어 있지 않은 경우 다음과 같이 설치
```bash
sudo apt-get install openssh-server  # Ubuntu와 Debian 기반 시스템 
```    

### 2. SSH 서버 설정
- **SSH 구성 파일 수정**: SSH 서버의 구성은 주로 `/etc/ssh/sshd_config` 파일을 통해 이루어지며. 이 파일에서 포트 번호, 허용하는 인증 방법 등을 설정
- 예를 들어, 기본 포트인 22 대신 다른 포트를 사용하고 싶다면 `Port` 지시어를 변경
- `PermitRootLogin no` 설정을 통해 루트 로그인을 비활성화하여 보안을 강화
- **서비스 재시작**: 설정을 변경한 후에는 SSH 서버를 재시작해야 적용
```bash
sudo systemctl restart sshd
```
    

### 3. SSH 보안 강화

- **공개키 인증 사용**: SSH에서는 비밀번호 대신 키 기반 인증을 사용 가능, 이는 보안을 대폭 향상 시킴
    
- 개인 키와 공개 키를 생성
- 공개 키를 원격 서버의 `~/.ssh/authorized_keys` 파일에 추가
- 클라이언트는 개인 키를 사용하여 서버에 로그인
- **방화벽 설정**: SSH 서버가 동작하는 포트(기본적으로 22)만 네트워크에서 허용하도록 방화벽을 설정
- **Fail2ban 설치**: 반복적인 로그인 시도를 감지하고 차단하는 Fail2ban과 같은 도구를 설치하여 보안을 강화할 수 있음
    

### 4. SSH 사용
- 원격 서버에 접속하려면 다음 명령어를 사용
    
```bash
ssh [사용자명]@[서버주소] -p [포트번호]
```    
예: `ssh user@example.com -p 22`
