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

</style>

<nav id="deli_nav" class="d-flex justify-content-evenly text-center">
    <a href="/">
        <div>
            <i class="fa-solid fa-house"></i>
            <p>홈</p>
        </div>
    </a>
    <a href="/myPage/dibs/">
        <div>
            <i class="fa-solid fa-heart"></i>
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





