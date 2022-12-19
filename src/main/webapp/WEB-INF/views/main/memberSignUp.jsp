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
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>
    <!--sweet alert2-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link rel="stylesheet" href="/resources/css/main/memberSignUp.css">
</head>
<body>

<form id="signup_frm" method="post" action="/account/memberSignUp">
    <h1>일반 회원가입</h1>
    <a href="https://kauth.kakao.com/oauth/authorize?client_id=1475b617eab69841d5cabd68f1527015&redirect_uri=http://localhost/account/oauth/kakao&response_type=code"><img
            src="/resources/img/kakao_login_start.png" width="300px"></a><br>
    <hr>

    <%--이메일 입력--%>
    <input type="text" placeholder="이메일 주소 입력해라" name="acc_email" id="acc_email">
    <button type="button" id="acc_email_certi_btn">인증</button><br>
    <p id="acc_email_msg" style="display: none">이메일 양식에 맞게 썼는지 + 중복 확인 중입니다.</p>
    <%--이메일 인증--%>
    <input type="text" placeholder="이메일 인증번호 6자리" id="acc_email_confirm_input" maxlength='6' oninput=validNum()>
    <button type="button" id="acc_email_confirm_btn">확인</button>
    <span id="acc_email_certi_count"></span>

    <hr>

    <input type="text" placeholder="비밀번호 입력해라"><br>
    <p>비밀번호 양식에 맞게 썼는지 확인 중입니다.</p>
    <input type="password" placeholder="비밀번호 동일하게 입력해라" name="acc_pw"><br>
    <p>비밀번호 동일하게 입력하는지 확인 중입니다.</p>
    <input type="hidden" name="acc_type" value="client">
    <input type="hidden" name="acc_sns" value="normal">

    <hr>
    <input type="text" placeholder="이름 입력해봐라." name="mem_name" id="mem_name"><br>
    <hr>

    <%--번호 입력--%>
    <input type="text" placeholder="번호 숫자만 입력해봐라." name="mem_phone" id="mem_phone" maxlength='11' oninput=validNum()>
    <button type="button" id="tel_btn">인증</button><br>
    <p id="mem_phone_msg" style="display: none">번호 양식에 맞게 썼는지 확인 중입니다.</p>
    <%--번호 인증--%>
    <input type="text" placeholder="인증번호 6자리 입력해봐라  숫자만" name="telCertifyStr" id="telCertifyStr" maxlength='6'
           oninput=validNum()>
    <button type="button" id="tel_confirm_btn">확인</button>
    <span id="mem_phone_certi_count"></span>

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

    <button type="button">취소 하기</button>
    <button type="submit">가입 완료</button>

</form>

<script src="/resources/js/main/memberSignUp.js"></script>
</body>
</html>
