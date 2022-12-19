<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>사업자 메인페이지</title>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" href="/resources/css/owner/ownerMain.css" type="text/css">

</head>
<body>
<main id="ownerMain">

    <div class="container">
        <div class="leftBox"> </div>
        <div class="rightbox">
            <div>
                메인페이지
                <c:choose>
                    <c:when test="${not empty list}">
                        <c:forEach var="i" items="${list}">
                            <hr>
                            <div>사업자회원번호 : ${i.owner_seq}</div>
                            <div>식당번호 : ${i.store_seq}</div>
                            <div>식당명 : ${i.store_name}</div>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
            <hr>
            <div class="infoBox">
                <div>하루 총 매출액 : ${total}</div>
                <c:choose>
                    <c:when test="${not empty dslist}">
                        <c:forEach var="j" items="${dslist}">
                            <c:choose>
                                <c:when test="${not empty j}">
                                    <hr>
                                    <div>식당번호 : ${j.store_seq}</div>
                                    <div>식당이름 : ${j.store_name}</div>
                                    <div>매출액 : ${j.daily_sales}</div>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
            <hr>
            <div>
                <a href="/account/logout">[유저+오너]로그아웃</a><br>
                <a href="/account/withdrawal">[유저+오너]회원탈퇴</a><br>
            </div>
        </div>
    </div>

        <script src="/resources/js/owner/ownerMain.js"></script>
</main>
</body>
</html>