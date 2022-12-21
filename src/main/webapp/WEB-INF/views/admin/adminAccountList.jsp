

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


    <link rel="stylesheet" href="/resources/css/admin/accountList.css" type="text/css">
</head>
<body>
<main id="account_list">
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
                <input type="hidden"  class="acc_seq" value="${ac_acc_Seq}">

                <td class="acc_email">${ac.acc_email} </td>
                <td class="mem_nick">${ac.mem_nick}</td>
                <td class="mem_phone">${ac.mem_phone} </td>
                <td class="add_detail1">${ac.add_detail1} </td>
                <td class="acc_signupdate">${ac.acc_signupdate} </td>
                <td class="mem_grade">${ac.mem_grade}</td>
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
                이메일 <input
                    type="text" placeholder="이메일" id="email" class="email" disabled>
            </div>
            <div>
                닉네임<input
                    type="text" placeholder="이름" disabled id="nick" class="nick">
            </div>
            <div>
                연락처<input
                    type="text" placeholder="연락처" disabled id="phone" class="phone">
            </div>

            <div>
                가입일<input
                    type="text" placeholder="가입일자" disabled id="accsignupdate" class="accsignupdate">
            </div>
            <div>
               등급<input
                    type="text" placeholder="등급" disabled id="memgrade" class="memgrade">
            </div>

            <div>
                회원번호<input
                    type="text" placeholder="회원번호" id="accseq" class="accseq">
            </div>


            <button type="button" id="deleteAccount" type="button">삭제</button>
        </div>
    </div>
</form>


<script src="/resources/js/admin/accountList.js"></script>
</main>
</body>
</html>
