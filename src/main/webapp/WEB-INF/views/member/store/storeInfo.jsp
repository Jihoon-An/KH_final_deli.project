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
<title>식당상세정보</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<!--jQuery-->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
</script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2831f365f4c14d690cf0e21146e8dd99"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
<!-- bootstrap CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- bootstrap JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
<link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico"/>
<link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/member/store/storeInfo.css">
</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
<main id="store_info">
    <%--    영업정보--%>
    <%--        <div class="container">--%>
    <%--            <div id="map" style="width:100%; height:200px;"></div>--%>
    <%--            <div class="header">--%>
    <%--                <div id="storeName">${storeDTO.store_name}</div>--%>
    <%--                <div id="star"> 별 (${storeReviewAvg})</div>--%>
    <%--                <div id="reviewCount">리뷰수(${storeReviewCount})</div>--%>
    <%--                <div id="store_intro">${storeDTO.store_intro}</div>--%>
    <%--                            <div class="deliveryInfo" style="text-align: left;">--%>
    <%--                                <div>최소주문금액 : ${storeDTO.store_min_price}원</div>--%>
    <%--                                <div>배달예상시간 : ${storeDTO.store_deli_time}분</div>--%>
    <%--                                <div>배달팁 : ${storeDTO.store_deli_tip}원</div>--%>
    <%--                            </div>--%>
    <%--            </div>--%>
    <%--                    <div class="fieldBox">--%>
    <%--                        <div id="menu"><a href="/store/menu">메뉴</a></div>--%>
    <%--                        <div id="info"><a href="#"><h2>정보</h2></a></div>--%>
    <%--                        <div id="review"><a href="/store/review">리뷰</a></div>--%>
    <%--                    </div>--%>
    <%--            <div class="storeInfo">--%>
    <%--                <div class="store">--%>
    <%--                    <div>가게명 :${storeInfoDTO.store_name}</div>--%>
    <%--                    <div>전화번호 :${storeInfoDTO.store_phone}</div>--%>
    <%--                    &lt;%&ndash;                <c:forEach var="i" items="${bsnsHours}" varStatus="status">&ndash;%&gt;--%>
    <%--                    &lt;%&ndash;                    <div>${i.key}</div>&ndash;%&gt;--%>
    <%--                    &lt;%&ndash;                    <c:choose>&ndash;%&gt;--%>
    <%--                    &lt;%&ndash;                        <c:when test="${i.value.get(\"open\") eq '영업일'}">&ndash;%&gt;--%>
    <%--                    &lt;%&ndash;                            <div>오픈타임 ${i.value.get("open_time")} || 클로즈타임 ${i.value.get("close_time")}</div>&ndash;%&gt;--%>
    <%--                    &lt;%&ndash;                        </c:when>&ndash;%&gt;--%>
    <%--                    &lt;%&ndash;                        <c:otherwise>&ndash;%&gt;--%>
    <%--                    &lt;%&ndash;                                    휴무일&ndash;%&gt;--%>
    <%--                    &lt;%&ndash;                        </c:otherwise>&ndash;%&gt;--%>
    <%--                    &lt;%&ndash;                    </c:choose>&ndash;%&gt;--%>
    <%--                    &lt;%&ndash;                </c:forEach>&ndash;%&gt;--%>
    <%--                    <div>월요일 : ${bsnsHours.get("mon").get("open")}</div>--%>
    <%--                    <c:if test="${bsnsHours.get('mon').get('open') eq '영업일'}">--%>
    <%--                        <div>영업시간 : ${bsnsHours.get("mon").get("open_time")}--%>
    <%--                            ~ ${bsnsHours.get("mon").get("close_time")}</div>--%>
    <%--                    </c:if>--%>

    <%--                    <div>화요일 : ${bsnsHours.get("thu").get("open")}</div>--%>
    <%--                    <c:if test="${bsnsHours.get('thu').get('open') eq '영업일'}">--%>
    <%--                        <div>영업시간 : ${bsnsHours.get("thu").get("open_time")}--%>
    <%--                            ~ ${bsnsHours.get("thu").get("close_time")}</div>--%>
    <%--                    </c:if>--%>
    <%--                    <div>수요일 : ${bsnsHours.get("wed").get("open")}</div>--%>
    <%--                    <c:if test="${bsnsHours.get('wed').get('open') eq '영업일'}">--%>
    <%--                        <div>영업시간 : ${bsnsHours.get("wed").get("open_time")}--%>
    <%--                            ~ ${bsnsHours.get("wed").get("close_time")}</div>--%>
    <%--                    </c:if>--%>
    <%--                    <div>목요일 : ${bsnsHours.get("thu").get("open")}</div>--%>
    <%--                    <c:if test="${bsnsHours.get('thu').get('open') eq '영업일'}">--%>
    <%--                        <div>영업시간 : ${bsnsHours.get("thu").get("open_time")}--%>
    <%--                            ~ ${bsnsHours.get("thu").get("close_time")}</div>--%>
    <%--                    </c:if>--%>

    <%--                    <div>금요일 : ${bsnsHours.get("fri").get("open")}</div>--%>
    <%--                    <c:if test="${bsnsHours.get('fri').get('open') eq '영업일'}">--%>
    <%--                        <div>영업시간 : ${bsnsHours.get("fri").get("open_time")}--%>
    <%--                            ~ ${bsnsHours.get("fri").get("close_time")}</div>--%>
    <%--                    </c:if>--%>

    <%--                    <div>토요일 : ${bsnsHours.get("sat").get("open")}</div>--%>
    <%--                    <c:if test="${bsnsHours.get('sat').get('open') eq '영업일'}">--%>
    <%--                        <div>영업시간 : ${bsnsHours.get("sat").get("open_time")}--%>
    <%--                            ~ ${bsnsHours.get("sat").get("close_time")}</div>--%>
    <%--                    </c:if>--%>

    <%--                    <div>일요일 : ${bsnsHours.get("sun").get("open")}</div>--%>
    <%--                    <c:if test="${bsnsHours.get('sun').get('open') eq '영업일'}">--%>
    <%--                        <div>영업시간 : ${bsnsHours.get("sun").get("open_time")}--%>
    <%--                            ~ ${bsnsHours.get("sun").get("close_time")}</div>--%>
    <%--                    </c:if>--%>

    <%--                    <div>휴무일 :${storeInfoDTO.store_close_day}</div>--%>


    <%--                </div>--%>
    <%--                &lt;%&ndash;배달정보&ndash;%&gt;--%>
    <%--                <div class="deliveryInfo">--%>
    <%--                    <div class="store">--%>
    <%--                        <div>최소주문금액 :${storeInfoDTO.store_min_price}</div>--%>
    <%--                        <div>배달팁:${storeInfoDTO.store_deli_tip}</div>--%>
    <%--                        <div>배달가능지역 :${storeInfoDTO.store_destination}</div>--%>
    <%--                        <div>배달예상시간 :${storeInfoDTO.store_deli_time}</div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>

    <%--                &lt;%&ndash;사업자 정보&ndash;%&gt;--%>
    <%--                <div class="bsInfo">--%>
    <%--                    <div class="store">--%>
    <%--                        <div>대표자명 :${ownerInfoDTO.owner_name}</div>--%>
    <%--                        <div>상호명:${storeInfoDTO.store_name}</div>--%>
    <%--                        <div> 가게주소:${storeInfoDTO.store_add_detail1}<br>--%>
    <%--                            ${storeInfoDTO.store_add_detail2}</div>--%>
    <%--                        <div>사업자번호 :${ownerInfoDTO.owner_num}</div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <div class="container">
        <%--        <div class="header">--%>
        <%--            <div id="storeName">${storeInfoDTO.store_name}</div>--%>
        <%--            <div id="star"> 별 (${storeReviewAvg})</div>--%>
        <%--            <div id="reviewCount">리뷰수(${storeReviewCount})</div>--%>
        <%--            <div id="storeInfo">${storeInfoDTO.store_intro}</div>--%>
        <%--            <div class="deliveryInfo" style="text-align: left;">--%>
        <%--                <div>최소주문금액 : ${storeInfoDTO.store_min_price}원</div>--%>
        <%--                <div>배달예상시간 : ${storeInfoDTO.store_deli_time}분</div>--%>
        <%--                <div>배달팁 : ${storeInfoDTO.store_deli_tip}원</div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <%@ include file="/WEB-INF/views/member/store/storeHeader.jsp" %>
        <div class="fieldBox">
            <div id="menu"><a href="/store/menu/${storeInfoDTO.store_seq}">메뉴</a></div>
            <div id="info"><a href="#" id="to_info">정보</a></div>
            <div id="review"><a href="/store/review/${storeInfoDTO.store_seq}">리뷰</a></div>
        </div>
        <hr>
        <div id="map" style="width:100%; height:200px;"></div>
        <hr>
        <div class="store">
            <div class="field">영업정보</div>
            <div class="contents">
                <div>상호명 : ${storeInfoDTO.store_name}</div>
                <div>전화번호 : ${storeInfoDTO.store_phone}</div>
            </div>
        </div>
        <hr>
        <div class="delivery">
            <div class="field">배달정보</div>
            <div class="contents title">
                <div>최소주문금액</div>
                <div>배달팁</div>
                <div>배달가능지역</div>
                <div>배달예상시간</div>
            </div>
            <div class="detail_contents">
                <div><fmt:formatNumber value="${storeInfoDTO.store_min_price}" pattern="#,###"/>원</div>
                <div><fmt:formatNumber value="${storeInfoDTO.store_deli_tip}" pattern="#,###"/>원</div>
                <div>${storeInfoDTO.store_destination}</div>
                <div>${storeInfoDTO.store_deli_time}분</div>
            </div>
        </div>
        <hr>
        <div class="businessman">
            <div class="field">사업자정보</div>
            <div class="contents title">
                <div>대표자명</div>
                <div>상호명</div>
                <div>사업자주소</div>
                <div>사업자등록번호</div>
            </div>
            <div class="detail_contents">
                <div>${ownerInfoDTO.owner_name}</div>
                <div>${storeInfoDTO.store_name}</div>
                <div>${storeInfoDTO.store_add_detail1}<br>
                    ${storeInfoDTO.store_add_detail2}</div>
                <div>${ownerInfoDTO.owner_num}</div>
            </div>

        </div>
    <script>
        var latitude =${storeInfoDTO.store_add_x};
        var longitude =${storeInfoDTO.store_add_y};
    </script>
    <script src="/resources/js/member/store/storeInfo.js"></script>
</main>
</body>
</html>
