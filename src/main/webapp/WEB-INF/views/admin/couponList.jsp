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
    <title>Title</title>

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

    <link rel="stylesheet" href="/resources/css/admin/couponList.css">
</head>
<body>
<main id="coupon_list">
<div id="table_area">
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
                    <td class="discount">
                            ${cp.cp_discount}
                        <c:choose>
                            <c:when test='${cp.cp_type == "percent"}'>
                                %
                            </c:when>
                            <c:otherwise>
                                원
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="period">${cp.cp_period} 일</td>
                    <input type="hidden" value="${cp.cp_seq}" class="seq">
                    <input type="hidden" value="${cp.cp_code}" class="code">
                    <input type="hidden" value="${cp.cp_content}" class="content">
                    <input type="hidden" value="${cp.cp_period}" class="period">
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>

</div>
</main>
<script src="/resources/js/admin/couponList.js"></script>
</body>
</html>
