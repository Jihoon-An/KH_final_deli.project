<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-14
  Time: 오전 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <title>memberOrder</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" href="/resources/css/member/order/orderDetail.css">

</head>
<body>
<main id="orderDetail">
    <div class="container">
        <div class="store">
            <c:choose>
                <c:when test="${not empty storeInfoDTO}">
                    <h3> ${storeInfoDTO.store_name}</h3>
                    <div>주문일시 :
                        <fmt:parseDate value="${storeInfoDTO.order_date}" var="registered"
                                       pattern="yyyy-MM-dd HH:mm:ss"/>
                        <fmt:formatDate value="${registered}" pattern="yyyy년 MM월 dd일 a h:mm"/>
                    </div>
                    <div id="del_time">배달예상시간 : ${storeInfoDTO.store_deli_time}분</div>
                    <div id="order_num">주문번호 : ${storeInfoDTO.order_seq}</div>
                </c:when>
            </c:choose>
        </div>
        <hr>
        <div class="order">
            <h3>주문내역</h3>
            <div>
                <c:forEach var="menuList" items="${basketMenu}">
                    <div class="menuBox">
                        <div id="menu_name">${menuList.menu.menu_name} ${menuList.count}개</div>
<%--                        <c:forEach var="optionList" items="${menuList.optionList}">--%>
                            <div>그룹 : ${optionList.option_group}음료</div>
                            <div>옵션 : ${optionList.option_name}</div>
                            <div>옵션 수량 : ${optionList.option_multiple}</div>
                            <div>가격 : ${optionList.option_price}</div>
<%--                        </c:forEach>--%>
                        <div>${menuList.price}원</div>
                    </div>
                    <hr>
                </c:forEach>

            </div>
        </div>
        <hr>
        <div class="pay">
            <c:choose>
                <c:when test="${not empty payInfoDTO}">
                    <h3>결제정보</h3>
                    <div class="field">
                        <div id="total_money">총주문금액</div>
                        <div>쿠폰할인</div>
                        <div>포인트할인</div>
                        <div>배달팁</div>
                    </div>

                    <div class="price">
                        <div>${payInfoDTO.order_price}원</div>
                        <div id="coupon_discount">-${payInfoDTO.discountByCoupon}</div>
                        <div id="point_discount">-${payInfoDTO.order_point}</div>
                        <div id="coupon_discount">${payInfoDTO.delivery_tip}원</div>
                    </div>
                    <hr>
                    <div class="field pay_field">
                        <div>총 결제금액</div>
                        <div>결제방법</div>
                    </div>

                    <div class="pay_method">
                        <div>${payInfoDTO.pay_price}</div>
                        <div>${payInfoDTO.pay_method}</div>
                    </div>
                </c:when>
            </c:choose>
        </div>
        <hr>
        <div class="orderer">
            <c:choose>
            <c:when test="${not empty ordererInfoDTO}">
            <h3>주문자 정보</h3>
            <div id="del_destination">배달주소</div>
            <div id="destination" style="font-size: small;">
                    ${ordererInfoDTO.address_add_detail1} ${ordererInfoDTO.orders_add_detail2}</div>
            <hr>
            <div>전화번호
                <div id="phone">${ordererInfoDTO.mem_phone}</div>
                <hr>
                <div>가게요청사항
                    <div id="store_req">${ordererInfoDTO.order_store_req}</div>
                    <hr>
                    <div>배달요청사항
                        <div id="del_req">${ordererInfoDTO.order_rider_req}</div>
                    </div>
                    </c:when>
                    </c:choose>
                </div>
                <div class="btn">
                    <%--메인으로?--%>
                    <button id="complete">완료</button>
                </div>
            </div>

            <script src="/resources/js/member/order/orderDetail.js"></script>
            <%--            <%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>--%>
</main>
</body>
</html>
