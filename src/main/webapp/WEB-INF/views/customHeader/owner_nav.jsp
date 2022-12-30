<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- font-awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">

<!-- Bootstrap - css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
      crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>

<link rel="stylesheet" href="/resources/css/customHeader/common.css" type="text/css">

<style>

  #wrap_host{
    height: 100vh;
    z-index: 2;
  }

  #deli_nav {
    z-index: 3;
    background: #888888;
    min-height: 900px;
    min-width: 220px;
    padding-top: 15px;
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

</style>

<div id="wrap_host" class="d-flex justify-content-start">
  <nav id="deli_nav" class="d-flex flex-column">
    <a class="a_tag" href="/">
      <h2>Deli</h2>
      <h2>Owner</h2></a>
    <a href="/account/logout">로그아웃</a>
    <i class="fa-solid fa-user"></i>
    <a href="/owner/info">내 정보</a>
    <i class="fa-solid fa-basket-shopping"></i>
    <a href="/owner/store/list">식당관리</a>
    <i class="fa-solid fa-shop"></i>
    <a href="/owner/order">주문관리</a>
  </nav>
