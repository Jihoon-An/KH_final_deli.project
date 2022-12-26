
//정규식


//input 칸 안에 숫자값 외에 값 받지 않기
function validNum() {
    event.target.value = event.target.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
}

//비어있는지 확인

let inputId = $("#input_id").val();

function storeSubmitCheck() {
    if ($("#gym_name").val() == "") {
        wobble($("#gym_name"));
        $("#gym_name").focus();
    }
    else if ($("#gym_phone").val() == "") {
        wobble($("#gym_phone"));
        $("#gym_phone").focus();
    }
    else if ($("#gym_price").val() == "") {
        wobble($("#gym_price"));
        $("#gym_price").focus();
    }
    else if ($("#gym_open").val() == "") {
        wobble($("#gym_open"));
        $("#gym_open").focus();
    }
    else if ($("#gym_close").val() == "") {
        wobble($("#gym_close"));
        $("#gym_close").focus();
    }
    else if ($("#gym_address1").val() == "") {
        wobble($(".lb_gym_address1"));
        $(".lb_gym_address1").focus();
    }
    else if ($("#gym_address2").val() == "") {
        wobble($("#gym_address2"));
        $("#gym_address2").focus();
    }
    else {
        Swal.fire({title: "등록 성공", icon: "success", text: "등록이 완료되었습니다"});
        return true;
    }
    Swal.fire({title: "수정 실패", icon: "error", text: "수정에 실패하였습니다. 관리자에게 문의해주세요"});
    return false;
}







$(".bs").on("change", function () {
    if ($(this).val() == '영업일') {
        $(this).closest($(".bsns_div")).find($(".bs_time")).show();
    } else {
        $(this).closest($(".bsns_div")).find($(".bs_time")).find($(".bsns")).val("");
        $(this).closest($(".bsns_div")).find($(".bs_time")).hide();
    }
})


$("#add").on("click", function () {
    let bsns_div = $(".bsns_div");
    var bs_day = {
        "mon": {
            open: $(bsns_div[0]).find(".bs_open").val(),
            open_time: $(bsns_div[0]).find(".bs_open_time").val(),
            close_time: $(bsns_div[0]).find(".bs_close_time").val()
        },
        "tue": {
            open: $(bsns_div[1]).find(".bs_open").val(),
            open_time: $(bsns_div[1]).find(".bs_open_time").val(),
            close_time: $(bsns_div[1]).find(".bs_close_time").val()
        },
        "wed": {
            open: $(bsns_div[2]).find(".bs_open").val(),
            open_time: $(bsns_div[2]).find(".bs_open_time").val(),
            close_time: $(bsns_div[2]).find(".bs_close_time").val()
        },
        "thu": {
            open: $(bsns_div[3]).find(".bs_open").val(),
            open_time: $(bsns_div[3]).find(".bs_open_time").val(),
            close_time: $(bsns_div[3]).find(".bs_close_time").val()
        },
        "fri": {
            open: $(bsns_div[4]).find(".bs_open").val(),
            open_time: $(bsns_div[4]).find(".bs_open_time").val(),
            close_time: $(bsns_div[4]).find(".bs_close_time").val()
        },
        "sat": {
            open: $(bsns_div[5]).find(".bs_open").val(),
            open_time: $(bsns_div[5]).find(".bs_open_time").val(),
            close_time: $(bsns_div[5]).find(".bs_close_time").val()
        },
        "sun": {
            open: $(bsns_div[6]).find(".bs_open").val(),
            open_time: $(bsns_div[6]).find(".bs_open_time").val(),
            close_time: $(bsns_div[6]).find(".bs_close_time").val()
        }
    }

    $("#bsns_data").val(JSON.stringify(bs_day));
    console.log(bs_day);
    console.log($("#bsns_data").val());
    let bsnsData = JSON.parse($("#bsns_data").val());
    console.log(bsns_data); //이렇게 parsing해서 쓰면 돼요.



    $("#frm").attr("action", "/store/add/storeAdd")
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

$("#menu_img").on("change", function () {
    if ($("#menu_img").val() == "") {
        $("#profile").attr("src", "/resources/img/store/no_storelogo.png");
        return;
    }
    console.log($("#menu_img").val());
    let ext = $("#menu_img").val().split(".").pop().toLowerCase();

    let accept = ["png", "jpg", "jpeg", "gif"];

    let result = $.inArray(ext, accept); //첫번쨰 인자값이 두번쨰 인자 배열 안에 존재한다면 배열 인덱스 반환(0이상값 반환),  존재하지않으면 -1 반환
    console.log(result);


    if (result == -1) {
        alert("이미지만 사용 가능합니다")
        $("#menu_img").val("");//비워주기
        $("#profile").attr("src", "/images/no_profile.png")//다른 사진들어올떄 #profile 도 비워주기


    } else {
        fileToBase64(document.getElementById("menu_img").files[0]);
    }
});


$(document).on("click", ".postsearch", function () {
    new daum.Postcode({
        oncomplete: function (data) {
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
                    let x = result[0].x;
                    let y = result[0].y;
                    console.log(x)
                    console.log(y)
                    document.getElementById("store_add_y").value = x;
                    document.getElementById("store_add_x").value = y;
                }
            };
            geocoder.addressSearch(addr, callback);


            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("add1").value = data.roadAddress;
            document.getElementById("add1").value = data.jibunAddress;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("add2").focus();
        }
    }).open();
})