let lang_kor = {
    "decimal": "",
    "emptyTable": "데이터가 없습니다.",
    "info": "_START_ - _END_ (총 _TOTAL_ 개)",
    "infoEmpty": "0 개",
    "infoFiltered": "(전체 _MAX_ 개 중 검색결과)",
    "infoPostFix": "",
    "thousands": ",",
    "lengthMenu": "_MENU_ 개씩 보기",
    "loadingRecords": "로딩중...",
    "processing": "처리중...",
    "search": "검색 : ",
    "zeroRecords": "검색된 데이터가 없습니다.",
    "paginate": {
        "first": "첫 페이지",
        "last": "마지막 페이지",
        "next": "다음",
        "previous": "이전"
    },
    "aria": {
        "sortAscending": " :  오름차순 정렬",
        "sortDescending": " :  내림차순 정렬"
    }
};

$(document).ready(function () {
    $('#myTable').DataTable({
        language: lang_kor,
        order: [[0, 'desc']], lengthMenu: [
            [10, 25, 50, -1],
            [10, 25, 50, 'All'],
        ]
    });
});
trClickEvent();
//페이지 버튼을 눌렀을때 다시 script 돌아가게
$(".paginate_button").click(function () {
    trClickEvent();
});


function trClickEvent() {
    $(".owner_tr").click(function () {

        $("#frm").find(".ownernum").val(
            $(this).find(".owner_num").html());

        $("#frm").find(".owner_seq").val(
            $(this).find(".owner_seq").html()
        );
        $("#frm").find(".acc_seq").val(
            $(this).find(".acc_seq").html()
        );

        $("#frm").find(".name").val(
            $(this).find(".owner_name").html()
        )
        $("#frm").find(".ownerPhone").val(
            $(this).find(".owner_phone").html()
        );

        $("#frm").find(".email").val(
            $(this).find(".acc_email").html()
        );

        $("#frm").find(".scount").val(
            $(this).find(".store_count").html()
        );

        $("#frm").find(".signdate").val(
            $(this).find(".acc_signupdate").html()
        );


        $(".modal").fadeIn();

    });

};

$(".closeBtn").click(function () {
    $(".modal").fadeOut();
});

$("#deleteOwner").on("click", function () {
    let ans = confirm("사업자회원정보를 삭제하시겠습니까?");
    let ownerSeq = $(this).closest(".modal").find("#owner_seq").val();
    let accSeq = $(this).closest(".modal").find("#acc_seq").val();
    if (ans == true) {
        $(".modal").fadeOut();
        $.ajax({
            url: "/admin/owner/list/deleteOwner",
            data: {
                owner_seq: ownerSeq,
                acc_seq: accSeq
            },
            type: "post"
        }).done(function (resp) {
            location.reload();
        })
    }
});