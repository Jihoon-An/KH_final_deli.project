// input 칸에 숫자 외에 입력 안되게 막기
function validNum() {
    event.target.value = event.target.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
}

// 유효성 검사 Regex
let emailRegex = /^[a-zA-Z0-9+-\_.]{1,15}@[a-zA-Z0-9-]{1,15}\.[a-zA-Z-.]{2,8}$/;
let pwRegex = /^(?=.*[A-Za-z\d])(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
                // 특수문자를 무조건 1개 이상 포함, 숫자, 영문 대소문자 사용 가능한 8-16자리
// let phoneRegex = /^0[\d]{9,10}$/;
let phoneRegex = $("#mem_phone").val().replace(/-/gi, "");
let nickRegex = /^[가-힣a-zA-Z0-9]{1,10}$/;
let addNameRegex = /^[가-힣a-zA-Z0-9]{1,10}$/;

var email_ok = false;
var pw_ok = false;
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

// 이메일(아이디) - 아이디 중복검사 & 값 입력 유효성 검사 display
$("#email_certi_btn").on("click", function () {
    if($("#acc_email").is(":disabled")){
        $("#acc_email").val("");
        $("#acc_email_hidden").val("");
        $("#acc_email").attr("disabled",false);
    }

    if (emailRegex.test($("#acc_email").val())
        && $("#email_msg").html() == "사용 가능한 이메일 입니다. 인증해주세요.") {
        $.ajax({
            url: "/account/dupleCheck",
            type: "post",
            data: {email: $("#acc_email").val()}
        }).done(function (result) {
            if (!result) { // 아이디가 존재하지않으므로 사용할 수 있는 경우
                // 이메일 보내기
                confirmText = randomString();
                sendAuthNum("#email_count");
                $.ajax({
                    url: "/mailCerti",
                    type: "post",
                    data: {
                        address: $("#acc_email").val(),
                        title: "Deli email confirm",
                        message: "<h1>" + confirmText + "</h1>"
                    }
                });
                $("#email_confirm_box").show();
            }
        });
    }
});

function randomString() {   //6글자의 랜덤한 글자 생성/
    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz';
    const stringLength = 6;
    let randomstring = '';
    for (let i = 0; i < stringLength; i++) {
        const rnum = Math.floor(Math.random() * chars.length);
        randomstring += chars.substring(rnum, rnum + 1);
    }
    console.log(randomstring);
    return randomstring;
}

function email_check() {
    if ($("#acc_email").val() == "") {
        $("#email_msg").show();
        $("#pw_msg").css("color", "#000000");
        $("#email_msg").html("사용하는 이메일을 입력해주세요");
    } else if (!emailRegex.test($("#acc_email").val())) {
        $("#email_msg").show();
        $("#email_msg").css("color", "#FF0000");
        $("#email_msg").html("이메일 형식을 확인해주세요");
    } else {
        $.ajax({
            url: "/account/dupleCheck",
            type: "post",
            data: {email: $("#acc_email").val()}
        }).done(function (result) {
            if (result) { // 아이디가 이미 존재하므로 사용할 수 없는 경우
                $("#email_msg").show();
                $("#email_msg").css("color", "#FF0000");
                $("#email_msg").html("이미 사용 중인 이메일 입니다.");
            } else { // 아이디가 존재하지않으므로 사용할 수 있는 경우
                $("#email_msg").show();
                $("#email_msg").css("color", "#008000");
                $("#email_msg").html("사용 가능한 이메일 입니다. 인증해주세요.");
            }
        })
    }
}

$("#acc_email").on("focus", function () {
    email_check();
})

$("#acc_email").on("keyup", function () {
    email_check();
})


//email confirm
$("#email_confirm_input").on("keydown", function (e) {
    if (e.which == 13) {
        email_confirm();
    }
});

$("#email_confirm_btn").click(function () {
    email_confirm();
});


function email_confirm() {
    if ($("#email_confirm_input").val() == confirmText && $("#email_count").html() != "시간초과") {
        $("#email_confirm_input").val("");
        $("#email_msg").css("color", "#000000");
        $("#email_msg").html("");
        $("#email_msg").hide();
        $("#email_confirm_box").hide();
        $("#acc_email").attr("disabled",true);
        let acc_email_val = $("#acc_email").val();
        $("#acc_email_hidden").val(acc_email_val);
        email_ok = true;
    } else if ($("#email_count").html() == "시간초과") {
        Swal.fire({
            icon: 'error',
            title: '실패',
            text: '인증을 다시해주세요',
        });
        email_ok = false;
    } else {
        Swal.fire({
            icon: 'error',
            title: '실패',
            text: '인증번호를 확인해주세요',
        });
        email_ok = false;
    }
}

// 휴대폰번호 - 값 입력 유효성 검사 display
function phone_check() {
    if ($("#mem_phone").val() == "") {
        $("#phone_msg").show();
        $("#phone_msg").css("color", "#000000");
        $("#phone_msg").html("숫자만 입력 가능합니다");
    } else if (phoneRegex.length != 11) {
        $("#phone_msg").show();
        $("#phone_msg").css("color", "#FF0000");
        $("#phone_msg").html("핸드폰 번호 형식을 확인해주세요");
    } else {
        $("#phone_msg").show();
        $("#phone_msg").css("color", "#008000");
        $("#phone_msg").html("핸드폰을 인증해주세요");
    }
}


$("#phone_certi_btn").on("click", function () {
    if($("#mem_phone").is(":disabled")){
        $("#mem_phone").val("");
        $("#mem_phone_hidden").val("");
        $("#mem_phone").attr("disabled",false);
    }
    if (phoneRegex.length == 11) {
        $.ajax({
            url: "/account/certify/tel",
            type: "post",
            data: {mem_phone: $("#mem_phone").val()}
        }).done(function (result) {
            if (result != null) {
                sendAuthNum("#phone_count");
                $("#phone_confirm_box").show();
            } else {
                Swal.fire({
                    icon: 'error',
                    title: '실패',
                    text: '메세지 전송 실패',
                });
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

    if (phoneRegex.length == 11
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
                $("#mem_phone").attr("disabled", true);
                let mem_phone_val = $("#mem_phone").val().replace(/-/gi, "");
                $("#mem_phone_hidden").val(mem_phone_val);
                phone_ok = true;
            } else if ($("#phone_count").html() == "시간초과") {
                Swal.fire({
                    icon: 'error',
                    title: '실패',
                    text: '인증을 다시해주세요',
                });
                phone_ok = false;
            } else {
                Swal.fire({
                    icon: 'error',
                    title: '실패',
                    text: '인증번호를 확인해주세요',
                });
                phone_ok = false;
            }
        })
    }
}

$("#pw,#pw_re").on("focus", function () {
    pw_check();
})

$("#pw,#pw_re").on("keyup", function () {
    pw_check();
})

// 비밀번호 - 값 입력 유효성 검사 display
function pw_check() {
    if ($("#pw").val() == "") {
        $("#pw_msg").show();
        $("#pw_msg").css("color", "#000000");
        $("#pw_msg").html("비밀번호 입력시 특수문자는 무조건 1개 포함해주세요");
        pw_ok = false;
    } else if (!pwRegex.test($("#pw").val())) {
        $("#pw_msg").show();
        $("#pw_msg").css("color", "#FF0000");
        $("#pw_msg").html("비밀번호 형식을 확인해주세요");
        pw_ok = false;
    } else if ($("#pw_re").val() != $("#pw").val()) {
        $("#pw_msg").show();
        $("#pw_msg").css("color", "#FF0000");
        $("#pw_msg").html("동일한 비밀번호를 입력해주세요");
        pw_ok = false;
    } else {
        $("#pw_msg").html("");
        $("#pw_msg").css("color", "#000000");
        $("#pw_msg").hide();
        pw_ok = true;
    }
}



$("#submit_btn").click(function () {
    if (!email_ok) {
        Swal.fire({
            icon: 'error',
            title: '실패',
            text: '이메일을 다시 확인해주세요',
        });
        $("#acc_email").focus();
        return;
    }
    if (!pw_ok) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다',
            text: '비밀번호를 다시 확인해주세요',
        });
        $("#pw").focus();
        return;
    }
    if (!nickRegex.test($("#mem_nick").val())) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다',
            text: '닉네임을 다시 확인해주세요',
        });
        $("#mem_nick").focus();
        return;
    }
    if (!phone_ok) {
        Swal.fire({
            icon: 'error',
            title: '실패',
            text: '휴대폰을 다시 확인해주세요',
        });
        $("#pw").focus();
        return;
    }
    if (!addNameRegex.test($("#add_name").val())) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다',
            text: '주소지 별명을 다시 확인해주세요',
        });
        $("#add_name").focus();
        return;
    }
    if($("#postcode").val()=="") {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다',
            text: '우편검색 버튼 눌러 주소를 입력해주세요',
        });
        $("#postcode").focus();
        return;
    }
    if($("#add_detail2").val()=="") {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다',
            text: '상세주소를 입력해주세요',
        });
        $("#add_detail2").focus();
        return;
    }
    $("#signup_frm").submit();
});



$(document).on("click", ".postsearch", function () {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = ''; // 주소 변수
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
                document.getElementById("add_detail1").value = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
                document.getElementById("add_detail1").value = data.jibunAddress;
            }
            var geocoder = new kakao.maps.services.Geocoder();
            var callback = function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    let x = result[0].x;
                    let y = result[0].y;
                    document.getElementById("add_y").value = x;
                    document.getElementById("add_x").value = y;
                }
            };

            geocoder.addressSearch(addr, callback);
            document.getElementById("postcode").value = data.zonecode;
            document.getElementById("add_detail2").focus();
        }
    }).open();
})

function autoHypenTel(str) {
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';

    if (str.substring(0, 2) == 02) {
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
        // 핸드폰 및 다른 지역 전화번호 일 경우
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

