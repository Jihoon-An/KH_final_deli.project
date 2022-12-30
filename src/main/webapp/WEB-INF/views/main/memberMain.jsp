<%--
  Created by IntelliJ IDEA.
  User: xiati
  Date: 2022-12-12
  Time: 오후 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>딜리 - 메인</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">

    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico"/>
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/css/main/memberMain.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
</head>
<body>

<%@ include file="/WEB-INF/views/customHeader/m_bell.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_cart.jsp" %>
<jsp:include page="/member/header/destination/click"/>
<%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_top.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<c:import url="/member/header/destination"/>

<main id="memberMain">
    <div class="container">
        <div id="categorySec">
            <div class="categoryBox"><a href="/store/search?filter=한식"> <img src="/resources/img/memberMain/korean.png"
                                                                             class="categoryIcon">
                <div class="categoryName">한식</div>
            </a></div>
            <div class="categoryBox"><a href="/store/search?filter=분식"><img src="/resources/img/memberMain/bunsik.png"
                                                                            class="categoryIcon">
                <div class="categoryName">분식</div>
            </a></div>
            <div class="categoryBox"><a href="/store/search?filter=찜·탕·찌개"><img src="/resources/img/memberMain/jjim.png"
                                                                                class="categoryIcon">
                <div class="categoryName">찜·탕·찌개</div>
            </a></div>
            <div class="categoryBox"><a href="/store/search?filter=치킨"><img src="/resources/img/memberMain/chicken.png"
                                                                            class="categoryIcon">
                <div class="categoryName">치킨</div>
            </a></div>
            <div class="categoryBox"><a href="/store/search?filter=버거"><img src="/resources/img/memberMain/burger.png"
                                                                            class="categoryIcon">
                <div class="categoryName">버거</div>
            </a></div>
            <div class="categoryBox"><a href="/store/search?filter=중식"><img src="/resources/img/memberMain/china.png"
                                                                            class="categoryIcon">
                <div class="categoryName">중식</div>
            </a></div>
            <div class="categoryBox"><a href="/store/search?filter=일식"><img src="/resources/img/memberMain/japan.png"
                                                                            class="categoryIcon">
                <div class="categoryName">일식</div>
            </a></div>
            <div class="categoryBox"><a href="/store/search?filter=양식"><img src="/resources/img/memberMain/western.png"
                                                                            class="categoryIcon">
                <div class="categoryName">양식</div>
            </a></div>
            <div class="categoryBox"><a href="/store/search?filter=피자"><img src="/resources/img/memberMain/pizza.png"
                                                                            class="categoryIcon">
                <div class="categoryName">피자</div>
            </a></div>
            <div class="categoryBox"><a href="/store/search?filter=샐러드"><img src="/resources/img/memberMain/salad.png"
                                                                             class="categoryIcon">
                <div class="categoryName">샐러드</div>
            </a></div>
            <div class="categoryBox"><a href="/store/search?filter=카페·디저트"><img src="/resources/img/memberMain/cafe.png"
                                                                                class="categoryIcon">
                <div class="categoryName">카페·디저트</div>
            </a></div>
            <div class="categoryBox"><a href="/store/search?filter=도시락"><img src="/resources/img/memberMain/dosirak.png"
                                                                             class="categoryIcon">
                <div class="categoryName">도시락</div>
            </a></div>
        </div>
        <hr>
        <c:choose>
            <c:when test="${not empty store_list}">
                <c:forEach var="store_list" items="${store_list}" varStatus="status">
                    <div class="storeList d-inline-flex m-2">
                        <a href="/store/menu/${store_list.STORE_SEQ}" class="storeLink">
                            <div class="logoBox">
                                <c:choose>
                                    <c:when test="${store_list.STORE_LOGO !=null}">
                                        <img class="store_logo" src="/resources/img/store/${store_list.STORE_LOGO}">
                                    </c:when>
                                    <c:otherwise>
                                        사진없음
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="infoBox">
                                <div class="storeName">${store_list.STORE_NAME}
                                    <span class="storeEtc">    <i class="fa-solid fa-star"></i>  ${store_list.AVERAGE_STARS}
                                </span>
                                </div>
                                <div class="storePrice">최소주문금액 <span class="priceFont">${store_list.STORE_MIN_PRICE}원</span> ·
                                    배달요금 <span class="priceFont">${store_list.STORE_DELI_TIP}원</span> · <span class="distance priceFont"><fmt:formatNumber var="DISTANCE" value="${store_list.DISTANCE}" pattern="#.##"/>
                                    <c:if test="${store_list.DISTANCE >= 1000}">
                                        <fmt:formatNumber value="${(DISTANCE) / (1000)}" pattern=".0"/>km</c:if>
                                    <c:if test="${store_list.DISTANCE < 1000}">${store_list.DISTANCE}m</c:if></span>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div>근처에 주문할 수 있는 가게가 없습니다.</div>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>