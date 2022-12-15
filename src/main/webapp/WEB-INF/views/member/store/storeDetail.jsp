<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-15
  Time: 오후 4:35
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
        * {
            box-sizing: border-box;
        }

        div {
            border: 1px solid black;
        }

        .container {
            width: 375px;
            height: auto;
            margin: auto;
        }

        .storeIntro {
            width: 100%;
            height: 150px;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="storeIntro">
        <div class="store_name">상호명 : ${storeDTO.store_name}</div>
        <div class="store_deli_time">배달시간 : ${storeDTO.store_deli_time}분</div>
        <div class="store_deli_tip">배달팁 : ${storeDTO.store_deli_tip}원</div>
        <div class="store_deli_tip">식당소개 : ${storeDTO.store_intro}</div>
    </div>
    <div class="menuInfo">
        <div></div>

    </div>
</div>
</body>
</html>
