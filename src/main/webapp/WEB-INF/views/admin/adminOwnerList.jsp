

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


    <link rel="stylesheet" href="/resources/css/admin/ownerList.css" type="text/css">
</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/admin_nav.jsp" %>
<main id="owner_list">
    <table id="myTable" class="display">
        <thead>
        <tr>
            <th>사업자 번호</th>
            <th>사업자 회원번호</th>
            <th>회원번호</th>
            <th>사업자 이름</th>
            <th>연락처</th>
            <th>이메일</th>
            <th>보유 식당 갯수</th>
            <th>가입일</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty owner_list}">
            <c:forEach var="ow" items="${owner_list}">
                <tr>
                    <td class="owner_num"> ${ow.owner_num}</td>
                    <td class="owner_seq">${ow.owner_seq}</td>
                    <td class="acc_seq">${ow.acc_seq}</td>
                    <td class="owner_name">${ow.owner_name}</td>
                    <td class="owner_phone">${ow.owner_phone} </td>
                    <td class="acc_email">${ow.acc_email} </td>
                    <td class="store_count">${ow.store_count}</td>
                    <td class="acc_signupdate">${ow.acc_signupdate} </td>

                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>

    <%--모달--%>
    <form action="/admin/deleteReview" id="frm">
        <div class="modal">
            <div class="modal_content">
                <div class="closeModal">X</div>

                <div>
                    사업자 번호 <input
                        type="text" placeholder="사업자 번호" id="ownernum" class="ownernum" disabled>
                </div>
                <div>
                    사업자 회원번호<input
                        type="text" placeholder="사업자 회원번호" disabled id="owner_seq" class="owner_seq">
                </div>
                <div>
                    회원번호<input
                        type="text" placeholder="회원번호" disabled id="acc_seq" class="acc_seq">
                </div>
                <div>
                    사업자 이름<input
                        type="text" placeholder="사업자 이름" disabled id="name" class="name">
                </div>
                <div>
                    연락처<input
                        type="text" placeholder="연락처" disabled id="ownerPhone" class="ownerPhone">
                </div>
                <div>
                    이메일<input
                        type="text" placeholder="이메일" disabled id="email" class="email">
                </div>
                <div>
                    보유 식당갯수<input
                        type="text" placeholder="식당갯수" id="scount" class="scount">
                </div>
                <div>
                    가입일<input
                        type="text" placeholder="가입일" id="signdate" class="signdate">
                </div>


                <button type="button" id="deleteOwner" type="button">삭제</button>
            </div>
        </div>
    </form>


    <script src="/resources/js/admin/ownerList.js"></script>
</main>
</body>
</html>
