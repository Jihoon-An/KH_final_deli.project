<%--
  Created by IntelliJ IDEA.
  User: abg14
  Date: 2022-12-14
  Time: 오후 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 운영자 쿠폰관리</title>
    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>
    <%--data tables--%>
    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="/resources/css/admin/couponList.css">
</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/admin_nav.jsp" %>
<main id="coupon_list">
    <div id="table_area">
        <!-- 테이블 -->
        <table id="myTable" class="display">
            <thead>
            <tr>
                <th class="name">쿠폰이름</th>
                <th class="type">타입</th>
                <th class="discount">할인</th>
                <th class="period">기간</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${!empty cpList}">
                <c:forEach var="cp" items="${cpList}">
                    <tr class="coupon">
                        <td class="name">${cp.cp_name}</td>
                        <td class="type">${cp.cp_type}</td>
                        <c:choose>
                            <c:when test='${cp.cp_type == "percent"}'>
                                <td class="discount">${cp.cp_discount}%</td>
                            </c:when>
                            <c:otherwise>
                                <td class="discount">${cp.cp_discount}원</td>
                            </c:otherwise>
                        </c:choose>

                        <td class="period">${cp.cp_period} 일</td>
                        <input type="hidden" value="${cp.cp_seq}" class="seq">
                        <input type="hidden" value="${cp.cp_code}" class="code">
                        <input type="hidden" value="${cp.cp_content}" class="content">
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>

    <a href="/admin/coupon/add">
        <button id="add_cp_btn">쿠폰 추가</button>
    </a>

    <!-- 모달 -->
    <div id="modal">
        <div id="close_modal">X</div>
        <div id="modal_content">
            modal_cp_seq wheat
            <input type="hidden" id="modal_cp_seq" placeholder="seq"
                   style="background-color: wheat;" readonly>
            modal_cp_name Red
            <input type="text" id="modal_cp_name" placeholder="name" style="background-color: red;"
                   readonly>
            modal_cp_code Dodgerblue
            <input type="text" id="modal_cp_code" placeholder="code"
                   style="background-color: dodgerblue;" readonly>
            modal_cp_content white
            <input type="text" id="modal_cp_content" placeholder="content"
                   style="background-color: white;" readonly>
            modal_cp_type yellow
            <input type="text" id="modal_cp_type" placeholder="cp_type"
                   style="background-color: yellow;" readonly>
            modal_cp_discount Green
            <input type="text" id="modal_cp_discount" placeholder="cp_discount"
                   style="background-color: green;" readonly>
            modal_cp_period Salmon
            <input type="text" id="modal_cp_period" placeholder="cp_period"
                   style="background-color: salmon;" readonly>
        </div>
        <div id="modal_btn_area">
            <button id="publish_btn" type="button">발행</button>
            <button id="delete_btn" type="button">삭제</button>
        </div>
    </div>

</main>
<script src="/resources/js/admin/couponList.js"></script>
</body>
</html>
