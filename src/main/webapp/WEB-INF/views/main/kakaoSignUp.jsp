<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-11
  Time: 오후 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>카카오 회원가입</title>
</head>
<body>

<form method="post" action="/account/kakaoSignUp">
    <h1>회원가입 추가 정보 입력</h1>
    <hr>
    <input type="text" placeholder="이메일 주소 입력해라" name="acc_email"><br>
    <input type="text" placeholder="비밀번호 입력해라" name="acc_pw"><br>
    <input type="password" placeholder="비밀번호 동일하게 입력해라" name="acc_pw_re"><br>
    <input type="hidden" name="acc_type" value="client">
    <input type="hidden" name="acc_sns" value="kakao">
    <input type="hidden" name="acc_token" value="${acc_token}">
    <button type="submit">가입 완료</button>
</form>

</body>
</html>
