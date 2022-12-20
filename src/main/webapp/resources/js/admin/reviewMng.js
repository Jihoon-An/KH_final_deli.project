$('#myTable').DataTable();

trClickEvent();
//페이지 버튼을 눌렀을때 다시 script 돌아가게
$("#myTable_paginate").click(function () {
    trClickEvent();
});

function trClickEvent() {
    $("tr").click(function () {

        let rev_display=$(this).find(".rev_display").val();
        console.log(rev_display);
        //리뷰 비공개
        if (rev_display == 'Y') {
            $("#openReview").hide();
            $("#privateReview").show();
            $("#privateReview").on("click", () => {
                let rev_seq = $(this).find(".rev_seq").val();
                $.ajax({
                    url: "/admin/review/modifyReviewDisplay",
                    data: {
                        "rev_seq": rev_seq,
                        "rev_display": 'N'
                    },
                    type: "post"
                }).done(function (resp) {
                    location.reload();
                })
            })
        } else {
            //리뷰 공개
            $("#privateReview").hide();
            $("#openReview").show();
            $("#openReview").on("click", () => {
                let rev_seq = $(this).find(".rev_seq").val();
                $.ajax({
                    url: "/admin/review/modifyReviewDisplay",
                    data: {
                        "rev_seq": rev_seq,
                        "rev_display": 'Y'
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

//모달닫기
$(".closeModal").click(function () {
    $(".modal").fadeOut();
});

//리뷰삭제
$("#deleteReview").on("click", function () {
    let ans = confirm("리뷰를 삭제하시겠습니까?");
    let rev_seq = $(this).closest(".modal").find("#rseq").val();

    if (ans == true) {
        $(".modal").fadeOut();
        $.ajax({
            url: "/admin/review/deleteReview",
            data: {"rev_seq": rev_seq},
            type: "post"
        }).done(function (resp) {
            location.reload();
        })
    }
});



