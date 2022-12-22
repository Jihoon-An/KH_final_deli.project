<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>DELI</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <!-- daumPostcode -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- kakaoMap -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>

    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <!-- sweetalert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">

    <!-- StyleSheet-->
    <link rel="stylesheet" href="/resources/css/member/store/storeSearch.css" type="text/css">
</head>
<body>


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
