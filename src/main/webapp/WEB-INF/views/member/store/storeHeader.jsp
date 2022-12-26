<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-26
  Time: 오전 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title></title>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
</head>
<body>
<div class="header">
    <div id="storeName">${storeInfoDTO.store_name}</div>
    <div id="star"> 별 (${storeReviewAvg})</div>
    <div id="reviewCount">리뷰수(${storeReviewCount})</div>
    <div id="storeInfo">${storeInfoDTO.store_intro}</div>
    <div class="deliveryInfo" style="text-align: left;">
        <div>최소주문금액 : ${storeInfoDTO.store_min_price}원</div>
        <div>배달예상시간 : ${storeInfoDTO.store_deli_time}분</div>
        <div>배달팁 : ${storeInfoDTO.store_deli_tip}원</div>
    </div>
</div>
</body>
</html>
