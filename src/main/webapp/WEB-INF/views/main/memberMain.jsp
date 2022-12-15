<%--
  Created by IntelliJ IDEA.
  User: xiati
  Date: 2022-12-12
  Time: 오후 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원 메인페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
</head>
<body>
<div>
<table border="1px">
    <tr>
        <td><a>한식</a></td>
        <td><a>양식</a></td>
        <td><a>중식</a></td>
        <td><a>일식</a></td>
    </tr>
    <tr>
        <td><a>야식</a></td>
        <td><a>디저트</a></td>
        <td><a>아시안</a></td>
        <td><a>분식</a></td>
    </tr>
    <tr>
        <td colspan="4"><a href="/memberReviewForm/toMemberReviewForm">리뷰쓰기</a></td>
    </tr>
</table>
<c:choose>
    <c:when test="${not empty list}">
        <c:forEach var="cp" items="${list}">
            <div>
                <span>가게시퀀스 : ${cp.store_seq}</span>
                <span>평점 : ${cp.avg_star}</span> <%-- 소수점 첫째자리까지 --%>
                <span>가게이름 : ${cp.store_name}</span>
                <span>로고 : ${cp.store_logo}</span>
                <span>최소금액 : ${cp.store_min_price},</span>
                <span>배달팁 : ${cp.store_deli_tip},</span>
                <span>배달시간 : ${cp.store_deli_time}</span>
            </div>
        </c:forEach>
    </c:when>
</c:choose>
    <div>
        <h1>
            <a href="/account/logout"><button>로그아웃</button></a>
        </h1>
        <h2>
            <a href="/userMenu/toMyPage"><button>마이페이지</button></a>
        </h2>
    </div>
</div>
</body>
</html>