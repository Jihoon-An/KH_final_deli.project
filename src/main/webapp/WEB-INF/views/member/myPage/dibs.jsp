<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>찜</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" href="/resources/css/member/myPage/dibs.css" type="text/css">
</head>
<body>
<main id="dibs">
    <div class="container">
        <div>
            <a href="/">
                <Button> Back</Button>
            </a>
        </div>
        <hr>
        <div>찜</div>
        <hr>
        <div>
            <c:choose>
                <c:when test="${not empty list}">
                    <c:forEach var="i" items="${list}" varStatus="status">
                        <c:choose>
                            <c:when test="${i.STORE_LOGO !=null}">
                                <div>
                                    <img class="storeLogo" src="/resources/img/store/${i.STORE_LOGO}">
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>이미지: 사진없음</div>
                            </c:otherwise>
                        </c:choose>
                        <div class="info">
                            <div>식당명: ${i.STORE_NAME}</div>
                            <div>평점: ${i.avg_star}</div>
                            <div>최소주문금액: ${i.STORE_MIN_PRICE}</div>
                            <div>배달팁: ${i.STORE_DELI_TIP}</div>
                            <div>배달시간: ${i.STORE_DELI_TIME}</div>
                            <div>
                                <button class="heart">찜</button>
                            </div>
                        </div>
                        <hr>
                    </c:forEach>
                </c:when>
            </c:choose>
        </div>
    </div>
</main>
<script src="/resources/js/member/myPage/dibs.js"></script>
</body>
</html>