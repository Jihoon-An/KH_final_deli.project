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

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">

    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico" />
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">

    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/member/order/orderHistory.css" type="text/css">

</head>

<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_bell.jsp" %>
<%--<%@ include file="/WEB-INF/views/customHeader/m_cart.jsp" %>--%>
<%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_top.jsp" %>

<main id = "order_history">
<div class="container">
    <c:choose>
    <c:when test="${not empty menu_list}">
    <c:forEach var="i" items="${menu_list}">
    <div class="box1">
        <div class="box2">
            <span class="head_deli">배달주문</span>
            <span class="head_date">${i.formDate}</span>
            <span class="head_status">
                ${i.order_status}
<%--                <c:if test="${i.order_status=='order'}">미접수</c:if>--%>
<%--                <c:if test="${i.order_status=='take'}">접수</c:if>--%>
<%--                <c:if test="${i.order_status=='cooking'}">조리중</c:if>--%>
<%--                <c:if test="${i.order_status=='delivering'}">배달중</c:if>--%>
<%--                <c:if test="${i.order_status=='complete'}">배달완료</c:if>--%>
            </span>
        </div>
        <div class="box3">
            <c:if test="${i.store_logo==null}">
                <div class="image-box"><img class="image-thumbnail" src="/resources/img/store/no_storelogo.png" id="profile"></div>
            </c:if>
            <c:if test="${i.store_logo!=null}">
                <div class="image-box"><img class="image-thumbnail" src="/resources/img/store/${i.store_logo }" id="profile"></div>
            </c:if>
            <div class="info">
                <span class="storename">${i.store_name}</span>
                <p class="meinfo">
                        ${basketMenu[0].menu.menu_name} x ${basketMenu[0].count}

                    <c:if test="${basketMenu[1].menu.menu_name!=null}">
                        <c:forEach var="menu" items="${basketMenu}" varStatus="n">
                            <c:if test="${n.index >0}">외 ${n.index}건</c:if>
                        </c:forEach>
                    </c:if>

                </p>
                <a href="/"><button>메인으로</button></a>
                <a href="/myPage/reviewWrite/${i.order_seq}"><button>리뷰작성</button></a>
                <a href="/order/detail/${i.order_seq}"><button>주문상세</button></a>
                <button>재주문</button>
            </div>
        </div>

    </div>
    </c:forEach>
    </c:when>
        <c:otherwise>결제내역없음</c:otherwise>
    </c:choose>
</div>



</main>
</body>
</html>