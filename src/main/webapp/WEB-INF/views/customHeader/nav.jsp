<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- font-awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
<!-- bootstrap CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- bootstrap JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

<style>
    #deli_nav {
        z-index: 30;
        position: fixed;
        margin: 0 auto;
        left: 0;
        right: 0;
        bottom: 0;
        min-width: 360px;
        max-width: 420px;
        height: 75px;
        padding-top: 15px;
        background-color: #E84C4F;
        color: #FFFFFF;
    }

    #deli_nav a {
        color: #FFFFFF;
        text-decoration: none;
    }

    #deli_nav a:link {
        color: #FFFFFF;
    }

    #deli_nav a:hover {
        color: #F8F5F2;
    }

    #deli_nav a:active {
        color: #FFFFFF;
    }

    #deli_nav div {
        width: 93.75px;
    }

    #deli_nav i {
        font-size: 23px;
        margin-bottom: 7px;
    }

    #deli_nav p {
        font-size: 12px;
    }

    body {
        background: #333333;
        overflow-y: auto;
    }

    main {
        background-color: #FFFFFF;
        position: relative;
        margin: 0 auto;
        min-width: 360px;
        max-width: 420px;
        min-height: 100vh;
    }

    a#topBtn {
        background-color: #e84c4f;
        position: fixed; /* 포지션 고정 */
        margin: 0 auto;
        left: 310px;
        right: 0; /* 오른쪽에서 2% - %도 할수 있음*/
        bottom: 90px; /* 밑에서 5px */
        display: none; /* 보여지지 없음 - 기본적으로 안보여지게 */
        z-index: 30; /* 포지션을 먼저 지정후 z-좌표(레이어) : 9999입니다. */
        border-radius: 50%;
        width: 30px;
        height: 30px;
        box-shadow: 0 2px 5px -2px rgba(0,0,0,0.7);
    }

    a#topBtn {
        color: #F8F5F2;
        text-decoration: none;
    }

    a#topBtn:link {
        color: #F8F5F2;
    }

    a#topBtn:hover {
        color: #F8F5F2;
    }

    a#topBtn:active {
        color: #F8F5F2;
    }
</style>

<script>
    $(function () { // 보이기 | 숨기기
        $(window).scroll(function () {
            if ($(this).scrollTop() > 250) { //250 넘으면 버튼이 보여짐니다.
                $('#topBtn').fadeIn();
            } else {
                $('#topBtn').fadeOut();
            }
        }); // 버튼 클릭시
        $("#topBtn").click(function () {
            $('html, body').animate({
                scrollTop: 0 // 0 까지 animation 이동합니다.
            }, 100); // 속도 400
            return false;
        });
    });
</script>

<a id="topBtn" href="#">
    <div style="position: absolute; top: 7px; left: 8px" class="text-center">
        <i class="fa-solid fa-chevron-up"></i></div>
</a>

<nav id="deli_nav" class="d-flex justify-content-evenly text-center">
    <a href="/">
        <div>
            <i class="fa-solid fa-house"></i>
            <p>홈</p>
        </div>
    </a>
    <a href="/myPage/dibs/">
        <div>
            <i class="fa-solid fa-inbox"></i>
            <p>찜</p>
        </div>
    </a>
    <a href="/member/order/history">
        <div>
            <i class="fa-solid fa-clipboard"></i>
            <p>주문내역</p>
        </div>
    </a>
    <a href="/myPage">
        <div>
            <i class="fa-solid fa-user"></i>
            <p>마이딜리</p>
        </div>
    </a>
</nav>





