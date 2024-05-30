---
title: Git 기타 설정
layout: post
tags:
  - Git
permalink: /git/setting
---

## pager 제거

종종 git branch 등의 명령어를 실행 했을때 아래와 같이 표시 될 때가 있다
(컨트롤  + z 를 해야 풀려 날수 있음)
```zsh
* main
~
~
~
(END)
```

그냥 cat 형태로 보려면 아래 명령어 입력
```zsh
git config --global core.pager cat
```

---

### 잔디 안심어 질때
아래 명령어로 내 아이디 세팅 되어있나 확인
``` zsh 
git config --list
```

없으면 아래 명령어 실행
```zsh
git config --global user.email {email}
```

```zsh
git config --global user.name {name}
```

####  명령어 화면 전환 설정 해제
```bash
git config --global pager.branch false
```


