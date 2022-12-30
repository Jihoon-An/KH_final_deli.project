$(document).ready(function () {
    $('#myTable').DataTable();
});
trClickEvent();
//페이지 버튼을 눌렀을때 다시 script 돌아가게
$(".paginate_button").click(function () {
    trClickEvent();
});


function trClickEvent() {
    $("account_tr").click(function () {

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