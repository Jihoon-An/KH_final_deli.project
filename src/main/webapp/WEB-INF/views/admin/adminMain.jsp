<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-20
  Time: 오후 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 운영자</title>
    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>

    <link rel="stylesheet" href="/resources/css/admin/adminMain.css" type="text/css">


    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['bar']});
        // google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['일자', '일별 매출'],
                <c:forEach var="sl" items="${salesList}" varStatus="status">
                ['${sl.daily_date}',${sl.sum_daily_sales}]<c:if test="${!status.last}">,</c:if>
                </c:forEach>
            ]);

            var options = {
                title: '딜리 일별 매출',
                curveType: 'function',
                bars: 'vertical',
                vAxis: {format: 'decimal'},
                colors: ['#E84C4F'],
                legend: { position: 'bottom' }

            };


            // var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
            var chart = new google.charts.Bar(document.getElementById('curve_chart'));

            var formatter = new google.visualization.NumberFormat({pattern:'###,###,###'});
            formatter.format(data,1);

            options.vAxis.format = 'decimal';
            chart.draw(data, google.charts.Bar.convertOptions(options));


            // chart.draw(data, options);
        }
    </script>
</head>

<%@ include file="/WEB-INF/views/customHeader/admin_nav.jsp" %>

<main id="adminMain">

    <h2 style="margin-top:60px; margin-bottom: 50px; text-align: center;">딜리 오늘의 매출은 0원입니다.</h2>
    <div id="curve_chart" style="width: 1000px; height: 700px; margin: 0 auto"></div>

<%--    <c:forEach var="sl" items="${salesList}" varStatus="status">--%>
<%--        ['${sl.daily_date}',${sl.sum_daily_sales}]<c:if test="${!status.last}">,</c:if>--%>
<%--    </c:forEach>--%>

    <script src="/resources/js/admin/adminMain.js"></script>
</main>
</div>


</body>
</html>