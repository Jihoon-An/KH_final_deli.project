# 프로젝트 명: Deli
> 목표: 빅테크 기업들이 운영하는 소비자와 식당 운영자를 연결시켜주는 배달 앱을 WebApp으로 구현.
## 목차
1. [소개](https://github.com/Jihoon-An/KH_final_deli.project/blob/main/README.md#1-%EC%86%8C%EA%B0%9C)
- 프로젝트에 시도하고 싶었던 것
- 개발환경
- 디렉토리 패키지 구조
2. [기획, 관리](https://github.com/Jihoon-An/KH_final_deli.project/blob/main/README.md#2-%EA%B8%B0%ED%9A%8D-%EA%B4%80%EB%A6%AC)
- 일정표, 일지
- ERD
- 와이어 프레임
- 플로우 차트
3. [담당 기능](https://github.com/Jihoon-An/KH_final_deli.project/blob/main/README.md#3-%EB%8B%B4%EB%8B%B9-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C)
- (비회원) 사업자 회원가입
- (일반 유저) 메뉴 상세 - 옵션 선택, 장바구니 담기
- (일반 유저) 알림
- (사업자 유저) 주문관리
- (Admin) 쿠폰관리
4. [기능 구현 지원](https://github.com/Jihoon-An/KH_final_deli.project/blob/main/README.md#4-%EA%B8%B0%EB%8A%A5-%EA%B5%AC%ED%98%84-%EC%A7%80%EC%9B%90-%ED%95%B5%EC%8B%AC)
- (일반 유저) 식당 리스트 - 경도 위도를 기반으로 일정 거리 내의 식당 출력
- (일반 유저) 리뷰 수정 - 최대 개수가 정해진 다수의 이미지 수정

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

ㄴdomain   
|&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;admin   
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;controller    
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;mapper     
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;service    
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;dto   
|&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;main&nbsp;(비로그인)   
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;...   
|&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;member   
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;header   
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;...   
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;myPage   
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;...   
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;order   
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;...   
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;store   
|&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;...   
|&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;owner   
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;...   
ㄴglobal   
&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;config   
&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;entity   
&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;exception   
&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;interceptor   
&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;type   
&nbsp;&nbsp;&nbsp;&nbsp;ㄴ&nbsp;util


## 2. 기획, 관리

### 일정표, 일지
<img width="70%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FZ0RBB%2FbtrWD54VdVv%2Fb7SMIk3ygK2sBkjRtCb171%2Fimg.jpg"><br>
<img width="70%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fceis9p%2FbtrWCh6K6Mf%2Fhlex0zFcSD7lUumg47HqHk%2Fimg.jpg">
- 엑셀표로 일정을 계획하고, 프로젝트 안에 당일 작업한 일지를 간단히 작성합니다.

### ERD
<img width="70%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcexp3o%2FbtrWEfGnU9g%2FPdfK24b8BCSPqhqNIQnCZ1%2Fimg.jpg"><br>

### 와이어 프레임
<img width="70%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbOrHTx%2FbtrWEK7hya5%2Fz7PLY7Ps6EXMvi0fOeOVKk%2Fimg.jpg">

### 플로우 차트
<img width="70%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FboCWL6%2FbtrWEKlViRI%2F8czBxAOfbKLFQzDQAM5yo1%2Fimg.jpg"><br>
<img width="70%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbPndOO%2FbtrWDPA9rhO%2FaAkO081mKEeQA1dDY2gT1k%2Fimg.jpg">

## 3. 담당 기능 소개
### (비회원) 사업자 회원가입
<img width="70%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fk1dFv%2FbtrWQ5kj3Id%2FtfWEKTUnkJghF8b9c8BaP1%2Fimg.jpg"><br>
이메일 중복방지, 이메일 인증, 전화번호 인증

### (일반 유저) 메뉴 상세 - 옵션 선택, 장바구니 담기
<img width="30%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb9qtrd%2FbtrWQ4yUfcn%2F29F978UtYwrqdtAqQEmFnK%2Fimg.jpg"><br>
[장바구니 담는 Method](https://github.com/Jihoon-An/KH_final_deli.project/blob/c1536e3f52e100cf3924c2d5efc31ec215106bcd/src/main/java/kh/deli/domain/member/store/service/StoreBasketService.java#L31)

### (사업자 유저) 주문관리, 알림
<img width="70%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FlF1gv%2FbtrWQt62l2R%2Fn99IMkRZkftjuXna3YVolk%2Fimg.jpg"><br>
1. 매장이 여러개 있을 경우 맨 위의 Select에서 매장을 선택할 수 있습니다. 
2. 해당 주문에 체크를 하고 위에서 상태를 선택한 후 '선택항목 상태 바꾸기' 버튼을 클릭하면 상태가 변경되고 사용자가 접속해 있는 경우 알림이 발생합니다.
3. '링크 보내기' 버튼을 클릭하고 전화번호를 입력하면, 해당 주문의 정보를 담은 페이지의 링크를 **Redis**를 거쳐 랜덤한 링크로 바꾸고, 입력한 전화번호에 메세지로 링크를 전송합니다. 

### (Admin) 쿠폰관리
<img width="70%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fs8e8i%2FbtrWQL0FIAr%2F6DwrMlhbI802KBR5ei9rT0%2Fimg.jpg"><br>
<img width="70%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbedQHf%2FbtrWTKMIDaV%2FBDVVgi5lBidUqUpvkBZcEK%2Fimg.jpg"><br>


## 4. 기능 구현 지원
### (일반 유저) 식당 리스트 - 경도 위도를 기반으로 일정 거리 내의 식당 출력
<img width="50%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FeDz99y%2FbtrWQrhfyyg%2Fim2CYsZzwbwPkWrKJ4eXw0%2Fimg.jpg"><br>
<img width="50%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fb8RqYI%2FbtrWRWtlSw8%2FB2cJazqWVZLk68ze40Iji0%2Fimg.jpg">

### (일반 유저) 리뷰 수정 - 최대 개수가 정해진 다수의 이미지 수정
<img width="30%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fnav4K%2FbtrWQ304Mps%2FaeAOYETFujYVpD8KNW0zx0%2Fimg.jpg"><br>
[아래 소스 링크](https://github.com/Jihoon-An/KH_final_deli.project/blob/c1536e3f52e100cf3924c2d5efc31ec215106bcd/src/main/webapp/resources/js/member/myPage/modifyReview.js#L124)<br>
<img width="60%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbZV0RR%2FbtrWQqvQ4KT%2FDKeorZDLtj7xiL7HXbAkCk%2Fimg.jpg"><br>
[아래 소스 링크](https://github.com/Jihoon-An/KH_final_deli.project/blob/c1536e3f52e100cf3924c2d5efc31ec215106bcd/src/main/webapp/resources/js/member/myPage/modifyReview.js#L124)<br>
<img width="60%" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FpILFx%2FbtrWQ4Z0eXL%2FY5f0Hmw6MmPHaT9ccMHqh0%2Fimg.jpg"><br>


