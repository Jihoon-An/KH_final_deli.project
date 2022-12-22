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
    <%@ include file="/WEB-INF/views/member/header/temporaryNavi.jsp" %>
    <div class="container">
        <div>
            메인페이지
            <table border="1px solid black">
                <c:choose>
                    <c:when test="${not empty list}">
                        <c:forEach var="i" items="${list}">
                            <tr>
                                <td>사업자회원번호 : ${i.owner_seq}</td>
                                <td>식당번호 : ${i.store_seq}</td>
                                <td>식당명 : ${i.store_name}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </table>
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
            <div>
                <select>
                    <c:choose>
                        <c:when test="${not empty list}">
                            <c:forEach var="i" items="${list}">
                                <option class="storeOption"
                                        value="${i.store_seq}">${i.store_seq}+${i.store_name}</option>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <option>식당을 추가해주세요</option>
                        </c:otherwise>
                    </c:choose>
                </select>
                <span>
                        기간선택
                        <input type="date" id="startDate"> - <input type="date" id="endDate">
                    </span>
                <button id="optionBtn" type="button">검색</button>
            </div>
            <div class="storeSales">

            </div>
        </div>
        <hr>
        <div>
            <a href="/account/logout">[유저+오너]로그아웃</a><br>
            <a href="/account/withdrawal">[유저+오너]회원탈퇴</a><br>
        </div>
    </div>

    <script src="/resources/js/owner/ownerMain.js"></script>
</main>
</body>
</html>