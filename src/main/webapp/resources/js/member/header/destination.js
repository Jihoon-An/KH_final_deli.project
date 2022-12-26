
var posY;

// 배송지 모달 열기
$("#destination_change").click(function (){
    $(".modal").fadeIn();
    $(".modal_destination_add").hide();
    $(".modal_destination_container").show();

    posY = $(window).scrollTop();
    $("html, body").addClass("not_scroll");
    $(".cont").css("top",-posY);
})


// 주소지 추가 열기
$("#destination_add_box_btn").click(function () {
    $(".modal").fadeIn();
});

// 주소지 추가 닫기
function closeDestinationAdd () {
    $(".modal_destination_add").fadeOut();
}

// 버튼 누르면 모달닫기
function closeModal () {
    $("html, body").removeClass("not_scroll");
    posY = $(window).scrollTop(posY);
    $(".modal").fadeOut();
    $("input:radio[name='radio_add_division']:radio[id='basics']").prop("checked", true);
}

// ESC 누르면 Modal 닫기
$(window).on("keyup", e => {
    if ($(".modal")[0].style.display == "block" && e.keyCode == 27) { closeModal(); }
});


// 창 바깥쪽 클릭하면 Modal 닫기
$(".modal").on("click", e => {
    if (e.target.classList.contains("modal")) { closeModal(); }
});





$(document).on("click",".del", function () { // 정적바인딩
    if($(this).closest(".destination_box").find(".pick").html() == "[기본]"){
        alert("기본 배송지는 삭제 불가합니다.기본 주소지 변경 후 삭제해주세요.")
    } else {
        if(confirm("정말 삭제 하시겠습니까?")){
            $.ajax({
                url: "/member/header/destination/delete",
                type: "post",
                data: {add_seq:$(this).closest(".destination_box").find(".add_seq").val()}
            }).done(function () {
                $("#destination_select_frm").load("/member/header/destination #destination_select_box"); // 동적바인딩 이슈
            });
        } else {
            return false;
        }
    }
});


$(document).on("click","#destination_select", function () {
    if($("input[name='radio_add_division']:checked").closest($(".destination_box")).find($(".pick")).html()=="[선택]") {
        if(confirm('기본 선택지를 변경하면 초기 화면으로 돌아갑니다.')){
            $("input[name='radio_add_division']:not(:checked)").closest($(".destination_box")).find($(".hidden_add_division")).val("add");
            $("input[name='radio_add_division']:checked").closest($(".destination_box")).find($(".hidden_add_division")).val("basics");
            $("input[name='radio_add_division']:checked").closest($(".destination_box")).find($(".pick")).html("[기본]");
            $("input[name='radio_add_division']:not(:checked)").closest($(".destination_box")).find($(".pick")).html("[선택]");
            $.ajax({
                url: "/member/header/destination/divisionChange",
                type: "post",
                data: $("#destination_select_frm").serialize()
            }).done(function() {
                location.replace('/');
            });
        } else {
            return false;
        }
    }
});

$(document).on("click","#destination_add_box_btn", function () {
    $("input:not([name=acc_seq])").val("");
    $(".modal_destination_add").show();
});


$(document).on("click", ".postsearch", function () {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = ''; // 주소 변수
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
                document.getElementById("add_detail1").value = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
                document.getElementById("add_detail1").value = data.jibunAddress;
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
            document.getElementById("add_detail2").focus();
        }
    }).open();
})



// 엔터 = 버튼 클릭
$("#add_name, #postcode, #add_detail1, #add_detail2").on("keyup", (e) => { if (e.keyCode == 13) { $("#destination_add_btn").click() } });

$(document).on("click","#destination_add_btn", function () {
    if ($("#add_name").val()=="") {
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
        $("#destination_select_frm").load("/member/header/destination #destination_select_box");
        $(".modal_destination_add").hide();
    });
});