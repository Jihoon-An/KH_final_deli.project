<%--
  Created by IntelliJ IDEA.
  User: abg14
  Date: 2022-12-13
  Time: 오후 4:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>couponMng</title>

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
    <%--css--%>
    <link href="/resources/css/admin/addCoupon.css" rel="stylesheet"/>
    <%--sweetalert--%>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<main id="add_coupon">

    <h1>쿠폰 등록</h1>
    <form id="cp_add_frm" action="/admin/addCoupon/add" method="post">
        <%--이름--%>
        <div class="row" id="name_area">
            <div class="col-3">
                <span class="info_title">쿠폰이름</span>
            </div>
            <div class="col-9">
                <input type="text" name="cp_name">
            </div>
        </div>
        <%--쿠폰코드--%>
        <div class="row" id="name_area">
            <div class="col-3">
                <span class="info_title">쿠폰코드</span>
            </div>
            <div class="col-9">
                <input type="text" name="cp_code" id="cp_code">
                <button type="button" id="cp_code_confirm_btn">중복확인</button>
            </div>
        </div>
        <%--할인종류--%>
        <div class="row" id="type_area">
            <div class="col-3">
                <span class="info_title">할인종류</span>
            </div>
            <div class="col-9">
                <select name="cp_type">
                    <option value="amount">정액할인</option>
                    <option value="percent">퍼센트할인</option>
                </select>
            </div>
        </div>
        <%--할인율--%>
        <div class="row" id="discount_area">
            <div class="col-3">
                <span class="info_title">할인율</span>
            </div>
            <div class="col-9">
                <input type="number" name="cp_discount">
            </div>
        </div>
        <%--쿠폰기한--%>
        <div class="row" id="period_area">
            <div class="col-3">
                <span class="info_title">쿠폰기한</span>
            </div>
            <div class="col-9">
                <input type="number" name="cp_period">
            </div>
        </div>
        <%--설명--%>
        <div class="row" id="content_area">
            <div class="col-3">
                <span class="info_title">쿠폰설명</span>
            </div>
            <div class="col-9">
                <textarea name="cp_content"></textarea>
            </div>
        </div>
        <%--푸터 메뉴--%>
        <div class="row">
            <button type="button" id="cp_add_btn">등록하기</button>
        </div>
    </form>
</main>
<script src="/resources/js/admin/addCoupon.js"></script>
</body>
</html>
