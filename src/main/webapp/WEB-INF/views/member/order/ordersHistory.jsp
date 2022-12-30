<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ykm
  Date: 2022-12-15
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>딜리 - 주문내역</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>
    <link rel="stylesheet" href="/resources/css/member/order/orderHistory.css" type="text/css">

</head>

<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_bell.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_cart.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_top.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>

<main id = "order_history">
    <hr class="mt55">
    <div class="container">
        <c:choose>
            <c:when test="${not empty order_list}">
                <c:forEach var="order_list" items="${order_list}" varStatus="status">

                    <jsp:useBean id="now" class="java.util.Date"/>
                    <fmt:parseNumber value="${now.time}" integerOnly="true"
                                     var="nowfmtTime" scope="request"/>
<%--                       <fmt:parseNumber var="parseDate" value="${order_list.order_date.time+(1000*60*60*24*30)}" integerOnly="true"  scope="request"/>--%>
                    <fmt:parseNumber var="parseDate" value="${order_list.order_date.time+( 1000 * 60 * 60 * 24*30  )}" integerOnly="true"  scope="request"/>
                          <%-- 주문날짜 기준 30일지나면 출력이 안된다--%>
                        <c:if test="${nowfmtTime<parseDate}">

                        <div class="box1">
                        <div class="box2">
                            <span class="head_deli">배달주문</span>
                            <span class="head_date">${order_list.formDate}</span>
                            <span class="head_status">
                            ${order_list.order_status}
<%--&lt;%&ndash;                <c:if test="${i.order_status=='order'}">미접수</c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${i.order_status=='take'}">접수</c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${i.order_status=='cooking'}">조리중</c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${i.order_status=='delivering'}">배달중</c:if>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:if test="${i.order_status=='complete'}">배달완료</c:if>&ndash;%&gt;--%>
            </span>
                        </div>
                        <div class="box3">

                            <c:if test="${order_list.store_logo==null}">
                                <div class="image-box"><img class="image-thumbnail" src="/resources/img/store/no_storelogo.png" id="profile"></div>
                            </c:if>
                            <c:if test="${order_list.store_logo!=null}">
                                <div class="image-box"><img class="image-thumbnail" src="/resources/img/store/${order_list.store_logo }" id="profile"></div>
                            </c:if>
                            <div class="info">
                                <a href="/store/menu/${order_list.store_seq}"><span class="storename">${order_list.store_name}</span></a>

                                <p class="meinfo">

<%--                                    <input type="hidden" value=" ${menu_list[status.index].menu.menu_name}" class="mName">--%>
<%--                                    <input type="hidden" value="${menu_list[status.index].count}" class="mCount">--%>
<%--                                    <input type="hidden" value="${menu_list[status.index].menu.menu_price}" class="mPrice">--%>
<%--                                    <input type="hidden" value="${menu_list[status.index].menu.store_seq}" class="mstore_seq">--%>
<%--                                    <input type="hidden" value="${menu_list[status.index].menu.menu_seq}" class="mmenu_seq">--%>


                                        ${menu_list[status.index].menu.store_seq}
                                        ${menu_list[status.index].menu.menu_price}

                                        ${menu_list[status.index].menu.menu_name} <%-- 메뉴명--%>



                                    <c:if test = "${menu_list[status.index].count>0}">
                                        x  ${menu_list[status.index].count}
                                    </c:if> <%-- 메뉴 0개 이상일때 --%>

                                    <c:if test = "${menu_count_list[status.index]>1}">
                                        외 ${menu_count_list[status.index]-1}건
                                    </c:if>  <%-- 또다른 메뉴가 추가로 있을떄 --%>



                                        <%--                        ${basketMenu[4].menu.menu_name} x ${basketMenu[0].count}--%>

                                        <%--                    <c:if test="${basketMenu[0].menu.menu_name!=null}">--%>
                                        <%--                        <c:forEach var="menu" items="${basketMenu}" varStatus="n">--%>
                                        <%--                            <c:if test="${n.index >0}">외 ${n.index}건</c:if>--%>
                                        <%--                        </c:forEach>--%>
                                        <%--                    </c:if>--%>

                                </p>

                                <div class="infoFooter">
                                <a href="/myPage/reviewWrite/${order_list.order_seq}"><button class="deli_btn">리뷰작성</button></a>

                                <a href="/order/detail/${order_list.order_seq}"><button class="deli_btn">주문상세</button></a>

                                 <a href="/order/history/${order_list.order_seq}"><button class="deli_btn" type="button">재주문</button></a>


<%--                                       <button class="deli_btn" type="button" onclick="toBaskett()">재주문</button>--%>
<%--                                    <form action="/menu/detail/toBasket" method="post" id="put_basket">--%>
<%--                                        <input type="hidden" name="basket_menu" id="basket_menu">--%>
<%--                                    </form>--%>

                                </div>
                                <c:if test="${order_list.order_status='배달완료'}">
                                </c:if>
                            </div>
                        </div>

                    </div>
                        </c:if>

                </c:forEach>
            </c:when>
            <c:otherwise>결제내역없음</c:otherwise>
        </c:choose>


        <div>

        </div>

    </div>

    <hr class="mt90">
</main>

<%--<script>--%>
<%--    var countt= ${menu_list[1].count};--%>
<%--    var selec_option = new Array();--%>
<%--    var one_pprice = ${menu_list[1].menu.menu_price}--%>


<%--        console.log(${menu_list[1].menu.store_seq})--%>
<%--        class BasketMenuDTOo{--%>
<%--            constructor(options, count, price) {--%>
<%--                this.storeSeq = ${menu_list[1].menu.store_seq}--%>
<%--                    this.menuSeq = ${menu_list[1].menu.menu_seq};--%>
<%--                this.optionSeqList = options;--%>
<%--                this.count = count;--%>
<%--                this.price = price;--%>
<%--            }--%>
<%--        }--%>
<%--</script>--%>

<%--<script>--%>
<%--    var countt= $(".mCount").val();--%>
<%--    var selec_option = new Array();--%>
<%--    var one_pprice = $(".mPrice").val()--%>

<%--        console.log($(".mstore_seq").val())--%>
<%--        class BasketMenuDTOo{--%>
<%--            constructor(options, count, price) {--%>
<%--                this.storeSeq = $(".mstore_seq").val()--%>
<%--                    this.menuSeq = $(".mmenu_seq").val();--%>
<%--                this.optionSeqList = options;--%>
<%--                this.count = countt;--%>
<%--                this.price = one_pprice;--%>
<%--            }--%>
<%--        }--%>
<%--</script>--%>



<script>
    // function putBaskett() {
    //     var basket = new BasketMenuDTOo(selec_option, countt, one_pprice);
    //     $("#basket_menu").val(JSON.stringify(basket));
    //
    //     $("#put_basket").submit();
    // }

    // function toBaskett() {
    //     var basket = new BasketMenuDTOo(selec_option, countt, one_pprice); //객체가
    //     $("#basket_menu").val(JSON.stringify(basket));
    //
    //     $("#put_basket").attr("action", "/menu/detail/toBasket").submit();
    // }
</script>
</body>
</html>
