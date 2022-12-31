<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 사업자</title>

    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>

    <link rel="stylesheet" href="/resources/css/owner/ownerMain.css" type="text/css">

    <%--  chart.js cdn  --%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body>

<%@ include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>

<main id="ownerMain">
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
            <div>하루 총 매출액 : <fmt:formatNumber value="${total}" pattern="#,###"/></div>
            <c:choose>
                <c:when test="${not empty dslist}">
                    <c:forEach var="j" items="${dslist}">
                        <c:choose>
                            <c:when test="${not empty j}">
                                <hr>
                                <div>식당번호 : ${j.store_seq}</div>
                                <div>식당이름 : ${j.store_name}</div>
                                <div>매출액 : <fmt:formatNumber value="${j.daily_sales}" pattern="#,###"/></div>
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

    <hr>
    <div style="width: 800px;"><canvas id="myChart"></canvas></div>

    <script src="/resources/js/owner/ownerMain.js"></script>
</main>
</body>
</body>
</html>