$(document).ready(function () {
    $('#myTable').DataTable();
})
trClickEvent();
//페이지 버튼을 눌렀을때 다시 script 돌아가게
$(".paginate_button").click(function () {
    trClickEvent();
});


function trClickEvent() {
    $("tr").click(function () {

        $("#frm").find(".ownernum").val(
            $(this).find(".owner_num").html());

        $("#frm").find(".oseq").val(
            $(this).find(".owner_seq").html()
        );

        $("#frm").find(".name").val(
            $(this).find(".owner_name").html()
        )
        $("#frm").find(".ophone").val(
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


        $("#accseq").val($(this).find(".acc_seq").val());
        $(".modal").fadeIn();

    });

};

$(".closeModal").click(function () {
    $(".modal").fadeOut();
});

$("#deleteOwner").on("click", function () {
    let ans = confirm("사업자회원정보를 삭제하시겠습니까?");
    let owner_seq = $(this).closest(".modal").find("#oseq").val();

    if (ans == true) {
        $(".modal").fadeOut();
        $.ajax({
            url: "/admin/owner/list/deleteOwner",
            data: {owner_seq:owner_seq},
            type: "post"
        }).done(function (resp) {
            location.reload();
        })
    }
});