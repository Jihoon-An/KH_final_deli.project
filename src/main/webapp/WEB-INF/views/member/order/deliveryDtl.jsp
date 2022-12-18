<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-16
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>배달기사전용페이지</title>
</head>
<body>

<main id="storeSearch">
    <div class="container">
        <h1>고객배달영수증</h1>
        <h4>주문번호</h4>
        <div>${storeInfoDTO.order_seq}</div>
        <h4>주문시간</h4>
        <div>${storeInfoDTO.order_date}</div>
        <h4>주문내역</h4>
        <div>메뉴 출력</div>
        <hr>
        <h1>주문자정보</h1>
        <h4>연락처</h4>
        <div>${ordererInfoDTO.mem_phone}</div>
        <h4>주소</h4>
        <div>${ordererInfoDTO.address_add_detail1} ${ordererInfoDTO.orders_add_detail2}</div>
        <h4>배송요청사항</h4>
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
