


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


/**
 * 휴대폰 번호 인증 기능
 */

// input 칸에 숫자 외에 입력 안되게 막기
function validNum() {
    event.target.value = event.target.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
}

function phone_check() {
    if ($("#phoneInput").val() == "") {
        $("#phone_msg").show();
        $("#pw_msg").css("color", "#000000");
        $("#phone_msg").html("숫자만 입력 가능합니다");
    } else if (!phoneRegex.test($("#phoneInput").val())) {
        $("#phone_msg").show();
        $("#phone_msg").css("color", "#FF0000");
        $("#phone_msg").html("핸드폰 번호 형식을 확인해주세요");
    } else {
        $("#phone_msg").show();
        $("#phone_msg").css("color", "#008000");
        $("#phone_msg").html("인증번호를 입력해주세요");
        // $("#phone_msg").html("");
        // $("#phone_msg").css("color", "#000000");
        // $("#phone_msg").hide();
    }
}

$("#modifyPhoneButton").click(function (){
    let phoneNumber = $("#phoneInput");
    phoneNumber.attr('readonly', false).val("").focus();
    $(this).hide();
    $("#phone_certi_btn").show();
    $("#certificationBox").show();
});





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
    if (phoneRegex.test($("#phoneInput").val())) {
        $.ajax({
            url: "/account/certify/tel",
            type: "post",
            data: {mem_phone: $("#phoneInput").val()}
        }).done(function (result) {
            if (result != null) {
                sendAuthNum("#phone_count");
                $("#phone_confirm_box").show();
            } else {
                alert("메시지 전송 실패");
            }
        });
    } else {
        phone_check();
    }
});




$("#phoneInput").on("focus", function () {
    phone_check();
})

$("#phoneInput").on("keyup", function () {
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
    if (phoneRegex.test($("#phoneInput").val())
        && $("#phone_msg").html() == "인증번호를 입력해주세요") {
        $.ajax({
            url: "/account/certify/telConfirm",
            type: "post",
            data: {mem_phone: $("#phoneInput").val(), phone_confirm_input: $("#phone_confirm_input").val()}
        }).done(function (result) {
            if (result == true && $("#phone_count").html() != "시간초과") {
                $("#phone_msg").hide();
                $("#phone_confirm_box").hide();
                $("#certificationBox").hide();
                $("#phoneInput").attr("readonly", true);
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
$("#modifyButton").click(function (){

    let oldPhone = $("#oldPhoneNumber").val();

    if (phone_ok !== true) {
        $("#phoneInput").val(oldPhone);
    }

    $("#ownerForm").submit();

    // $.ajax({
    //     url: "/owner/info/modifyOwner",
    //     type: "post",
    //     // data: $("#ownerForm").serialize(),
    //     data: {
    //         owner_name: $("#owner_name").val(),
    //         owner_phone: $("#phoneInput").val(),
    //         owner_num: $("#owner_num").val(),
    //         file: $("#ownerCardInput").val()
    //     },
    //     contentType: false,
    //     processData: false,
    //     success:function (resp){
    //         if (resp == 'true'){
    //             alert("사업자 정보 변경 성공");
    //             $(".modal").fadeOut();
    //         }else {
    //             alert("사업자 정보 변경 실패");
    //         }
    //     }
    // });
})


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
