
$("#findEmailBox").hide();
$("#findPassWordBox").hide();

$("#findEmailButton").click(()=>{
    $("#findEmailBox").show();
    $("#findPassWordBox").hide();
})
$("#findPassWordButton").click(()=>{
    $("#findPassWordBox").show();
    $("#findEmailBox").hide();
})




// input 칸에 숫자 외에 입력 안되게 막기
function validNum() {
    event.target.value = event.target.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
}

// 전화번호 정규식
let phoneRegex = /^0[\d]{9,10}$/;

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

// 휴대폰번호 - 값 입력 유효성 검사 display
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
        $("#phone_msg").html("핸드폰을 인증해주세요.");
    }
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
        && $("#phone_msg").html() == "핸드폰을 인증해주세요.") {
        $.ajax({
            url: "/account/certify/telConfirm",
            type: "post",
            data: {mem_phone: $("#mem_phone").val(), phone_confirm_input: $("#phone_confirm_input").val()}
        }).done(function (result) {
            if (result == true && $("#phone_count").html() != "시간초과") {
                $("#phone_confirm_input").val("");
                $("#phone_msg").css("color", "#000000");
                $("#phone_msg").html("");
                $("#phone_msg").hide();
                $("#phone_confirm_box").hide();
                // $("#mem_phone").attr("disabled", true);
                alert("인증에 성공하였습니다")
                phoneOk = true;

                $.ajax({
                    url: "/account/findAccount/email",
                    type: "post",
                    data: {phoneNumber: $("#mem_phone").val()},
                    dataType: "json"
                }).done(function (result) {
                    for (let i=0;result.length>i;i++) {
                        $("#emailBox").append(
                            "<div class='emailResultBox'>" +
                            "<div class='emailDiv'>" +
                            "<span class='emailResult'>이메일 : "+result[i]+"</span>" +
                            "</div>" +
                            "<div class='signUpDateDiv'>" +
                            "<span class='signUpDateSpan'>가입날짜 : "+"1999.08.26"+"</span>" +
                            "</div>" +
                            "</div>"
                        )
                    }
                })
            } else if ($("#phone_count").html() == "시간초과") {
                alert("인증을 다시 해주세요");
                phoneOk = false;
            } else {
                alert("인증 번호를 확인해주세요");
                phoneOk = false;
            }
        })
    }
}





// 휴대폰번호 - 값 입력 유효성 검사 display
function pw_phone_check() {
    if ($("#pw_mem_phone").val() == "") {
        $("#pw_phone_msg").show();
        $("#pw_phone_msg").css("color", "#000000");
        $("#pw_phone_msg").html("숫자만 입력 가능합니다");
    } else if (!phoneRegex.test($("#pw_mem_phone").val())) {
        $("#pw_phone_msg").show();
        $("#pw_phone_msg").css("color", "#FF0000");
        $("#pw_phone_msg").html("핸드폰 번호 형식을 확인해주세요");
    } else {
        $("#pw_phone_msg").show();
        $("#pw_phone_msg").css("color", "#008000");
        $("#pw_phone_msg").html("핸드폰을 인증해주세요.");
    }
}


$("#pw_phone_certi_btn").on("click", function () {
    if($("#pw_mem_phone").is(":disabled")){
        $("#pw_mem_phone").val("");
        $("#pw_mem_phone").attr("disabled",false);
    }
    if (phoneRegex.test($("#pw_mem_phone").val())) {
        $.ajax({
            url: "/account/certify/tel",
            type: "post",
            data: {mem_phone: $("#pw_mem_phone").val()}
        }).done(function (result) {
            if (result != null) {
                sendAuthNum("#phone_count");
                $("#pw_phone_confirm_box").show();
            } else {
                alert("메시지 전송 실패");
            }
        });
    } else {
        pw_phone_check();
    }
});


$("#pw_mem_phone").on("focus", function () {
    pw_phone_check();
})
$("#pw_mem_phone").on("keyup", function () {
    pw_phone_check();
})
//phone confirm
$("#pw_phone_confirm_input").on("keydown", function (e) {
    if (e.which == 13) {
        pw_phone_confirm();
    }
});
$("#pw_phone_confirm_btn").click(function () {
    pw_phone_confirm();
});

function pw_phone_confirm() {
    if (phoneRegex.test($("#pw_mem_phone").val())
        && $("#pw_phone_msg").html() == "핸드폰을 인증해주세요.") {
        $.ajax({
            url: "/account/certify/telConfirm",
            type: "post",
            data: {mem_phone: $("#pw_mem_phone").val(), phone_confirm_input: $("#pw_phone_confirm_input").val()}
        }).done(function (result) {
            if (result == true && $("#pw_phone_count").html() != "시간초과") {
                $("#pw_phone_confirm_input").val("");
                $("#pw_phone_msg").css("color", "#000000");
                $("#pw_phone_msg").html("");
                $("#pw_phone_msg").hide();
                $("#pw_phone_confirm_box").hide();
                // $("#mem_phone").attr("disabled", true);
                alert("인증에 성공하였습니다")
                phoneOk = true;

                $.ajax({
                    url: "/account/findAccount/passWord",
                    type: "post",
                    data: {email: $("#pw_emailInput").val() , phoneNumber: $("#pw_mem_phone").val()}
                }).done(function (result) {
                    console.log(result);
                    $("#passWordBox").append(
                        "<div class='passWordResultBox'>" +
                        "<div class='passWordDiv'>" +
                        "<span class='passWordResult'>변경된 임시 비밀번호</span>" +
                        "</div>" +
                        "<div class='signUpDateDiv'>" +
                        "<span class='signUpDateSpan'>"+result+"</span>" +
                        "</div>" +
                        "</div>"
                    )
                })
            } else if ($("#pw_phone_count").html() == "시간초과") {
                alert("인증을 다시 해주세요");
                phoneOk = false;
            } else {
                alert("인증 번호를 확인해주세요");
                phoneOk = false;
            }
        })
    }
}




