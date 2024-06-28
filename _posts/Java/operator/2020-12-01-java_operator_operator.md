---
title: 연산자 01.연산자
layout: post
tags:
  - Java
permalink: /java/operator
---

### 연산자란?

연산자는 연산을 수행하는 기호.. 쉽게 말하면 **\+ 더하기 - 빼기 \* 곱하기 / 나누기**등을 수행 해주는 기호를 말한다

자바에는 사칙연산 (+ - \* /) 외에도 다양한 연산기호들이 존재한다.

연산자가 연산을 수행하려면 당연히 연산의 대상이 있어야 하는데 연산 당하는 녀석들을 피연산자(operand) 라고 한다.

```
연산자(operator) 연산을 수행하는 기호 (+, -, *, / 등)
피연산자(operand) 연산자의 작업 대상(변수, 상수, 리터럴, 수식)

x + 5 // 변수 x, 리터럴 5는 피연산자 덧셈(+)기호는 연산자
```

### 연산자의 종류

| 종류 | 연산자 | 설명 |
| --- | --- | --- |
| 산술 연산자 | +   -   \*   /   %   <<   >> | 사칙 연산(+, -, \*, /)과 나머지연산 (%) |
| 비교 연산자 | \>   <   \>=   <=  ==  != | 크고 작음과 같고 다름을 비교 |
| 논리 연산자 | &&   \|\|   !   &   \|   ^   ~ | "그리고(AND)"와 "또는(OR)"으로 조건을 연결 |
| 대입 연산자 | \= | 우변의 값을 좌변에 저장 |
| 기 타 | (type)   ?:   instanceof | 형변환 연산자, 삼항 연산자, instanceof연산자 |

꽤 많은 연산자가 있지만 카테고리별로 나누면 생각보다 많지 않고 쓰다보면 외워진다.

### 연산자의 우선순위, 결합규칙

식에 사용된 연산자가 두개 이상이면 연산자의 우선순위로 연산순위가 결정되는데

수학에서 배운것과 같이 곱셈과 나눗셈(\*, /)이 덧셈과 뺄셈(+, -)보다 우선순위가 높다

| 식 | 설명 |
| --- | --- |
| \-x + 3 | x의 부호를 먼저 바꾸고 덧셈이 수행된다, x에 붙어있는 -는 뺄셈 연산자가 아닌 부호 연산자 |
| x + 3 \* y | 곱셈이 먼저 수행된 뒤 덧셈이 수행된다 (3 \* y 가 먼저 수행) |
| x + 3 > y - 2 | x + 3과 y - 2를 각각 수행한 뒤 비교 연산자가 수행된다 |
| x > 3 && x < 5 | 논리 연산자 && 보다 비교 연산자 > , < 가 먼저 수행된다.   (식의 의미 : x가 3보다 크고 x가 5보다 작은가?) |
| result = x + y \* 3; | 대입 연산자는 연산자 중 가장 우선순위가 낮다.   우측의 모든 연산이 끝난 뒤 그 값이 변수result에 저장된다. |

위의 표를 본다면 대부분의 연산순서는 어렵지 않게 알수 있는 수준이라고 생각한다.

하지만 상식만으로 판단하기 어려운 우선순위들도 많이 있다.

| 식 | 설명 |
| --- | --- |
| x << 2 + 1 | 쉬프트 연산자 << 는 덧셈 연산자보다 우선순위가 낮다. |
| data & 0xFF == 0 | 비트연산자 &는 비교연산자 == 보다 우선순위가 낮아 비교연산 후 비트연산이 이루어진다   왼쪽의 식은 data & (0xFF == 0) 과 같다. |
| x < -1 \|\| x > 3 && x < 5 | 논리 연산자는 AND(&, &&)가 OR(\|, \|\|)보다 우선순위가 높다   왼쪽의 식은 x < -1 \|\| (x > 3 && x < 5) 이다. |

하나의 식에 **같은 우선순위**의 연산자들이 여러 개 있는 경우는? **연산자의 결합규칙**으로 연산이 된다.

연산자의 결합규칙은 연산자마다 다르지만 **대부분 왼쪽에서 오른쪽**으로 연산되고

**단항 연산자와 대입 연산자만** 그 반대로 **오른쪽에서 왼쪽**으로 연산을 수행하게 된다.

```
1. 산술 > 비교 > 논리 > 대입. 대입은 가장 마지막에 수행된다.
2. 단항 연산자와 대입 연산자를 제외한 모든 연산의 진행방향은 왼쪽에서 오른쪽이다.
```

<table style="border-collapse: collapse; width: 100%; height: 280px;" border="1" data-ke-style="style12" data-ke-align="alignLeft">
<tbody>
<tr style="height: 20px;">
<td style="width: 14.7674%; height: 20px; text-align: center;"><span>종류</span></td>
<td style="width: 11.7442%; height: 20px; text-align: center;"><span>결합규칙</span></td>
<td style="width: 62.6744%; height: 20px; text-align: center;"><span>연산자</span></td>
<td style="width: 10.814%; height: 20px; text-align: center;"><span>우선순위</span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 14.7674%; height: 20px; text-align: center;"><span style="color: #333333;">단항 연산자</span></td>
<td style="width: 11.7442%; height: 20px; text-align: center;"><b>&larr;</b></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;++</span><span style="color: #333333;"><span>&nbsp;</span>&nbsp; --<span style="color: #333333;"><span>&nbsp;</span>&nbsp; +<span style="color: #333333;"><span>&nbsp;</span>&nbsp; -<span style="color: #333333;"><span>&nbsp;</span>&nbsp; ~<span style="color: #333333;"><span>&nbsp;</span>&nbsp; !<span style="color: #333333;"><span>&nbsp;</span>&nbsp; (type)</span></span></span></span></span></span></td>
<td style="width: 10.814%; height: 260px; text-align: center;" rowspan="13"><span style="color: #333333;">높음&uarr;</span><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><span style="color: #333333;">낮음&darr;</span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 14.7674%; height: 60px; text-align: center;" rowspan="3"><span style="color: #333333;">산술 연산자</span></td>
<td style="width: 11.7442%; height: 20px; text-align: center;"><span style="color: #333333;">&rarr;</span></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;*</span><span style="color: #333333;"><span>&nbsp;</span>&nbsp; /<span style="color: #333333;"><span>&nbsp;</span>&nbsp; %</span></span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 11.7442%; height: 20px; text-align: center;"><span style="color: #333333;">&rarr;</span></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;+</span><span style="color: #333333;"><span>&nbsp;</span>&nbsp; -</span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 11.7442%; height: 20px; text-align: center;"><span style="color: #333333;">&rarr;</span></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;&lt;&lt;</span><span style="color: #333333;"><span>&nbsp;</span>&nbsp; &gt;&gt;</span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 14.7674%; height: 40px; text-align: center;" rowspan="2"><span style="color: #333333;">비교 연산자</span></td>
<td style="width: 11.7442%; height: 20px; text-align: center;"><span style="color: #333333;">&rarr;</span></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;&lt;</span><span style="color: #333333;"><span>&nbsp;</span>&nbsp; &gt;<span style="color: #333333;"><span>&nbsp;</span>&nbsp; &lt;=<span style="color: #333333;"><span>&nbsp;</span>&nbsp; &gt;=<span style="color: #333333;"><span>&nbsp;</span>&nbsp; instanceof</span></span></span></span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 11.7442%; height: 20px; text-align: center;"><span style="color: #333333;">&rarr;</span></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;==</span><span style="color: #333333;"><span>&nbsp;</span>&nbsp; !=</span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 14.7674%; height: 100px; text-align: center;" rowspan="5"><span style="color: #333333;">논리 연산자</span></td>
<td style="width: 11.7442%; height: 20px; text-align: center;"><span style="color: #333333;">&rarr;</span></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;&amp;</span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 11.7442%; height: 20px; text-align: center;"><span style="color: #333333;">&rarr;</span></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;^</span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 11.7442%; height: 20px; text-align: center;"><span style="color: #333333;">&rarr;</span></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;|</span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 11.7442%; height: 20px; text-align: center;"><span style="color: #333333;">&rarr;</span></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;&amp;&amp;</span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 11.7442%; height: 20px; text-align: center;"><span style="color: #333333;">&rarr;</span></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;||</span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 14.7674%; height: 20px; text-align: center;"><span style="color: #333333;">삼항연산자</span></td>
<td style="width: 11.7442%; height: 20px; text-align: center;"><span style="color: #333333;">&rarr;</span></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;? :</span></td>
</tr>
<tr style="height: 20px;">
<td style="width: 14.7674%; height: 20px; text-align: center;"><span style="color: #333333;">대입 연산자</span></td>
<td style="width: 11.7442%; height: 20px; text-align: center;"><b><span style="color: #333333;">&larr;</span></b></td>
<td style="width: 62.6744%; height: 20px;"><span style="color: #333333;">&nbsp;=</span><span style="color: #333333;"><span>&nbsp;</span>&nbsp; +=<span style="color: #333333;"><span>&nbsp;</span>&nbsp; -=<span style="color: #333333;"><span>&nbsp;</span>&nbsp; *=<span style="color: #333333;"><span>&nbsp;</span>&nbsp; /=<span style="color: #333333;"><span>&nbsp;</span>&nbsp; %=<br />&nbsp;&lt;&lt;=<span style="color: #333333;"><span>&nbsp;</span>&nbsp; &gt;&gt;=<span style="color: #333333;"><span>&nbsp;</span>&nbsp; &amp;=<span style="color: #333333;"><span>&nbsp;</span>&nbsp; ^=<span style="color: #333333;"><span>&nbsp;</span>&nbsp; |=</span></span></span></span></span></span></span></span></span></td>
</tr>
</tbody>
</table>

!. 위 표의 단항연산자에 있는 +와 -는 부호연산자이고 (type)은 형변환(casting) 연산자
