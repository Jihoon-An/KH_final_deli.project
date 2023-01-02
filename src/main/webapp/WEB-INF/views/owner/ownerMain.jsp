<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 사업자</title>

    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>

    <link rel="stylesheet" href="/resources/css/owner/ownerMain.css" type="text/css">

    <%--  chart.js cdn  --%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <%--data tables--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

</head>
<body>

<%@ include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>

<main id="ownerMain">
    <div class="container">
        <div class="infoBox">
                <h3 style="margin-top:60px; margin-bottom: 50px; text-align: center;">
                <c:if test="${total != 0}">
                    회원님의 오늘 하루 총 매출은 <fmt:formatNumber value="${total}" pattern="#,###"/> 원 입니다😋
                </c:if>
                <c:if test="${total == 0}">
                    회원님의 오늘 하루 총 매출은 0 원 입니다😑
                </c:if>
                </h3>
            <div id="graph" style="width: 300px;">
                <canvas id="ddSales"></canvas>
                <script>
                    const ddSales = document.getElementById('ddSales');

                    new Chart(ddSales, {
                        type: 'pie',
                        data: {
                            labels: [
                                <c:forEach var="ds" items="${dslist}" varStatus="status">
                                    '${ds.store_name}'<c:if test="${!status.last}">,</c:if>
                                </c:forEach>
                            ],
                            datasets: [{
                                label: '오늘 하루 매출',
                                data: [
                                    <c:forEach var="ds" items="${dslist}"  varStatus="status">
                                    '${ds.daily_sales}'<c:if test="${!status.last}">,</c:if>
                                    </c:forEach>
                                ],
                                borderWidth: 1
                            }]
                        }
                    });
                </script>
            </div>
        </div>
        <hr>
        <div>
            <h4 style="margin: 15px 0px;">매출보기</h4>
            <div id="optionCOn">
                <select>
                    <c:choose>
                        <c:when test="${not empty list}">
                            <c:forEach var="i" items="${list}">
                                <option class="storeOption"
                                        value="${i.store_seq}">${i.store_name}</option>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <option>식당을 추가해주세요</option>
                        </c:otherwise>
                    </c:choose>
                </select>
                <span>
                        기간선택</span>
                        <input type="date" id="startDate"> - <input type="date" id="endDate">

                <button id="optionBtn" type="button" class="deli_btn">검색</button>
            </div>
            <div>
                <table id="myTable">
                    <thead>
                    <tr>
                        <th class="date">매출일</th>
                        <th class="sales">매출</th>
                    </tr>
                    </thead>
                    <tbody class="storeSales">
                    <tr>
                        <td> 출력할 내용이 없습니다.</td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="/resources/js/owner/ownerMain.js"></script>
</main>


</body>
</html>