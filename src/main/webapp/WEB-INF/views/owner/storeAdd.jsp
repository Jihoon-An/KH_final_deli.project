<%--
  Created by IntelliJ IDEA.
  User: ykm
  Date: 2022-12-13
  Time: 오전 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>

    <link rel="stylesheet" href="/resources/css/owner/storeAdd.css" type="text/css">
</head>


<body>
<main id ="storeAdd">
<h1>
    식당추가
</h1>
<form action="" id="frm" method="post" enctype="multipart/form-data">
    <div>
        <input type="text" name="store_name" placeholder="상호명입력" id = "inputId">
        <br>
        <input type="text" name="store_phone" placeholder="폰번호입력">
        <br>
        <input type="text" id="postcode" placeholder="우편번호">
        <button type="button" class="postsearch">우편검색</button>
        <br>
        <input type="text" id="add1" name="store_add_detail1" placeholder="기본주소">
        <br>
        <input type="text" id="add2" name="store_add_detail2" placeholder="상세주소">
        <br>
        <input type="hidden" id="store_add_x" name="store_add_x" >
        <input type="hidden" id ="store_add_y"  name="store_add_y" >

        <select name="store_category" >
            <option value="한식">
                한식
            </option>
            <option value="양식">
                양식
            </option>
            <option value="일식">
                일식
            </option>
            <option value="중식">
                중식
            </option>
            <option value="분식">
                분식
            </option>
            <option value="찜·탕·찌개">
                찜·탕·찌개
            </option>
            <option value="치킨">
                치킨
            </option>
            <option value="피자">
                피자
            </option>
            <option value="버거">
                버거
            </option>
            <option value="도시락">
                도시락
            </option>
            <option value="카페·디저트">
                카페·디저트
            </option>
        </select>
        <br>
        <div class="profile">
            <div class="thumbnail">
                <img src="/resources/img/store/no_storelogo.png" id="profile">
            </div>
            <div class="control">
                <input type=file name="file" id="menu_img" accept=".png, .jpg, .jpg,.gif">
            </div>
        </div>
        <input type="text" name="store_intro" placeholder="식당소개">
        <br>
        <input type="text" name="store_origin" placeholder="원산지">
        <Br>

        <div class="bsns_div">
            <span>월요일</span>
            <input type="hidden" class="bsns" value="월요일">
            <select name="test" class="bsns bs bs_open">
                <option>영업일</option>
                <option>휴무일</option>
            </select>
            <span class="bs_time">
            <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
        </div>
        <div class="bsns_div">
            <span>화요일</span>
            <input type="hidden" class="bsns" value="화요일">
            <select name="test" class="bsns bs bs_open">
                <option>영업일</option>
                <option>휴무일</option>
            </select>
            <span class="bs_time">
            <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
        </div>
        <div class="bsns_div">
            <span>수요일</span>
            <input type="hidden" class="bsns" value="수요일">
            <select name="test" class="bsns bs bs_open">
                <option>영업일</option>
                <option>휴무일</option>
            </select>
            <span class="bs_time">
            <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
        </div>
        <div class="bsns_div">
            <span>목요일</span>
            <input type="hidden" class="bsns" value="목요일">
            <select name="test" class="bsns bs bs_open">
                <option>영업일</option>
                <option>휴무일</option>
            </select>
            <span class="bs_time">
            <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
        </div>
        <div class="bsns_div">
            <span>금요일</span>
            <input type="hidden" class="bsns" value="금요일">
            <select name="test" class="bsns bs bs_open">
                <option>영업일</option>
                <option>휴무일</option>
            </select>
            <span class="bs_time">
            <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
        </div>
        <div class="bsns_div">
            <span>토요일</span>
            <input type="hidden" class="bsns" value="토요일">
            <select name="test" class="bsns bs bs_open">
                <option>영업일</option>
                <option>휴무일</option>
            </select>
            <span class="bs_time">
             <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
        </div>
        <div class="bsns_div">
            <span>일요일</span>
            <input type="hidden" class="bsns" value="일요일">
            <select name="test" class="bsns bs bs_open">
                <option>영업일</option>
                <option>휴무일</option>
            </select>
            <span class="bs_time">
            <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
        </div>
        <input type="hidden" id="bsns_data" name="store_bsns_hours">

        <br>
        <input type="text" name="store_close_day" placeholder="휴무일">
        <br>
        <input type="text" name="store_min_price" placeholder="주문 최소 금액">
        <input type="text" name="store_deli_tip" placeholder="배달팁">
        <br>
        <select name="store_deli_time" id="time">
            <option value="20">20분</option>
            <option value="30">30분</option>
            <option value="40">40분</option>
            <option value="60">60분</option>
            <option value="90">90분</option>
        </select>
        <p>오픈여부</p>
        <label><input type="radio" name="store_open" value="Y"> Y</label>
        <label><input type="radio" name="store_open" value="N"> N</label>
        <p>공개여부</p>
        <label><input type="radio" name="store_display" value="Y"> Y</label>
        <label><input type="radio" name="store_display" value="N"> N</label>
        <br>
        <input type="text" name="store_destination">
    </div>
    <button id = add type="button">식당추가</button>
</form>

</main>
<script src="/resources/js/owner/storeAdd.js"></script>
</body>


</html>
