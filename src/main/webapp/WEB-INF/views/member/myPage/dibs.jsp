<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <title>딜리 - 찜 목록</title>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" href="/resources/css/member/myPage/dibs.css" type="text/css">

    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico" />
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">

    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
</head>
<body>

<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_cart.jsp" %>

<main id="dibs">
    <hr class="mt55">
    <div class="container">
        <div id="pageTitle">찜</div>
        <div id="dibCountSec">내가 찜한 맛집 ${dibCount}개</div>
            <c:choose>
                <c:when test="${not empty list}">
                    <c:forEach var="i" items="${list}">

                        <div class="dibBox m-3">
                            <c:choose>
                                <c:when test="${i.STORE_LOGO !=null}">
                                    <div class="imgBox">
                                        <img class="storeLogo" src="/resources/img/store/${i.STORE_LOGO}">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="imgBox"><img class="storeLogo" src="/resources/img/store/no_storelogo.png"></div>
                                </c:otherwise>
                            </c:choose>
                            <div class="info">
                                <div class="store_name"><a href="/store/menu/${i.STORE_SEQ}">${i.STORE_NAME}</a></div>
                                <div class="avg_star"><i class="fa-solid fa-star"></i> <span class="fontColor">${i.avg_star}</span></div>
                                <div class="store_min">최소주문금액 <span class="fontColor"><fmt:formatNumber value="${i.STORE_MIN_PRICE}" pattern="#,###"/>원</span></div>
                                <div class="store_min">배달요금 <span class="fontColor"><fmt:formatNumber value="${i.STORE_DELI_TIP}" pattern="#,###"/>원</span></div>
                                <div class="store_deli_time">배달시간 <span class="fontColor">${i.STORE_DELI_TIME}분</span></div>
                            </div>
                            <div id="btnBox">
                                <button class="heart">
                                    <input class="store_seq" type="hidden" value="${i.STORE_SEQ}">
                                    <label class="heartIcon"><i class="fa-solid fa-heart  fa-lg"></i></label>
                                </button>
                            </div>
                        </div>

                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="dibBox">찜한 가게가 없습니다.</div>
                </c:otherwise>
            </c:choose>
    </div>
    <hr class="mt90">
</main>
<script src="/resources/js/member/myPage/dibs.js"></script>
</body>
</html>