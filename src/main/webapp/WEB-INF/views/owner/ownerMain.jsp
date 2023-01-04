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
<style>
    #deli_nav {
        min-height: 1700px;
    }
</style>

<main id="ownerMain">
    <div class="container">
        <div class="infoBox">
            <h3 style="margin-top:60px; margin-bottom: 50px; text-align: center;">
                <c:if test="${total != 0}">
                    회원님의 오늘 하루 총 매출은 <span id="titlefont"><fmt:formatNumber value="${total}" pattern="#,###"/></span> 원 입니다😋
                </c:if>
                <c:if test="${total == 0}">
                    회원님의 오늘 하루 총 매출은 <span id="titlefont">0</span> 원 입니다😑
                </c:if>
            </h3>
            <c:if test="${total != 0}">
                <div id="graph" style="width: 300px;">
                    <canvas id="ddSales"></canvas>
                    <script>
                        const ddSales = document.getElementById('ddSales');

                        new Chart(ddSales, {
                            type: 'pie',
                            data: {
                                labels: [
                                    <c:forEach var="ds" items="${dslist}" varStatus="status">
                                    '${ds.store_name}'<c:if test="${!status.last}">, </c:if>
                                    </c:forEach>
                                ],
                                datasets: [{
                                    label: '오늘 하루 매출',
                                    data: [
                                        <c:forEach var="ds" items="${dslist}"  varStatus="status">
                                        '${ds.daily_sales}'<c:if test="${!status.last}">, </c:if>
                                        </c:forEach>
                                    ],
                                    borderWidth: 1
                                }]
                            }
                        });
                    </script>
                </div>
            </c:if>
            <h4 style="margin-top:30px; text-align: center;">
                어제와 오늘의 주문건수 비교하기
            </h4>
            <span class="expain" style="text-align: center;">
                어제의 주문건수와 오늘의 주무건수를 비교할 수 있습니다. <br>비교하기는 오늘의 주문이 들어온 식당만 가능합니다.
            </span>
            <div class="memo">
                <c:if test="${total != 0}">
                <select id="memoSelect">
                    <c:forEach var="ds" items="${dslist}">
                        <option class="storeSeqOpt"
                                value="${ds.store_seq}">${ds.store_name}
                            </option>
                    </c:forEach>
                </select>
                <button id="orderCtnBtn" type="button" class="deli_btn">비교하기</button>
                </c:if>
                <div id="memo">
                </div>
            </div>
        </div>

        <hr>
        <div>
            <h4 style="margin-top: 15px; margin-bottom: 5px;">매출보기</h4>
            <span class="expain">
                매일 00시 00분에 하루전 매출을 자동산출합니다. 매출보기는 전날까지의 매출을 볼 수 있습니다.
            </span>
            <div id="optionCon">
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
                        <th class="orderCnt">주문건수</th>
                    </tr>
                    </thead>
                    <tbody class="storeSales">
                    <tr>
                        <td> 출력할 내용이 없습니다.</td>
                        <td></td>
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