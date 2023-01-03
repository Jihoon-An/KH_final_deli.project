<%--
  Created by IntelliJ IDEA.
  User: Minseop
  Date: 2022-12-20
  Time: 오후 5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>딜리 - 내 포인트/쿠폰</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>
    <link rel="stylesheet" href="/resources/css/member/myPage/memberCouponPoint.css" type="text/css">

</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>
<main id="memberCouponPoint">

    <div class="container">

        <div class="titleBox">
            쿠폰&포인트
        </div>

        <div class="pointBox">
            <div class="pointLeftSpan">
                보유 포인트
            </div>
            <div class="pointRightSpan">
                ${point}P
            </div>
        </div>

        <hr>

        <div class="couponBox">
            <div class="couponTopBox">
                보유 쿠폰
                <span id="couponCountSpan">${coupons.size()}</span>장
            </div>

            <c:forEach var="coupons" items="${coupons}">
                <div class="coupon">
                    <div class="couponHead">
                        <div class="couponLabelBox">
                            <label class="deliveryLabel">배달</label>
                            <label class="pickUpLabel">포장</label>
                        </div>
                        <div class="periodBox">
<%--                            기한 ${coupons.cp_period}일--%>
                            ~ <fmt:formatDate value="${coupons.mc_deadline}" pattern="yyyy.MM.dd"/>까지
                        </div>
                    </div>
                    <div class="couponInfo">
                        <span class="couponNameSpan">
                            ${coupons.cp_name}
                        </span>
                        <p>
                            <span class="couponContentSpan">
                                ${coupons.cp_content}
                            </span>
                        </p>
                    </div>

<%--                    쿠폰 SEQ : ${coupons.cp_seq}--%>
<%--                    쿠폰 코드 : ${coupons.cp_code}--%>
<%--                    쿠폰 할인 : ${coupons.cp_discount}--%>
<%--                    쿠폰 타입 : ${coupons.cp_type}--%>
                </div>
            </c:forEach>

        </div>

    </div>

</main>

</body>
</html>
