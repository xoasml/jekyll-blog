---
title: Docker volume
layout: post
tags:
  - Docker
permalink: docker/volume
---

### 볼륨 생성 기본 명령어
```bash
docker volume create [OPTIONS] [VOLUME]
```

- **[OPTIONS]**: 볼륨 생성 시 설정할 수 있는 다양한 옵션입니다.
- **[VOLUME]**: 생성할 볼륨의 이름입니다. 이름을 지정하지 않으면 Docker가 자동으로 고유한 이름을 생성합니다.

### 자주 사용되는 옵션들

- `--driver`, `-d`: 볼륨을 생성할 때 사용할 드라이버를 지정합니다. 기본값은 `local` 입니다.
- `--label`: 볼륨에 메타데이터를 추가하기 위한 레이블을 설정합니다.
- `--opt`, `-o`: 드라이버에 특정한 옵션을 전달합니다. 이 옵션은 드라이버에 따라 다르며, 예를 들어 파일 시스템 유형이나 볼륨을 마운트할 경로 등을 지정할 수 있습니다.

### 볼륨 생성 예시

1. **기본 볼륨 생성**
```zsh
docker volume create my_volume
```
`my_volume` 라는 이름의 볼륨을 생성합니다.
    
2. **옵션을 사용하여 볼륨 생성**
```zsh
docker volume create --label project=my_project my_volume
```    
`project=my_project`  라는 레이블을 가진 `my_volume` 볼륨을 생성합니다.
    
3. **드라이버 옵션을 사용하여 볼륨 생성**
```zsh
docker volume create --driver local --opt type=tmpfs --opt device=tmpfs --opt o=size=100m,uid=1000 my_temp_volume
```
`local` 드라이버를 사용하여 `tmpfs` 타입의 `my_temp_volume` 볼륨을 생성하며, 크기는 100MB이고, UID는 1000으로 설정합니다.
    

볼륨을 생성한 후에는 `docker volume ls` 명령어를 사용하여 생성된 볼륨 목록을 확인할 수 있고, `docker volume inspect [VOLUME_NAME]`을 사용하여 특정 볼륨의 상세 정보를 조회할 수 있습니다.