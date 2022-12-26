<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>식당관리</title>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <%--data tables--%>
    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="/resources/css/owner/storeList.css">
</head>
<div>

<%@ include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>

<main id="ownerStore">

    <div id="container">

        <table id="myTable">
            <thead>
            <tr>
                <th class="sName">상호명</th>
                <th class="phone">연락처</th>
                <th class="add_detail">주소</th>
                <th class="display">공개여부</th>
                <th class="btn"></th>
            </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty list}">
                    <c:forEach var="store" items="${list}">
                        <tr class="store">
                            <td class="name">${store.store_name}</td>
                            <td class="phone">${store.store_phone}</td>
                            <td class="add_detail">${store.store_add_detail1}, ${store.store_add_detail2}</td>
                            <td class="display"><span class="display_val">${store.store_display}</span> <button class="display_toggle">전환하기</button></td>
                            <td class="btn">
                                <a href="/store/mng?store_seq=${store.store_seq}">
                                    <button type="button">정보수정</button>
                                </a>
                                <a href="/owner/menu?store_seq=${store.store_seq}">
                                    <button type="button">메뉴수정</button>
                                </a>
                                <form action="/owner/store/list/delete" method="post" style="display: inline">
                                    <input type="hidden" class="store_seq" name="store_seq"
                                           value="${store.store_seq}">
                                    <button type="button" class="del_btn">삭제</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
            </c:choose>
            </tbody>
        </table>
    </div>

    <a href="/owner/store/add"><button>식당추가</button></a>

</main>
<script src="/resources/js/owner/storeList.js"></script>
</div>
</body>
</html>