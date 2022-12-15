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

    <c:choose>
      <c:when test="${not empty address_List}">
        <c:forEach var="i" items="${address_List}">
        <c:if test="${i.add_division=='basics'}">checked</c:if>>
        </c:forEach>
      </c:when>
    </c:choose>

    <h3>검색 결과 00개</h3>
    <hr>
</main>

<script>
</script>

</body>
</html>
