<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 마이페이지</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico" />
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">


    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>


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
                <a href="/myPage/couponPoint">
                    <div class="link couponAndPointBox">
                        <span class="icon" style="color: #f37d1b"><i class="fa-solid fa-ticket"></i></span><br>
                        <span class="text">쿠폰&포인트</span>
                    </div>
                </a>
                <a href="/myPage/dibs/">
                    <div class="link FavoritesBox">
                        <span class="icon" style="color: #b92526"><i class="fa-solid fa-heart"></i></span><br>
                        <span class="text">찜</span>
                    </div>
                </a>
                <a href="/member/order/history">
                    <div class="link orderHistoryBox">
                        <span class="icon" style="color: #57524b"><i class="fa-solid fa-barcode"></i></span><br>
                        <span class="text">주문내역</span>
                    </div>
                </a>
                <a href="/myPage/reviewList">
                    <div class="link reviewManagerBox">
                        <span class="icon" style="color: #e7b513"><i class="fa-solid fa-star"></i></span><br>
                        <span class="text">리뷰관리</span>
                    </div>
                </a>
            </div>

            <div class="buttonBox">
                접속 이메일 : ${loginEmail}
                <a href="/account/logout">
                    <button>로그아웃</button>
                </a>
            </div>


        </div>

    </main>

</body>
</html>
