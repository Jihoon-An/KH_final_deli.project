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

<%--<%@ include file="/WEB-INF/views/customHeader/m_bell.jsp" %>--%>
<%--<%@ include file="/WEB-INF/views/customHeader/m_cart.jsp" %>--%>
<%--<jsp:include page="/member/header/destination/click" />--%>
<%--<%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>--%>
<%--<%@ include file="/WEB-INF/views/customHeader/m_top.jsp" %>--%>
<%--<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>--%>
<%--<c:import url="/member/header/destination" />--%>

<main id="dibs">
    <div class="container">
        <div id="pageTitle">찜</div>
        <div id="dibCountSec">내가 찜한 맛집 ${dibCount}개</div>
            <c:choose>
                <c:when test="${not empty list}">
                    <c:forEach var="i" items="${list}">
                        <hr>
                        <div class="dibBox">
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
                                <div class="store_name"><a href="/store/menu?store_seq=${i.STORE_SEQ}">${i.STORE_NAME}</a></div>
                                <div class="avg_star"><i class="fa-solid fa-star"></i> ${i.avg_star}</div>
                                <div class="store_min">최소주문금액: ${i.STORE_MIN_PRICE}, 배달팁: ${i.STORE_DELI_TIP}</div>
                                <div class="store_deli_time">배달시간: ${i.STORE_DELI_TIME}분</div>
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
            </c:choose>
    </div>
</main>
<script src="/resources/js/member/myPage/dibs.js"></script>
</body>
</html>