var name_ok = false;
var code_ok = false;
var discount_ok = false;
var content_ok = false;
var period_ok = false;

$("#cp_code_confirm_btn").click(function () {
    $.ajax({
        url: "/addCoupon/dupleCheck",
        type: "post",
        data: {code: $("#cp_code").val()}
    }).done(function (result) {
        if (result == true) {
            Swal.fire({
                icon: 'error',
                title: '실패',
                text: '중복된 코드입니다',
            });
            $("#cp_code").val("").focus();
        } else {
            Swal.fire('사용가능 한 이메일입니다');
            $("#cp_code").attr("readonly", "true");
            code_ok = true;
        }
    });
});

$("#cp_add_btn").click(function () {
    if (!name_ok) {
        Swal.fire({
            icon: 'error',
            title: '실패',
            text: '쿠폰이름을 다시 확인해 주세요',
        });
        return;
    }
    $();
});

