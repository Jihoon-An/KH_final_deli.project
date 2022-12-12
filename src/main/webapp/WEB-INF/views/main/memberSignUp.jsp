<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-11
  Time: 오후 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>일반 회원 가입</title>
</head>
<body>

<form method="post" action="/account/memberSignUp">
    <h1>회원가입</h1>
    <a href="https://kauth.kakao.com/oauth/authorize?client_id=2aad40910868e3c5fa9594f8de34a07b&redirect_uri=http://mydeli/main/kakao&response_type=code"><img src="/resources/img/kakao_login.png"></a><br>
    /oauth/authorize?client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&response_type=code HTTP/1.1
    <hr>
    <a href="https://kauth.kakao.com/oauth/logout?client_id=2aad40910868e3c5fa9594f8de34a07b&logout_redirect_uri=http://mydeli/main/kakao/do">로그아웃</a>
    <hr>
    <input type="text" placeholder="이메일 주소 입력해라" name="acc_email"><br>
    <input type="text" placeholder="비밀번호 입력해라" name="acc_pw"><br>
    <input type="password" placeholder="비밀번호 동일하게 입력해라" name="acc_pw_re"><br>
    <input type="hidden" name="acc_type" value="client">
    <input type="hidden" name="acc_sns" value="normal">
    <button type="submit">가입 완료</button>
    <hr>
    <input type="hidden" name="acc_sns" value="kakao"><br>
    acc_token<br>
</form>

</body>
</html>
