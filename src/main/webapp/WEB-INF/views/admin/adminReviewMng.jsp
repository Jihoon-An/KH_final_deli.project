<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-13
  Time: 오전 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <script>
        $(document).ready(function () {
            $('#myTable').DataTable();

            $("#rev_content").css("cursor", "pointer");

        });
    </script>

    <style>
        .modal {
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            top: 0;
            left: 0;
            display: none;
        }

        .modal_content {
            width: 400px;
            height: auto;
            background: #fff;
            border-radius: 10px;
            position: relative;
            top: 50%;
            left: 50%;
            margin-top: -100px;
            margin-left: -200px;
            text-align: center;
            box-sizing: border-box;
            padding: 74px 0;
            /*line-height: 23px;*/
            cursor: pointer;
        }
    </style>
</head>
<body>
<table id="myTable" class="display">
    <thead>
    <tr>
        <th>작성자</th>
        <th>리뷰내용</th>
        <th>상호명</th>
        <th>작성일자</th>
        <th>수정일자</th>
    </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${not empty nev_list}">
                <c:forEach var="i" items="${nev_list}">
        <tr>
                    <input type="hidden" value="${i.rev_seq}">
                    <input type="hidden" value="${i.rev_star}">

                    <td class="mem_name">${i.mem_name}</td>
                    <td id="rev_content">${i.rev_content}</td>
                    <td>${i.store_name}</td>
                    <td>${i.rev_writedate}</td>
                    <c:choose>
                        <c:when test="${i.rev_modified_date!=null}">
                            <td>${i.rev_modified_date}</td>
                        </c:when>
                    </c:choose>
                    <div class="modal">
                        <div class="modal_content">
                            <div class="closeModal">X</div>
                            <div>
                                작성자 <input
                                    type="text" placeholder="작성자" id="writer" class="writer" disabled
                                    value="${i.mem_name}">
                            </div>
                            <div>
                                별점 <input
                                    type="text" placeholder="별점" disabled value="${i.rev_star}">
                            </div>
                            <div>
                                작성시간<input
                                    type="text" placeholder="작성시간" disabled value="${i.rev_writedate}">
                            </div>
                            <div>
                                리뷰 내용<input
                                    type="text" placeholder="리뷰내용" disabled value="${i.rev_content}">
                            </div>
                            <div>
                                수정시간<input
                                    type="text" placeholder="수정시간" disabled value="${i.rev_modified_date}">
                            </div>
                            <button type="button">비공개</button>
                            <button id="deleteReview" type="button">삭제</button>
                        </div>
                    </div>
<%--                    <script>--%>
<%--                        $(".modal").hide();--%>
<%--                    </script>--%>
        </tr>
                </c:forEach>
            </c:when>
        </c:choose>
    </tbody>
</table>

<%--<form action="/admin/deleteReview">--%>
<%--    <div class="modal">--%>
<%--        <div class="modal_content">--%>
<%--            <div id="closeModal">X</div>--%>
<%--            <div>--%>
<%--                작성자 <input--%>
<%--                    type="text" placeholder="작성자" id="writer" class="writer" disabled--%>
<%--                    value="${i.mem_name}">--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                별점 <input--%>
<%--                    type="text" placeholder="별점" disabled value="${i.rev_star}">--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                작성시간<input--%>
<%--                    type="text" placeholder="작성시간" disabled value="${i.rev_writedate}">--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                리뷰 내용<input--%>
<%--                    type="text" placeholder="리뷰내용" disabled value="${i.rev_content}">--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                수정시간<input--%>
<%--                    type="text" placeholder="수정시간" disabled value="${i.rev_modified_date}">--%>
<%--            </div>--%>
<%--            <button type="button">비공개</button>--%>
<%--            <button id="deleteReview" type="button">삭제</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</form>--%>

<script>
    $(function () {

        $("#deleteReview").on("click", function () {
            let ans = confirm("리뷰를 삭제하시겠습니까?");
            if (ans == true) location.href = "/admin/deleteReview";
        });

        $("#rev_content").click(function () {
            $(".modal").fadeIn();

        });

        $(".closeModal").click(function () {
            $(".modal").fadeOut();
        });

    });
</script>
</body>
</html>
