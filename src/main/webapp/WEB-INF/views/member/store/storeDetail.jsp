<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-17
  Time: 오전 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>식당상세메뉴</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <%--    <link rel="stylesheet" href="/resources/css/member/store/storeDetail.css">--%>
    <style>
        * {
            box-sizing: border-box;
        }

        .container {
            width: 360px;
            margin: auto;
        }

         /*div{border:1px solid black;}*/
        .header {
            overflow: hidden;
        }

        .header > div {
            text-align: center;
            width: 95%;
            margin: auto;
        }

        .header #storeName {
            line-height: 70px;
        }

        .header #star {
            width: 95%;
        }

        .header #reviewCount {
            width: 95%;
        }

        .header #storeInfo {
            word-wrap: break-word;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .deliveryInfo {
            width: 95%;
        }

        .deliveryInfo {
            border: 3px solid black;
            border-radius: 10px;
        }

        .deliveryInfo div {
            line-height: 27px;
        }

        .fieldBox {
            width: 95%;
            margin: auto;
            overflow: hidden;
        }

        .fieldBox div {
            float: left;
            width: 33.33%;
            height: 45px;
            text-align: center;
            line-height: 45px;
            margin-top: 10px;
        }

        .fieldBox div a {
            text-decoration: none;
            color: black;
        }

        .category {
            width: 340.5px;
            position: relative;
            overflow: hidden;
            left: 10px;
            margin-top: 10px;
        }

        .category div {
            float: left;
            position: relative;
            border: 1px solid black;
            border-radius: 10px;
            padding: 2px 5px;
            margin-right: 7px;
        }

        #menu {
            font-weight: bold;
            font-size: 1.6em

        }
    </style>
</head>
<body>
<%--<main id="storeDetail">--%>
<%--    <div class="container">--%>
<%--        <div class="storeIntro">--%>
<%--            <div class="store_name">상호명 : ${storeDTO.store_name}</div>--%>
<%--            <div><button class="heart">찜<input type="hidden" value="${storeDTO.store_seq}"></button></div>--%>
<%--            <div class="store_deli_time">배달시간 : ${storeDTO.store_deli_time}분</div>--%>
<%--            <div class="store_deli_tip">배달팁 : ${storeDTO.store_deli_tip}원</div>--%>
<%--            <div class="store_deli_tip">식당소개 : ${storeDTO.store_intro}</div>--%>
<%--            <c:choose>--%>
<%--                <c:when test="${not empty storeReviewCount}">--%>
<%--                    <div class="store_deli_tip">리뷰개수 : ${storeReviewCount}</div>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <div>리뷰개수 : 0개</div>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>

<%--            <c:choose>--%>
<%--                <c:when test="${not empty storeReviewAvg}">--%>
<%--                    <div>리뷰 평균 : ${storeReviewAvg}</div>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <div>리뷰 평균 : 0</div>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--        </div>--%>

<%--        <div class="fieldBox">--%>
<%--            <div id="menu"><h2><a href="#">메뉴</a></h2></div>--%>
<%--            <div id="info"><a href="/store/info">정보</a></div>--%>
<%--            <div id="review"><a href="/store/review">리뷰</a></div>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;메뉴 카테고리&ndash;%&gt;--%>
<%--        <div class="menuInfo">--%>
<%--            <c:choose>--%>
<%--                <c:when test="${not empty menuGroup}">--%>
<%--                    <c:forEach var="mGroup" items="${menuGroup}">--%>
<%--                        <div class="menu_group">${mGroup}</div>--%>
<%--                    </c:forEach>--%>
<%--                </c:when>--%>
<%--            </c:choose>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;메뉴 카테고리 -메뉴들&ndash;%&gt;--%>
<%--        <div class="menuDetailInfo">--%>
<%--            <c:choose>--%>
<%--                <c:when test="${not empty categoryList}">--%>
<%--                    <c:forEach var="categories" items="${categoryList}">--%>
<%--                        <div class="bottom_menu_group">${categories.menu_group}--%>
<%--                            <c:forEach var="menuList" items="${categories.menuList}">--%>
<%--                                <div class="menu">--%>
<%--                                    <div class="yyyy">--%>
<%--                                        <div>메뉴 이름 : ${menuList.menu_name}</div>--%>
<%--                                        <div>메뉴 가격 : ${menuList.menu_price}원</div>--%>
<%--                                        <div>메뉴 소개 : ${menuList.menu_intro}</div>--%>
<%--                                    </div>--%>
<%--                                    <c:choose>--%>
<%--                                        <c:when test="${not empty menuList.menu_img}">--%>
<%--                                            <div class="menu_img">--%>
<%--                                                <img src="/resources/img/menu-img/${menuList.menu_img}">--%>
<%--                                            </div>--%>
<%--                                        </c:when>--%>
<%--                                        <c:otherwise></c:otherwise>--%>
<%--                                    </c:choose>--%>
<%--                                </div>--%>
<%--                            </c:forEach>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                </c:when>--%>
<%--            </c:choose>--%>
<%--        </div>--%>

<%--        &lt;%&ndash;원산지&ndash;%&gt;--%>
<%--        <div class="origin">--%>
<%--            ${storeDTO.store_origin}--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <script src="/resources/js/member/store/storeDetail.js"></script>--%>
<%--</main>--%>
<div class="container">
    <div class="header">
        <div id="storeName">${storeDTO.store_name}</div>
        <div id="star"> 별 (${storeReviewAvg})</div>
        <div id="reviewCount">리뷰수(${storeReviewCount})</div>
        <div id="storeInfo">${storeDTO.store_intro}</div>
        <div class="deliveryInfo" style="text-align: left;">
            <div>최소주문금액 : ${storeDTO.store_min_price}원</div>
            <div>배달예상시간 : ${storeDTO.store_deli_time}분</div>
            <div>배달팁 : ${storeDTO.store_deli_tip}원</div>
        </div>
    </div>
    <div class="fieldBox">
        <div id="menu"><a href="#">메뉴</a></div>
        <div id="info"><a href="/store/info">정보</a></div>
        <div id="review"><a href="/store/review">리뷰</a></div>
    </div>
    <div class="category">
        <c:choose>
            <c:when test="${not empty menuGroup}">
                <c:forEach var="mGroup" items="${menuGroup}">
                    <div class="menuCategory">${mGroup}</div>
                </c:forEach>
            </c:when>
        </c:choose>
    </div>
    <hr>
    <div class="menu">
    </div>
</div>

</body>
</html>