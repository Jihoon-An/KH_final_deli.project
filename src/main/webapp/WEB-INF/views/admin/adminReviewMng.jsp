<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-13
  Time: 오전 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .modal{
            position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
        }

        .modal_content{
            width:400px; height:200px;
            background:#fff; border-radius:10px;
            position:relative; top:50%; left:50%;
            margin-top:-100px; margin-left:-200px;
            text-align:center;
            box-sizing:border-box; padding:74px 0;
            line-height:23px; cursor:pointer;
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
        <c:choose>
            <c:when test="">
                <th>수정일자</th>
            </c:when>
        </c:choose>
    </tr>
    </thead>
    <tbody>
    <tr>
        <c:choose>
            <c:when test="${not empty nev_list}">
                <c:forEach var="i" items="${nev_list}">
                    <td>${i.mem_name}</td>
                    <td id="rev_content">${i.rev_content}</td>
                    <td>${i.store_name}</td>
                    <td>${i.rev_writedate}</td>
                    <c:choose>
                        <c:when test="${i.rev_modified_date!=null}">
                            <th>수정일자</th>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </c:when>
        </c:choose>
    </tr>
    </tbody>
</table>

<div class="modal">
    <div class="modal_content">
        <div id="closeModal">X</div>
     <div>작성자</div>
        <div>제목</div>
    </div>
</div>

<script>
    $(function(){

        $("#rev_content").click(function(){
            $(".modal").fadeIn();
        });

        $("#closeModal").click(function(){
            $(".modal").fadeOut();
        });

    });
</script>
</body>
</html>
