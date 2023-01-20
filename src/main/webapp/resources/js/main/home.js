

/**
 * 이메일 저장 해제 기능
 */
$("#emailSave").on("change" ,()=>{
    if (!$("#emailSave").is(":checked")) {
        $.ajax({
            url: "/account/deleteSavedEmail",
            type: "post"
        }).done(function(response){
        });
    }
});




function login(){
    if ($("#emailInput").val() == "") {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '이메일을 입력해 주세요.',
        });
        $("#emailInput").focus();
        return false;
    }
    if ($("#passWordInput").val() == "") {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '비밀번호를 입력해 주세요.',
        });
        $("#emailInput").focus();
        return false;
    }

    $.ajax({
        url: "/account/login",
        type: "post",
        data: $("#loginForm").serialize()
    }).done(function(response){
        if (response == false){
            Swal.fire({
                icon: 'error',
                title: '로그인 실패',
                text: '이메일 또는 비밀번호를 다시 확인해 주세요.',
            });
        }else {
            location.reload();
        }
    });
}


$("#loginButton").click(()=>{
    login();
});

$("#emailInput").on("keydown", function (e) {
    if (e.which == 13) {
        login();
    }
});
$("#passWordInput").on("keydown", function (e) {
    if (e.which == 13) {
        login();
    }
});
