<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-15
  Time: 오후 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="/WEB-INF/views/member/header/header.jsp" %>

<main id="storeSearch">
    <div class="container">
        <form action="/store/search">
            <input type="text" placeholder="검색해라" name="search">
            <button>검색</button>
        </form>
        <hr>
        <div class="d-inline-flex">
            <a href="/store/search?filter=star"><div class="filter py-1 px-2 m-1">별점</div></a>
            <a href="/store/search?filter=review"><div class="filter py-1 px-2 m-1">리뷰</div></a>
            <a href="/store/search?filter=delifree"><div class="filter py-1 px-2 m-1">무료배달</div></a>
            <a href="/store/search?filter=minprice"><div class="filter py-1 px-2 m-1">최소주문금액</div></a>
        </div>

        <hr>
        <div class="d-flex flex-column">
            <c:choose>
                <c:when test="${not empty store_list}">
                    <c:forEach var="store_list" items="${store_list}" varStatus="status">

                        <div class="store_list d-inline-flex m-2">
                            <div class="m-2 store_logo_box">
                                <c:choose>
                                    <c:when test="${store_list.STORE_LOGO !=null}">
                                        <div>
                                            <img class="store_logo" src="/resources/img/store/${store_list.STORE_LOGO}">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div>이미지: 사진없음</div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="m-2 store_info_box">
                                <div>식당명: ${store_list.STORE_NAME}</div>
                                <div>★${store_list.AVERAGE_STARS} / 리뷰 ${store_list.COUNT_REVIEW}개
                                    /
                                    <fmt:formatNumber var="DISTANCE" value="${store_list.DISTANCE}" pattern="#.##"/>
                                    <c:if test="${store_list.DISTANCE >= 1000}">
                                    <fmt:formatNumber value="${(DISTANCE) / (1000)}" pattern=".0"/>km</c:if>
                                    <c:if test="${store_list.DISTANCE < 1000}">${store_list.DISTANCE}m</c:if>
                                </div>
                                <div>최소주문금액: ${store_list.STORE_MIN_PRICE}원</div>
                                <div>배달요금: ${store_list.STORE_DELI_TIP}원</div>
                                <div class="menu_name">
                                    메뉴명:
                                    <c:forEach var="menu_list" items="${menu_list[status.index].menu_name}" varStatus="status2">
                                        ${menu_list}<c:if test="${!status2.last}">, </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    근처에 주문할 수 있는 가게가 없습니다.
                </c:otherwise>
            </c:choose>

            <!--
<%--          상호명${store_list.STORE_NAME}<BR>--%>
<%--          식당카테고리${store_list.STORE_CATEGORY}<BR>--%>
<%--          식당연락처${store_list.STORE_PHONE}<BR>--%>
<%--          식당코멘트${store_list.STORE_INTRO}<BR>--%>
<%--          최소주문금액${store_list.STORE_MIN_PRICE}<BR>--%>
<%--          배달팁${store_list.STORE_DELI_TIP}<BR>--%>
<%--          배달예상시간${store_list.STORE_DELI_TIME}<BR>--%>
<%--          식당영업시간${store_list.STORE_BSNS_HOURS}<BR>--%>
<%--          식당휴무일${store_list.STORE_CLOSE_DAY}<BR>--%>
<%--          기본위치${store_list.STORE_ADD_DETAIL1}<BR>--%>
<%--          상세위치${store_list.STORE_ADD_DETAIL2}<BR>--%>
<%--          위도${store_list.STORE_ADD_X}<BR>${store_list.STORE_ADD_Y}<BR>--%>
<%--          경도${store_list.STORE_LOGO}<BR>--%>
<%--          원산지${store_list.STORE_ORIGIN}<BR>--%>
<%--          오픈여부${store_list.STORE_OPEN}<BR>--%>
<%--          공개여부${store_list.STORE_DISPLAY}<BR>--%>
<%--          배달가능지역${store_list.STORE_DESTINATION}<BR>--%>
<%--          거리${store_list.STORE_DISTANCE}<BR>--%>
<%--          거리 ${store_list.DISTANCE}<BR>--%>
<%--          평균별점 ${store_list.AVERAGE_STARS}<BR>--%>
<%--          리뷰개수 ${store_list.COUNT_REVIEW}<BR>--%>

-->

        </div>
    </div>
</main>

</body>
</html>