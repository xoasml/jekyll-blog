---
title: Git 명령어
layout: post
tags:
  - Git
permalink: /git/command
---


#### 현재 path git으로 지정
``` bash
git init
```

#### 상태 확인
``` bash
git status
```

#### stage 영역에 추가 : 추가 해야 commit이 됨
``` bash
git add 파일이름 # 특정 파일
git add . # 모든 파일 
git add 파일1 파일2 파일3 # 여러 특정 파일
git add *.java # 특정 패턴의 파일
```

#### 커밋
```bash
git commit -m "커밋 메시지"
```

#### 원격 저장소에 업로드
```bash
git push
```
--- 
## reset
#### 로그 확인
```bash
git log
```
```bash
commit 7d312b1b6823097c3beaf17b1b246aaed46a876b (HEAD -> main, origin/main)
Author: TaeHoon <31303655+xoasml@users.noreply.github.com>
Date:   Thu May 30 12:42:30 2024 +0900

    fix: 3

commit 0f306f1a1f68859b1f79eaf59aa2fc05e652024e
Author: TaeHoon <31303655+xoasml@users.noreply.github.com>
Date:   Thu May 30 12:32:30 2024 +0900

    fix: 2

commit 78b694819d865c6c1b3b90f7514af29876c97a0f
Author: TaeHoon <31303655+xoasml@users.noreply.github.com>
Date:   Thu May 30 11:16:58 2024 +0900

    fix: 1
```
#### 특정 커밋에서 부터 되돌리기
```bash
git reset --hard 78b694819d865c6c1b3b90f7514af29876c97a0f
git reset --soft 78b694819d865c6c1b3b90f7514af29876c97a0f
git reset --mixed 78b694819d865c6c1b3b90f7514af29876c97a0f
```
#### 최근 n개 되돌리기
```bash
git reset --hard HEAD~3 #3개 전까지 되돌림
git reset --soft HEAD~3 #3개 전까지 되돌림
git reset --mixed HEAD~3 #3개 전까지 되돌림
```
- `--hard`: 커밋을 되돌리고 작업 디렉토리와 스테이징 영역도 커밋 전 상태로 되돌림
- `--soft`: 커밋을 되돌리지만 작업 디렉토리와 스테이징 영역의 변경 사항은 유지
- `--mixed` : 커밋과 스테이징 영역을 되돌리고 작업 디렉토리 변경 사항은 유지



---

## branch
#### 로컬 브랜치 확인
```Bash
git branch
```
#### 로컬 브랜치 생성
```Bash
# 생성
git branch <브랜치 이름>

# 생성 + 이동
git branch -b <브랜치 이름>
```

#### 로컬 브랜치 삭제 
``` sh
git branch -d <로컬 브랜치 이름> 
```

#### 브랜치 이동
```Bash
git checkout <브랜치 이름>
```

#### 저장소의 타 브랜치에서 pull
```Bash
git pull origin <브랜치 이름>
```
--- 

## merge 
#### 원하는 코드를 가진 브랜치를 입력
```bash
git merge <브랜치 이름>
```

#### Conflict(충돌) 시 되돌리기
```bash
git merge --abort
```

---

## remote
#### 원격 저장소 연결
```Bash
git remote add origin <URL>
```

#### 연결중인 저장소 확인
```Bash
git remote -v
```

#### 원격 저장소 끊기
```Bash
git remote remove origin
```

#### 원격 저장소 브랜치 생성 & 연결
```Bash
git push origin -u <branchName>
```

#### 원격 저장소 브랜치 삭제
```Bash
git push origin --delete <branchName>
```

#### 원격 저장소 브랜치 목록 보기

``` Bash
git branch -r
```