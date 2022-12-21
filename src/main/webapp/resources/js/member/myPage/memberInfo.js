
// 기존 휴대폰번호
const oldPhoneNumber = $("#oldPhoneNumber").val();

// 패스워드 변경 Div Hide
$(".modifyPwBox").hide();

// 휴대폰 인증 Div Hide
$("#certificationBox").hide();



/**
 * 닉네임 Remove 버튼 기능
 */
$("#nameRemoveLabel").click(function (){
    $("#nickName").val("");
})



/**
 * 패스워드 변경 버튼 기능
 */
$("#passWordModifyBtn").click(function (){
    $(".modifyPwBox").show();

    // 비밀번호 변경 확인 버튼 기능
    $("#modifyPasswordConfirmBtn").click(function (){

        let oldPW = $("#oldPassWord");
        let newPW = $("#newPassWord");
        let conPW = $("#confirmPassWord");
        let pwCheckSpan = $("#pwCheckSpan");

        console.log(oldPW.val());
        console.log(newPW.val());
        console.log(conPW.val());
        console.log(pwCheckSpan.html());
        pwCheckSpan.text('');

        if (!oldPW.val().trim()) {
            oldPW.focus();
            oldPW.val("");
            pwCheckSpan.text("현재 비밀번호를 입력해주세요.");
            return false;
        }
        if (!newPW.val().trim()) {
            newPW.focus();
            newPW.val("");
            pwCheckSpan.text("새 비밀번호를 입력해주세요.");
            return false;
        }
        if (!conPW.val().trim()) {
            conPW.focus();
            conPW.val("");
            pwCheckSpan.text("새 비밀번호 확인을 입력해주세요.");
            return false;
        }
        if (newPW.val() !== conPW.val()) {
            $("#pwCheckSpan").text("새 비밀번호와 일치하지 않습니다.")
            return false;
        }

        if(oldPW.val().trim() !== '' && newPW.val().trim() !== '' && conPW.val().trim() !== ''){
            $.ajax({
                url: "/myPage/memberInfo/modify/passWord",
                type: "post",
                data: $("#modifyMemberInfo").serialize(),
                success:function (resp){
                    oldPW.val("");
                    newPW.val("");
                    conPW.val("");
                    pwCheckSpan.text("");
                    if (resp == 'true'){
                        alert("비밀번호 변경 성공");
                        $(".modifyPwBox").hide();
                    }else {
                        alert("비밀번호 변경 실패");
                    }
                }
            });

        }

    });
});



/**
 * 휴대폰번호 재인증 버튼 기능
 */
$("#reCertificationBtn").click(function (){
    let phoneNumber = $("#phoneNumber");
    phoneNumber.attr('readonly', false).val("").focus();
    $(this).text("발송");
    $("#certificationBox").show();

    // 인증번호 확인 버튼 기능
    $("#certificationConfirmBtn").click(function (){
        //
        //
        //
        $("#certificationBox").hide();
        phoneNumber.attr('readonly', true);
        $("#reCertificationBtn").text("재인증");
    });

});



/**
 * 정보 수정 버튼 기능
 */
$("#saveButton").on("click" ,()=>{

    $.ajax({
        url: "/myPage/memberInfo/modify",
        type: "post",
        data: $("#modifyMemberInfo").serialize()
    }).done(function(){
        alert("수정 성공");
    });

});




