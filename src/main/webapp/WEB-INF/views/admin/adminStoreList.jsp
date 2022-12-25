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

    <link rel="stylesheet" href="/resources/css/admin/storeList.css">

    <%--sweetalert--%>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>


<%@ include file="/WEB-INF/views/customHeader/admin_nav.jsp" %>

<main id="adminStore">

    <div id="container">

        <table id="myTable" class="display">
            <thead>
            <tr>
                <th class="seq">식당번호</th>
                <th class="sName">상호명</th>
                <th class="category">업종</th>
                <th class="phone">연락처</th>
                <th class="add_detail1">주소</th>
                <th class="oNum">사업자 등록번호</th>
                <th class="oName">대표자명</th>
                <th class="display">공개여부</th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty list}">
                    <c:forEach var="sysName" items="${list}">
                        <tr class="store">
                            <td class="store_seq">${sysName.store_seq}</td>
                            <td class="store_name">${sysName.store_name}</td>
                            <td class="store_category">${sysName.store_category}</td>
                            <td class="store_phone">${sysName.store_phone}</td>
                            <td class="store_add_detail1">${sysName.store_add_detail1}, ${sysName.store_add_detail2}</td>
                            <td class="owner_num">${sysName.owner_num}</td>
                            <td class="owner_name">${sysName.owner_name}</td>
                            <td class="store_display">${sysName.store_display}</td>
                        </tr>
                    </c:forEach>
                </c:when>
            </c:choose>
            </tbody>
        </table>
    </div>


    <!-- 모달 -->
    <div class="modal">
        <div class="modal_content">
            <div class="closeBtn">X</div>
            <div>
                식당번호
                <input type="text" placeholder="식당번호" disabled id="store_seq">
            </div>
            <div>
                상호명
                <input type="text" placeholder="상호명" disabled id="store_name">
            </div>
            <div>업종
                <input type="text" placeholder="업종" disabled id="store_category">
            </div>
            <div>
                연락처
                <input type="text" placeholder="연락처" disabled id="store_phone">
            </div>
            <div>
                주소
                <input type="text" placeholder="주소" disabled id="store_add_detail1">
            </div>
            <div>
                사업자 등록번호
                <input type="text" placeholder="사업자 등록번호" disabled id="owner_num">
            </div>
            <div>
                대표자명
                <input type="text" placeholder="대표자명" disabled id="owner_name">
            </div>
            <div>
                공개여부
                <input type="text" placeholder="공개여부" disabled id="store_display">
            </div>

            <div class="btnBox">
                <button type="button" id="deleteBtn">삭제</button>
                <button type="button" id="statusBtn">비공개</button>
            </div>
        </div>
    </div>

</main>

<script src="/resources/js/admin/storeList.js"></script>
</div>
</body>
</html>
