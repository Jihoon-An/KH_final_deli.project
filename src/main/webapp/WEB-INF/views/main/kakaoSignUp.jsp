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
    <title>카카오 회원가입</title>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>

</head>
<body>

<form method="post" action="/account/kakaoSignUp">
    <h1>회원가입 추가 정보 입력</h1>
    <hr>

    <input type="text" placeholder="이메일 주소 입력해라" name="acc_email"><br>
    <p>이메일 양식에 맞게 썼는지 + 중복 확인 중입니다.</p>
    <input type="text" placeholder="비밀번호 입력해라"><br>
    <p>비밀번호 양식에 맞게 썼는지 확인 중입니다.</p>
    <input type="password" placeholder="비밀번호 동일하게 입력해라" name="acc_pw"><br>
    <p>비밀번호 동일하게 입력하는지 확인 중입니다.</p>
    <input type="hidden" name="acc_type" value="client">
    <input type="hidden" name="acc_sns" value="kakao">
    <input type="hidden" name="acc_token" value="${acc_token}">
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
    <button type="submit">가입 완료</button>
</form>

<script>

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
