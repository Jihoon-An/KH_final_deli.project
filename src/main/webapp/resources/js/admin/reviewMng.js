$('#myTable').DataTable();

trClickEvent();
//페이지 버튼을 눌렀을때 다시 script 돌아가게
$(".paginate_button").click(function (){
    trClickEvent();
});
function trClickEvent() {
    $("tr").click(function () {
        $("#frm").find(".writer").val(
            $(this).find(".mem_name").html()
        );

        $("#star").val(
            $(this).find(".rev_star").val()
        );

        $("#review_content").html(
            $(this).find(".rev_content").html()
        );

        if (!$(this).find(".rev_content").html()) {
            $("#review_content").html(
                "리뷰 내용 x"
            );
        } else {
            $("#review_content").html(
                $(this).find(".rev_content").html()
            );
        }

        $("#write_date").val(
            $(this).find(".rev_writedate").find("#formed_rev_writedate").val()
        );

        // $(this).closest("tr").find(".rev_modified_date").val()
        if ($(this).find(".rev_modified_date").val() != "") {
            $("#modified_date").val(
                $(".formed_rev_modified_date").val()
            );
        } else {
            $("#modified_date").val("");
        }

        // rev_seq
        $("#rseq").val($(this).find(".rev_seq").val());

        $(".modal").fadeIn();

    });
};

// $(".mem_name").on("click", function () {
//     $("#frm").find(".writer").val(
//         $(this).html()
//     );
//
//     $("#star").val(
//         $(this).closest("tr").find(".rev_star").val()
//     );
//
//     $("#review_content").html(
//         $(this).closest("tr").find(".rev_content").html()
//     );
//
//     $("#write_date").val(
//         $(this).closest("tr").find(".rev_writedate").find("#formed_rev_writedate").val()
//     );
//
//     if( $(this).closest("tr").find(".rev_modified_date").val()!=null){
//         $("#modified_date").val(
//             $(".formed_rev_modified_date").val()
//         );
//     }else{
//         $("#modified_date").val("");
//     }
//
//     // rev_seq
//     $("#rseq").val($(this).closest("tr").find(".rev_seq").val());
//
//     $(".modal").fadeIn();
//
// });
//
//
// $(".store_name").on("click", function () {
//     $("#frm").find(".writer").val(
//         $(this).siblings(".mem_name").html()
//     );
//
//     $("#star").val(
//         $(this).closest("tr").find(".rev_star").val()
//     );
//
//     $("#review_content").html(
//         $(this).closest("tr").find(".rev_content").html()
//     );
//
//     $("#write_date").val(
//         $(this).closest("tr").find(".rev_writedate").find("#formed_rev_writedate").val()
//     );
//
//     if( $(this).closest("tr").find(".rev_modified_date").val()!=null){
//         $("#modified_date").val(
//             $(".formed_rev_modified_date").val()
//         );
//     }else{
//         $("#modified_date").val("");
//     }
//
//     // rev_seq
//     $("#rseq").val($(this).closest("tr").find(".rev_seq").val());
//
//     $(".modal").fadeIn();
//
// });
//
// $(".rev_writedate").on("click", function () {
//     $("#frm").find(".writer").val(
//         $(this).siblings(".mem_name").html()
//     );
//
//     $("#star").val(
//         $(this).closest("tr").find(".rev_star").val()
//     );
//
//     $("#review_content").html(
//         $(this).closest("tr").find(".rev_content").html()
//     );
//
//
//     $("#write_date").val(
//         $(this).closest("tr").find(".rev_writedate").find("#formed_rev_writedate").val()
//     );
//
//     if( $(this).closest("tr").find(".rev_modified_date").val()!=null){
//         $("#modified_date").val(
//             $(".formed_rev_modified_date").val()
//         );
//     }else{
//         $("#modified_date").val("");
//     }
//
//     // rev_seq
//     $("#rseq").val($(this).closest("tr").find(".rev_seq").val());
//
//     $(".modal").fadeIn();
//
// });
//
//
// $(".rev_modified_date").on("click", function () {
//     $("#frm").find(".writer").val(
//         $(this).siblings(".mem_name").html()
//     );
//
//     $("#star").val(
//         $(this).closest("tr").find(".rev_star").val()
//     );
//
//     $("#review_content").html(
//         $(this).closest("tr").find(".rev_content").html()
//     );
//
//
//     $("#write_date").val(
//         $(this).closest("tr").find(".rev_writedate").find("#formed_rev_writedate").val()
//     );
//
//
//     if( $(this).closest("tr").find(".rev_modified_date").val()!=null){
//         $("#modified_date").val(
//             $(".formed_rev_modified_date").val()
//         );
//     }else{
//         $("#modified_date").val("");
//     }
//
//     // rev_seq
//     $("#rseq").val($(this).closest("tr").find(".rev_seq").val());
//
//     $(".modal").fadeIn();
//
// });
$(".closeModal").click(function () {
    $(".modal").fadeOut();
});

$("#deleteReview").on("click", function () {
    let ans = confirm("리뷰를 삭제하시겠습니까?");
    let rev_seq=$(this).closest(".modal").find("#rseq").val();

    if (ans == true) {
        // location.href = "/admin/review/deleteReview?rev_seq="+rev_seq;
        $.ajax({
            url:"/admin/review/deleteReview",
            data: {rev_seq : rev_seq},
            type:"post"
        }).done(function (resp){
            location.reload();
        })
    }
});





