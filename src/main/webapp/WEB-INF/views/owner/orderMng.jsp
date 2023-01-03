<%--
  Created by IntelliJ IDEA.
  User: jihoon
  Date: 2022-12-22
  Time: 오전 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 주문관리</title>
    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>
    <%--data tables--%>
    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="/resources/css/admin/couponList.css">

    <link href="/resources/css/owner/orderMng.css" rel="stylesheet">
</head>
<body>

<%@ include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>

<main id="order_mng">
    <div class="container">
        <div class="dropdown-center py-3">
            <button class="btn btn-secondary dropdown-toggle" type="button"
                    data-bs-toggle="dropdown"
                    aria-expanded="false">
                <c:forEach var="store" items="${storeList}">
                    <c:if test="${store.store_seq eq storeSeq}">
                        ${store.store_name}
                    </c:if>
                </c:forEach>
            </button>
            <ul class="dropdown-menu">
                <c:forEach var="store" items="${storeList}">
                    <li><a class="dropdown-item"
                           href="http://mydeli.me/owner/order/${store.store_seq}">${store.store_name}</a>
<%--                           href="http://localhost/owner/order/${store.store_seq}">${store.store_name}</a>--%>
                    </li>
                </c:forEach>
            </ul>
        </div>


        <%--    <div>--%>
        <%--        <button type="button">새 주문 보기</button>--%>
        <%--    </div>--%>

        <div class="pb-4">
            <button type="button" id="status_btn" class="btn btn-light" style="border: 1px solid #3e4462">선택항목 상태 바꾸기</button>
            <select name="status" id="new_status">
                <option value="미접수">미접수</option>
                <option value="접수">접수</option>
                <option value="조리중">조리중</option>
                <option value="배달중">배달중</option>
                <option value="배달완료">배달완료</option>
            </select>
        </div>

        <table id="order_table" class="table table-borded">
            <thead>
            <tr>
                <td class="check_box"><input type="checkbox" id="all_check"></td>
                <td class="status">상태</td>
                <td class="mem_name">주문자이름</td>
                <td class="mem_phone">전화번호</td>
                <td class="menu_name">메뉴이름</td>
                <td class="mem_add">주소</td>
                <td class="deli_link">배송링크</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orderList}" varStatus="status">
                <tr>
                    <input type="hidden" class="order_seq" value="${order.orderSeq}">
                    <td class="check_box">
                        <input id="order_check${status.index}" type="checkbox"
                               class="check_box_input" name="order_check${status.index}">
                    </td>
                    <label for="order_check${status.index}" style="cursor: pointer">
                        <td class="status">${order.status}</td>
                        <td class="mem_name">${order.memberName}</td>
                        <td class="mem_phone">${order.phone}</td>
                        <td class="menu_name">${order.menuStrList}</td>
                        <td class="mem_add">${order.address}</td>
                    </label>
                    <td class="deli_link_btn">
                        <button class="send_link_btn btn btn-light">링크<br>보내기</button>
                    </td>
                    <input type="hidden" class="deli_link" value="${order.link}">
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>

<script src="/resources/js/owner/orderMng.js"></script>
</body>
</html>
