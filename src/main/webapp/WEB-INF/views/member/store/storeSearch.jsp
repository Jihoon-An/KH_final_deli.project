<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-15
  Time: 오후 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>식당 검색 리스트</title>
  <!--jQuery-->
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"
          integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
  </script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>

  <style>
    #storeSearch .container {
      width: 375px;
      height: 800px;
      border: 1px solid black;
      margin: auto;
      text-align: center;
      padding-top: 50px;
    }
  </style>
</head>
<body>

<main id="storeSearch">
  <div class="container">
    <input type="text" placeholder="검색해라" name="search"><button>검색</button>
    <h3>검색 결과 00개</h3>
    <hr>

    <c:choose>
    <c:when test="${not empty store_list}">
    <c:forEach var="store_list" items="${store_list}">
    상호명${store_list.STORE_NAME}<BR>
    식당카테고리${store_list.STORE_CATEGORY}<BR>
    식당연락처${store_list.STORE_PHONE}<BR>
    식당코멘트${store_list.STORE_INTRO}<BR>
    최소주문금액${store_list.STORE_MIN_PRICE}<BR>
    배달팁${store_list.STORE_DELI_TIP}<BR>
    배달예상시간${store_list.STORE_DELI_TIME}<BR>
    식당영업시간${store_list.STORE_BSNS_HOURS}<BR>
    식당휴무일${store_list.STORE_CLOSE_DAY}<BR>
    기본위치${store_list.STORE_ADD_DETAIL1}<BR>
    상세위치${store_list.STORE_ADD_DETAIL2}<BR>
    위도${store_list.STORE_ADD_X}<BR>${store_list.STORE_ADD_Y}<BR>
    경도${store_list.STORE_LOGO}<BR>
    원산지${store_list.STORE_ORIGIN}<BR>
    오픈여부${store_list.STORE_OPEN}<BR>
    공개여부${store_list.STORE_DISPLAY}<BR>
    배달가능지역${store_list.STORE_DESTINATION}<BR>
      <c:if test=""></c:if>
    </c:forEach>
    </c:when>
    </c:choose>

</main>

<script>
</script>

</body>
</html>
