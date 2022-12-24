var emailOk = true;
var pwOk = true;
var nameOk = true;
var phoneOk = true;
var bsNumOk = true;
var bsCardOk = true;

var confirmText;
var confirmCount;
var countStopper = false;  //true: 돌고있는 count를 멈춤.
var countStatus = false;   //true: count가 돌고있는 중.

//이메일 시간 카운트다운
function countdown(elementName, minutes, seconds) {
    countStatus = true;
    countStopper = false;
    var element, endTime, hours, mins, msLeft, time;    //

    function twoDigits(n) {
        return (n <= 9 ? "0" + n : n);
    }

    function updateTimer() {
        msLeft = endTime - (+new Date);
        if (msLeft < 1000) {
            element.innerHTML = "시간초과"; //시간 다 되면 카운트에 숫자 대신 "시간초과"입력.
            countStatus = false;
        } else {
            time = new Date(msLeft);
            hours = time.getUTCHours();
            mins = time.getUTCMinutes();
            element.innerHTML = (hours ? hours + ':' + twoDigits(mins) : mins) + ':' + twoDigits(time.getUTCSeconds());
            if (countStopper) {        //count_stopper가 true면 count loop를 멈추고 상태를 변경.
                countStatus = false;   //count 상태 바꾸기.
                return;
            } else {
                setTimeout(updateTimer, time.getUTCMilliseconds() + 300);   //타이머 도는 딜레이설정
            }
        }
    }

    element = document.getElementById(elementName);                 //count 출력 위치 설정
    endTime = (+new Date) + 1000 * (60 * minutes + seconds) + 500;  //끝는 시간 설정
    updateTimer();  //count loop시작
}

function count_starter() {
    if (countStatus) {         //count가 돌고있으면 기존 카운트를 멈추고 새로운 딜레이 시작
        countStopper = true;   //기존 count loop를 멈추고 새로운 count를 시작함.
        setTimeout(count_starter, 300); //새 count 시작, 실패시 딜레이
    } else {
        countdown("confirm_count", 3, 0);   //기존에 count가 돌고있지 않았다면 새로운 카운트 시작.
    }
}

$("#email_btn").on("click", function () {
    $.ajax({
        url: "/ownerSignUp/dupleCheck",
        type: "post",
        data: {email: $("#email").val()}
    }).done(function (result) {
        if (result) {
            Swal.fire({
                icon: 'error',
                title: '실패',
                text: '중복된 이메일입니다',
            });
            $("#email").val("").focus();
        } else {
            Swal.fire('가입 가능한 이메일입니다.');
            // 이메일 보내기
            confirmText = randomString();

            $.ajax({
                url: "/mailCerti",
                type: "post",
                data: {
                    address: $("#email").val(),
                    title: "Deli email confirm",
                    message: "<h1>" + confirmText + "</h1>"
                }
            });
            $("#email_confirm_table").css("display", "block");

            countStopper = true;
            count_starter();
        }
    });
});

function randomString() {   //6글자의 랜덤한 글자 생성/
    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz';
    const stringLength = 6;
    let randomstring = '';
    for (let i = 0; i < stringLength; i++) {
        const rnum = Math.floor(Math.random() * chars.length);
        randomstring += chars.substring(rnum, rnum + 1);
    }
    return randomstring;
}


// 폰인증 보류
// $("#phone_btn").on("click", function () {
//     $.ajax({
//         url: "/",
//         type: "post",
//         data: {email:$("#email").val()}
//     })
// });

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
    if ($("#email_confirm_input").val() == confirmText && $("#confirm_count").html() != "시간초과") {
        $("#email_confirm_table").css("display", "none");
        emailOk = true;
    } else {
        Swal.fire({
            icon: 'error',
            title: '땡!',
            text: '일치하지 않습니다.',
        })
        emailOk = false;
    }
}

$("#submit_btn").click(function () {
    if (!emailOk) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '이메일을 다시 확인해주세요.',
        });
        $("#email").focus();
        return;
    }
    if (!pwOk) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '비밀번호를 다시 확인해주세요.',
        });
        $("#pw1").focus();
        return;
    }
    if (!nameOk) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '이름을 다시 확인해주세요.',
        });
        $("#name").focus();
        return;
    }
    if (!bsNumOk) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '사업자 번호를 다시 확인해주세요.',
        });
        $("#num").focus();
        return;
    }
    if (!bsCardOk) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '사업증을 다시 확인해주세요.',
        });
        $("#num").focus();
        return;
    }
    $("#signup_frm").submit();
});