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
    <title>OwnerSignUp</title>

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/css/main/ownerSignUp.css">

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
<main id="owner_signup">
    <div class="container">
        <form id="signup_frm" action="/ownerSignUp/signUp" enctype="multipart/form-data" method="post">
            <div class="header row"><h1 class="text-center">사업자 회원가입</h1></div>

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
            <div class="row" id="email_confirm_table">
                <div class="col-3">
                    <input class="input_data" id="email_confirm_input"/>
                </div>
                <div class="col-3">
                    <button class="confirm_btn" id="email_confirm_btn">확인</button>
                </div>
            </div>
            <%--비밀번호 입력--%>
            <div class="input_title row"><h5>비밀번호</h5></div>
            <div class="row">
                <div class="col">
                    <input class="input_data" id="pw1" name="acc_pw">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <input class="input_data" id="pw2">
                </div>
            </div>
            <%--이름 입력--%>
            <div class="input_title row"><h5>이름</h5></div>
            <div class="row">
                <div class="col">
                    <input class="input_data" id="name" name="owner_name">
                </div>
            </div>
            <%--핸드폰 번호 입력--%>
            <div class="input_title row"><h5>핸드폰 번호</h5></div>
            <div class="row">
                <div class="col-3">
                    <input class="input_data" id="phone" name="owner_phone">
                </div>
                <div class="col-3">
                    <button class="certi_btn" type="button" id="phone_btn">인증</button>
                </div>
            </div>
            <%--사업자 번호 입력--%>
            <div class="input_title row"><h5>사업자 번호</h5></div>
            <div class="row">
                <div class="col">
                    <input class="input_data" id="num" name="owner_num">
                </div>
            </div>
            <%--사업자 등록증 업로드--%>
            <div class="input_title row"><h5>사업자 등록증</h5></div>
            <div class="row">
                <div class="col">
                    <input type="file" class="input_file" id="input_file" name="input_file">
                </div>
            </div>
            <%--footer 버튼--%>
            <div class="row">
                <div class="col-3">
                    <button type="button" class="footer_btn">취소하기</button>
                </div>
                <div class="col-3">
                    <button type="submit" class="footer_btn">가입하기</button>
                </div>
            </div>
        </form>
    </div>
</main>


<script src="/resources/js/main/ownerSignUp.js"></script>
</body>
</html>
