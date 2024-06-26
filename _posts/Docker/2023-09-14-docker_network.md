---
title: Docker network
layout: post
tags:
  - Docker
permalink: docker/network
---
### 네트워크 생성 기본 명령어
```zsh
docker network create [OPTIONS] NETWORK
```

- **[OPTIONS]**: 네트워크 생성 시 설정할 수 있는 다양한 옵션들입니다.
- **NETWORK**: 생성할 네트워크의 이름입니다.

### 자주 사용되는 옵션들

- `--driver`, `-d`: 네트워크 드라이버를 지정합니다. Docker는 기본적으로 `bridge`, `overlay`, `host` 등 여러 네트워크 드라이버를 제공합니다. 기본값은 `bridge`입니다.
- `--subnet`: 네트워크에 사용할 서브넷을 지정합니다.
- `--ip-range`: 할당할 IP 주소 범위를 지정합니다.
- `--gateway`: 서브넷의 게이트웨이를 지정합니다.
- `--attachable`: `overlay` 네트워크에 대해 비 Swarm 서비스 컨테이너가 네트워크에 연결될 수 있도록 합니다.
- `--label`: 네트워크에 메타데이터를 추가하기 위한 레이블을 설정합니다.

### 네트워크 생성 예시

1. **기본 브릿지 네트워크 생성**
```zsh
docker network create --driver bridge my_bridge_network
```
`bridge` 드라이버를 사용하여 `my_bridge_network`라는 이름의 사용자 정의 네트워크를 생성합니다.


2. **서브넷과 게이트웨이를 지정하여 네트워크 생성**
```zsh
docker network create --driver bridge --subnet 192.168.1.0/24 --gateway 192.168.1.1 my_custom_network
```
지정된 서브넷과 게이트웨이를 가진 `my_custom_network`라는 네트워크를 생성합니다.

    
3. **레이블을 사용하여 네트워크 생성**
```zsh
docker network create --driver bridge --label project=my_project my_labeled_network
```
`project=my_project`라는 레이블을 가진 `my_labeled_network`라는 네트워크를 생성합니다.
    

네트워크를 생성한 후에는 `docker network ls` 명령어를 사용하여 생성된 네트워크 목록을 확인할 수 있고, `docker network inspect [NETWORK_NAME]`을 사용하여 특정 네트워크의 상세 정보를 조회할 수 있습니다.

---
### 1. Bridge 네트워크

- **속성**: Docker의 기본 네트워크 드라이버입니다. 각각의 컨테이너에 대해 가상의 네트워크 브릿지를 생성하여, 같은 브릿지 네트워크에 있는 컨테이너들이 서로 통신할 수 있게 해줍니다.
- **사용 사례**: 동일한 Docker 호스트에서 실행되는 컨테이너들 간의 통신이 필요할 때 주로 사용됩니다. 외부 네트워크와의 통신은 브릿지를 통해 이루어집니다.

### 2. Overlay 네트워크

- **속성**: 다중 Docker 호스트에서 실행되는 컨테이너들 사이에 안전한 네트워크를 구성할 수 있게 해주는 네트워크 드라이버입니다. 이는 Docker Swarm 모드에서 여러 노드에 걸쳐 분산된 서비스를 운영할 때 유용합니다.
- **사용 사례**: 클러스터 내의 여러 Docker 데몬들 사이, 또는 여러 데몬들에 걸쳐 실행되는 컨테이너들 간의 통신이 필요한 분산 애플리케이션에 사용됩니다.

### 3. Host 네트워크

- **속성**: 이 드라이버를 사용하면 컨테이너가 호스트의 네트워크 네임스페이스를 직접 사용할 수 있습니다. 즉, 컨테이너는 네트워크 격리 없이 호스트의 IP와 포트를 사용하여 통신할 수 있습니다.
- **사용 사례**: 컨테이너에 네트워크 격리가 필요 없거나, 가능한 가장 빠른 네트워크 성능이 요구되는 경우에 사용됩니다. 컨테이너가 호스트 네트워크를 공유하기 때문에, 포트 충돌에 주의해야 합니다.

### 기타 네트워크 드라이버

- **Macvlan**: Macvlan 네트워크 드라이버를 사용하면 컨테이너에 MAC 주소를 할당하여 물리 네트워크에 직접 연결하는 것처럼 만들 수 있습니다. 이는 특정 네트워킹 시나리오에서 유용할 수 있습니다.
- **None**: 이 드라이버를 사용하면 컨테이너가 어떠한 네트워크에도 연결되지 않습니다. 네트워크 격리가 필요한 경우에 사용됩니다.