<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ykm
  Date: 2022-12-15
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docume7898nt</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
</head>
<style>
    * {
        box-sizing: border-box;
    }

    div {
        border: 1px solid black;
    }

    .container {
        width: 375px;
        height: 800px;
        margin-top: 30px;
        overflow: hidden;
    }
    .box1{
        width: 100%;
        height: 100px;
        margin-top: 40px;
    }
    .box2{
        width: 100%;
        height: 15%;
        /* font-size: 10px; */
    }
    .box3{
        width: 100%;
        height: 85%;
    }

    .headdeli{
        margin-right: 15px;
        height: 100%;
        padding-left: 3px;
    }
    .headdate{
        margin-right: 10px;
        padding-left: 3px;
    }
    .headstatus{
        float:right;
        padding-right: 3px;
    }
    .image-box {
        width:100px;
        height:60px;
        overflow:hidden;
        margin:0 auto;
        float: left;
    }
    .image-thumbnail {
        width:100%;
        height:100%;
        object-fit:scale-down;
    }
    .info{
        margin: 9px;
        width: 65%;
        height: 60px;
        float: left;

    }

    .storename{
        margin-left :2px;
        /* font-size: 10px; */
    }
    .storeloca{
        /* font-size: 10px; */
    }
    p{
        height: 10px;
    }
    .meinfo{
        /* font-size: 8px; */
    }
</style>
<body>
<c:choose>
    <c:when test="${not empty list}">
        <c:forEach var="i" items="${list}">
<div class="container">

    <div class="box1">
        <div class="box2">
            <span class="headdeli">배달주문</span>
            <span class="headdate">${i.order_date}</span>
            <span class="headstatus">${i.order_status}</span>
        </div>
        <div class="box3">
            <c:if test="${i.store_logo==null}">
                <div class="image-box"><img class="image-thumbnail" src="/resources/img/store/no_storelogo.png" id="profile"></div>
            </c:if>
            <c:if test="${i.store_logo!=null}">
                <div class="image-box"><img class="image-thumbnail" src="/resources/img/store/${i.store_logo }" id="profile"></div>
            </c:if>
            <div class="info">
                <span class="storename ">${i.store_name}</span>
                <span class="storeloca ">-${i.add_detail2}</span>
                <p><span class="meinfo">${i.menu_list}</span><span class="meinfo">${i.pay_price}</span></p>
                <button type="button">리뷰작성</button>
                <button>주문상세</button>
                <button>재주문</button>
            </div>
        </div>

    </div>

</div>
        </c:forEach>
    </c:when>
    <c:otherwise>결제내역없음</c:otherwise>
</c:choose>



</body>
</html>