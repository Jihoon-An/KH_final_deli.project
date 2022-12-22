<%--
  Created by IntelliJ IDEA.
  User: HYB
  Date: 2022-12-22
  Time: 오후 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>운영자 - 식당관리</title>

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

    <%--data tables--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="/resources/css/admin/">

    <%--sweetalert--%>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
<main id="adminStore">

    <div id="container">

        <table id="myTable" class="display">
            <thead>
                <tr>
                    <th class="store_seq">식당번호</th>
                    <th class="store_name">상호명</th>
                    <th class="store_category">업종</th>
                    <th class="store_phone">연락처</th>
                    <th class="store_add_detail1">주소</th>
                    <th class="store_add_detail2">상세주소</th>
                    <th class="owner_num">사업자 등록번호</th>
                    <th class="owner_name">대표자명</th>
                </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty list}">
                    <c:forEach var="sysName" items="${list}">
                        <tr class="store">
                            <td class="name">${sysName.store_seq}</td>
                            <td class="name">${sysName.store_name}</td>
                            <td class="name">${sysName.store_category}</td>
                            <td class="name">${sysName.store_phone}</td>
                            <td class="name">${sysName.store_add_detail1}</td>
                            <td class="name">${sysName.store_add_detail2}</td>
                            <td class="name">${sysName.owner_num}</td>
                            <td class="name">${sysName.owner_name}</td>
                        </tr>
                    </c:forEach>
                </c:when>
            </c:choose>
            </tbody>
        </table>
    </div>


    <!-- 모달 -->
    <%--    <div id="modal">--%>
    <%--        <div id="close_modal">X</div>--%>
    <%--        <div id="modal_content">--%>
    <%--            modal_cp_seq wheat--%>
    <%--            <input type="hidden" id="modal_cp_seq" placeholder="seq" style="background-color: wheat;" readonly>--%>
    <%--            modal_cp_name Red--%>
    <%--            <input type="text" id="modal_cp_name" placeholder="name" style="background-color: red;" readonly>--%>
    <%--            modal_cp_code Dodgerblue--%>
    <%--            <input type="text" id="modal_cp_code" placeholder="code" style="background-color: dodgerblue;" readonly>--%>
    <%--            modal_cp_content white--%>
    <%--            <input type="text" id="modal_cp_content" placeholder="content" style="background-color: white;" readonly>--%>
    <%--            modal_cp_type yellow--%>
    <%--            <input type="text" id="modal_cp_type" placeholder="cp_type" style="background-color: yellow;" readonly>--%>
    <%--            modal_cp_discount Green--%>
    <%--            <input type="text" id="modal_cp_discount" placeholder="cp_discount" style="background-color: green;" readonly>--%>
    <%--            modal_cp_period Salmon--%>
    <%--            <input type="text" id="modal_cp_period" placeholder="cp_period" style="background-color: salmon;" readonly>--%>
    <%--        </div>--%>
    <%--        <div id="modal_btn_area">--%>
    <%--            <button id="publish_btn" type="button">발행</button>--%>
    <%--            <button id="delete_btn" type="button">삭제</button>--%>
    <%--        </div>--%>
    <%--    </div>--%>

</main>

<script src="/resources/js/admin/storeList.js"></script>

</body>
</html>
