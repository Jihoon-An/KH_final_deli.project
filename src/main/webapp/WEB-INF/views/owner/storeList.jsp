<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>식당관리</title>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <%--data tables--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="/resources/css/owner/storeList.css">
</head>
<body>

<main id="ownerStore">

    <div id="container">

        <table id="myTable">
            <thead>
            <tr>
                <th class="seq">식당번호</th>
                <th class="sName">상호명</th>
                <th class="category">업종</th>
                <th class="phone">연락처</th>
                <th class="add_detail1">주소</th>
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
                            <td class="store_display">${sysName.store_display}</td>
                        </tr>
                    </c:forEach>
                </c:when>
            </c:choose>
            </tbody>
        </table>
    </div>

</main>

<script src="/resources/js/owner/storeList.js"></script>
</div>
</body>
</html>