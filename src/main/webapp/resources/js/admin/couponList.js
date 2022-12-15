$(document).ready(function () {
    $('#myTable').DataTable();
});

$(".coupon").click(function () {

    let seq=$(this).find(".seq").val();
    let code=$(this).find(".code").val();
    let name=$(this).find(".name").text();
    let content=$(this).find(".content").val();
    let type=$(this).find(".type").text();
    let discount=$(this).find(".discount").text();
    let period=$(this).find(".period").val();
    $("#modal").find("#modal_cp_seq").val(seq);
    $("#modal").find("#modal_cp_name").val(name);
    if (code == null) {
        $("#modal").find("#modal_cp_code").css("display", "none");
    }else {
        $("#modal").find("#modal_cp_code").val(code);
    }
    if (content == null) {
        $("#modal").find("#modal_cp_content").css("display", "none");
    }else {
        $("#modal").find("#modal_cp_content").val(content);
    }
    $("#modal").find("#modal_cp_type").val(type);
    $("#modal").find("#modal_cp_discount").val(discount);

    if (content == null) {
        $("#modal").find("#modal_cp_content").css("display", "none");
    }else {
        $("#modal").find("#modal_cp_content").val(content);
    }
    $("#modal").find("#modal_cp_period").val(period);
    $("#modal").fadeIn();
});

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