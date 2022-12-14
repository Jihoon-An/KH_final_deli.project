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


</head>
<body>

<form id="signup_frm" method="post" action="/account/memberSignUp">
    <h1>일반 회원가입</h1>
    <a href="https://kauth.kakao.com/oauth/authorize?client_id=1475b617eab69841d5cabd68f1527015&redirect_uri=http://localhost/account/oauth/kakao&response_type=code"><img
            src="/resources/img/kakao_login.png"></a><br>
    <hr>
    <input type="text" placeholder="이메일 주소 입력해라" name="acc_email"><br>
    <input type="text" placeholder="비밀번호 입력해라"><br>
    <input type="password" placeholder="비밀번호 동일하게 입력해라" name="acc_pw"><br>
    <input type="hidden" name="acc_type" value="client">
    <input type="hidden" name="acc_sns" value="normal">

    <input type="text" placeholder="이름 입력해봐라." name="mem_name" id="mem_name"><br>
    <hr>
    <input type="text" placeholder="번호 입력해봐라." name="mem_phone" id="mem_phone"><br>
    <button type="button" id="tel_btn">발송</button>
    <hr>
    <input type="text" placeholder="인증번호 6자리 입력해봐라" name="telCertifyStr" id="telCertifyStr"><br>
    <button type="button" id="tel_confirm_btn">확인</button>
    <hr>

    <input type="text" id="postcode" placeholder="우편번호">
    <button type="button" class="postsearch">우편검색</button>
    <br>
    <input type="text" id="add_detail1" name="add_detail1" placeholder="기본주소">
    <br>
    <input type="text" id="add_detail2" name="add_detail2" placeholder="상세주소">
    <br>
    <input type="text" id="add_x" name="add_x" style="display: none">
    <input type="text" id="add_y" name="add_y" style="display: none">

    <button type="submit">가입 완료</button>
</form>

<script>

    var telCertifyCode = "";

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
                alert("성공");
            } else {
                alert("실패");
            }
        });
    });

    $(document).on("click", ".postsearch", function () {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
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


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("postcode").value = data.zonecode;
                document.getElementById("add_detail1").value = data.jibunAddress;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("add_detail2").focus();
            }
        }).open();
    })

</script>


</body>
</html>
