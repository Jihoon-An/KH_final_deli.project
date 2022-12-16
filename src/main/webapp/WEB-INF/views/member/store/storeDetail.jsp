<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-15
  Time: 오후 4:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>memberOrder</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" href="/resources/css/member/store/storeDetail.css">
</head>
<body>
<main id="storeDetail">
    <div class="container">
        <div class="storeIntro">
            <div class="store_name">상호명 : ${storeDTO.store_name}</div>
            <div class="store_deli_time">배달시간 : ${storeDTO.store_deli_time}분</div>
            <div class="store_deli_tip">배달팁 : ${storeDTO.store_deli_tip}원</div>
            <div class="store_deli_tip">식당소개 : ${storeDTO.store_intro}</div>
            <div class="store_deli_tip">리뷰개수 : ${storeReviewCount}</div>
        </div>
        <div class="fieldBox">
            <div id="menu">메뉴</div>
            <div id="info">정보</div>
            <div id="review">리뷰</div>
        </div>

        <%--        메뉴 카테고리--%>
        <div class="menuInfo">
            <c:choose>
                <c:when test="${not empty menuGroup}">
                    <c:forEach var="i" items="${menuGroup}">
                        <div class="menu_group">${menuGroup}</div>
                    </c:forEach>
                </c:when>
            </c:choose>
        </div>

        <%--        메뉴 카테고리 -메뉴들--%>
        <div class="menuDetailInfo">
            <c:choose>
                <c:when test="${not empty categoryList}">
                    <c:forEach var="i" items="${categoryList}">
                        <div class="bottom_menu_group">${i.menu_group}
                            <c:forEach var="k" items="${i.menuList}">

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
</main>
</body>
</html>
