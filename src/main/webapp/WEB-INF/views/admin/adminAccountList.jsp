

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

<%--모달--%>
<form action="/admin/deleteReview" id="frm">
    <div class="modal">
        <div class="modal_content">
            <div class="closeModal">X</div>

            <div>
                작성자 <input
                    type="text" placeholder="작성자" id="writer" class="writer" disabled>
            </div>
            <div>
                별점 <input
                    type="text" placeholder="별점" disabled id="star" class="star">
            </div>
            <%--            <div>--%>
            <%--                리뷰 내용<input--%>
            <%--                    type="text" placeholder="리뷰내용" disabled id="review_content" class="review_content">--%>
            <%--            </div>--%>
            <div id="reviewField">리뷰 내용</div>
            <div id="review_content" class="review_content">
            </div>
            <div>
                작성일자<input
                    type="text" placeholder="작성일자" disabled id="write_date" class="write_date">
            </div>
            <div>
                수정일자<input
                    type="text" placeholder="수정일자" disabled id="modified_date" class="modified_date">
            </div>

            <div>
                리뷰번호<input
                    type="text" placeholder="리뷰번호" id="rseq" class="rseq">
            </div>

            <button type="button">비공개</button>
            <button type="button" id="deleteReview" type="button">삭제</button>
        </div>
    </div>
</form>


<script src="/resources/js/admin/reviewMng.js"></script>
</main>
</body>
</html>
