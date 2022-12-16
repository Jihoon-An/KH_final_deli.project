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
    console.log("seq : " + seq);
    console.log("name : " + name);
    console.log("code : " + code);
    console.log("content : " + content);
    console.log("type : " + type);
    console.log("discount : " + discount);
    console.log("period : " + period);
    //위에서 가져온 값 세팅하고 없는 값 html 지우기.
    //seq
    $("#modal").find("#modal_cp_seq").val(seq);
    //name
    $("#modal").find("#modal_cp_name").val(name);
    //code
    if (!code) {
        $("#modal").find("#modal_cp_code").hide();
    }else {
        $("#modal").find("#modal_cp_code").show().val(code);
    }
    //content
    if (!content) {
        $("#modal").find("#modal_cp_content").hide();
    }else {
        $("#modal").find("#modal_cp_content").show().val(content);
    }
    //type
    $("#modal").find("#modal_cp_type").val(type);
    //discount
    $("#modal").find("#modal_cp_discount").val(discount);
    //period
    if (!period) {
        $("#modal").find("#modal_cp_period").hide();
    }else {
        $("#modal").find("#modal_cp_period").show().val(period);
    }
    $("#modal").fadeIn();
});

//쿠폰 상세 모달 닫기
$("#close_modal").click(function () {
    $("#modal").fadeOut();
    $("#modal").find("#modal_cp_seq").val("").css("display", "block");
    $("#modal").find("#modal_cp_name").val("").css("display", "block");
    $("#modal").find("#modal_cp_code").val("").css("display", "block");
    $("#modal").find("#modal_cp_content").val("").css("display", "block");
    $("#modal").find("#modal_cp_type").val("").css("display", "block");
    $("#modal").find("#modal_cp_discount").val("").css("display", "block");
    $("#modal").find("#modal_cp_period").val("").css("display", "block");
});

//발행하기 버튼 (미완성)
$("#publish_btn").click(() => {
    // Swal.fire({
    //     title: '정말 비공개 처리 하시겠습니까?',
    //     icon: 'warning',
    //     showCancelButton: true,
    //     confirmButtonColor: '#3085d6',
    //     cancelButtonColor: '#d33',
    //     confirmButtonText: '실행',
    //     cancelButtonText: '취소'
    // }).then((result) => {
    //     if (result.isConfirmed) {
    //         $.ajax({
    //             url: "",
    //             type: "post",
    //             data: {},
    //             dataType: "json"
    //         }).done(() => {
    //             Swal.fire({
    //                 position: 'center-center',
    //                 icon: 'success',
    //                 title: '삭제되었습니다.',
    //                 showConfirmButton: false,
    //                 timer: 1500
    //             })
    //         }).error();
    //     }
    // })
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