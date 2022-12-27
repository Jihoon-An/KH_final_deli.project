<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-17
  Time: 오전 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>식당상세메뉴</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="/resources/css/member/store/storeDetail.css">
    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico" />
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
</head>
<body>

<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>

<main id="storeDetail">
    <%--    <div class="container">--%>
    <%--        <div class="storeIntro">--%>
    <%--            <div class="store_name">상호명 : ${storeDTO.store_name}</div>--%>
    <%--            <div><button class="heart">찜<input type="hidden" value="${storeDTO.store_seq}"></button></div>--%>
    <%--            <div class="store_deli_time">배달시간 : ${storeDTO.store_deli_time}분</div>--%>
    <%--            <div class="store_deli_tip">배달팁 : ${storeDTO.store_deli_tip}원</div>--%>
    <%--            <div class="store_deli_tip">식당소개 : ${storeDTO.store_intro}</div>--%>
    <%--            <c:choose>--%>
    <%--                <c:when test="${not empty storeReviewCount}">--%>
    <%--                    <div class="store_deli_tip">리뷰개수 : ${storeReviewCount}</div>--%>
    <%--                </c:when>--%>
    <%--                <c:otherwise>--%>
    <%--                    <div>리뷰개수 : 0개</div>--%>
    <%--                </c:otherwise>--%>
    <%--            </c:choose>--%>

    <%--            <c:choose>--%>
    <%--                <c:when test="${not empty storeReviewAvg}">--%>
    <%--                    <div>리뷰 평균 : ${storeReviewAvg}</div>--%>
    <%--                </c:when>--%>
    <%--                <c:otherwise>--%>
    <%--                    <div>리뷰 평균 : 0</div>--%>
    <%--                </c:otherwise>--%>
    <%--            </c:choose>--%>
    <%--        </div>--%>

    <%--        <div class="fieldBox">--%>
    <%--            <div id="menu"><h2><a href="#">메뉴</a></h2></div>--%>
    <%--            <div id="info"><a href="/store/info">정보</a></div>--%>
    <%--            <div id="review"><a href="/store/review">리뷰</a></div>--%>
    <%--        </div>--%>

    <%--        &lt;%&ndash;메뉴 카테고리&ndash;%&gt;--%>
    <%--        <div class="menuInfo">--%>
    <%--            <c:choose>--%>
    <%--                <c:when test="${not empty menuGroup}">--%>
    <%--                    <c:forEach var="mGroup" items="${menuGroup}">--%>
    <%--                        <div class="menu_group">${mGroup}</div>--%>
    <%--                    </c:forEach>--%>
    <%--                </c:when>--%>
    <%--            </c:choose>--%>
    <%--        </div>--%>

    <%--        &lt;%&ndash;메뉴 카테고리 -메뉴들&ndash;%&gt;--%>
    <%--        <div class="menuDetailInfo">--%>
    <%--            <c:choose>--%>
    <%--                <c:when test="${not empty categoryList}">--%>
    <%--                    <c:forEach var="categories" items="${categoryList}">--%>
    <%--                        <div class="bottom_menu_group">${categories.menu_group}--%>
    <%--                            <c:forEach var="menuList" items="${categories.menuList}">--%>
    <%--                                <div class="menu">--%>
    <%--                                    <div class="yyyy">--%>
    <%--                                        <div>메뉴 이름 : ${menuList.menu_name}</div>--%>
    <%--                                        <div>메뉴 가격 : ${menuList.menu_price}원</div>--%>
    <%--                                        <div>메뉴 소개 : ${menuList.menu_intro}</div>--%>
    <%--                                    </div>--%>
    <%--                                    <c:choose>--%>
    <%--                                        <c:when test="${not empty menuList.menu_img}">--%>
    <%--                                            <div class="menu_img">--%>
    <%--                                                <img src="/resources/img/menu-img/${menuList.menu_img}">--%>
    <%--                                            </div>--%>
    <%--                                        </c:when>--%>
    <%--                                        <c:otherwise></c:otherwise>--%>
    <%--                                    </c:choose>--%>
    <%--                                </div>--%>
    <%--                            </c:forEach>--%>
    <%--                        </div>--%>
    <%--                    </c:forEach>--%>
    <%--                </c:when>--%>
    <%--            </c:choose>--%>
    <%--        </div>--%>

    <%--        &lt;%&ndash;원산지&ndash;%&gt;--%>
    <%--        <div class="origin">--%>
    <%--            ${storeDTO.store_origin}--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <div class="container">
        <%@ include file="/WEB-INF/views/member/store/storeHeader.jsp" %>
        <div class="contents">
            <div class="category">
                <c:choose>
                    <c:when test="${not empty menuGroup}">
                        <c:forEach var="mGroup" items="${menuGroup}">
                            <div class="menuCategory">${mGroup}</div>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
            <hr>
            <div class="menu_list">
                <c:choose>
                    <c:when test="${not empty categoryList}">
                        <c:forEach var="categories" items="${categoryList}">
                            <div class="bottom_menu_group">${categories.menu_group}
                                <hr>
                                <c:forEach var="menuList" items="${categories.menuList}">
                                <a href="/menu/detail/${menuList.menu_seq}">
                                    <div>
                                    <div class="menu">
                                        <div class="yyyy">
                                            <div>${menuList.menu_name}</div>
                                            <div id="menu_intro">${menuList.menu_intro}</div>
                                            <div>${menuList.menu_price}원</div>
                                        </div>
                                    </div>
                                    <div class="menu_img"></div>
                                    </div>
                                </a>
                                            <%--                                <img src="/resources/img/menu-img/ramyun.png">--%>
                                        <c:choose>
                                            <c:when test="${not empty menuList.menu_img}">
                                                <img src="/resources/img/menu-img/${menuList.menu_img}">
                                            </c:when>
                                            <c:otherwise></c:otherwise>
                                        </c:choose>
                                    </div>
                                </c:forEach>
                            </div>
                            <hr>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
        </div>
        <div class="origin">
            ${storeDTO.store_origin}
        </div>

    </div>
    <script src="/resources/js/member/store/storeDetail.js"></script>
</main>
</body>
</html>