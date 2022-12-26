<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-16
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>배달기사전용페이지</title>
</head>
<body>

<main id="deliveryDtl">
    <div class="container">
        난수로 페이지 생성 /
        혹은 라이더 번호 입력해야 볼 수 있는 페이지 ㄱㄱ

        <h1>고객배달영수증</h1>
        <h4>주문번호</h4>
        <div>${storeInfoDTO.order_seq}</div>
        <h4>주문시간</h4>
        <div>${storeInfoDTO.order_date}</div>
        <h4>주문내역</h4>
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
<%--            <c:forEach var="menuList" items="${orderDetailDTOList}">--%>
<%--                <div class="menuBox">--%>
<%--                    메뉴 : ${menuList.menuDTO.menu_name} <br>--%>
<%--                    <c:forEach var="optionList" items="${menuList.menuOptionDTO}">--%>
<%--                        그룹 : ${optionList.option_group}<br>--%>
<%--                        옵션 : ${optionList.option_name} <br><br>--%>
<%--                    </c:forEach>--%>
<%--                        ${menuList.count}개<br>--%>
<%--                        ${menuList.price}원--%>
<%--                </div>--%>
<%--                <hr>--%>
<%--            </c:forEach>--%>
        </div>
        <hr>
        <h1>주문자정보</h1>
        <h4>연락처</h4>
        <div>${ordererInfoDTO.mem_phone}</div>
        <h4>주소</h4>
        <div>${ordererInfoDTO.address_add_detail1} ${ordererInfoDTO.orders_add_detail2}</div>
        <h4>라이더님에게 전달하는 말</h4>
        <div>${ordererInfoDTO.order_rider_req}</div>
        <hr>
        <h1>식당정보</h1>
        <h4>식당명</h4>
        <div>${storeInfoDTO.store_name}</div>
        <h4>연락처</h4>
        <div>${storeInfoDTO.store_phone}</div>
        <h4>주소</h4>
        <div>${storeInfoDTO.store_add_detail1} ${storeInfoDTO.store_add_detail2}</div>
        <hr>
        <button>배달완료</button>
        <hr>
        누르면 확인 창 한번 더 뜨고 완료 누르면 controller에서 배달완료로 변경 됨
    </div>
    배달 예상 시간 : ${storeInfoDTO.store_deli_time}분

</main>
</body>
</html>
