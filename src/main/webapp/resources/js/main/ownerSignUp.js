var emailOk = false;
var pwOk = false;
var nameOk = false;
var phoneOk = false;
var bsNumOk = false;
var bsCardOk = false;

var phoneConfirmText;
var phoneConfirmCount;
var phoneCountStopper = false;  //true: 돌고있는 count를 멈춤.
var phoneCountStatus = false;   //true: count가 돌고있는 중.

var confirmText;
var confirmCount;
var countStopper = false;  //true: 돌고있는 count를 멈춤.
var countStatus = false;   //true: count가 돌고있는 중.

//이메일 시간 카운트다운
function countdown(elementName, minutes, seconds) {
    countStatus = true;
    countStopper = false;
    let element, endTime, hours, mins, msLeft, time;    //

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

function countStarter() {
    if (countStatus) {         //count가 돌고있으면 기존 카운트를 멈추고 새로운 딜레이 시작
        countStopper = true;   //기존 count loop를 멈추고 새로운 count를 시작함.
        setTimeout(countStarter, 300); //새 count 시작, 실패시 딜레이
    } else {
        countdown("confirm_count", 3, 0);   //기존에 count가 돌고있지 않았다면 새로운 카운트 시작.
    }
}

$("#email_btn").on("click", function () {
    // 이메일 유효성 검사
    let emailRegex = new RegExp('^[a-zA-Z0-9+-\\_.]{1,15}@[a-zA-Z0-9-]{1,15}\\.[a-zA-Z-.]{2,8}$');
    if (emailRegex.test($("#email").val()) == false) {
        Swal.fire('옳지 않은 이메일 형식입니다.');
        $("#email").focus();
        emailOk = false;
        return;
    }
    ;

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

            // $.ajax({
            //     url: "/mailCerti",
            //     type: "post",
            //     data: {
            //         address: $("#email").val(),
            //         title: "Deli email confirm",
            //         message: "<h1>" + confirmText + "</h1>"
            //     }
            // });
            $("#email_confirm_table").css("display", "block");

            countStopper = true;
            countStarter();
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


//이메일 시간 카운트다운
function phoneCountdown(elementName, minutes, seconds) {
    phoneCountStatus = true;
    phoneCountStopper = false;
    let element, endTime, hours, pMins, msLeft, pTime;    //

    function twoDigits(n) {
        return (n <= 9 ? "0" + n : n);
    }

    function phoneUpdateTimer() {
        msLeft = endTime - (+new Date);
        if (msLeft < 1000) {
            element.innerHTML = "시간초과"; //시간 다 되면 카운트에 숫자 대신 "시간초과"입력.
            phoneCountStatus = false;
        } else {
            pTime = new Date(msLeft);
            hours = pTime.getUTCHours();
            pMins = pTime.getUTCMinutes();
            element.innerHTML = (hours ? hours + ':' + twoDigits(pMins) : pMins) + ':' + twoDigits(pTime.getUTCSeconds());
            if (phoneCountStopper) {        //count_stopper가 true면 count loop를 멈추고 상태를 변경.
                phoneCountStatus = false;   //count 상태 바꾸기.
                return;
            } else {
                setTimeout(phoneUpdateTimer, pTime.getUTCMilliseconds() + 300);   //타이머 도는 딜레이설정
            }
        }
    }

    element = document.getElementById(elementName);                 //count 출력 위치 설정
    endTime = (+new Date) + 1000 * (60 * minutes + seconds) + 500;  //끝는 시간 설정
    phoneUpdateTimer();  //count loop시작
}

function phoneCountStarter() {
    if (phoneCountStatus) {         //count가 돌고있으면 기존 카운트를 멈추고 새로운 딜레이 시작
        phoneCountStopper = true;   //기존 count loop를 멈추고 새로운 count를 시작함.
        setTimeout(phoneCountStarter, 300); //새 count 시작, 실패시 딜레이
    } else {
        phoneCountdown("phone_confirm_count", 3, 0);   //기존에 count가 돌고있지 않았다면 새로운 카운트 시작.
    }
}


// 폰인증

$("#phone_btn").on("click", function () {

    phoneOk = false;
    let phoneNum = $("#phone").val().replace(/-/gi, "");
    if (phoneNum.length != 11) {
        Swal.fire("전화번호를 다시 확인해주세요.");
        return;
    }
    $("#owner_phone").val(phoneNum);
    phoneConfirmText = randomString();

    $.ajax({
        url: "/util/sendSms",
        type: "post",
        data: {tel:phoneNum, msg:'딜리 인증번호['+phoneConfirmText +']'}
    })

    $("#phone_confirm_box").css("display", "flex");
    $("#phone_confirm_input").val("");
    phoneCountStarter();
});
$("#phone_confirm_btn").on("keydown", function (e) {
    if (e.which == 13) {
        phoneConfirm();
    }
});
$("#phone_confirm_btn").click(function () {
    phoneConfirm();
});

function phoneConfirm() {
    if ($("#phone_confirm_count").html() == "시간초과") {
        phoneOk = false;
        Swal.fire({
            icon: 'error',
            title: '땡!',
            text: '시간이 초과되었습니다.',
        });
        return;
    }

    if (phoneConfirmText == $("#phone_confirm_input").val()) {
        phoneOk = true;
        $("#phone_confirm_box").css("display", "none");
        Swal.fire("인증되었습니다.");
    } else {
        phoneOk = false;
        $("#phone_confirm_input").val("");
        Swal.fire("땡!!");
    }
}

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
    if ($("#confirm_count").html() == "시간초과") {
        Swal.fire({
            icon: 'error',
            title: '땡!',
            text: '시간이 초과되었습니다.',
        })
        emailOk = false;
    }

    if ($("#email_confirm_input").val() == confirmText) {
        $("#email_confirm_table").css("display", "none");
        $("#email").attr("readonly", "true");
        $("#email_btn").attr("disabled");
        $("#re_email_btn").toggle();
        $("#email_btn").toggle();
        emailOk = true;
        Swal.fire({
            icon: 'success',
            title: '성공!',
            text: '이메일이 인증되었습니다.',
        })
    } else {
        Swal.fire({
            icon: 'error',
            title: '땡!',
            text: '일치하지 않습니다.',
        })
        emailOk = false;
    }
}

// email 다시 입력
$("#re_email_btn").click(function () {
    $("#re_email_btn").toggle();
    $("#email_btn").toggle();
    $("#email_confirm_input").val("");
    $("#email").removeAttr("readonly");
    emailOk = false;
});

$('#input_file').on('change', function () {
    filesTest($(this)[0]);
})

function filesTest(element) {  // 값이 변경되면
    const files = element.files;

    for (const file of files) {
        var filename = file.name.split('/').pop().split('\\').pop();
        var ext = filename.split('.').pop().toLowerCase(); //확장자분리
        //아래 확장자가 있는지 체크

        if ($.inArray(ext, ['jpg', 'jpeg', 'gif', 'png', 'pdf']) == -1) {
            Swal.fire({
                icon: 'error',
                title: '파일 형식 오류',
                text: 'jpg, jpeg, gif, png, pdf 파일만 업로드할 수 있습니다.',
            })
            element.value = "";
            bsCardOk = false;
            return;
        }
        bsCardOk = true;
    }
};


//Submit
$("#submit_btn").click(function () {
    //test


    //비밀번호
    let pw1 = $("#pw1").val();
    let pw2 = $("#pw2").val();

    let pwRegex = /^(?=.*[A-Za-z\d])(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
    if (!pwRegex.test(pw1)) {
        Swal.fire({
            icon: 'error',
            title: '비밀번호가 옳바르지 않습니다.',
            text: '조건을 다시 확인해주세요.',
        });
        $("#pw1").focus();
        pwOk = false;
        return;
    }

    if (pw1 == pw2) {
        pwOk = true;
    } else {
        pwOk = false;
        Swal.fire({
            icon: 'error',
            title: '비밀번호가 일치하지 않습니다.',
            text: '비밀번호를 다시 확인해주세요.',
        });
        $("#pw2").focus();
        return;
    }

    //이름
    let nameRegex = /^[가-힣]{2,4}$/;
    if (nameRegex.test($("#name").val())) {
        nameOk = true;
    } else {
        nameOk = false;
        Swal.fire({
            icon: 'error',
            title: '이름이 조건에 맞지 않습니다.',
            text: '조건을 다시 확인해주세요.',
        });
        $("#name").focus();
        return;
    }
    //핸드폰번호
    //인증에서 처리

    //사업자번호
    let numRegex = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/;
    if (numRegex.test($("#num").val())) {
        bsNumOk = true;
    } else {
        Swal.fire({
            icon: 'error',
            title: '형식이 일치하지 않습니다.',
            text: '사업자 번호를 다시 확인해주세요.',
        });
    }
    //사업자 등록증


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

function autoHypenTel(str) {
    str = str.replace(/[^0-9]/g, '');
    str = str.substring(0,11);
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

$('#phone').keyup(function (event) {
    event = event || window.event;
    var _val = this.value.trim();
    this.value = autoHypenTel(_val);
});


// //////////////// 눈 /////////////////
// const MIN_DURATION = 10;
//
// function makeSnowflake() {
//     const body = document.getElementById("body");
//     const snowflake = document.createElement("div");
//     const delay = Math.random() * 10;
//     const initialOpacity = Math.random();
//     const duration = Math.random() * 20 + MIN_DURATION;
//     snowflake.classList.add("snowflake");
//     snowflake.style.left = `${Math.random() * window.screen.width}px`;
//     snowflake.style.animationDelay = `${delay}s`;
//     snowflake.style.opacity = initialOpacity;
//     snowflake.style.animation = `fall ${duration}s linear`;
//
//     body.appendChild(snowflake);
//
//     setTimeout(()=> {
//         body.removeChild(snowflake);
//         makeSnowflake()
//     }, (duration + delay) * 1000);
// }
//
// for (let index = 0; index < 50; index++){
//     setTimeout(makeSnowflake, 500 * index);
// }
// ////////////////////////////////////////