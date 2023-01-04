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
    <title>딜리 - 운영자 쿠폰추가</title>
    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>
    <%--css--%>
    <link href="/resources/css/admin/addCoupon.css" rel="stylesheet"/>
</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/admin_nav.jsp" %>
<main id="add_coupon">
    <h1>쿠폰 등록</h1>
    <form id="cp_add_frm" action="/admin/coupon/add/add" method="post" class="container-fluid justify-content-start">
        <%--이름--%>
        <div class="input-group mb-3">
            <span class="input-group-text info_title" id="basic-addon1">쿠폰이름</span>
            <input type="text" class="form-control" placeholder="필수" aria-label="필수"
                   aria-describedby="basic-addon1" name="cp_name" maxlength="20">
        </div>

        <%--쿠폰코드--%>
            <div class="input-group mb-3">
                <span class="input-group-text info_title">쿠폰코드</span>
                <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)"
                       name="cp_code" id="cp_code" maxlength="20" placeholder="선택">
                <button class="btn btn-outline-secondary" type="button" id="cp_code_confirm_btn">중복확인</button>
            </div>

        <%--할인종류--%>
            <div class="input-group mb-3">
                <label class="input-group-text" for="cp_type">할인종류</label>
                <select class="form-select" id="cp_type" name="cp_type">
                    <option value="amount">정액할인</option>
                    <option value="percent">퍼센트할인</option>
                </select>
            </div>

        <%--할인율--%>
            <div class="input-group mb-3">
                <span class="input-group-text info_title" id="info_title">할인금액</span>
                <input type="number" class="form-control" placeholder="필수" aria-label="필수"
                       aria-describedby="basic-addon1" name="cp_discount" maxlength="20">
            </div>


        <%--쿠폰기한--%>
            <div class="input-group mb-3">
                <span class="input-group-text info_title info_title">쿠폰기한</span>
                <input type="number" class="form-control" placeholder="필수 - 일 수 기준" aria-label="필수"
                       aria-describedby="basic-addon1" name="cp_period" maxlength="20">
            </div>


        <%--설명--%>
            <div class="input-group">
                <span class="input-group-text">쿠폰설명</span>
                <textarea class="form-control" aria-label="With textarea" name="cp_content" placeholder="필수"></textarea>
            </div>


        <%--푸터 메뉴--%>
        <div class="row justify-content-center">
            <button type="button" id="cp_add_btn" class="btn btn-secondary col-5 mt-3">등록하기</button>
        </div>
    </form>
</main>
<script src="/resources/js/admin/addCoupon.js"></script>
</body>
</html>
