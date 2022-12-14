<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/member/userMenu/myPage.css" type="text/css">
</head>
<body>

    <main id="myPage">

        <div class="container">

            <div class="topBox">
                <div class="topLeftBox">
                    <a href="/"><i class="fa-solid fa-arrow-left"></i></a>
                </div>
                <div class="topRightBox">
                    <a href="/"><i class="fa-solid fa-house"></i></a>
                </div>
            </div>

            <div class="titleBox">
                마이페이지
            </div>

            <a href="/">
                <div class="profileBox">
                    <i class="fa-regular fa-circle-user"></i> 닉네임
                    <div><i class="fa-solid fa-chevron-right"></i></div>
                </div>
            </a>
            <div class="linkBox">
                <a href="/">
                    <div class="link couponAndPointBox">
                        <span class="icon"><i class="fa-solid fa-ticket"></i></span><br>
                        <span class="text">쿠폰</span>
                    </div>
                </a>
                <a href="/">
                    <div class="link FavoritesBox">
                        <span class="icon"><i class="fa-solid fa-heart"></i></span><br>
                        <span class="text">찜</span>
                    </div>
                </a>
                <a href="/">
                    <div class="link orderHistoryBox">
                        <span class="icon"><i class="fa-solid fa-barcode"></i></span><br>
                        <span class="text">주문내역</span>
                    </div>
                </a>
                <a href="/">
                    <div class="link reviewManagerBox">
                        <span class="icon"><i class="fa-solid fa-comments"></i></span><br>
                        <span class="text">리뷰관리</span>
                    </div>
                </a>
            </div>

            <div class="buttonBox">
                <a href="/account/logout">
                    <button>로그아웃</button>
                </a>
            </div>


        </div>

    </main>

</body>
</html>
