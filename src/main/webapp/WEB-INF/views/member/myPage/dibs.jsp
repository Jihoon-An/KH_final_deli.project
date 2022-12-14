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
    <div>찜</div>
    <div>
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach var="i" items="${list}">
                    <div class="logoimg">이미지</div>
                    <div class="info">
                    </div>
                </c:forEach>
            </c:when>
        </c:choose>
    </div>
</div>
</body>
</html>