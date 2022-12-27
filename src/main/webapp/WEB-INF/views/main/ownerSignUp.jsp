<%--
  Created by IntelliJ IDEA.
  User: abg14
  Date: 2022-12-12
  Time: 오후 1:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 사장님 가입</title>
    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico"/>
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/css/main/ownerSignUp.css">
    <%--sweet alert2--%>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <%--font--%>
    <%--font-family: 'Noto Sans KR', sans-serif;--%>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <%--font-family: 'Nanum Gothic', sans-serif;--%>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<body>
<main id="owner_signup">
    <div class="container">
        <form id="signup_frm" action="/ownerSignUp/signUp" enctype="multipart/form-data"
              method="post">
            <div class="header row"><h1 class="text-center">사업자 회원가입</h1></div>

            <%--이메일 입력--%>
            <div class="input_title row mt-5"><h5>이메일</h5></div>
            <div class="row">
                <div class="col-9">
                    <input class="input_data form-control" id="email" name="acc_email">
                </div>
                <div class="col-3">
                    <button class="certi_btn form-control myBtn" type="button" id="email_btn">인증</button>
                    <button class="certi_btn form-control myBtn" type="button" id="re_email_btn" style="display:none;">
                        다시입력
                    </button>
                </div>
            </div>

            <%--이메일 인증--%>
            <div id="email_confirm_table" class="mt-1">
                <div class="row">
                    <div class="col-9">
                        <input class="input_data form-control" id="email_confirm_input"/><span
                            id="confirm_count"></span>
                    </div>
                    <div class="col-3">
                        <button type="button" class="confirm_btn form-control myBtn" id="email_confirm_btn">확인</button>
                    </div>
                </div>
            </div>

            <%--비밀번호 입력--%>
            <div class="input_title row mt-3"><h5>비밀번호</h5></div>
            <div class="row">
                <div class="col">
                    <input type="password" class="input_data form-control" id="pw1" name="acc_pw" placeholder="8~16글자+특수문자">
                </div>
            </div>
            <div class="row mt-1">
                <div class="col">
                    <input type="password" class="input_data form-control" id="pw2" placeholder="비밀번호 재입력">
                </div>
            </div>

            <%--이름 입력--%>
            <div class="input_title row mt-3"><h5>이름</h5></div>
            <div class="row">
                <div class="col">
                    <input class="input_data form-control" id="name" name="owner_name">
                </div>
            </div>

            <%--핸드폰 번호 입력--%>
            <div class="input_title row mt-3"><h5>핸드폰 번호</h5></div>
            <div class="row">
                <div class="col-9">
                    <input
                            type="tel"
                            class="input_data form-control"
                            id="phone"
                            required
                            pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
                            maxlength="13"
                            placeholder="예) 010-1234-5678"
                    />
                    <input
                            type="hidden" ,
                            name="owner_phone",
                            id="owner_phone"
                    />
                </div>
                <div class="col-3">
                    <button class="certi_btn form-control myBtn" type="button" id="phone_btn">인증</button>
                </div>
            </div>
            <div class="row" id="phone_confirm_box" style="display: none">
                <div class="col-9">
                    <input class="form-control" type="text" id="phone_confirm_input" placeholder="인증문자 입력">
                    <span id="phone_confirm_count"></span>
                </div>
                <div class="col-3">
                    <button class="certi_btn form-control myBtn" type="button" id="phone_confirm_btn">확인</button>
                </div>
            </div>

            <%--사업자 번호 입력--%>
            <div class="input_title row mt-3"><h5>사업자 번호</h5></div>
            <div class="row">
                <div class="col">
                    <input type="number" class="input_data form-control" id="num" name="owner_num" min="0" maxlength="11" max="999999999999">
                </div>
            </div>

            <%--사업자 등록증 업로드--%>
            <div class="input_title row mt-3"><h5>사업자 등록증</h5></div>
            <div class="row">
                <div class="col">
                    <input type="file" class="input_file form-control" id="input_file" name="file">
                </div>
            </div>

            <%--footer 버튼--%>
            <div class="row justify-content-center mt-5">
                <div class="col-3">
                    <a href="/">
                        <button type="button" class="footer_btn form-control btn btn-danger" id="cancel_btn">취소하기</button>
                    </a>
                </div>
                <div class="col-3">
                    <button type="button" class="footer_btn form-control btn btn-danger" id="submit_btn">가입하기</button>
                </div>
            </div>
        </form>
    </div>
</main>


<script src="/resources/js/main/ownerSignUp.js"></script>
</body>
</html>
