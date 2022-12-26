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
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <title>회원 메인페이지</title>

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

    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico" />
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">

    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
</head>
<body>

<%@ include file="/WEB-INF/views/temporaryNavi.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_bell.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_cart.jsp" %>
<jsp:include page="/member/header/destination/click"/>
<%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_top.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<c:import url="/member/header/destination"/>

<main id="memberMain">
    <div class="container">
        <table border="1px">
            <tr>
                <td><a><img src="/resources/img/memberMain/korean.png" class="categoryIcon">
                    <div>한식</div>
                </a></td>
                <td><a><img src="/resources/img/memberMain/bunsik.png" class="categoryIcon">
                    <div>분식</div>
                </a></td>
                <td><a><img src="/resources/img/memberMain/jjim.png" class="categoryIcon">
                    <div>찜</div>
                </a></td>
                <td><a><img src="/resources/img/memberMain/chicken.png" class="categoryIcon">
                    <div>치킨</div>
                </a></td>
                <td><a><img src="/resources/img/memberMain/dosirak.png" class="categoryIcon">
                    <div>도시락</div>
                </a></td>
            </tr>
            <tr>
                <td><a><img src="/resources/img/memberMain/china.png" class="categoryIcon">
                    <div>중식</div>
                </a></td>
                <td><a><img src="/resources/img/memberMain/japan.png" class="categoryIcon">
                    <div>일식</div>
                </a></td>
                <td><a><img src="/resources/img/memberMain/western.png" class="categoryIcon">
                    <div>양식</div>
                </a></td>
                <td><a><img src="/resources/img/memberMain/pizza.png" class="categoryIcon">
                    <div>피자</div>
                </a></td>
                <td><a><img src="/resources/img/memberMain/burger.png" class="categoryIcon">
                    <div>버거</div>
                </a></td>
            </tr>
            <tr>
                <td><a><img src="/resources/img/memberMain/salad.png" class="categoryIcon">
                    <div>샐러드</div>
                </a></td>
                <td><a><img src="/resources/img/memberMain/cafe.png" class="categoryIcon">
                    <div>카페</div>
                </a></td>
                <td><a><img src="/resources/img/memberMain/dosirak.png" class="categoryIcon">
                    <div>도시락</div>
                </a></td>
                <td><a><img src="/resources/img/memberMain/franchise.png" class="categoryIcon">
                    <div>프랜차이즈</div>
                </a></td>
                <td><a><img src="/resources/img/memberMain/newstore.png" class="categoryIcon">
                    <div>신규맛집</div>
                </a></td>
            </tr>
        </table>
        <c:choose>
            <c:when test="${not empty store_list}">
                <c:forEach var="store_list" items="${store_list}" varStatus="status">
                    <hr>
                    <div class="store_list d-inline-flex m-2">
                        <div class="m-2 store_logo_box">
                            <c:choose>
                                <c:when test="${store_list.STORE_LOGO !=null}">
                                    <div>
                                        <img class="store_logo" src="/resources/img/store/${store_list.STORE_LOGO}">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div>이미지: 사진없음</div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="m-2 store_info_box">
                            <div>식당명: ${store_list.STORE_NAME}</div>
                            <div>★${store_list.AVERAGE_STARS} / 리뷰 ${store_list.COUNT_REVIEW}개
                                /
                                <fmt:formatNumber var="DISTANCE" value="${store_list.DISTANCE}" pattern="#.##"/>
                                <c:if test="${store_list.DISTANCE >= 1000}">
                                    <fmt:formatNumber value="${(DISTANCE) / (1000)}" pattern=".0"/>km</c:if>
                                <c:if test="${store_list.DISTANCE < 1000}">${store_list.DISTANCE}m</c:if>
                            </div>
                            <div>최소주문금액: ${store_list.STORE_MIN_PRICE}원</div>
                            <div>배달요금: ${store_list.STORE_DELI_TIP}원</div>
                            <div class="menu_name">
                                메뉴명:
                                <c:forEach var="menu_list" items="${menu_list[status.index].menu_name}"
                                           varStatus="status2">
                                    ${menu_list}<c:if test="${!status2.last}">, </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div>근처에 주문할 수 있는 가게가 없습니다.</div>
                <br>d<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br>d<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br>d<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br>d<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br>d<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br>d<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br>d<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br>d<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <br>d<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>