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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <title>딜리 - 결제내역</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/member/order/orderDetail.css">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico"/>
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
<main id="orderDetail">
    <div class="container">
        <div class="store">
            <c:choose>
                <c:when test="${not empty storeInfoDTO}">
                    <h2 id="store_name" class="info"> ${storeInfoDTO.store_name}</h2>
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
            <h3 class="info">주문내역</h3>
            <div>
                <c:forEach var="menuList" items="${basketMenu}">
                    <div class="menuBox">
                        <div id="menu_name">${menuList.menu.menu_name} ${menuList.count}개</div>
                            <%--                        <c:forEach var="optionList" items="${menuList.optionList}">--%>
                        <c:choose>
                        <c:when test="${fn:length(optionList.option_name) != 0}">
                            <div class="orderContent">${optionList.option_group} 사이드 선택 : 후렌치 후라이
                                미디엄${optionList.option_name}
                                (2000<fmt:formatNumber value="${optionList.option_price}" pattern="#,###"/>원),
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="orderContent">${optionList.option_group} 사이드 선택 : 후렌치 후라이
                                미디엄${optionList.option_name}
                                (2000<fmt:formatNumber value="${optionList.option_price}" pattern="#,###"/>원)
                            </div>
                        </c:otherwise>
                        </c:choose>
                            <%--                        </c:forEach>--%>
                        <div class="orderContent">${menuList.price}원</div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <hr>
        <div class="pay">
            <c:choose>
                <c:when test="${not empty payInfoDTO}">
                    <h3 class="info">결제 정보</h3>
                    <div class="field">
                        <div id="total_money">총주문금액</div>
                        <div>쿠폰할인</div>
                        <div>포인트할인</div>
                        <div>배달팁</div>
                    </div>


                    <div class="price">
                        <div><fmt:formatNumber value="${payInfoDTO.order_price}" pattern="#,###"/>원</div>
                        <div id="coupon_discount">-<fmt:formatNumber value="${payInfoDTO.discountByCoupon}"
                                                                     pattern="#,###"/>원
                        </div>
                        <div id="point_discount">-<fmt:formatNumber value="${payInfoDTO.point}"
                                                                    pattern="#,###"/>원
                        </div>
                        <div id="delivery_tip"><fmt:formatNumber value="${payInfoDTO.delivery_tip}" pattern="#,###"/>원
                        </div>
                    </div>
                    <hr>

                    <div class="field pay_field">
                        <div>총 결제금액</div>
                        <div>결제방법</div>
                    </div>

                    <div class="pay_method">
                        <div><fmt:formatNumber value="${payInfoDTO.pay_price}" pattern="#,###"/>원</div>
                        <div>${payInfoDTO.pay_method}</div>
                    </div>
                    <hr>
                </c:when>
            </c:choose>
        </div>
        <div></div>
        <div class="orderer">
            <c:choose>
            <c:when test="${not empty ordererInfoDTO}">
            <h3 class="info">주문자 정보</h3>
            <div id="del_destination" class="orderTitle">배달주소</div>
            <div id="destination" style="font-size: small;" class="orderContent">
                    ${ordererInfoDTO.address_add_detail1} ${ordererInfoDTO.orders_add_detail2}</div>

            <div class="orderTitle">전화번호</div>
            <div id="phone" class="orderContent">${ordererInfoDTO.mem_phone}</div>
            <div class="orderTitle">가게요청사항</div>
            <div id="store_req" class="orderContent">${ordererInfoDTO.order_store_req}</div>
            <div class="orderTitle">배달요청사항</div>
            <div id="del_req" class="orderContent">${ordererInfoDTO.order_rider_req}</div>

            </c:when>
            </c:choose>
            <div class="btn">
                <%--메인으로?--%>
                <button id="complete">확인</button>
            </div>

            <script src="/resources/js/member/order/orderDetail.js"></script>
</main>
</body>
</html>
