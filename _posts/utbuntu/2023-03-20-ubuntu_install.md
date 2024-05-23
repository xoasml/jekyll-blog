---
title: "\bUbuntu OS설치"
layout: post
tags:
  - Ubuntu
permalink: /ubuntu/install
---
### 1. Ubuntu 공홈에서 LTS .iso 다운로드
### 2. USB부팅 디스크로 만들기
1. [Rufus 다운로드](https://rufus.ie/ko/)
   - rufus-4.4.exe / 표준 / Window x64 / 1.4 MB / 2024.01.17 버전 받았었음
2. rufus 실행
3. 장치 : 원하는 USB
   부트유형 : "선택" 버튼 클릭 해서 다운 받아둔 ubuntu iso 선택
   파티션 구성 : MBR
   대상시스템 : BIOS 또는 UEFI
   파일시스템 : FAT32(기본)
4. 나머지는 건들 필요 없이 "시작" 버튼 클릭으로 진행
5. ISO, DD 선택 분기에서 ISO 선택
6. 그 뒤로 다 예 또는 확인
7. 기다리면 디스크 완성

### 3. 설치하려는 PC에 부팅디스크 꽂고 부팅
### 4. 바이오스에서 부팅디스크로 부팅되게 변경
### 5. 우분투로 부팅되면 검은 화면에 하얀 글씨 출력 되는데 가장 위 선택
### 6. 언어 English 선택, Install Ubuntu 선택
### 7. 키보드 레이아웃 English(US) - English(US) 선택
### 8. Normal installation 선택
### 9. Erase disk and install Ubuntu 선택
- 기존 하드의 내용이 지워진다는 경고 문구 확인

### 10. 위치는 Seoul을 지도에서 클릭하거나 텍스트 입력
### 11. 이름 작성은 영어로
