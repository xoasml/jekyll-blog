---
title: K8s kubectl
layout: post
tags:
  - Kubernetes
permalink: /kubernetes/kubectl
---
#### kubectl
- 발음은 "큐브컨트롤", "큐컨트롤"
- 쿠버네티스 클러스터와 상호작용 하지 위한 명령 도구
- 설치 방법과 명령어에 대한 정리
---

### 1. 명령어

1. 클러스터 정보 확인
- kubectl cluster-info : 클러스터의 기본 정보 조회
- kubectl get nodes : 클러스터의 모든 노드를 나열

2. 리소스 조회
- kubectl get pods : 모든 파드 목록을 나열
- kubectl get services : 모든 서비스 목록을 나열
- kubectl get deployments : 모든 디플로이먼트 목록을 나열
- kubectl get namespaces : 모든 네임스페이스 목록을 나열

3. 리소스 상세 정보
- kubectl describe pod <파드 이름> : 특정 파드의 상세 정보 조회
- kubectl describe service <서비스 이름> : 특정 서비스의 상세 정보 조회
- kubectl describe deployment <디플로이먼트 이름> : 특정 디플로이먼트의 상세 정보 조회

4. 리소스 생성 및 관리
- kubectl create -f <파일명> : 지정된 YAML 또는 JSON 파일을 사용하여 리소스를 생성
- kubectl apply -f <파일명> : YAML 또는 JSON 파일을 사용하여 리소스를 업데이트하거나 생성
- kubectl delete -f <파일명> : 지정된 파일을 사용하여 리소스를 삭제
- kubectl delete pod <파드 이름> : 특정 파드를 삭제
5. 로그 확인
- kubectl logs <파드 이름> : 특정 파드의 로그를 출력
- kubectl logs -f <파드 이름> : 특정 파드의 로그를 실시간으로 출력

6. 파드 접근 및 실행
- kubectl exec -it <파드 이름> -- /bin/bash : 특정 파드에 대한 셸 접근을 제공
- kubectl port-forward <파드 이름> <로컬 포트>:<파드 포트> : 로컬 시스템에서 파드로 포트 포워딩을 설정

7. 네임스페이스 변경
- kubectl config set-context --current --namespace=<네임스페이스 이름> : 현재 컨텍스트의 네임스페이스를 변경

---

### 2. 설치

- kubeadm kubelet kubectl의 버전이 서로 호환이 안되면 문제가 발생할 수 있음
- kubectl 설치는 kubeadm kubelet 과 함께 하는게 버전을 맞추기에 더편함
- 특별한 경우가 아니면 <a href="./kubeadm" target="_blank">kubeadm Page</a> 포스팅을 보고 함께 설치하길 권장 


1. kubectl 다운로드
```bash
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

- 진행 시 터미널에 아래와 같은 프로그래스가 표현
![](2.%20Areas/Blog/assets/images/Kubernetes/kubectl/1.png)


2. kubectl 설치
``` bash
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

- 명령어를 입력해도 아무런 반응이 없어서 실제 파일이 존재 하는지 확인
```bash
ll /usr/local/bin/kubectl
```
![](2.%20Areas/Blog/assets/images/Kubernetes/kubectl/2.png)

- 추가로 version 확인 으로 설치 확인 가능
```
kubectl version --client
```
