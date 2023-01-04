//data tables
$(document).ready(function () {
    $('#myTable').DataTable();
});

//쿠폰 상세 모달 띄우기
$(".coupon").click(function () {

    //선택한 coupon값 가져오기
    let seq=$(this).find(".seq").val();
    let name=$(this).find(".name").text();
    let code=$(this).find(".code").val();
    let content=$(this).find(".content").val();
    let type=$(this).find(".type").text();
    let discount=$(this).find(".discount").text();
    let period=$(this).find(".period").val();

    //위에서 가져온 값 세팅하고 없는 값 html 지우기.
    //seq
    $("#modal").find("#modal_cp_seq").val(seq);
    //name
    $("#modal").find("#modal_cp_name").html(name);
    //code
    if (!code) {
        $("#modal").find("#modal_cp_code").hide();
        $("#modal").find("#title_cp_code").hide();
    }else {
        $("#modal").find("#modal_cp_code").show().html(code);
        $("#modal").find("#title_cp_code").show();
    }
    //content
    if (!content) {
        $("#modal").find("#modal_cp_content").hide();
        $("#modal").find("#title_cp_content").hide();
    }else {
        $("#modal").find("#modal_cp_content").show().html(content);
        $("#modal").find("#title_cp_content").show();
    }
    //type
    $("#modal").find("#modal_cp_type").html(type);
    $("#modal").find("#title_cp_type");
    //discount
    $("#modal").find("#modal_cp_discount").html(discount);
    $("#modal").find("#title_cp_discount");
    //period
    if (!period) {
        $("#modal").find("#modal_cp_period").hide();
        $("#modal").find("#title_cp_period").hide();
    }else {
        $("#modal").find("#modal_cp_period").show().val(period);
        $("#modal").find("#title_cp_period").show();
    }
    $("#modal").fadeIn();
});

//쿠폰 상세 모달 닫기
$("#close_modal").click(function () {
    $("#modal").toggle();
    $("#modal").find("#modal_cp_name").html("").css("display", "block");
    $("#modal").find("#modal_cp_code").html("").css("display", "block");
    $("#modal").find("#modal_cp_content").html("").css("display", "block");
    $("#modal").find("#modal_cp_type").html("").css("display", "block");
    $("#modal").find("#modal_cp_discount").html("").css("display", "block");
    $("#modal").find("#modal_cp_period").html("").css("display", "block");
});

//발행하기 버튼 (미완성)
$("#publish_btn").click(() => {
    let user_email= $("#modal_content").find("#modal_user_email").val();
    let cp_seq= $("#modal_content").find("#modal_cp_seq").val();
    let cp_period= $("#modal_content").find("#modal_cp_period").val();

    console.log(user_email);
    console.log(cp_seq);
    Swal.fire({
        title: '쿠폰을 발행하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '실행',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: "/admin/coupon/list/publish",
                type: "post",
                data: {
                    "user_email" : user_email,
                    "cp_seq" : cp_seq,
                    "cp_period":cp_period
                }
            }).done((resp) => {
                if (resp == "쿠폰 발급 실패"){
                    Swal.fire({
                        position: 'center-center',
                        icon: 'warning',
                        title: resp,
                        showConfirmButton: false,
                        timer: 1500
                    })
                }else {
                    Swal.fire({
                        position: 'center-center',
                        icon: 'success',
                        title: resp,
                        showConfirmButton: false,
                        timer: 1500
                    })
                }
            }).error();
        }
    })
});

//삭제버튼
$("#delete_btn").click(() => {

    Swal.fire({
        title: '정말 삭제 하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '실행',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: "/admin/coupon/list/delete",
                type: "post",
                data: $("#modal_cp_seq").val()
            }).done(() => {
                Swal.fire({
                    position: 'center-center',
                    icon: 'success',
                    title: '삭제되었습니다.',
                    showConfirmButton: false,
                    timer: 1500
                })
            });
        }
    })
});