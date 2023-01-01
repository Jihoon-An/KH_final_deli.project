<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 장바구니</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>

    <link rel="stylesheet" href=" /resources/css/member/order/basket.css" type="text/css">

</head>
<body>
    <%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>
<main id="basket">
    <div class="container">

        <div class="titleBox">
            장바구니
        </div>
        <c:choose>
            <c:when test="${not empty basket}">
                <input type="hidden" id="storeSeq" value="${store.store_seq}">
                <input type="hidden" id="minPrice" value="${store.store_min_price}">
                <div class="storeImgBox">
                    <img style="width: 30px; height: 30px;" src="/resources/img/store/${store.store_logo}">
                </div>
                <div class="storeNameBox">
                    <span id="storeNameSpan" style="font-size: 20px;">${store.store_name}</span>
                </div>
                <br>
                <hr>
                <c:forEach var="menuList" items="${basket}">
                    <div class="menuBox">

                        <div class="menuTopDiv">
                            <span class="menuNameSpan">
                                ${menuList.menuDTO.menu_name}
                            </span>
                            <button class="deleteBtn">X</button>
                        </div>

                        <div class="menuImgDiv">
                            <img src="/resources/img/menu-img/${menuList.menuDTO.menu_img}">
                        </div>

                        <div class="menuInfoDiv">
                            <ul class="menuInfo">
                                <li>
                                    가격 :
                                    <span class="menuPrice">
                                        <fmt:formatNumber value="${menuList.menuDTO.menu_price}" type="number"/>
                                    </span>원
                                </li>
                            <c:forEach var="optionMap" items="${menuList.menuOptionDTO}" varStatus="i">
<%--                                - 옵션 메뉴 SEQ : ${optionMap.menu_seq}<br>--%>
<%--                                - 옵션 SEQ : ${optionMap.option_seq}<br>--%>
                                <input type="hidden" class="inputOptionSeq" value="${optionMap.option_seq}">
                                <li class="optionInfo">
                                    ${optionMap.option_group} : ${optionMap.option_name}
                                    (<span class="optionPrice op${i.count}"><fmt:formatNumber value="${optionMap.option_price}" type="number"/></span>원)
                                </li>
                            </c:forEach>
                            </ul>

                            <div class="priceBox">
<%--                                메뉴 SEQ : ${menuList.menuDTO.menu_seq}<br>--%>
                                <input type="hidden" class="inputMenuSeq" value="${menuList.menuDTO.menu_seq}">
                                <span class="priceSpan">
                                    <fmt:formatNumber value="${menuList.price}" type="number"/>
                                </span>원
                            </div>
                        </div>

                        <div class="menuBottomDiv">
                            <div class="countBox input-group">
                                <button class="minus deli_btn" style="line-height: 10px;">-</button>
                                    <span class="countSpan form-control" style="height: 30px; line-height: 18px; font-size: 14px;">
                                            ${menuList.count}
                                    </span>
                                <button class="plus deli_btn"  style="height: 30px; line-height: 10px;">+</button>
                            </div>
                        </div>

                    </div>
                </c:forEach>
                <hr>
                <div class="deliveryInfoDiv">
                    <div class="deliInfoLeftBox">
                        총 주문금액 :<br>
                        배달팁 :
                        <hr>
                        <strong>결제예정금액 :</strong>
                    </div>
                    <div class="deliInfoRightBox">
                        <span id="totalPriceSpan">
                            <fmt:formatNumber value="${totalPrice}" type="number"/>
                        </span>원<br>
                        <span id="deliTipSpan">
                            <fmt:formatNumber value="${store.store_deli_tip}" type="number"/>
                        </span>원
                        <hr>
                        <strong>
                            <span id="payAmountSpan">
                                <fmt:formatNumber value="${payAmount}" type="number"/>
                            </span>원
                        </strong>
                    </div>
                </div>

                <div class="buttonBox">
                    <form id="payment">
                        <input type="hidden" id="payAmount" name="payAmount" value="">

                        <a href="/order/orders/">
                            <button type="button" id="pay">
                                <span id="countPB">${totalCount}</span>
                                <span id="orderPB">배달 주문하기</span>
                                <div id="totalPBBox">
                                    <span id="totalPB">${payAmount}</span>원
                                </div>
                            </button>
                        </a>
                    </form>
                </div>
            </c:when>
            <c:otherwise>
                <img src="/resources/img/cart_no_product.png" style="width: 345px; margin-top: 50px;">
            </c:otherwise>
        </c:choose>

    </div>


    <script src="/resources/js/member/order/basket.js"></script>
</main>
</body>
</html>
