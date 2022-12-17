<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-11
  Time: 오후 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>일반 회원가입</title>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>
    <!--sweet alert2-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<form id="signup_frm" method="post" action="/account/memberSignUp">
    <h1>일반 회원가입</h1>
    <a href="https://kauth.kakao.com/oauth/authorize?client_id=1475b617eab69841d5cabd68f1527015&redirect_uri=http://localhost/account/oauth/kakao&response_type=code"><img
            src="/resources/img/kakao_login.png"></a><br>
    <hr>
    <input type="text" placeholder="이메일 주소 입력해라" name="acc_email"><br>
    <p>이메일 양식에 맞게 썼는지 + 중복 확인 중입니다.</p>


    <%--이메일 입력--%>
    <div class="input_title row"><h5>이메일</h5></div>
    <div class="row">
        <div class="col-3">
            <input class="input_data" id="email" name="acc_email">
        </div>
        <div class="col-3">
            <button class="certi_btn" type="button" id="email_btn">인증</button>
        </div>
    </div>
    <%--이메일 인증--%>
    <div id="email_confirm_table">
        <div class="row">
            <div class="col-3">
                <input class="input_data" id="email_confirm_input"/><span id="confirm_count"></span>
            </div>
            <div class="col-3">
                <button class="confirm_btn" id="email_confirm_btn">확인</button>
            </div>
        </div>
    </div>





    <input type="text" placeholder="비밀번호 입력해라"><br>
    <p>비밀번호 양식에 맞게 썼는지 확인 중입니다.</p>
    <input type="password" placeholder="비밀번호 동일하게 입력해라" name="acc_pw"><br>
    <p>비밀번호 동일하게 입력하는지 확인 중입니다.</p>
    <input type="hidden" name="acc_type" value="client">
    <input type="hidden" name="acc_sns" value="normal">
    <hr>
    <input type="text" placeholder="이름 입력해봐라." name="mem_name" id="mem_name"><br>
    <hr>
    <input type="text" placeholder="번호 입력해봐라." name="mem_phone" id="mem_phone"><button type="button" id="tel_btn">발송</button>
    <p>번호 양식에 맞게 썼는지 확인 중입니다.</p>
    <hr>
    <input type="text" placeholder="인증번호 6자리 입력해봐라" name="telCertifyStr" id="telCertifyStr">
     <button type="button" id="tel_confirm_btn">확인</button>
    <p>인증 완료인지 확인 중입니다.</p>
    <hr>
    <p>기본 배달지 주소 등록</p>
    <input type="text" placeholder="주소지 별명을 입력해주세요." name="add_name"><br>
    <input type="text" id="postcode" placeholder="우편번호">
    <button type="button" class="postsearch">우편검색</button>
    <br>
    <input type="text" id="add_detail1" name="add_detail1" placeholder="기본주소">
    <br>
    <input type="text" id="add_detail2" name="add_detail2" placeholder="상세주소">
    <br>
    <input type="hidden" id="add_x" name="add_x">
    <input type="hidden" id="add_y" name="add_y">

    <button type="button">취소 하기</button> <button type="submit">가입 완료</button>

</form>

<script>
    function countdown( elementName, minutes, seconds )
    {
        var element, endTime, hours, mins, msLeft, time;

        function twoDigits( n )
        {
            return (n <= 9 ? "0" + n : n);
        }

        function updateTimer()
        {
            msLeft = endTime - (+new Date);
            if ( msLeft < 1000 ) {
                element.innerHTML = "시간초과";
            } else {
                time = new Date( msLeft );
                hours = time.getUTCHours();
                mins = time.getUTCMinutes();
                element.innerHTML = (hours ? hours + ':' + twoDigits( mins ) : mins) + ':' + twoDigits( time.getUTCSeconds() );
                setTimeout( updateTimer, time.getUTCMilliseconds() + 500 );
            }
        }

        element = document.getElementById( elementName );
        endTime = (+new Date) + 1000 * (60*minutes + seconds) + 500;
        updateTimer();
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
                confirm_num = Math.floor(Math.random()*1000000)
                $.ajax({
                    url: "/mailCerti",
                    type: "post",
                    data: {
                        address: $("#email").val(),
                        title: "Deli email confirm",
                        message: "<h1>"+confirm_num+"</h1>"
                    }
                });
                $("#email_confirm_table").css("display", "block");
                countdown("confirm_count", 3, 0);
            }
        });
    });




    $("#email_confirm_btn").click(function () {
        if ($("#email_confirm_input").val() == confirm_num && $("#confirm_count").html() != "시간초과") {
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



















    $("#tel_btn").on("click", function () {
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

</script>


</body>
</html>
