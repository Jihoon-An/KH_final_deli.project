<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-20
  Time: 오후 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>운영자 메인페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="/resources/css/main/memberMain.css" type="text/css">
</head>
<body>
<main id="adminMain">
    <div class="container">
        <nav>
            <a href="/admin/coupon/add">[운영자]쿠폰 추가 페이지</a><br>
            <a href="/admin/coupon/list">[운영자]쿠폰 리스트 페이지</a><br>
            <a href="/admin/review/">[운영자]리뷰 관리 페이지</a><br>
            <a href="/admin/account/list/">[운영자]일반회원 관리 페이지</a><br>
        </nav>
        <hr>
    </div>
    <script src="/resources/js/main/home.js"></script>
</main>
</body>
</html>