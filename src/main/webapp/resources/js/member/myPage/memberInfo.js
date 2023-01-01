
// 기존 휴대폰번호
const oldPhoneNumber = $("#oldPhoneNumber").val();

// 패스워드 변경 Div Hide
$(".modifyPwBox").hide();

// 휴대폰 인증 Div Hide
$("#certificationBox").hide();
$("#phone_certi_btn").hide();



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
    $(this).hide();
    $("#passWordCloseBtn").show();
    $(".modifyPwBox").show();
});
$("#passWordCloseBtn").click(function (){
    $(this).hide();
    $("#passWordModifyBtn").show();
    $(".modifyPwBox").hide();
});

$("#newPassWord,#confirmPassWord").on("focus", function () {
    pw_check();
})
$("#newPassWord,#confirmPassWord").on("keyup", function () {
    pw_check();
})

// 비밀번호 - 값 입력 유효성 검사 display
function pw_check() {
    let pwRegex = /^(?=.*[A-Za-z\d])(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
    if ($("#newPassWord").val() == "") {
        $("#pwCheckSpan").show();
        $("#pwCheckSpan").css("color", "#000000");
        $("#pwCheckSpan").html("특수문자를 1개 이상 포함해 주세요");
        pw_ok = false;
    } else if (!pwRegex.test($("#newPassWord").val())) {
        $("#pwCheckSpan").show();
        $("#pwCheckSpan").css("color", "#FF0000");
        $("#pwCheckSpan").html("8-16자리, 특수문자 1개 이상 포함해 주세요");
        pw_ok = false;
    } else if ($("#confirmPassWord").val() != $("#newPassWord").val()) {
        $("#pwCheckSpan").show();
        $("#pwCheckSpan").css("color", "#FF0000");
        $("#pwCheckSpan").html("동일한 비밀번호를 입력해 주세요");
        pw_ok = false;
    } else {
        $("#pwCheckSpan").html("");
        $("#pwCheckSpan").css("color", "#000000");
        $("#pwCheckSpan").hide();
        pw_ok = true;
    }
}





// 비밀번호 변경 확인 버튼 기능
$("#modifyPasswordConfirmBtn").click(function (){
    let pwRegex = /^(?=.*[A-Za-z\d])(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
    let oldPW = $("#oldPassWord");
    let newPW = $("#newPassWord");
    let conPW = $("#confirmPassWord");
    let pwCheckSpan = $("#pwCheckSpan");

    pwCheckSpan.text('');

    if (!oldPW.val().trim()) {
        oldPW.focus();
        oldPW.val("");
        pwCheckSpan.text("현재 비밀번호를 입력해 주세요.");
        return false;
    }
    if (!newPW.val().trim()) {
        newPW.focus();
        newPW.val("");
        pwCheckSpan.text("새 비밀번호를 입력해 주세요.");
        return false;
    }
    if (!conPW.val().trim()) {
        conPW.focus();
        conPW.val("");
        pwCheckSpan.text("새 비밀번호 확인을 입력해 주세요.");
        return false;
    }
    if (!pwRegex.test(newPW.val())) {
        pwCheckSpan.text("비밀번호 형식에 맞게 입력해 주세요.");
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
                    Swal.fire({
                        icon: 'success',
                        title: '비밀번호가 변경되었습니다',
                    });
                    $("#passWordCloseBtn").hide();
                    $("#passWordModifyBtn").show();
                    $(".modifyPwBox").hide();
                }else {
                    Swal.fire({
                        icon: 'error',
                        title: '비밀번호 변경에 실패했습니다'
                    });
                }
            }
        });

    }

});




/**
 * 휴대폰번호 재인증 버튼 기능
 */

// input 칸에 숫자 외에 입력 안되게 막기
function validNum() {
    event.target.value = event.target.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
}

function phone_check() {
    if ($("#mem_phone").val() == "") {
        $("#phone_msg").show();
        $("#phone_msg").css("color", "#000000");
        $("#phone_msg").html("숫자만 입력 가능합니다");
    } else if (!phoneRegex.test($("#mem_phone").val())) {
        $("#phone_msg").show();
        $("#phone_msg").css("color", "#FF0000");
        $("#phone_msg").html("핸드폰 번호 형식을 확인해주세요");
    } else {
        $("#phone_msg").show();
        $("#phone_msg").css("color", "#008000");
        $("#phone_msg").html("인증번호를 입력해주세요");
    }
}

$("#reCertificationBtn").click(function (){
    let phoneNumber = $("#mem_phone");
    phoneNumber.attr('readonly', false).val("").focus();
    $(this).hide();
    $("#phone_certi_btn").show();
    $("#certificationBox").show();

    // 인증번호 확인 버튼 기능
    $("#certificationConfirmBtn").click(function (){
        $("#certificationBox").hide();
        phoneNumber.attr('readonly', true);
        $("#reCertificationBtn").text("재인증");
    });

});



/**
 * 휴대폰 번호 인증 기능
 */

let phoneRegex = /^0[\d]{9,10}$/;
var phone_ok = false;

var timer;
var isRunning = false;

// 인증번호 발송하고 타이머 함수 실행
function sendAuthNum(id){
    // 남은 시간
    var leftSec = 180,
        display = document.querySelector(id);
    // 이미 타이머가 작동중이면 중지
    if (isRunning){
        clearInterval(timer);
    } else {
        isRunning = true;
    }
    startTimer(leftSec, display);
}

function startTimer(count, display) {
    var minutes, seconds;
    timer = setInterval(function () {
        minutes = parseInt(count / 60, 10);
        seconds = parseInt(count % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        // 타이머 끝
        if (--count < 0) {
            clearInterval(timer);
            display.textContent = "시간초과";
            isRunning = false;
        }
    }, 1000);
}


$("#phone_certi_btn").on("click", function () {
    if($("#mem_phone").is(":disabled")){
        $("#mem_phone").val("");
        $("#mem_phone").attr("disabled",false);
    }
    if (phoneRegex.test($("#mem_phone").val())) {
        $.ajax({
            url: "/account/certify/tel",
            type: "post",
            data: {mem_phone: $("#mem_phone").val()}
        }).done(function (result) {
            if (result != null) {
                sendAuthNum("#phone_count");
                $("#phone_confirm_box").show();
                $("#count").show();
            } else {
                alert("메시지 전송 실패");
            }
        });
    } else {
        phone_check();
    }
});




$("#mem_phone").on("focus", function () {
    phone_check();
})

$("#mem_phone").on("keyup", function () {
    phone_check();
})

//phone confirm
$("#phone_confirm_input").on("keydown", function (e) {
    if (e.which == 13) {
        phone_confirm();
    }
});

$("#phone_confirm_btn").click(function () {
    phone_confirm();
});


function phone_confirm() {
    if (phoneRegex.test($("#mem_phone").val())
        && $("#phone_msg").html() == "인증번호를 입력해주세요") {
        $.ajax({
            url: "/account/certify/telConfirm",
            type: "post",
            data: {mem_phone: $("#mem_phone").val(), phone_confirm_input: $("#phone_confirm_input").val()}
        }).done(function (result) {
            if (result == true && $("#phone_count").html() != "시간초과") {
                $("#phone_msg").hide();
                $("#phone_confirm_box").hide();
                $("#certificationBox").hide();
                $("#mem_phone").attr("disabled", true);
                phone_ok = true;
                console.log(phone_ok);
            } else if ($("#phone_count").html() == "시간초과") {
                alert("인증을 다시 해주세요");
                phone_ok = false;
                console.log(phone_ok);
            } else {
                alert("인증 번호를 확인해주세요");
                phone_ok = false;
                console.log(phone_ok);
            }
        })
    }
}



/**
 * 정보 수정 버튼 기능
 */
$("#saveButton").on("click" ,()=>{

    let newNick = $("#nickName").val();
    let newPhone = $("#mem_phone").val();
    let oldPhone = $("#oldPhoneNumber").val();

    if (phone_ok === true) {
        $.ajax({
            url: "/myPage/memberInfo/modify",
            type: "post",
            data: {
                "mem_nick" : newNick,
                "mem_phone" : newPhone
            }
        }).done(function(){
            alert("수정 성공");
        });
    }else {
        $.ajax({
            url: "/myPage/memberInfo/modify",
            type: "post",
            data: {
                "mem_nick" : newNick,
                "mem_phone" : oldPhone
            }
        }).done(function(){
            alert("수정 성공");
        });
    }

});

/**
 * 회원탈퇴 버튼 기능
 */
$("#withdrawalButton").click(() => {
    Swal.fire({
        title: '정말 탈퇴하실건가요?',
        text: "다시 되돌릴 수 없습니다. 신중하세요.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소',
        reverseButtons: true, // 버튼 순서 거꾸로
    }).then((result) => {
        if (result.isConfirmed) {
            $("#withdrawalForm").submit();
        }
    })
});



