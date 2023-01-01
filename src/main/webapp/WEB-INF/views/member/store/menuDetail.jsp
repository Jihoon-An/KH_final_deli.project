<%@ page import="kh.deli.domain.member.store.dto.BasketDTO" %><%--
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
    <title>딜리 - 메뉴담기</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>
    <link href="/resources/css/member/store/menuDetail.css" rel="stylesheet">

</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_cart.jsp" %>
<main id="menu_detail">
    <img style="width: 100%;" src="/resources/img/menu-img/${menu.menu_img}" alt="menu_img">
    <div id="menu_name">${menu.menu_name}</div>
    <div id="menu_intro">${menu.menu_intro}</div>
    <hr>
    <div id="menu_price">${menu.menu_price}</div>

    <c:forEach var="optionMap" items="${menuOptions}">
        <div class="option_group">${optionMap.key}</div>
        <div class="option_select">
            <c:forEach var="option" items="${optionMap.value}">
                <input type="hidden" class="required" value="${option.option_required}">
                <c:choose>
                    <c:when test="${option.option_multiple eq 'N'}">
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
    var basketStoreSeq = '${basketStoreSeq}';
    console.log(basketStoreSeq);
</script>
<script src="/resources/js/member/store/menuDetail.js"></script>
</body>
</html>
