<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Deli Search</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">

    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico"/>
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <!-- daumPostcode -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- kakaoMap -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>

    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <!-- sweetalert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">

    <!-- StyleSheet-->
    <link rel="stylesheet" href="/resources/css/member/store/storeSearch.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">


</head>
<body>

<%@ include file="/WEB-INF/views/customHeader/m_bell.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_cart.jsp" %>
<jsp:include page="/member/header/destination/click"/>
<%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_top.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<c:import url="/member/header/destination"/>

<%--<%@ include file="/WEB-INF/views/customHeader/m_destinationChange.jsp" %>--%>
<%--<jsp:include page="/member/header/destination"/>--%>

<main id="storeSearch">

    <hr class="mt65">

    <div class="container">
        <form action="/store/search">
            <div class="search">
                <input type="text" class="searchTerm" placeholder="가게나 메뉴를 검색해보세요" name="search" maxlength="19">
                <button type="submit" class="searchButton">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </form>

        <div class="filter_box">
            <div style="margin: 0 auto" class="d-inline-flex">
                <a href="/store/search?filter=star">
                    <div class="filter" style="margin-right: 7px">별점순</div>
                </a>
                <a href="/store/search?filter=review">
                    <div class="filter" style="margin-right: 7px">리뷰순</div>
                </a>
                <a href="/store/search?filter=delifree">
                    <div class="filter" style="margin-right: 7px">무료배달만</div>
                </a>
                <a href="/store/search?filter=minprice">
                    <div class="filter">최소주문금액순</div>
                </a>
            </div>
        </div>

        <div class="d-flex flex-column">
            <p class="p1_font">식당<span class="span1_font">(${fn:length(store_list)})</span></p>
            <c:choose>
                <c:when test="${not empty store_list}">
                    <c:forEach var="store_list" items="${store_list}" varStatus="status">
                        <a href="/store/menu/${store_list.STORE_SEQ}">
                            <div class="store_list d-inline-flex">
                                <div class="m-2 store_logo_box">
                                    <c:choose>
                                        <c:when test="${store_list.STORE_LOGO !=null}">
                                            <div>
                                                <img class="store_logo"
                                                     src="/resources/img/store/${store_list.STORE_LOGO}">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div><p class="store_logo">사진없음</p></div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="m-2 store_info_box">
                                    <div class="p2_font">${store_list.STORE_NAME}</div>
                                    <div class="p3_font"><i class="fa-solid fa-star"></i> ${store_list.AVERAGE_STARS} / 리뷰 ${store_list.COUNT_REVIEW}개
                                        /
                                        <fmt:formatNumber var="DISTANCE" value="${store_list.DISTANCE}" pattern="#.##"/>
                                        <c:if test="${store_list.DISTANCE >= 1000}">
                                            <fmt:formatNumber value="${(DISTANCE) / (1000)}" pattern=".0"/>km</c:if>
                                        <c:if test="${store_list.DISTANCE < 1000}">${store_list.DISTANCE}m</c:if>
                                    </div>
                                    <div><span class="title_font">최소주문금액</span> ${store_list.STORE_MIN_PRICE}원</div>
                                    <div><span class="title_font">배달요금</span> ${store_list.STORE_DELI_TIP}원</div>
                                    <div class="menu_name">
                                        <c:forEach var="menu_list" items="${menu_list[status.index].menu_name}"
                                                   varStatus="status2">
                                            ${menu_list}<c:if test="${!status2.last}">, </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </a>
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

    <hr class="mt90">

</main>

<script>
    function getUrlParams() {
        var params = {};

        window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi,
            function(str, key, value) {
                params[key] = value;
            }
        );

        return params;
    }

    window.onload = function (){
        oParams = getUrlParams();
        if(oParams.filter == "star"){
            $(".filter").eq(0).css("color","#e84c4f");
            $(".filter").eq(0).css("font-weight","bolder");
        }
        if(oParams.filter == "review"){
            $(".filter").eq(1).css("color","#e84c4f");
            $(".filter").eq(1).css("font-weight","bolder");
        }
        if(oParams.filter == "delifree"){
            $(".filter").eq(2).css("color","#e84c4f");
            $(".filter").eq(2).css("font-weight","bolder");
        }
        if(oParams.filter == "minprice"){
            $(".filter").eq(3).css("color","#e84c4f");
            $(".filter").eq(3).css("font-weight","bolder");
        }
    }

</script>

</body>
</html>
