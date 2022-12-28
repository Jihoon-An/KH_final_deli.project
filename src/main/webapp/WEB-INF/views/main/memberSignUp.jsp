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
    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico"/>
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <!-- daumPostcode -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- kakaoMap -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2831f365f4c14d690cf0e21146e8dd99&libraries=services"></script>

    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <!-- sweetalert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">

    <link rel="stylesheet" href="/resources/css/main/memberSignUp.css">
    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
</head>
<body>
<main>
    <%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>

    <div class="container">
        <c:choose>
        <c:when test="${not empty kakaoAccessToken}">
        <form id="signup_frm" method="post" action="/account/kakaoSignUp">
            <input type="hidden" name="acc_type" value="client">
            <input type="hidden" name="acc_sns" value="kakao">
            <input type="hidden" name="acc_token" value="${acc_token}">
            <div class="titleBox">
                카카오회원가입 추가정보입력
            </div>
                <%--            스크립트에 카카오 아이디 있으면 회원탈퇴로 안내해주기.--%>
                <%--            <a href="/account/kakaoUnLink">--%>
                <%--                <button type="button">그냥 가입안할래요. 연동 해지해주세요.</button>--%>
                <%--            </a><br>--%>
            </c:when>
            <c:otherwise>
            <form id="signup_frm" method="post" action="/account/memberSignUp">
                <input type="hidden" name="acc_type" value="client">
                <input type="hidden" name="acc_sns" value="normal">
                <div class="titleBox">
                    일반회원가입
                </div>

                <a href="https://kauth.kakao.com/oauth/authorize?client_id=1475b617eab69841d5cabd68f1527015&redirect_uri=http://localhost/account/oauth/kakao&response_type=code"><img
                        src="/resources/img/kakao_login_start.png" width="100%"></a>

                <hr class="line">

                </c:otherwise>
                </c:choose>
                <p id="add_title">기본 정보 등록</p>
                <hr class="mini_line">
                <%--이메일 입력--%>
                <div class="input-group">
                    <input type="text" placeholder="이메일 주소 입력" id="acc_email" maxlength="38" class="form-control">
                    <input type="hidden" placeholder="이메일 주소 입력" name="acc_email" id="acc_email_hidden" maxlength="38">
                    <button type="button" id="email_certi_btn" class="deli_btn">인증</button>
                </div>
                <p id="email_msg" style="display: none">이메일 양식에 맞게 썼는지 + 중복 확인 중입니다.</p>
                <%--이메일 인증--%>
                <div id="email_confirm_box" style="display: none">
                    <div class="input-group">
                        <input type="text" placeholder="이메일 인증번호 6자리" id="email_confirm_input" maxlength="6"
                               class="form-control">
                        <button type="button" id="email_confirm_btn" class="deli_btn">확인</button>
                    </div>
                    <p class="count">인증번호 유효시간이 <span id="email_count"></span> 남았습니다</p>
                </div>

                <hr class="line">
                <input type="text" placeholder="비밀번호 숫자,영문,특수문자 8-16자리" id="pw" maxlength="16" class="form-control">
                <hr class="mini_line">
                <input type="password" placeholder="비밀번호 재입력" id="pw_re" name="acc_pw" maxlength="16"
                       class="form-control">
                <p id="pw_msg" style="display: none">비밀번호 동일하게 입력하는지 확인 중입니다.</p>

                <hr class="line">

                <input type="text" placeholder="닉네임 입력" name="mem_nick" id="mem_nick" maxlength="10"
                       class="form-control">

                <hr class="line">

                <%--phone 입력--%>
                <div class="input-group">
                    <input type="text" placeholder="휴대폰번호 숫자만 입력" id="mem_phone" maxlength="13" oninput=validNum()
                           class="form-control">
                    <input type="hidden" placeholder="휴대폰번호 숫자만 입력" name="mem_phone" id="mem_phone_hidden"
                           maxlength="13"
                           oninput=validNum()>
                    <button type="button" id="phone_certi_btn" class="deli_btn">인증</button>
                </div>
                <p id="phone_msg" style="display: none">phone 양식에 맞게 썼는지 확인 중입니다.</p>

                <%--phone 인증--%>
                <div id="phone_confirm_box" style="display: none">
                    <div class="input-group">
                        <input type="text" placeholder="phone 인증번호 6자리" name="phone_confirm_input"
                               id="phone_confirm_input"
                               maxlength="6" oninput=validNum() class="form-control">
                        <button type="button" id="phone_confirm_btn" class="deli_btn">확인</button>
                    </div>
                    <p class="count">인증번호 유효시간이 <span id="phone_count"></span> 남았습니다</p>
                </div>

                <hr class="line">

                <p id="add_title">기본 배달지 등록</p>
                <hr class="mini_line">
                <input type="text" placeholder="주소지 별명 입력" name="add_name" id="add_name" maxlength="10"
                       class="form-control">
                <hr class="mini_line">
                <div class="input-group">
                    <input type="text" id="postcode" placeholder="우편번호검색을 눌러주세요" class="form-control" readonly>
                    <button type="button" class="postsearch deli_btn">우편번호검색</button>
                </div>
                <hr class="mini_line">
                <input type="text" id="add_detail1" name="add_detail1" placeholder="기본주소가 입력됩니다" class="form-control" readonly>
                <hr class="mini_line">
                <input type="text" id="add_detail2" name="add_detail2" placeholder="상세주소 입력" class="form-control"
                       maxlength="50">
                <input type="hidden" id="add_x" name="add_x">
                <input type="hidden" id="add_y" name="add_y">

                <hr class="line">

                <div style="text-align: center">
                    <button type="button" id="submit_btn" class="deli_btn">가입 완료</button>
                </div>
            </form>
    </div>
    <div class="mt55"></div>
</main>
<script src="/resources/js/main/memberSignUp.js"></script>
</body>
</html>
