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

        .btn {

            width: 100%;
            height: 50px;
        }

        #complete {

            width: 100%;
            height: 100%;
            background-color: #e84c4f;
            color: white;
            border-radius: 5px;
            border-style: none;
        }
    </style>
</head>
<body>
<div class="container">
    <h3>상호명</h3>
    <hr>
    <h3>주문내역</h3>
    <hr>
    <h3>결제정보</h3>
    <hr>
    <h3>주문자정보</h3>

    <div class="btn">
        <%--메인으로--%>
        <a href="#">
            <button id="complete">완료</button>
        </a>
    </div>
</div>
</body>
</html>
