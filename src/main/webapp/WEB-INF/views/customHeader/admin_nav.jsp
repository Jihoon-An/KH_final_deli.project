<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

    #wrap_host{
        height: 100vh;
        z-index: 2;
    }

    #deli_nav {
        z-index: 3;
        background: #888888;
        min-height: 900px;
        min-width: 250px;
        padding-top: 35px;
        padding-left: 50px;
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

    main {
        min-width: 1000px;
        width: 1000px;
        margin: 0 auto;
    }

    #deli_nav h2 {
        font-weight: bold;
    }

    #deli_nav .logout{
        margin-top: 100px;
        font-size: 13px;
        color: #3e4462;
    }


</style>

<div id="wrap_host" class="d-flex justify-content-start">
    <nav id="deli_nav" class="d-flex flex-column">
        <a class="a_tag" href="/admin">
            <h2>Deli</h2>
            <h2>ADMIN</h2></a>
        <p class="logout"><a href="/account/logout">logout</a></p>
        <i class="fa-solid fa-ticket"></i>
        <p><a href="/admin/coupon/list">쿠폰관리</a></p>
        <i class="fa-regular fa-pen-to-square"></i>
        <p><a href="/admin/review">리뷰관리</a></p>
        <i class="fa-solid fa-user"></i>
        <p><a href="/admin/account/list">일반회원관리</a></p>
        <p><a href="/admin/owner/list">사업자회원관리</a></p>
        <i class="fa-solid fa-building"></i>
        <p><a href="/admin/store/list/">식당관리</a></p>

    </nav>
