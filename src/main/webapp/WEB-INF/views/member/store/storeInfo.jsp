<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-16
  Time: 오전 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title></title>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
</head>
<body>
<%--        메뉴 카테고리--%>
<div class="menuInfo">
    <c:choose>
        <c:when test="${not empty menuGroup}">
            <c:forEach var="i" items="${menuGroup}">
                <div class="menu_group">${i.menu_group}</div>
            </c:forEach>
        </c:when>
    </c:choose>
</div>

<%--        메뉴 카테고리 -메뉴들--%>
<div class="menuDetailInfo">
    <c:choose>
        <c:when test="${not empty menuGroup}">
            <c:forEach var="i" items="${menuGroup}">
                <div class="bottom_menu_group">${i.menu_group}
                    <c:forEach var="k" items="${menuList}">

                        <div class="menu">
                            <div class="yyyy">
                                <div>메뉴 이름 : ${k.menu_name}</div>
                                <div>메뉴 가격 : ${k.menu_price}원</div>
                                <div >메뉴 소개 : ${k.menu_intro}</div>
                            </div>
                            <div class="menu_img">img</div>
                        </div>
                    </c:forEach>

                </div>
            </c:forEach>
        </c:when>
    </c:choose>
</div>

<%--원산지--%>
<div class="origin">
    <c:choose>
        <c:when test="${not empty menuOrigin}">
            <c:forEach var="i" items="${menuOrigin}">
                <div class="menu_origin">${i.store_origin}</div>
            </c:forEach>
        </c:when>
    </c:choose>
</div>
</div>
</body>
</html>
