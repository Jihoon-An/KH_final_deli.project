<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 마이페이지</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>

    <link rel="stylesheet" href="/resources/css/member/myPage/myPage.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
</head>
<body>

    <%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%--    <%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>--%>
    <%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>

    <main id="myPage">

        <div class="container">


            <div class="titleBox">
                마이페이지
            </div>

            <a href="/myPage/memberInfo">
                <div class="profileBox">
                    <i class="fa-regular fa-circle-user"></i> ${memberInfo.mem_nick}
                    <div><i class="fa-solid fa-chevron-right"></i></div>
                </div>
            </a>
            <div class="linkBox">
                <a href="/myPage/dibs/">
                    <div class="link FavoritesBox">
                        <span class="icon" style="color: #f8181a"><i class="fa-solid fa-heart"></i></span><br>
                        <span class="text">찜</span>
                    </div>
                </a>
                <a href="/myPage/reviewList">
                    <div class="link reviewManagerBox">
                        <span class="icon" style="color: #ffcc01"><i class="fa-solid fa-star"></i></span><br>
                        <span class="text">리뷰관리</span>
                    </div>
                </a>
                <a href="/myPage/couponPoint">
                    <div class="link couponAndPointBox">
                        <span class="icon" style="color: #3e4462"><i class="fa-solid fa-ticket"></i></span><br>
                        <span class="text">쿠폰&포인트</span>
                    </div>
                </a>
                <a href="/order/history">
                    <div class="link orderHistoryBox">
                        <span class="icon" style="color: #57524b"><i class="fa-solid fa-barcode"></i></span><br>
                        <span class="text">주문내역</span>
                    </div>
                </a>
            </div>

            <div class="buttonBox">
                <div style="float: left; margin-top: 3px;">
                    <span style="font-size: 14px; color: #645DAF;"><i class="fa-solid fa-at"></i></span>
                </div>
                <div style="float: left; margin-left: 5px; margin-bottom: 5px;">
                    <span style="font-size: 12px;">${loginEmail}</span>
                </div>
                <a href="/account/logout">
                    <button>로그아웃</button>
                </a>
            </div>


        </div>

    </main>

</body>
</html>
