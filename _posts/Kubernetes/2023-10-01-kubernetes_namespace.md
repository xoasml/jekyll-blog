---
title: K8s Namespace
layout: post
tags:
  - Kubernetes
permalink: "/kubernetes/\bnamespace"
---

### 네임스페이스(Namespace)
- 클러스터 내에서 리소스를 분리하고 관리하는 단위
  - **리소스 분리**: 클러스터 내의 리소스를 논리적으로 분리하며 분리를 통해 여러 프로젝트 또는 팀이 서로 영향을 미치지 않고 독립적으로 작업할 수 있게 됨.
  - 리소스 제어: 네임스페이스 마다 리소스를 할당하고 제한을 설정하여 사용 리소스를 핸들링
  - **접근제어**: 역할기반 접근 제어(RBAC)를 사용해 특정 네임스페이스에 대한 접근 권한을 설정 가능, 이를통해 사용자 또는 팀단위로 접근 가능한 작업 공간을 설정 
  - **네임스페이스 스코프**: 특정 리소스 범위를 제한. 파드, 서비스, 컨피그맵(ConfigMap), 시크릿(Secret) 등 대부분의 k8s 리소스는 네임스페이스에 속함
#### 기본 네임스페이스
- Kubernetes에는 기본적으로 다음과 같은 네임스페이스가 존재
  - **default**: 사용자 리소스가 생성될 때 기본적으로 사용하는 네임스페이스
  - **kube-system**: Kubernetes 시스템 구성 요소가 배포되는 네임스페이스
  - **kube-public**: 클러스터 내에서 모든 사용자에게 읽기 전용으로 접근 가능한 리소스가 포함
  - **kube-node-lease**: 노드의 상태를 추적하는 임대 객체를 포함

---

### 네임스페이스 관리 명령어

- **네임스페이스 생성**:
   ```bash
   kubectl create namespace <namespace-name>
   ```

- **네임스페이스 목록 조회**:
   ```bash
   kubectl get namespaces
   ```

- **특정 네임스페이스의 리소스 조회**:
   ```bash
   kubectl get pods -n <namespace-name>
   ```

- **네임스페이스 삭제**:
   ```bash
   kubectl delete namespace <namespace-name>
   ```

### 예시

#### 네임스페이스 생성 예시
```bash
kubectl create namespace taehoon-dev
```

#### 특정 네임스페이스에서 파드 조회
```bash
kubectl get pods -n taehoon-dev
```

#### 네임스페이스에 리소스 할당량 설정
리소스 할당량은 네임스페이스 내에서 사용할 수 있는 리소스를 제한하는 데 사용

```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: dev-quota
  namespace: dev
spec:
  hard:
    pods: "10"
    requests.cpu: "4"
    requests.memory: 8Gi
    limits.cpu: "10"
    limits.memory: 16Gi
```

YAML 파일을 적용하면 `dev` 네임스페이스에 리소스 할당량이 설정

```bash
kubectl apply -f resource-quota.yaml
```

### 요약

네임스페이스는 Kubernetes 클러스터 내에서 리소스를 논리적으로 분리하고, 여러 팀이나 프로젝트가 독립적으로 작업할 수 있게 하며, 리소스 할당량과 접근 제어를 통해 효율적인 리소스 관리가 가능해짐

