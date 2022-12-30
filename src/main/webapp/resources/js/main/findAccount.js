

$("#choiceEmail").change(()=>{
    if ($("#choiceEmail").is(":checked")){
        $("#findEmailButton").css({
            "background-color":"#e84c4f",
            "color":"white"
        });
        $("#findPassWordButton").css({
            "background-color":"#F8F5F2",
            "border":"4px solid #e84c4f",
            "color":"#3e4462"
        });
    }
})
$("#choicePassWord").change(()=>{
    if ($("#choicePassWord").is(":checked")){
        $("#findPassWordButton").css({
            "background-color":"#e84c4f",
            "color":"white"
        });
        $("#findEmailButton").css({
            "background-color":"#F8F5F2",
            "border":"4px solid #e84c4f",
            "color":"#3e4462"
        });
    }
})



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
// let phoneRegex = /^0[\d]{9,10}$/;

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
    let phoneRegex = $("#mem_phone").val().replace(/-/gi, "");
    if ($("#mem_phone").val() == "") {
        $("#phone_msg").show();
        $("#phone_msg").css("color", "#000000");
        $("#phone_msg").html("숫자만 입력 가능합니다");
    } else if (phoneRegex.length != 11) {
        $("#phone_msg").show();
        $("#phone_msg").css("color", "#FF0000");
        $("#phone_msg").html("휴대폰 번호 형식을 확인해주세요");
    } else {
        $("#phone_msg").show();
        $("#phone_msg").css("color", "#008000");
        $("#phone_msg").html("휴대폰 번호를 인증해주세요");
    }
}


$("#phone_certi_btn").on("click", function () {
    if($("#mem_phone").is(":disabled")){
        $("#mem_phone").val("");
        $("#mem_phone").attr("disabled",false);
    }
    let phoneRegex = $("#mem_phone").val().replace(/-/gi, "");
    if (phoneRegex.length == 11) {
        $.ajax({
            url: "/account/certify/tel",
            type: "post",
            data: {mem_phone: $("#mem_phone").val().replace(/-/gi, "")}
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
$("#mem_phone").on("keyup", function (event) {
    phone_check();
    event = event || window.event;
    var _val = this.value.trim();
    this.value = autoHypenTel(_val);
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
    let phoneRegex = $("#mem_phone").val().replace(/-/gi, "");
    if (phoneRegex.length == 11
        && $("#phone_msg").html() == "휴대폰 번호를 인증해주세요") {
        $.ajax({
            url: "/account/certify/telConfirm",
            type: "post",
            data: {mem_phone: $("#mem_phone").val().replace(/-/gi, ""), phone_confirm_input: $("#phone_confirm_input").val()}
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
                    data: {phoneNumber: $("#mem_phone").val().replace(/-/gi, "")},
                    dataType: "json"
                }).done(function (result) {
                    for (let i=0;result.length>i;i++) {
                        $("#emailBox").append(
                            "<div class='emailResultBox'>" +
                            "<div class='emailDiv'>" +
                            "<span class='emailIcon'>" +
                            "<i class=\"fa-solid fa-at\"></i>" +
                            "</span>" +
                            "<span class='emailResult'>"+result[i].acc_email+"</span>" +
                            "</div>" +
                            "<div class='signUpDateDiv'>" +
                            "<span class='signUpIcon'>" +
                            "<i class=\"fa-solid fa-link\"></i>" +
                            "</span>" +
                            "<span class='signUpDateSpan'>"+result[i].acc_signupdate+"</span>" +
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
    let pw_phoneRegex = $("#pw_mem_phone").val().replace(/-/gi, "");
    if ($("#pw_mem_phone").val() == "") {
        $("#pw_phone_msg").show();
        $("#pw_phone_msg").css("color", "#000000");
        $("#pw_phone_msg").html("숫자만 입력 가능합니다");
    } else if (pw_phoneRegex.length != 11) {
        $("#pw_phone_msg").show();
        $("#pw_phone_msg").css("color", "#FF0000");
        $("#pw_phone_msg").html("휴대폰 번호 형식을 확인해주세요");
    } else {
        $("#pw_phone_msg").show();
        $("#pw_phone_msg").css("color", "#008000");
        $("#pw_phone_msg").html("휴대폰 번호를 인증해주세요");
    }
}


$("#pw_phone_certi_btn").on("click", function () {
    if($("#pw_mem_phone").is(":disabled")){
        $("#pw_mem_phone").val("");
        $("#pw_mem_phone").attr("disabled",false);
    }
    let pw_phoneRegex = $("#pw_mem_phone").val().replace(/-/gi, "");
    if (pw_phoneRegex.length == 11) {
        $.ajax({
            url: "/account/certify/tel",
            type: "post",
            data: {mem_phone: $("#pw_mem_phone").val().replace(/-/gi, "")}
        }).done(function (result) {
            if (result != null) {
                sendAuthNum("#pw_phone_count");
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
    event = event || window.event;
    var _val = this.value.trim();
    this.value = autoHypenTel(_val);
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
    let pw_phoneRegex = $("#pw_mem_phone").val().replace(/-/gi, "");
    if (pw_phoneRegex.length == 11
        && $("#pw_phone_msg").html() == "휴대폰 번호를 인증해주세요") {
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
                    data: {
                        email: $("#pw_emailInput").val(),
                        phoneNumber: $("#pw_mem_phone").val().replace(/-/gi, "")
                    }
                }).done(function (result) {
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


function autoHypenTel(str) {
    str = str.replace(/[^0-9]/g, '');
    str = str.substring(0,11);

    var tmp = '';

    if (str.substring(0, 2) == '02') {
        // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
        if (str.length < 3) {
            return str;
        } else if (str.length < 6) {
            tmp += str.substr(0, 2);
            tmp += '-';
            tmp += str.substr(2);
            return tmp;
        } else if (str.length < 10) {
            tmp += str.substr(0, 2);
            tmp += '-';
            tmp += str.substr(2, 3);
            tmp += '-';
            tmp += str.substr(5);
            return tmp;
        } else {
            tmp += str.substr(0, 2);
            tmp += '-';
            tmp += str.substr(2, 4);
            tmp += '-';
            tmp += str.substr(6, 4);
            return tmp;
        }
    } else {
        // 휴대폰 및 다른 지역 전화번호 일 경우
        if (str.length < 4) {
            return str;
        } else if (str.length < 7) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        } else if (str.length < 11) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        } else {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
    }

    return str;
}


