<%@ page import="kh.deli.global.entity.MenuDTO" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: abg14
  Date: 2022-12-19
  Time: 오후 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <title>Title</title>
    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico" />
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <%--sweetalert--%>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
    <link href="/resources/css/member/store/menuDetail.css" rel="stylesheet">
    <%--헤더 css--%>
    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
<main id="menu_detail">
    <img src="/resources/img/menu-img/${menu.menu_img}" alt="menu_img">
    <div id="menu_name">${menu.menu_name}</div>
    <div id="menu_intro">${menu.menu_intro}</div>
    <hr>
    <div id="menu_price">${menu.menu_price}</div>

    <c:forEach var="optionMap" items="${menuOptions}">
        <div class="option_group">${optionMap.key}</div>
        <div class="option_select">
            <c:forEach var="option" items="${optionMap.value}">
                <c:choose>
                    <c:when test="${option.option_multiple eq 'Y'}">
                        <div class="option">
                            <input class="option_check" name="${optionMap.key}" type="radio">

                            <span>${option.option_name}</span>
                            <span>+${option.option_price}</span>

                            <input class="option_seq" type="hidden" value='${option.option_seq}'>
                            <input class="option_price" type="hidden"
                                   value="${option.option_price}">
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="option">
                            <input class="option_check" type="checkbox">

                            <span>${option.option_name}</span>
                            <span>+${option.option_price}</span>

                            <input class="option_seq" type="hidden" value='${option.option_seq}'>
                            <input class="option_price" type="hidden"
                                   value="${option.option_price}">
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:forEach>

    <hr>
    수량선택
    <div>
        <button type="button" id="minus_btn">-</button>
        <input type="number" id="menu_count" min="1" value="1"/>
        <button type="button" id="plus_btn">+</button>
    </div>
    총주문금액
    <div id="total_price">
        ${menu.menu_price}
    </div>
    <button type="button" onclick="onModal()">장바구니 담기</button>
    <form action="/menu/detail/put" method="post" id="put_basket">
        <input type="hidden" name="basket_menu" id="basket_menu">
    </form>

</main>
<script>
    var count = 1;
    var select_option = new Array();
    var one_price = ${menu.menu_price};

    class BasketMenuDTO {
        constructor(options, count, price) {
            this.storeSeq = ${menu.store_seq}
                this.menuSeq = ${menu.menu_seq};
            this.optionSeqList = options;
            this.count = count;
            this.price = price;
        }
    }
</script>
<script src="/resources/js/member/store/menuDetail.js"></script>
</body>
</html>
