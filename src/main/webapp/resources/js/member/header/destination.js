// 버튼 누르면 모달닫기
$(".closeModal").click(function () {
    $(".modal").fadeOut();
});
// ESC 누르면 Modal 닫기
$(window).on("keyup", e => {
    if ($(".modal")[0].style.display == "block" && e.keyCode == 27) { $(".modal").fadeOut(); }
});


// 창 바깥쪽 클릭하면 Modal 닫기
$(".modal").on("click", e => {
    if (e.target.classList.contains("modal")) { $(".modal").fadeOut(); }
});

// 모달 열기
$("#destination_add_box_btn").click(function () {
    $(".modal").fadeIn();
});



// 비밀번호 찾기 페이지 처리
function showSearchPw() {
    $("#form_login").attr("style", "display:none");
    $("#form_searchPw").attr("style", "display:inline");
    $("#loginModal .title").text("비밀번호 찾기");
    $("#loginModal .window").attr("style", "height:450px");
}

// 뒤로가기 처리
function toBackward() {
    $(".search").attr("style", "display:none");
    $("#loginModal input:not([type='checkbox']").val("");
    $("#form_login").attr("style", "display:inline");
    $("#loginModal .title").text("회원 로그인");
    $("#loginModal .window").attr("style", "height:475px");
}

// ESC 누르면 Modal 닫기
$(window).on("keyup", e => {
    if ($("#loginModal")[0].style.display == "inline-flex" && e.keyCode == 27) { hideLoginModal(); }
});

// 창 바깥쪽 클릭하면 Modal 닫기
$("#loginModal").on("click", e => {
    if (e.target.classList.contains("loginModal-overlay")) { hideLoginModal(); }
});

// 엔터 = 버튼 클릭
$("#login_id, #login_pw").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_login").click() } });
$("#searchPw_email, #searchPw_phone").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_search").click() } });;


















$(".del").on("click", function () {
    if($(this).closest(".destination_box").find(".pick").html() == "[기본]"){
        confirm("기본 배송지는 삭제 불가합니다.기본 주소지 변경 후 삭제해주세요.")
    } else {
        if(confirm("정말 삭제 하시겠습니까?")){
            // $(this).closest(".destination_box").remove();
            $.ajax({
                url: "/member/header/destination/delete",
                type: "post",
                data: {add_seq:$(this).closest(".destination_box").find(".add_seq").val()}
            }).done(function () {
                alert("삭제 성공/모달 새고고침처럼 다시 보여야함/지웠다가 다시 띄우기");
            });
        }
    }
});


$("#destination_select").on("click", function () {
    $("input[name='radio_add_division']").closest($(".destination_box")).find($(".hidden_add_division")).val("add");
    if($("input[name='radio_add_division']:checked")){
        $("input[name='radio_add_division']:checked").closest($(".destination_box")).find($(".hidden_add_division")).val("basics");
    } else {
        $("input[name='radio_add_division']:not(:checked)").closest($(".destination_box")).find($(".hidden_add_division")).val("add");
    }

    $.ajax({
        url: "/member/header/destination/divisionChange",
        type: "post",
        data: $("#destination_select_frm").serialize(),
        dataType: 'JSON'
    }).done(function () {
        alert("선택지 변경 성공/모달 사라지고 메인으로 돌아가야함");
    });
});

$("#destination_add_box_btn").on("click", function () {
    $("input:not([name=acc_seq])").val("");
    $("#destination_add_box").show();
});


$(document).on("click", ".postsearch", function () {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = ''; // 주소 변수
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
                    document.getElementById("add_y").value = x;
                    document.getElementById("add_x").value = y;
                }
            };
            geocoder.addressSearch(addr, callback);
            document.getElementById("postcode").value = data.zonecode;
            document.getElementById("add_detail1").value = data.jibunAddress;
            document.getElementById("add_detail1").value = data.roadAddress;
            document.getElementById("add_detail2").focus();
        }
    }).open();
})

let addNameRegex = /^[가-힣a-zA-Z0-9]{1,10}$/;

$("#destination_add_btn").on("click", function () {
    if (!addNameRegex.test($("#add_name").val())) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '주소지 별명을 다시 확인해주세요.',
        });
        $("#add_name").focus();
        return;
    }
    if($("#postcode").val()=="") {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '우편검색 버튼 눌러 주소를 입력해주세요.',
        });
        $("#postcode").focus();
        return;
    }
    if($("#add_detail2").val()=="") {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '상세주소를 입력해주세요.',
        });
        $("#add_detail2").focus();
        return;
    }

    $.ajax({
        url: "/member/header/destination/insert",
        type: "post",
        data: $("#destination_add_frm").serialize()
    }).done(function () {
        $("#destination_add_box").hide();
    });
});
