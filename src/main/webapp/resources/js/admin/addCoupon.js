var name_ok = false;
var code_ok = true;
var discount_ok = false;
var content_ok = false;
var period_ok = false;

$("#cp_code").on("change", function () {
    if ($(this).val() == "") {
        code_ok = true;
    } else {
        code_ok = false;
    }
    console.log(code_ok);
});

$("#cp_code_confirm_btn").click(function () {
    $.ajax({
        url: "/admin/coupon/add/dupleCheck",
        type: "post",
        data: {code: $("#cp_code").val()},
        dataType: "json"
    }).done(function (result) {
        if (result) {
            Swal.fire({
                icon: 'error',
                title: '실패',
                text: '중복된 코드입니다'
            });
            code_ok = false;
            $("#cp_code").val("").focus();
        } else {
            Swal.fire('사용가능 한 코드입니다');
            $("#cp_code").attr("readonly", "true");
            code_ok = true;
        }
    });
});

$("#cp_add_btn").click(function () {
    if (!code_ok) {
        Swal.fire({
            icon: 'error',
            title: '실패',
            text: '쿠폰코드를 다시 확인해 주세요'
        });
        return;
    } else {
        $("#cp_add_frm").submit();
    }
});

