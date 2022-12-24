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
    <title>Title</title>

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>

    <%--data tables--%>
    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="/resources/css/admin/couponList.css">

    <%--sweetalert--%>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link href="/resources/css/owner/orderMng.css" rel="stylesheet">
</head>
<body>
<main id="order_mng" class="container">
<%--한줄의 요약해서 보이고 줄을 넘어가는 거는 ... 처리하고 마우스를 올리면 다 보이는 형태,
storeSeq가 다른 링크를 달아서 매장마다 관리할 수 있도록 함.--%>

    <div><button type="button">새 주문 보기</button></div>

    <div>
        <button type="button" id="status_btn">선택항목 상태 바꾸기</button>
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
        <c:forEach var="order" items="${orderList}">
            <tr>
                <input type="hidden" class="order_seq" value="${order.orderSeq}">
                <td class="check_box"><input type="checkbox" class="check_box_input"></td>
                <td class="status">${order.status}</td>
                <td class="mem_name">${order.memberName}</td>
                <td class="mem_phone">${order.phone}</td>
                <td class="menu_name">${order.menuStrList}</td>
                <td class="mem_add">${order.address}</td>
                <td class="deli_link">${order.link}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</main>

<script src="/resources/js/owner/orderMng.js"></script>
</body>
</html>
