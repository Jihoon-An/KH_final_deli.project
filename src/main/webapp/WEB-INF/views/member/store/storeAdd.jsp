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


    /* 이미지미리보기*/
    .resultval {
        color: red;
    }

    .profile {

        width: 300px;
        height: 100px;
        overflow: hidden;
    }

    .profile div {
        float: left;
        height: 100%;
    }

    .thumbnail {
        width: 30%;
        padding: 5px;
    }

    .thumbnail img {
        width: 100%;
        height: 100%;
    }

    .control {
        width: 70%;
        line-height: 100px;
    }

    .control input {
        width: 100%;
        height: 100%;
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
        </select>
        <br>
        <div class="profile">
            <div class="thumbnail">
                <img src="/images/no_profile.png" id="profile">
            </div>
            <div class="control">
                <input type=file name="file" id="menu_img" accept=".png, .jpg, .jpg,.gif">
            </div>
        </div>
        <input type="text" name="store_intro" placeholder="식당소개">
        <br>
        <input type="text" name="store_origin" placeholder="원산지">
        <Br>
        <div class="bsnsdiv">

        <select name="store_bsns_hours" class="bsns" class="bs1" >
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>
        </select>
        <input type =text value="월요일" disabled >
        <input type=hidden class=bsns value="월요일"  >
        <input type="time" class=bsns value="09:00" min="09:00" max="24:00"   class="bs1" disabled>
        <input type="time"class=bsns value="09:00" min="09:00" max="24:00"    class="bs1" disabled>

        <br>

        <select name="store_bsns_hours" class="bsns" class="bs2">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type=text  value="화요일" disabled>
        <input type=hidden class=bsns value="화요일">
        <input type="time" class=bsns value="09:00" min="09:00" max="24:00"  disabled  class="bs2">
        <input type="time" class=bsns value="09:00" min="09:00" max="24:00"  disabled class="bs2">

        <br>
        <select name="store_bsns_hours" class="bsns" class="bs3">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type=text value="수요일" disabled>
        <input type=hidden class=bsns value="수요일">
        <input type="time" class=bsns  value="09:00" min="09:00" max="24:00"  disabled class="bs3">
        <input type="time" class=bsns value="09:00" min="09:00" max="24:00"  disabled class="bs3">
        <br>
        <select name="store_bsns_hours" class="bsns" class="bs4">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type=text value="목요일" disabled>
        <input type=hidden class=bsns value="목요일">
        <input type="time" class=bsns value="09:00" min="09:00" max="24:00"  disabled class="bs4">
        <input type="time" class=bsns value="09:00" min="09:00" max="24:00"  disabled class="bs4">
        <br>
        <select name="store_bsns_hours" class="bsns" class="bs5">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type=text value="금요일" disabled>
        <input type=hidden class=bsns value="금요일">
        <input type="time" class=bsns value="09:00" min="09:00" max="24:00"  disabled class="bs5">
        <input type="time" class=bsns value="09:00" min="09:00" max="24:00"  disabled class="bs5">
        <br>
        <select name="store_bsns_hours" class="bsns" class="bs6">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type=text  value="토요일" disabled>
        <input type=hidden class=bsns value="토요일">
        <input type="time"  class=bsns value="09:00" min="09:00" max="24:00" class="bs6">
        <input type="time" class=bsns value="09:00" min="09:00" max="24:00" class="bs6">
        <br>
        <select name="store_bsns_hours" class="bsns" class="bs7">
            <option value="휴무일">
                휴무일
            </option>
            <option value="영업일">
                영업일
            </option>

        </select>
        <input type=text  value="일요일" disabled>
        <input type=hidden class=bsns value="일요일">
        <input type="time" class=bsns value="09:00" min="09:00" max="24:00" class="bs7">
        <input type="time" class=bsns value="09:00" min="09:00" max="24:00" class="bs7">
        <input type="hidden" id="bsnsdata" name="store_bsns_hours">
        </div>
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
</body>
<script>

    $(".bs1").on("change", function () {
        let bs1 = $(".bs1").val();
        console.log(bs1)
        if(bs1=='영업일'){
            $(".bs1").removeAttr("disabled")
            console.log("제거성공")
        }else{
            $(".bs1").attr("disabled", true)
            console.log("복구")
        }

    })


    $("#add").on("click", function(){

        var bsnsarr = [];

        let b = document.getElementsByClassName("bsns")
        let bs = document.getElementById("bsnsdata")


        for (let i = 0; i < b.length; i++) {

      bsnsarr.push(b[i].value);


        }

        console.log(bsnsarr.toString())

        bs.value= bsnsarr.toString()

        console.log(bs.value)


        $("#frm").attr("action", "/store/add")
        $("#frm").submit()




    })
    //이미지미리보기
    function fileToBase64(file) {
        const reader = new FileReader();
        reader.readAsDataURL(file)
        reader.onload = () => {
            console.dir(reader.result)   // base64
            $("#profile").attr("src", reader.result);
        }
    }
    $("#profile_img").on("change", function () {
        if ($("#profile_img").val() == "") {
            $("#profile").attr("src", "/profile/no_profile.png");
            return;
        }
        console.log($("#profile_img").val());
        let ext = $("#profile_img").val().split(".").pop().toLowerCase();

        let accept = ["png", "jpg", "jpeg", "gif"];

        let result = $.inArray(ext, accept); //첫번쨰 인자값이 두번쨰 인자 배열 안에 존재한다면 배열 인덱스 반환(0이상값 반환),  존재하지않으면 -1 반환
        console.log(result);



        if (result == -1) {
            alert("이미지만 사용 가능합니다")
            $("#profile_img").val("");//비워주기
            $("#profile").attr("src", "/images/no_profile.png")//다른 사진들어올떄 #profile 도 비워주기


        } else {
            fileToBase64(document.getElementById("profile_img").files[0]);
        }
    });



    $(document).on("click", ".postsearch", function() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                var geocoder = new kakao.maps.services.Geocoder();

                var callback = function (result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        let x=result[0].x;
                        let y= result[0].y;
                        console.log(x)
                        console.log(y)
                        document.getElementById("store_add_y").value = x;
                        document.getElementById("store_add_x").value = y;
                    }
                };
                geocoder.addressSearch(addr, callback);


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("add1").value = data.jibunAddress;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("add2").focus();
            }
        }).open();
    })

</script>

</html>
