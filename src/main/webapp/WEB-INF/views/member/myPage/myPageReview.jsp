<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-26
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <title>딜리 - 리뷰관리</title>
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">


</head>
<body>
<main id="review_list">
    <table id="myTable" class="display">
        <thead>
        <tr>
            <th>작성자</th>
            <th>2</th>
            <th>3</th>
            <th>4</th>
            <th>5</th>
            <th>5</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty myPageReviewList}">
            <c:forEach var="sysName" items="${myPageReviewList}">
                <td>
                    <td class="mem_name">${sysName.mem_nick}</td>
                    <td class="rev_content">${sysName.rev_content}</td>
                    <td class="store_name">${sysName.store_name}</td>
                    <td class="rev_writedate">
<%--                        <fmt:parseDate value="${sysName.rev_writetime}" var="registered" pattern="yyyy-MM-dd HH:mm:ss"/>--%>
                        <fmt:formatDate value="${registered}" pattern="yyyy-MM-dd"/>
                        <input id="formed_rev_writetime" class="formed_rev_writetime"
                               type="hidden" value= <fmt:formatDate value="${registered}" pattern="yyyy-MM-dd"/>>
                    </td>
                    <td>별점 ${sysName.rev_star}</td>
<%--                    <input type="hidden" value="${sysName.rev_seq}" class="rev_seq">--%>
<%--                    <input type="hidden" value="${sysName.rev_star}" class="rev_star">--%>
                </tr>
            </c:forEach>
                    </c:if>

        </tbody>
    </table>


    <%--모달--%>
<%--    <form action="/admin/review/deleteReview" id="frm">--%>
<%--        <div class="modal">--%>
<%--            <div class="modal_content">--%>
<%--                <div class="closeModal">X</div>--%>
<%--                <div>--%>
<%--                    작성자 <input--%>
<%--                        type="text" placeholder="작성자" id="writer" class="writer" disabled>--%>
<%--                </div>--%>
<%--                <div>--%>
<%--                    별점 <input--%>
<%--                        type="text" placeholder="별점" disabled id="star" class="star" disabled>--%>
<%--                </div>--%>
<%--                <div id="reviewField">리뷰 내용</div>--%>
<%--                <div id="review_content" class="review_content" disabled></div>--%>
<%--                <div>--%>
<%--                    작성일자<input--%>
<%--                        type="text" placeholder="작성일자" disabled id="write_date" class="write_date">--%>
<%--                </div>--%>
<%--                <div>--%>
<%--                    수정일자<input--%>
<%--                        type="text" placeholder="수정일자" disabled id="modified_date" class="modified_date">--%>
<%--                </div>--%>
<%--                <div>--%>
<%--                    리뷰번호<input--%>
<%--                        type="text" placeholder="리뷰번호" id="rseq" class="rseq" name="rev_seq">--%>
<%--                </div>--%>

<%--                <div class="btns">--%>
<%--                    <button type="button" id="deleteReview">삭제</button>--%>
<%--                    <button type="button" id="privateReview">비공개</button>--%>
<%--                    <button type="button" id="openReview">공개</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form>--%>
    <script src="/resources/js/member/myPage/myReview.js"></script>
</main>
</body>
</html>
