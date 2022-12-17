<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: ykm--%>
<%--  Date: 2022-12-16--%>
<%--  Time: 오후 3:48--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--<html>--%>

<%--<head>--%>
<%--    <title>admin</title>--%>
<%--    <!--jQuery-->--%>
<%--    <script src="https://code.jquery.com/jquery-3.6.1.min.js"--%>
<%--            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">--%>
<%--    </script>--%>

<%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">--%>
<%--    <script type="text/javascript" charset="utf8"--%>
<%--            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>--%>

<%--</head>--%>
<%--<style>--%>


<%--    #myTable * {--%>
<%--        cursor: pointer;--%>
<%--    }--%>
<%--</style>--%>

<%--<script>--%>
<%--    $(function (){--%>
<%--        $('#myTable').DataTable();--%>
<%--    })--%>
<%--</script>--%>

<%--<body>--%>

<%--    <table id="myTable" class="display">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>회원번호</th>--%>
<%--            <th>이메일</th>--%>
<%--            <th>이름</th>--%>
<%--            <th>연락처</th>--%>
<%--            <th>주소</th>--%>
<%--            <th>가입일</th>--%>
<%--            <th>등급</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--    <c:choose>--%>
<%--        <c:when test="${not empty account_list}}">--%>
<%--            <c:forEach var="ac" items="${account_list}">--%>
<%--        <tr>--%>

<%--            <td class="acc_seq"> ${ac.acc_seq}</td>--%>
<%--            <td class="acc_email">${ac.acc_email} </td>--%>
<%--            <td class="mem_name">${ac.mem_name}</td>--%>
<%--            <td class="mem_phone">${ac.mem_phone} </td>--%>
<%--            <td class="add_detail1">${ac.add_detail1} </td>--%>
<%--            <td class="acc_signupdate">${ac.acc_signupdate} </td>--%>
<%--            <td class="mem_grade">${ac.mem_grade}</td>--%>
<%--        </tr>--%>
<%--            </c:forEach>--%>

<%--        </c:when>--%>

<%--    </c:choose>--%>
<%--        </tbody>--%>
<%--    </table>--%>


<%--    <script>--%>


<%--        // $(document).ready(function () {--%>
<%--        //     $('#myTable').DataTable();--%>
<%--        // });--%>


<%--    </script>--%>

<%--</body>--%>

<%--</html>--%>


<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-13
  Time: 오전 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>adminReviewMng</title>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>



</head>
<body>
<table id="myTable" class="display">
    <thead>
    <tr>
        <th>회원번호</th>
        <th>이메일</th>
        <th>이름</th>
        <th>연락처</th>
        <th>주소</th>
        <th>가입일</th>
        <th>등급</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty account_list}">
        <c:forEach var="ac" items="${account_list}">
            <tr>
                <td class="acc_seq"> ${ac.acc_seq}</td>

                <td class="acc_email">${ac.acc_email} </td>
                <td class="mem_name">${ac.mem_name}</td>
                <td class="mem_phone">${ac.mem_phone} </td>
                <td class="add_detail1">${ac.add_detail1} </td>
                <td class="acc_signupdate">${ac.acc_signupdate} </td>
                <td class="mem_grade">${ac.mem_grade}</td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>

<script>
    $(document).ready(function () {
        $('#myTable').DataTable();
    });
</script>

</body>
</html>
