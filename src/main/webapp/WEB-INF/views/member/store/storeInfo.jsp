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
    <style>
        * {
            box-sizing: border-box
        }

        div {
            border: 1px solid black;
        }

        .container {
            width: 375px;
            height: auto;
            margin: auto;
            overflow: hidden;
        }

        .storeInfo {
            overflow: hidden
        }

        .store {
            float: left;
        }
    </style>
</head>
<body>
<%--영업정보--%>
<div class="container">
    <div id="map" style="width:100%; height:200px;"></div>
    <div class="storeIntro">
        <div class="store_name">상호명 : ${storeInfoDTO.store_name}</div>
        <div class="store_deli_time">배달시간 : ${storeInfoDTO.store_deli_time}분</div>
        <div class="store_deli_tip">배달팁 : ${storeInfoDTO.store_deli_tip}원</div>
        <div class="store_deli_tip">식당소개 : ${storeInfoDTO.store_intro}</div>
        <div class="store_deli_tip">리뷰개수 : ${storeReviewCount}</div>
        <div>리뷰 평균 : ${storeReviewAvg}</div>
    </div>
    <div class="fieldBox">
        <div id="menu"><a href="/store/menu">메뉴</a></div>
        <div id="info"><a href="#"><h2>정보</h2></a></div>
        <div id="review"><a href="/store/review">리뷰</a></div>
    </div>
    <div class="storeInfo">
        <div class="store">
            <div>가게명 :${storeInfoDTO.store_name}</div>
            <div>전화번호 :${storeInfoDTO.store_phone}</div>
            <div>영업일 :${storeInfoDTO.store_bsns_hours}</div>
            <div>휴무일 :${storeInfoDTO.store_close_day}</div>
        </div>
        <%--배달정보--%>
        <div class="deliveryInfo">
            <div class="store">
                <div>최소주문금액 :${storeInfoDTO.store_min_price}</div>
                <div>배달팁:${storeInfoDTO.store_deli_tip}</div>
                <div>배달가능지역 :${storeInfoDTO.store_destination}</div>
                <div>배달예상시간 :${storeInfoDTO.store_deli_time}</div>
            </div>
        </div>

        <%--사업자 정보--%>
        <div class="bsInfo">
            <div class="store">
                <div>대표자명 :${ownerInfoDTO.owner_name}</div>
                <div>상호명:${storeInfoDTO.store_name}</div>
                <div> 가게주소:${storeInfoDTO.store_add_detail1}<br>
                    ${storeInfoDTO.store_add_detail2}</div>
                <div>사업자번호 :${ownerInfoDTO.owner_num}</div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2831f365f4c14d690cf0e21146e8dd99"></script>
<script>

    var latitude =${storeInfoDTO.store_add_x};
    var longitude =${storeInfoDTO.store_add_y};

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
            level: 1 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커가 표시될 위치입니다
    var markerPosition = new kakao.maps.LatLng(latitude, longitude);

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);
</script>
</html>
