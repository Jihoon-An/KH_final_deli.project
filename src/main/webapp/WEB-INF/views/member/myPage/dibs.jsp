<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <title>찜</title>

    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" href="/resources/css/member/myPage/dibs.css" type="text/css">

    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
</head>
<body>
<main id="dibs">
    <div class="container">
        <div id="pageTitle">찜</div>
        <div id="dibCountSec">내가 찜한 맛집 1개</div>
        <div id="dibSec">
            <c:choose>
                <c:when test="${not empty list}">
                    <c:forEach var="i" items="${list}">
                        <div class="dibBox">
                            <c:choose>
                                <c:when test="${i.STORE_LOGO !=null}">
                                    <div class="imgBox">
                                        <img class="storeLogo" src="/resources/img/store/${i.STORE_LOGO}">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="imgBox">이미지: 사진없음</div>
                                </c:otherwise>
                            </c:choose>
                            <div class="info">
                                <div>식당명: ${i.STORE_NAME}</div>
                                <div>평점: ${i.avg_star}</div>
                                <div>최소주문금액: ${i.STORE_MIN_PRICE}</div>
                                <div>배달팁: ${i.STORE_DELI_TIP}</div>
                                <div>배달시간: ${i.STORE_DELI_TIME}</div>
                            </div>
                            <div id="btnSec">
                                <button class="heart">
                                    <input class="store_seq" type="hidden" value="${i.STORE_SEQ}">
                                    <label><i class="fa-solid fa-heart"></i> </label>
                                </button>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>
        </div>
    </div>
</main>
<script src="/resources/js/member/myPage/dibs.js"></script>
</body>
</html>