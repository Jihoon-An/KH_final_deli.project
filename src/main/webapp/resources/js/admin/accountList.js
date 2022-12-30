let lang_kor = {
    "decimal" : "",
    "emptyTable" : "데이터가 없습니다.",
    "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
    "infoEmpty" : "0 개",
    "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
    "infoPostFix" : "",
    "thousands" : ",",
    "lengthMenu" : "_MENU_ 개씩 보기",
    "loadingRecords" : "로딩중...",
    "processing" : "처리중...",
    "search" : "검색 : ",
    "zeroRecords" : "검색된 데이터가 없습니다.",
    "paginate" : {
        "first" : "첫 페이지",
        "last" : "마지막 페이지",
        "next" : "다음",
        "previous" : "이전"
    },
    "aria" : {
        "sortAscending" : " :  오름차순 정렬",
        "sortDescending" : " :  내림차순 정렬"
    }
};

$(document).ready(function() {
    $('#myTable').DataTable( {
        language : lang_kor
    } );
} );


$(document).ready(function () {
    $('#myTable').DataTable()(
        { order: [[0, 'desc']],lengthMenu: [
                [10, 25, 50, -1],
                [10, 25, 50, 'All'],
            ],}
    );
});
trClickEvent();
//페이지 버튼을 눌렀을때 다시 script 돌아가게
$(".paginate_button").click(function () {
    trClickEvent();
});


function trClickEvent() {
    $(".account_tr").click(function () {

        $("#frm").find(".email").val(
            $(this).find(".acc_email").html());

        $("#frm").find(".nick").val(
            $(this).find(".mem_nick").html()
        );

        $("#frm").find(".phone").val(
            $(this).find(".mem_phone").html()
        )

        $("#frm").find(".accsignupdate").val(
            $(this).find(".acc_signupdate").html()
        );

        $("#frm").find(".memgrade").val(
            $(this).find(".mem_grade").html()
        );


        $("#accseq").val($(this).find(".acc_seq").val());
        $(".modal").fadeIn();

    });

};

$(".closeModal").click(function () {
    $(".modal").fadeOut();
});

$("#deleteAccount").on("click", function () {
    let ans = confirm("회원정보를 삭제하시겠습니까?");
    let acc_seq = $(this).closest(".modal").find("#accseq").val();

    if (ans == true) {
        $(".modal").fadeOut();
        $.ajax({
            url: "/admin/account/list/deleteAccount",
            data: {acc_seq:acc_seq},
            type: "post"
        }).done(function (resp) {
            location.reload();
        })
    }
});