---
title: K8s Helm
layout: post
tags:
  - Kubernetes
permalink: /kubernetes/helm
---
## 1. Helm 설치
- Helm은 Kubernetes용 패키지 매니저

```bash
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
```
```bash
sudo apt-get install apt-transport-https --yes
```
```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
```
```bash
sudo apt-get update
```
```bash
sudo apt-get install helm
```
### 2. 저장소 추가 및 업데이트
- 차트는 https://artifacthub.io/ 에서도 확인 가능
- Helm 차트를 사용하려면 저장소를 추가하고 업데이트 필요
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

- 차트 리포지토리 추가가 완료되면 설치할 수 있는 차트들의 목록을 볼 수 있다.
```
helm search repo bitnami
```

### 3. 예제 차트 관리
이제 Helm을 사용하여 애플리케이션을 설치할 수 있습니다. 예를 들어, nginx-ingress를 설치

#### 설치
```bash
helm install bitnami/mysql --generate-name
```

#### 제거
```bash
helm uninstall mysql-1612624192
```

### 4. Chart 로컬에서 관리하기
- repo를 이용하는 방법도 있지만 chart에 원하는 정보를 입력 해놓고
  동일한 환경으로 파드를 생성 하는게 관리적 측면에서 편함
1. 빈 차트 생성
```bash
helm create [차트이름]
```

2. 설치
```bash
helm install <release-name> <path-to-chart>
```