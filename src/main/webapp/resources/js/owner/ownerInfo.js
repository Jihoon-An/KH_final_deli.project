/**
 * 비밀번호 변경 버튼 기능
 */
$("#modifyPassWordModalButton").click(()=>{
    $(".modal").fadeIn();

    // 비밀번호 변경 확인 버튼 기능
    $("#modifyPasswordConfirmBtn").click(function (){

        let oldPW = $("#oldPassWord");
        let newPW = $("#newPassWord");
        let conPW = $("#confirmPassWord");
        let pwCheckSpan = $("#pwCheckSpan");

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
                url: "/owner/info/modifyPassWord",
                type: "post",
                data: $("#modifyPassWordForm").serialize(),
                success:function (resp){
                    oldPW.val("");
                    newPW.val("");
                    conPW.val("");
                    pwCheckSpan.text("");
                    if (resp == 'true'){
                        alert("비밀번호 변경 성공");
                        $(".modal").fadeOut();
                    }else {
                        alert("비밀번호 변경 실패");
                    }
                }
            });

        }

    });

})


/**
 * 비밀번호 모달 닫기 기능
 */
$("#closeModalButton").click(()=>{
    $(".modal").fadeOut();
})

