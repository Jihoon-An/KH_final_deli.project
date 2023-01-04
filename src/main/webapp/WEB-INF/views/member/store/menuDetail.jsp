<%@ page import="kh.deli.domain.member.store.dto.BasketDTO" %><%--
  Created by IntelliJ IDEA.
  User: abg14
  Date: 2022-12-19
  Time: 오후 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<main id="menu_detail">
    <c:if test="${menu.menu_img ne null}">
    <img style="width: 100%; height: 260px; object-fit: cover;" src="/resources/img/menu-img/${menu.menu_img}" alt="menu_img">
    </c:if>
    <div class="container px-4">
        <div id="menu_name" class="text-center py-2">${menu.menu_name}</div>
        <div id="menu_intro" class="text-center">${menu.menu_intro}</div>
        <hr>
        <div class="row">
            <div class="col-6 fs-3 soft-bold">가격</div>
            <div class="col-6 fs-3 text-end soft-bold"><fmt:formatNumber value="${menu.menu_price}" type="number"/>원</div>
            <div id="menu_price" style="display: none;">${menu.menu_price}</div>
        </div>
        <hr>
        <c:forEach var="optionMap" items="${menuOptions}">
            <div class="option_map">
                <div class="option_group fs-4">${optionMap.key}</div>
                <div class="option_select">
                    <c:forEach var="option" items="${optionMap.value}">
                        <input type="hidden" class="required" value="${option.option_required}">
                        <c:choose>
                            <c:when test="${option.option_multiple eq 'N'}">
                                <div class="option pt-3 row">
                                    <div class="col-9">
                                        <input class="option_check form-check-input"
                                               name="${optionMap.key}" type="radio">
                                        <span>${option.option_name}</span>
                                    </div>
                                    <div class="col-3 text-end">
                                        <span>+<fmt:formatNumber value="${option.option_price}" type="number"/>원</span>
                                    </div>
                                    <input class="option_seq" type="hidden"
                                           value='${option.option_seq}'>
                                    <input class="option_price" type="hidden"
                                           value="${option.option_price}">
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="option pt-3 row">
                                    <div class="col-9">
                                        <input class="option_check form-check-input"
                                               type="checkbox">
                                        <span>${option.option_name}</span>
                                    </div>
                                    <div class="col-3 text-end">
                                        <span>+<fmt:formatNumber value="${option.option_price}" type="number"/>원</span>
                                    </div>
                                    <input class="option_seq" type="hidden"
                                           value='${option.option_seq}'>
                                    <input class="option_price" type="hidden"
                                           value="${option.option_price}">
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </div>
            <hr>
        </c:forEach>
        <div class="row">
            <div class="col-6 fs-4 soft-bold">
                수량선택
            </div>
            <div class="col-6">
                <div class="text-end input-group">
                    <button class="col-3 btn btn-secondary" type="button" id="minus_btn">-</button>
                    <input class="col-3 text-center form-control" type="number" id="menu_count"
                           min="1" value="1"
                           readonly/>
                    <button class="col-3 btn btn-secondary" type="button" id="plus_btn">+</button>
                </div>
            </div>
        </div>
        <div class="row text-center mt-4 pb-5">
            <button class="btn btn-danger" id="basket_btn" type="button" onclick="onModal()">
<%--            <span class="mx-0" id="total_price">--%>
<%--                ${menu.menu_price}--%>
<%--            </span>--%>
                <span class="mx-0" id="total_price">
                <fmt:formatNumber value="${menu.menu_price}" type="number"/>
            </span>
                <span class="mx-0">원 담기</span>
            </button>
        </div>
        <form action="/menu/detail/put" method="post" id="put_basket">
            <input type="hidden" name="basket_menu" id="basket_menu">
        </form>
    </div>
</main>
<script src="/resources/js/member/store/menuDetail.js"></script>
</body>
</html>
