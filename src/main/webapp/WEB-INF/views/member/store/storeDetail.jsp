<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>딜리 - 식당메뉴</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>
    <link rel="stylesheet" href="/resources/css/member/store/storeDetail.css">
</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
<main id="store_detail">
    <div class="container">
        <%@ include file="/WEB-INF/views/member/store/storeHeader.jsp" %>
        <hr style="margin-top: 10px; margin-bottom: 5px;">
        <div class="contents">
            <c:choose>
                <c:when test="${not empty menuGroup}">
                    <%--                                <c:forEach var="i" items="${reviews.menu_list}">--%>
                    <%--                                    <div>메뉴명 : ${i}</div>--%>
                    <div class="filter_box">
                        <div style="margin: 0 auto;" class="d-inline-flex">
                            <c:forEach var="mGroup" items="${menuGroup}" varStatus="num">
                                <a href="#bottom_menu_group${num.count}" style="text-decoration: none; color: black;"><div class="filter menuCategory" style="margin-right: 7px">${mGroup}</div></a>
                            </c:forEach>
                            <%--임시--%>
                            <div class="filter menuCategory" style="margin-right: 7px">aaaaaaaaaa</div>
                            <div class="filter menuCategory" style="margin-right: 7px">ssssssssssss</div>
                        </div>
                    </div>
                </c:when>
            </c:choose>
            <div style="height: 10px;"></div>
            <div class="menu_list">
<%--                                <div class="bottom_menu_group" style="font-weight: bold; font-size: 17px;">십새끼--%>
<%--                                    <hr>--%>

<%--                                    <div class="menu_box">--%>
<%--                                        <div class="box">--%>
<%--                                            <a href="/menu/detail/32">--%>
<%--                                                <div class="menu_info">--%>
<%--                                                    <div class="menu">--%>
<%--                                                        <div class="yyyy">--%>
<%--                                                            <div class="menu_name">시발로마</div>--%>
<%--                                                            <div class="menu_intro">--%>
<%--                                                                ssssssssssssssddddddddddddddddddddddddddddddddddddddddddddddddddssssssssssss아 개ㅃ까치네--%>
<%--                                                            </div>--%>

<%--                                                            <div>30,000원</div>--%>

<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="menu_img">--%>
<%--                                                        <img class="menu_img"--%>
<%--                                                             src="/resources/img/menu-img/af866bd1-eb48-474e-92a2-b01a646031d1_다운로드.jpg" style="width: 90px; height: 115px;">--%>
<%--                                                    </div>--%>
<%--                                                    &lt;%&ndash;                                    <div class="menu_img">&ndash;%&gt;--%>
<%--                                                    &lt;%&ndash;                                        <img src="/resources/img/menu-img/ramyun.png">&ndash;%&gt;--%>
<%--                                                    &lt;%&ndash;                                    </div>&ndash;%&gt;--%>
<%--                                                </div>--%>
<%--                                            </a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                <c:choose>
                    <c:when test="${not empty categoryList}">
                        <c:forEach var="categories" items="${categoryList}" varStatus="num">
                            <div class="bottom_menu_group" id="bottom_menu_group${num.count}"
                                 style="font-weight: bold; font-size: 17px; margin-bottom: 5px;">${categories.menu_group}
                                <div style="height: 10px;"></div>
                                <c:forEach var="menuList" items="${categories.menuList}">
                                    <div class="menu_box">
                                        <div class="box">
                                            <a href="/menu/detail/${menuList.menu_seq}">
                                                <div class="menu_info">
                                                    <c:choose>
                                                        <c:when test="${not empty menuList.menu_img}">
                                                            <div class="menu">
                                                                <div class="yyyy">
                                                                    <div class="menu_name">${menuList.menu_name}</div>
                                                                    <div class="menu_intro">
                                                                        ssssssssssssssddddddddddddddddddddddddddddddddddddddddddddddddddsssssssssssss${menuList.menu_intro}
                                                                    </div>
                                                                    <div class="menu_price">${menuList.menu_price}원</div>
                                                                </div>
                                                            </div>
                                                            <div class="menu_img">
                                                                <img class="menu_img"
                                                                     src="/resources/img/menu-img/${menuList.menu_img}" style="width: 90px; height: 115px;">
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="menu">
                                                                <div class="yyyy">
                                                                    <div class="menu_name">${menuList.menu_name}</div>
                                                                    <div id="menu_intro"
                                                                         style="width: 275px; text-overflow: unset; white-space: unset; overflow: unset; word-break:break-word">
                                                                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddaaaaaaaaaaaaaddddddsssssssssssss${menuList.menu_intro}
                                                                    </div>
                                                                    <div>${menuList.menu_price}원</div>
                                                                </div>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <hr>
                                    <%--                            <c:choose>--%>
                                    <%--                                <c:when test="${not empty menuList.menu_img}">--%>
                                    <%--                                    <img class="menu_img" src="/resources/img/menu-img/${menuList.menu_img}">--%>
                                    <%--                                </c:when>--%>
                                    <%--                                <c:otherwise></c:otherwise>--%>
                                    <%--                            </c:choose>--%>
                                    <%--            </div>--%>
                                </c:forEach>
                            </div>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
        </div>
        <%--원산지--%>
        <c:choose>
            <c:when test="${not empty storeInfoDTO.store_origin}">
                <div class="origin" style="margin-top: -10px;">
                        원산지 : ${storeInfoDTO.store_origin}
                </div>
            </c:when>
            <c:otherwise>
                원산지 없음
            </c:otherwise>
        </c:choose>
    </div>
    <script src="/resources/js/member/store/storeDetail.js"></script>
</main>
</body>