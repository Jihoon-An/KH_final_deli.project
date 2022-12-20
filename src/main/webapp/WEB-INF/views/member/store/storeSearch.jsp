<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-15
  Time: 오후 12:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>식당 검색 리스트</title>

    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
        #storeSearch .container {
            width: 375px;
            height: 800px;
            border: 1px solid black;
            margin: auto;
            text-align: center;
            padding-top: 50px;
        }


        .filter {
            border-radius: 20px;
            border: #e84c4f solid 1px;
        }

        .store_list {
            border: #e84c4f solid 1px;
        }

        .store_logo {
            width: 90px;
            height: 100px;
            object-fit: cover;
        }

        .store_info_box {
            overflow: hidden;
        }

        .menu_name {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>

</head>
<body>


<main id="storeSearch">
    <div class="container">
        <form action="/storeSearch">
            <input type="text" placeholder="검색해라" name="search">
            <button>검색</button>
        </form>
        <hr>
        <div class="d-inline-flex">
            <a href="/storeSearch?filter=star"><div class="filter py-1 px-2 m-1">별점</div></a>
            <a href="/storeSearch?filter=review"><div class="filter py-1 px-2 m-1">리뷰</div></a>
            <a href="/storeSearch?filter=delifree"><div class="filter py-1 px-2 m-1">무료배달</div></a>
            <a href="/storeSearch?filter=minprice"><div class="filter py-1 px-2 m-1">최소주문금액</div></a>
        </div>

        <hr>
        <div class="d-flex flex-column">
            <c:choose>
                <c:when test="${not empty store_list}">
                    <c:forEach var="store_list" items="${store_list}" varStatus="status">

                        <div class="store_list d-inline-flex m-2">
                            <div class="m-2 store_logo_box">
                                <c:choose>
                                    <c:when test="${store_list.store_logo !=null}">
                                        <div>
                                            <img class="store_logo" src="/resources/img/store/${store_list.store_logo}">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div>이미지: 사진없음</div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                                ${store_list.STORE_LOGO}
                            <div class="m-2 store_info_box">
                                최소주문금액${store_list.STORE_MIN_PRICE}<BR>
                                <div>식당명: ${store_list.STORE_NAME}</div>
                                <div>★${store_list.AVERAGE_STARS} / 리뷰개수:${store_list.COUNT_REVIEW}
                                    / ${store_list.DISTANCE}m
                                </div>
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

<script>
</script>

</body>
</html>
