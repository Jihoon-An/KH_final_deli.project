$(document).ready(function () {
    $('#myTable').DataTable();
});
trClickEvent();
function trClickEvent() {
    $("tr").click(function () {
        // $("#frm").find(".writer").val(
        //     $(this).find(".mem_name").html()
        // );
        //
        // $("#star").val(
        //     $(this).find(".rev_star").val()
        // );
        //
        // $("#review_content").html(
        //     $(this).find(".rev_content").html()
        // );
        //
        // if (!$(this).find(".rev_content").html()) {
        //     $("#review_content").html(
        //         "리뷰 내용 x"
        //     );
        // } else {
        //     $("#review_content").html(
        //         $(this).find(".rev_content").html()
        //     );
        // }
        //
        // $("#write_date").val(
        //     $(this).find(".rev_writedate").find("#formed_rev_writedate").val()
        // );
        //
        // // $(this).closest("tr").find(".rev_modified_date").val()
        // if ($(this).find(".rev_modified_date").val() != "") {
        //     $("#modified_date").val(
        //         $(".formed_rev_modified_date").val()
        //     );
        // } else {
        //     $("#modified_date").val("");
        // }
        //
        // // rev_seq
        // $("#rseq").val($(this).find(".rev_seq").val());

        $(".modal").fadeIn();

    });
};