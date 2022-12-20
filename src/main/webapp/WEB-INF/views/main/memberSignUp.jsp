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
    <title>회원가입</title>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>
    <!--sweet alert2-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link rel="stylesheet" href="/resources/css/main/memberSignUp.css">
</head>
<body>
<c:choose>
    <c:when test="${not empty kakaoAccessToken}">
<form id="signup_frm" method="post" action="/account/kakaoSignUp">
    <input type="hidden" name="acc_type" value="client">
    <input type="hidden" name="acc_sns" value="kakao">
    <input type="hidden" name="acc_token" value="${acc_token}">

    <h1>회원가입 추가 정보 입력</h1>
    <a href="/account/kakaoUnLink"><button type="button">꺼져</button> </a>
    </c:when>
    <c:otherwise>
<form id="signup_frm" method="post" action="/account/memberSignUp">
    <input type="hidden" name="acc_type" value="client">
    <input type="hidden" name="acc_sns" value="normal">

    <h1>일반 회원가입</h1>
    <a href="https://kauth.kakao.com/oauth/authorize?client_id=1475b617eab69841d5cabd68f1527015&redirect_uri=http://localhost/account/oauth/kakao&response_type=code"><img
            src="/resources/img/kakao_login_start.png" width="300px"></a><br>
    </c:otherwise>
</c:choose>

    <%--이메일 입력--%>
    <input type="text" placeholder="이메일 주소 입력" name="acc_email" id="acc_email" maxlength='38'>
    <button type="button" id="email_certi_btn">인증</button><br>
    <p id="email_msg" style="display: none">이메일 양식에 맞게 썼는지 + 중복 확인 중입니다.</p>
    <%--이메일 인증--%>
    <div id="email_confirm_box" style="display: none">
        <input type="text" placeholder="이메일 인증번호 6자리" id="email_confirm_input" maxlength='6'>
        <button type="button" id="email_confirm_btn">확인</button>
        <span id="email_count"></span>
    </div>

    <hr>

    <input type="text" placeholder="숫자, 영문, 특수문자 조합에 8-16자리" id="pw" maxlength='16'><br>
    <input type="password" placeholder="비밀번호 재입력" id="pw_re" name="acc_pw" maxlength='16'><br>
    <p id="pw_msg" style="display: none">비밀번호 동일하게 입력하는지 확인 중입니다.</p>

    <hr>
    <input type="text" placeholder="닉네임 입력" name="mem_nick" id="mem_nick" maxlength='10'><br>
    <hr>

    <%--phone 입력--%>
    <input type="text" placeholder="핸드폰 번호 숫자만 입력" name="mem_phone" id="mem_phone" maxlength='11' oninput=validNum()>
    <button type="button" id="phone_certi_btn">인증</button><br>
    <p id="phone_msg" style="display: none">phone 양식에 맞게 썼는지 확인 중입니다.</p>
    <%--phone 인증--%>
    <div id="phone_confirm_box" style="display: none">
        <input type="text" placeholder="phone 인증번호 6자리" name="phone_confirm_input" id="phone_confirm_input" maxlength='6' oninput=validNum()>
        <button type="button" id="phone_confirm_btn">확인</button>
        <span id="phone_count"></span>
    </div>

    <hr>

    <p>기본 배달지 주소 등록</p>
    <input type="text" placeholder="주소지 별명을 입력해주세요." name="add_name" id="add_name" maxlength='10'><br>
    <input type="text" id="postcode" placeholder="우편번호" readonly>
    <button type="button" class="postsearch">우편검색</button>
    <br>
    <input type="text" id="add_detail1" name="add_detail1" placeholder="기본주소" readonly>
    <br>
    <input type="text" id="add_detail2" name="add_detail2" placeholder="상세주소">
    <br>
    <input type="hidden" id="add_x" name="add_x">
    <input type="hidden" id="add_y" name="add_y">

    <button type="button">취소 하기</button>
    <button type="button" id="submit_btn">가입 완료</button>

</form>

<script src="/resources/js/main/memberSignUp.js"></script>
</body>
</html>
