# 프로젝트 명: Deli
> 목표: 빅테크 기업들이 운영하는 소비자와 식당 운영자를 연결시켜주는 배달 앱을 WebApp으로 구현.
## 목차   
1. 소개
  - 프로젝트에 시도하고 싶었던 것
  - 개발환경
  - 디렉토리 패키지 구조
2. 기획, 관리
  - 일정표, 일지
  - ERD
  - 와이어 프레임
  - 플로우 차트


  ---

## 1. 소개
- 개발기간: 2022.11.29 ~ 2023.01.05
- 플랫폼: Web, WebApp
- 개발인원: 7명
### 프로젝트에 시도하고 싶었던 것
  - 프레임워크, 라이브러리 - **Java mail sender**, **Web-socket**, **Spring boot**, JPA(실패)
  - 그 외 - **도메인 형 패키지 구조**, **컨벤션 만들고 **, TDD(실패), proxy패턴(실패)
  - 실패원인 - 시간부족
### 개발환경
- **Back-End -** JDK11, Spring Boot 2.7.6, Spring Batch, MyBatis, OracleDB(ojdbc v8), Redis
- **Front-End -** HTML5, CSS, JavaScript, jQuery, Ajax, Jsp
- **Infra -** AWS EC2(Windows), tomcat 8.5, Route 53, Cafe24(DNS)
- **API, 라이브러리 -** Kakao API(login, pay, map), Naver API(sms), Java mail sender, WebSocket, Sweetalert2, Bootstrap, Web-socket

### 디렉토리 패키지 구조 - 도메인

domain   
&nbsp;&nbsp;ㄴ&nbsp;admin   
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;controller    
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;mapper     
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;service    
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;dto   
&nbsp;&nbsp;ㄴ&nbsp;main&nbsp;(비로그인)   
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;...   
&nbsp;&nbsp;ㄴ&nbsp;member   
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;header   
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;...   
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;myPage   
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;...   
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;order   
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;...   
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;store   
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;...   
&nbsp;&nbsp;ㄴ&nbsp;owner   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;...   
global   
&nbsp;&nbsp;ㄴ&nbsp;config   
&nbsp;&nbsp;ㄴ&nbsp;entity   
&nbsp;&nbsp;ㄴ&nbsp;exception   
&nbsp;&nbsp;ㄴ&nbsp;interceptor   
&nbsp;&nbsp;ㄴ&nbsp;type   
&nbsp;&nbsp;ㄴ&nbsp;util   
   
     
## 2. 기획, 관리

### 일정표, 일지
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FZ0RBB%2FbtrWD54VdVv%2Fb7SMIk3ygK2sBkjRtCb171%2Fimg.jpg">
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fceis9p%2FbtrWCh6K6Mf%2Fhlex0zFcSD7lUumg47HqHk%2Fimg.jpg">

### ERD
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcexp3o%2FbtrWEfGnU9g%2FPdfK24b8BCSPqhqNIQnCZ1%2Fimg.jpg">

### 와이어 프레임
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbOrHTx%2FbtrWEK7hya5%2Fz7PLY7Ps6EXMvi0fOeOVKk%2Fimg.jpg">

### 플로우 차트
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FboCWL6%2FbtrWEKlViRI%2F8czBxAOfbKLFQzDQAM5yo1%2Fimg.jpg"><br>
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbPndOO%2FbtrWDPA9rhO%2FaAkO081mKEeQA1dDY2gT1k%2Fimg.jpg">


