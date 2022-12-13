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
</head>
<style>
    * {
        box-sizing: border-box;
    }

    div {
        border: 1px solid black;
    }

    .container {
        width: 100%;
        height: 80%;
    }
    .box1{
        width: 300px;
    }
</style>

<body>
<h1>
    식당추가
</h1>
<form action="" id="frm" method="post" enctype="multipart/form-data">
    <div>
        <input type="text" name="store_name" placeholder="상호명입력">
        <br>
        <input type="text" name="store_phone" placeholder="폰번호입력">
        <br>
        <input type="text" id="postcode" placeholder="우편번호">
        <button type="button" id="postsearch">우편검색</button>
        <br>
        <input type="text" id="add1" name="store_add_deatail1" placeholder="기본주소">
        <br>
        <input type="text" name="store_add_deatail2" placeholder="상세주소">
        <br>
        <input type="text" name="store_add_x" style="display: none">
        <input type="text" name="store_add_y" style="display: none">

        <select name="store_category">
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
        </select>
        <br>
        <input type="file" name="store_logo">
        <div class="logopre">로고 미리보기</div>
        <input type="text" name="store_intro" placeholder="식당소개">
        <br>
        <input type="text" name="store_origin" placeholder="원산지">
        <Br>
        <select name="store_bsns_hours">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type =text value="월요일" disabled >
        <input type=hidden name="store_bsns_hours" value="월요일" id="day" >
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">
        <br>
        <select name="store_bsns_hours">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type=text  value="화요일" disabled>
        <input type=hidden name="store_bsns_hours" value="화요일">
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">
        <br>
        <select name="store_bsns_hours">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type=text value="수요일" disabled>
        <input type=hidden name="store_bsns_hours" value="수요일">
        <input type="time" name=store_bsns_hours  value="09:00" min="09:00" max="24:00">
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">
        <br>
        <select name="store_bsns_hours">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type=text value="목요일" disabled>
        <input type=hidden name="store_bsns_hours" value="목요일">
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">
        <br>
        <select name="store_bsns_hours">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type=text value="금요일" disabled>
        <input type=hidden name="store_bsns_hours" value="금요일">
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">
        <br>
        <select name="store_bsns_hours">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type=text  value="토요일" disabled>
        <input type=hidden name="store_bsns_hours" value="토요일">
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">`
        <br>
        <select name="store_bsns_hours">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type=text  value="일요일" disabled>
        <input type=hidden name="store_bsns_hours" value="일요일">
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">
        <input type="time" name=store_bsns_hours value="09:00" min="09:00" max="24:00">`
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
        <br>
        <input type="text" name="store_destination">
    </div>
    <button id = add type="button">식당추가</button>
</form>
</body>
<script>


    $("#add").on("click", function(){

        var bsns = [];




        let b = document.getElementsByName("store_bsns_hours")

        for (let i = 0; i < b.length; i++) {

            bsns.push(b[i].value);


        }

        $.ajax({
            url: "/store/add",
            type: "post",
            contentType: 'application/json',
            data: { "bsns": JSON.stringify(bsns) },
            success: function (data) {

            }


        })




    })



    // 우편번호 검색
    $(document).on("click", "postsearch", function execDaumPostcode(e) {
        new daum.Postcode({
            oncomplete: function (data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                e.target.innerHTML = roadAddr;
                $(e.target).siblings("input[name='gym_address1']").attr("value", roadAddr);


                var geocoder = new kakao.maps.services.Geocoder();

                var callback = function (result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        result[0].x;
                        result[0].y;

                        $(e.target).siblings("input[name='gym_x']").val(result[0].y);
                        $(e.target).siblings("input[name='gym_y']").val(result[0].x);

                    }
                };
                geocoder.addressSearch(roadAddr, callback);
            }
        }).open();
    })
    document.getElementById("postsearch").onclick = function () {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("add1").value = data.jibunAddress; //roadAddress 도로명 주소
            }
        }).open();

    }
</script>
</html>
