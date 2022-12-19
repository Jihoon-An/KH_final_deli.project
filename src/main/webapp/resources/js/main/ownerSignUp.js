var email_ok = true;
var pw_ok = true;
var name_ok = true;
var phone_ok = true;
var bs_num_ok = true;
var bs_card_ok = true;

var confirm_text;
var confirm_count;
var count_stopper = false;
var count_status = false;

//이메일 시간 카운트다운
function countdown(elementName, minutes, seconds) {
    count_status = true;
    count_stopper = false;
    var element, endTime, hours, mins, msLeft, time;

    function twoDigits(n) {
        return (n <= 9 ? "0" + n : n);
    }

    function updateTimer() {
        msLeft = endTime - (+new Date);
        if (msLeft < 1000) {
            element.innerHTML = "시간초과";
        } else {
            time = new Date(msLeft);
            hours = time.getUTCHours();
            mins = time.getUTCMinutes();
            element.innerHTML = (hours ? hours + ':' + twoDigits(mins) : mins) + ':' + twoDigits(time.getUTCSeconds());
            if (count_stopper) {
                count_status = false;
                return;
            } else {
                setTimeout(updateTimer, time.getUTCMilliseconds() + 300);
            }
        }
    }

    element = document.getElementById(elementName);
    endTime = (+new Date) + 1000 * (60 * minutes + seconds) + 500;
    updateTimer();
}

function count_starter() {
    if (count_status) {
        count_stopper = true;
        console.log("test")
        setTimeout(count_starter, 300);
    } else {
        countdown("confirm_count", 3, 0);
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
            confirm_text = randomString();

            console.log(confirm_text);

            $.ajax({
                url: "/mailCerti",
                type: "post",
                data: {
                    address: $("#email").val(),
                    title: "Deli email confirm",
                    message: "<h1>" + confirm_text + "</h1>"
                }
            });
            $("#email_confirm_table").css("display", "block");

            count_stopper = true;
            count_starter();
        }
    });
});

function randomString() {
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
    if ($("#email_confirm_input").val() == confirm_text && $("#confirm_count").html() != "시간초과") {
        $("#email_confirm_table").css("display", "none");
        email_ok = true;
    } else {
        Swal.fire({
            icon: 'error',
            title: '땡!',
            text: '일치하지 않습니다.',
        })
        email_ok = false;
    }
}

$("#submit_btn").click(function () {
    if (!email_ok) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '이메일을 다시 확인해주세요.',
        });
        $("#email").focus();
        return;
    }
    if (!pw_ok) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '비밀번호를 다시 확인해주세요.',
        });
        $("#pw1").focus();
        return;
    }
    if (!name_ok) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '이름을 다시 확인해주세요.',
        });
        $("#name").focus();
        return;
    }
    if (!bs_num_ok) {
        Swal.fire({
            icon: 'error',
            title: '옳바르지 않은 입력입니다.',
            text: '사업자 번호를 다시 확인해주세요.',
        });
        $("#num").focus();
        return;
    }
    if (!bs_card_ok) {
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