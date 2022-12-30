<%--
  Created by IntelliJ IDEA.
  User: Minseop
  Date: 2022-12-20
  Time: 오후 5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 내 포인트/쿠폰</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>
    <link rel="stylesheet" href="/resources/css/member/myPage/memberCouponPoint.css" type="text/css">
</head>
<body>

<main id="memberCouponPoint">

    <div class="container">

        <div class="pointBox">
            보유 포인트 : ${point}P
        </div>

        <hr>

        <div class="couponBox">

            <c:forEach var="coupons" items="${coupons}">
                <div class="coupon">
                    쿠폰 SEQ : ${coupons.cp_seq}<br>
                    쿠폰 코드 : ${coupons.cp_code}<br>
                    쿠폰 이름 : ${coupons.cp_name}<br>
                    쿠폰 컨텐츠 : ${coupons.cp_content}<br>
                    쿠폰 할인 : ${coupons.cp_discount}<br>
                    쿠폰 타입 : ${coupons.cp_type}<br>
                    쿠폰 기간 : ${coupons.cp_period}
                    <hr>
                </div>
            </c:forEach>

        </div>

    </div>

</main>

</body>
</html>
