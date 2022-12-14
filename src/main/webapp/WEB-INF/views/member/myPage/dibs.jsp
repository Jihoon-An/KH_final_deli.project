<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>찜</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
</head>
<body>
<div>
    <div><Button>Back</Button></div>
    <hr>
    <div>찜</div>
    <hr>
    <div>
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach var="i" items="${list}">
                    <div class="logoimg">이미지: ${i.STORE_LOGO}</div>
                    <div class="info">
                        <div>식당명: ${i.STORE_NAME}</div>
                        <div>평점: </div>
                        <div>최소주문금액: ${i.STORE_MIN_PRICE}</div>
                        <div>배달팁: ${i.STORE_DELI_TIP}</div>
                        <div>배달시간: ${i.STORE_DELI_TIME}</div>
                        <div>찜 여부: </div>
                    </div>
                    <hr>
                </c:forEach>
            </c:when>
        </c:choose>
    </div>
</div>
</body>
</html>