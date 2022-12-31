<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>
    <title>딜리 - 식당메뉴</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>
    <link rel="stylesheet" href="/resources/css/member/store/storeDetail.css">
    <link rel="stylesheet" href="/resources/css/member/store/storeInfo.css">
    <link rel="stylesheet" href="/resources/css/member/store/storeReview.css">
</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_cart.jsp" %>
<main id="store_detail">
    <div class="container">
        <%@ include file="/WEB-INF/views/member/store/storeMenu.jsp" %>
    </div>
</main>
</body>