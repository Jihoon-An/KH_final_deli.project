<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-17
  Time: 오전 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>식당상세리뷰</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <style>
        * {
            box-sizing: border-box
        }

        div {
            border: 1px solid black;
        }

        .container {
            width: 375px;
            height: auto;
            margin: auto;
            overflow: hidden;
        }

        .storeInfo {
            overflow: hidden
        }

        .store {
            float: left;
        }
    </style>
</head>
<body>
<%--영업정보--%>
<div class="container">
    <div class="storeIntro">
        <div class="store_name">상호명 : ${storeInfoDTO.store_name}</div>
        <div class="store_deli_time">배달시간 : ${storeInfoDTO.store_deli_time}분</div>
        <div class="store_deli_tip">배달팁 : ${storeInfoDTO.store_deli_tip}원</div>
        <div class="store_deli_tip">식당소개 : ${storeInfoDTO.store_intro}</div>
        <div class="store_deli_tip">리뷰개수 : ${storeReviewCount}</div>
        <div>리뷰 평균 : ${storeReviewAvg}</div
    </div>

    <div class="fieldBox">
        <div id="menu"><a href="/store/menu">메뉴</a></div>
        <div id="info"><a href="/store/info">정보</a></div>
        <div id="review"><a href="#"><h2>리뷰</h2></a></div>
    </div>

    <div class="reviews">
        <c:choose>
            <c:when test="${not empty storeReviewList}">
                <c:forEach var="i" items="${storeReviewList}">
                    <div id="nickname">${i.mem_nick}</div>
                    <div id="writeDate">${i.rev_writedate}</div>
                    <div id="reviewStar">${i.rev_star}</div>
                    <c:forEach var="k" items="${i.rev_sysname}"><%--사진 출력되게해야함--%>
                        <div id="reviewImgs">
                            <img src="/resources/img/review">
                        </div>
                    </c:forEach>
                    <div id="revieContent">${i.rev_content}</div>
                    <c:forEach var="l" items="${i.menu_list}">
                        <div id="reviewImgs">${l}</div>
                    </c:forEach>
                    <br>
                </c:forEach>
            </c:when>
        </c:choose>
    </div>
</div>
</body>
</html>
