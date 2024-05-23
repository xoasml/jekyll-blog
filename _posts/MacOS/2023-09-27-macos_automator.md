---
title: MacOS Automator
layout: post
tags:
  - MacOS
permalink: /macos/automator
---
- 반복작업의 자동화를 위한 애플리케이션
- 다양한 작업을 시퀀스로 묶어 워크플로우로 만들수 있음

#### 1. Spotlight에 Automator 검색해서 열기
#### 2. `빠른 동작` 선택 > `선택` 버튼 클릭
![](./../../../assets/images/MacOS/automator/2.png)


#### 3. `현재 수신하는 작업흐름` : `파일 또는 폴더` 선택 / `선택 항목 위치` : `Finder.app`  선택
![](./../../../assets/images/MacOS/automator/3.png)

#### 4. `applescript` 검색 결과로 나온 AppleScript 실행 드래그
![](../../../assets/images/MacOS/automator/4.png)
#### 5. Script 입력
![](../../../assets/images/MacOS/automator/5.png)
```AppleScript
on run {input, parameters}
	try
		set itemPaths to ""
		repeat with anItem in input
			set itemPath to POSIX path of anItem
			set itemPaths to itemPaths & " " & quoted form of itemPath
		end repeat
		
		do shell script "open -a \"Visual Studio Code\"" & itemPaths
	on error errMsg
		display dialog "Error: " & errMsg
	end try
end run
```


#### 6. 이후 시스템 설정 / 키보드 / 서비스 / 일반으로 들어가면 생성한 script에 대해 단축키 추가가 가능해진다.
![](../../../assets/images/MacOS/automator/6.png)
