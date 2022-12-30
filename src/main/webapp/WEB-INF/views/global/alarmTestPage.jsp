<%--
  Created by IntelliJ IDEA.
  User: abg14
  Date: 2022-12-24
  Time: 오후 7:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>alarm</title>
    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>

    <link href="/resources/css/global/alarm.css" rel="stylesheet">
    <script src="/resources/js/global/alarm.js"></script>
</head>
<body>

<%--WS 테스트용--%>
<input type="text" id="test_input">
<button type="button"id="test_btn">신호 보내기</button>
<div id="test_div"></div>
<button type="button" id="test_message" onclick="testMessage()">test message</button>

</body>
</html>
