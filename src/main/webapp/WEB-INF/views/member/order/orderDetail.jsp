<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-14
  Time: 오전 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <c:choose>
        <c:when test="${not empty storeInfoDTO}">
            <h3> ${storeInfoDTO.store_name}</h3>
            <div>주문 시간 : ${storeInfoDTO.order_date}</div>
            <div>배달 예상 시간 : ${storeInfoDTO.store_deli_time}분</div>
            <div>주문 번호 : ${storeInfoDTO.order_seq}</div>
        </c:when>
    </c:choose>
    <hr>
        <h3>주문내역</h3>
        <div>

            <c:forEach var="menuList" items="${basketMenu}">
                <div class="menuBox">
                    메뉴 : ${menuList.menu.menu_name} <br>
                    <c:forEach var="optionList" items="${menuList.optionList}">
                        그룹 : ${optionList.option_group}<br>
                        옵션 : ${optionList.option_name} <br>
                        옵션 수량 : ${optionList.option_multiple} <br>
                        가격 : ${optionList.option_price} <br><br>
                    </c:forEach>
                    ${menuList.count}개<br>
                    ${menuList.price}원
                </div>
                <hr>
            </c:forEach>

        </div>
    <hr>
    <c:choose>
        <c:when test="${not empty payInfoDTO}">
            <h3>결제정보</h3>
            <div>총주문금액 ${payInfoDTO.order_price}원</div>
            <div>쿠폰할인 -${payInfoDTO.discountByCoupon}</div>
            <div>포인트할인 -${payInfoDTO.order_point}</div>
            <div>배달팁 +${payInfoDTO.delivery_tip}</div>
            <hr>
            <div>총결제금액 ${payInfoDTO.pay_price}</div>
            <div>결제방법 ${payInfoDTO.pay_method}</div>
        </c:when>
    </c:choose>
    <hr>
    <c:choose>
        <c:when test="${not empty ordererInfoDTO}">
            <h3>주문자 정보</h3>
            <div>전화번호 : ${ordererInfoDTO.mem_phone}</div>
            <div>주소 : ${ordererInfoDTO.address_add_detail1}</div>
            <div>상세주소 : ${ordererInfoDTO.orders_add_detail2}</div>
            <div>가게요청사항 : ${ordererInfoDTO.order_store_req}</div>
            <div>배달요청사항 : ${ordererInfoDTO.order_rider_req}</div>
        </c:when>
    </c:choose>

    <div class="btn">
        <%--메인으로?--%>
        <button id="complete">완료</button>
    </div>
</div>

    <script src="/resources/js/member/order/orderDetail.js" ></script>
</main>
</body>
</html>
