
var email_confirm_num;

$("#email_btn").on("click", function () {
    $.ajax({
        url: "/ownerSignUp/dupleCheck",
        type: "post",
        data: {email: $("#email").val()}
    }).done(function (result) {
        if (result == true) {
            Swal.fire({
                icon: 'error',
                title: '실패',
                text: '중복된 이메일입니다',
            })
        } else {
            Swal.fire('가입 가능한 이메일입니다.');
            // 이메일 보내기
            email_confirm_num = Math.floor(Math.random()*1000000)
            $.ajax({
                url: "/mailCerti",
                type: "post",
                data: {
                    address: $("#email").val(),
                    title: "Deli email confirm",
                    message: "<h1>"+email_confirm_num+"</h1>"
                }
            });
            $("#email_confirm_table").css("display", "block");
        }
    });
});

// 폰인증 보류
// $("#phone_btn").on("click", function () {
//     $.ajax({
//         url: "/",
//         type: "post",
//         data: {email:$("#email").val()}
//     })
// });

$("email_confirm_btn").click(function () {

});