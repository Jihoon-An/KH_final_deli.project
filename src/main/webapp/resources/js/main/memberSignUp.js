// input 칸에 숫자 외에 입력 안되게 막기
function validNum() {
    event.target.value = event.target.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
}


function countdown(elementName, minutes, seconds) {
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
            setTimeout(updateTimer, time.getUTCMilliseconds() + 500);
        }
    }
    element = document.getElementById(elementName);
    endTime = (+new Date) + 1000 * (60 * minutes + seconds) + 500;
    updateTimer();
}


// 유효성 검사 Regex
let emailRegex = /^[a-zA-Z0-9+-\_.]{1,20}@[a-zA-Z0-9-]{1,15}\.[a-zA-Z-.]{1,12}$/;
let bsPwRegex = /^(?=.*[A-Za-z\d])(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
let phoneRegex = /^0[\d]{8,10}$/;
let bsNumberRegex = /^[1-9][\d]{7}[1-9][\d]$/;


// 이메일(아이디) - 아이디 중복검사 & 값 입력 유효성 검사 display
$("#acc_email_certi_btn").on("click", function () {
    if (emailRegex.test($("#acc_email").val())
        && $("#acc_email_msg").html() == "사용 가능한 이메일 입니다.") {
        $.ajax({
            url: "/account/dupleCheck",
            type: "post",
            data: {email: $("#acc_email").val()}
        }).done(function (result) {
            if (!result) { // 아이디가 존재하지않으므로 사용할 수 있는 경우
                // 이메일 보내기
                confirm_num = Math.floor(Math.random() * 1000000)
                $.ajax({
                    url: "/mailCerti",
                    type: "post",
                    data: {
                        address: $("#acc_email").val(),
                        title: "Deli email confirm",
                        message: "<h1>" + confirm_num + "</h1>"
                    }
                });
                countdown("acc_email_certi_count", 3, 0);
            }
        });
    }
});

function email_check() {
    if ($("#acc_email").val() == "") {
        $("#acc_email_msg").css("display", "block");
        $("#acc_email_msg").html("이메일 형식을 아이디로 사용합니다");
    } else if (!emailRegex.test($("#acc_email").val())) {
        $("#acc_email_msg").css("display", "block");
        $("#acc_email_msg").css("color", "#FF0000");
        $("#acc_email_msg").html("이메일 형식을 확인해주세요");
    } else {
        $.ajax({
            url: "/account/dupleCheck",
            type: "post",
            data: {email: $("#acc_email").val()}
        }).done(function (result) {
            if (result) { // 아이디가 이미 존재하므로 사용할 수 없는 경우
                $("#acc_email_msg").css("display", "block");
                $("#acc_email_msg").css("color", "#FF0000");
                $("#acc_email_msg").html("이미 사용 중인 이메일 입니다.");
            } else { // 아이디가 존재하지않으므로 사용할 수 있는 경우
                $("#acc_email_msg").css("display", "block");
                $("#acc_email_msg").css("color", "#008000");
                $("#acc_email_msg").html("사용 가능한 이메일 입니다.");
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


$("#acc_email_confirm_btn").click(function () {
    if ($("#email_confirm_input").val() == confirm_num && $("#confirm_count").html() != "시간초과") {
        $("#acc_email_msg").css("display", "none");
        email_ok = true;
    } else {
        Swal.fire({
            icon: 'error',
            title: '땡!',
            text: '일치하지 않습니다.',
        })
        email_ok = false;
    }
});




// 휴대폰번호 - 아이디 중복검사 & 값 입력 유효성 검사 display
$("#acc_email_certi_btn").on("click", function () {
    if (emailRegex.test($("#acc_email").val())) {
        $.ajax({
            url: "/account/dupleCheck",
            type: "post",
            data: {email: $("#acc_email").val()}
        }).done(function (result) {
            if (!result) { // 아이디가 존재하지않으므로 사용할 수 있는 경우
                // 이메일 보내기
                confirm_num = Math.floor(Math.random() * 1000000)
                $.ajax({
                    url: "/mailCerti",
                    type: "post",
                    data: {
                        address: $("#acc_email").val(),
                        title: "Deli email confirm",
                        message: "<h1>" + confirm_num + "</h1>"
                    }
                });
                countdown("acc_email_certi_count", 3, 0);
            }
        });
    }
});


$("#tel_btn").on("click", function () {
    if (phoneRegex.test($("#mem_phone").val())) {
        $.ajax({
            url: "/account/certify/tel",
            type: "post",
            data: {tel: $("#mem_phone").val()}
        }).done(function (result) {
            if (result != null) {
                alert("메시지 전송 중");
            } else {
                alert("메시지 전송 실패");
            }
        });
    } else {
        $("#mem_phone_msg").css("display", "block");
        $("#mem_phone_msg").css("color", "#FF0000");
        $("#mem_phone_msg").html("번호 형식을 확인해주세요.");
    }
});

$("#tel_confirm_btn").on("click", function () {
    $.ajax({
        url: "/account/certify/telConfirm",
        type: "post",
        data: {tel: $("#mem_phone").val(), telCertifyStr: $("#telCertifyStr").val()}
    }).done(function (result) {
        console.log(result);
        if (result == true) {
            alert("인증 성공");
        } else {
            alert("인증 실패");
        }
    });
});



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



$(document).on("click", ".postsearch", function () {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = ''; // 주소 변수
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
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
            document.getElementById("add_detail1").value = data.roadAddress;
            document.getElementById("add_detail1").value = data.jibunAddress;
            document.getElementById("add_detail2").focus();
        }
    }).open();
})