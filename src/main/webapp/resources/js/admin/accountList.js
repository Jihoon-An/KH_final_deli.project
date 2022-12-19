$(document).ready(function () {
    $('#myTable').DataTable();
});
trClickEvent();
//페이지 버튼을 눌렀을때 다시 script 돌아가게
$(".paginate_button").click(function () {
    trClickEvent();
});
function trClickEvent() {
    $("tr").click(function () {

        if ($(this).find(".rev_display").val() == 'Y') {
            $("#openReview").hide();
            $("#privateReview").on("click", () => {
                let rev_seq = $(this).find(".rev_seq").val();
                $.ajax({
                    url: "/admin/review/modifyReviewDisplay",
                    data: {
                        rev_seq: rev_seq,
                        rev_display: 'N'
                    },
                    type: "post"
                }).done(function (resp) {
                    location.reload();
                })
            })
        } else {
            $("#privateReview").hide();
            $("#openReview").on("click", () => {
                let rev_seq = $(this).find(".rev_seq").val();
                $.ajax({
                    url: "/admin/review/modifyReviewDisplay",
                    data: {
                        rev_seq: rev_seq,
                        rev_display: 'Y'
                    },
                    type: "post"
                }).done(function (resp) {
                    location.reload();
                })
            })
        }

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

// function trClickEvent() {
//     $("tr").click(function () {
//
//         $("#frm").find(".email").val(
//             $(this).find(".acc_email").html());
//
//         $("#frm").find(".name").val(
//             $(this).find(".mem_name").html()
//         );
//
//         $("#frm").find(".phone").val(
//             $(this).find(".mem_phone").html()
//         )
//
//         $("#frm").find(".add").val(
//             $(this).find(".mem_name").html()
//         );
//
//
//         $(".modal").fadeIn();
//
//     });
//
//
//
// };