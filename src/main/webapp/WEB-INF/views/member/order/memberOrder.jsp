<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-14
  Time: 오전 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>memberOrder</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <style>
        .container {
            width: 375px;
            height: auto;
            border: 1px solid black;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="storeInfo">
        <div>상호명</div>
        <div>주문시간</div>
        <div>도착예정시간</div>
        <div>주문번호</div>
    </div>
    <div class="orderHistory">주문내역</div>
    <div class="paymentInfo">결제정보</div>
    <div class="ordererInfo">주문자정보</div>
    <div class="completeBtn">완료</div>
</div>
</body>
</html>
