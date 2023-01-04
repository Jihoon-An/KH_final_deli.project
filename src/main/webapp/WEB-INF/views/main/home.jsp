<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>

    <title>딜리 - Deli</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <link href="/resources/favicon.ico" rel="shortcut icon" type="image/x-icon">
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

    <!-- sweetAlert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- animate -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <link rel="stylesheet" href="/resources/css/main/home.css" type="text/css">
</head>
<body>

<main id="home">

    <div class="container">

        <div class="logoBox animate__animated animate__lightSpeedInRight">
            <img src="/resources/img/deli_logo.png">
        </div>

        <div class="loginBox">
            <form id="loginForm" action="/account/login" method="post">

                <div class="inputBox">
                    <input type="text" id="emailInput" class="form-control"
                           placeholder="이메일" name="email" <c:if test="${not empty saved_email}"> value="${saved_email}"</c:if>>
                    <input type="password" id="passWordInput" class="form-control" placeholder="비밀번호" name="pw">
                </div>

                <div class="buttonBox">
                    <button type="button" id="loginButton">로그인</button>
                    <div class="saveBox">
                        <input type="checkbox" id="emailSave" name="emailSave" class="" <c:if test="${not empty saved_email}">checked</c:if>>
                        <label class="cbx" for="emailSave"></label>
                        <label class="lbl" for="emailSave">이메일저장</label>
                    </div>
                    <div class="findBox">
                        <a class="link" href="/account/findAccount">이메일 l 비밀번호 찾기</a>
                    </div>
                </div>
                <br><br>
                <br><br>
                <div id="kakaoBox">
                    <a class="link" href="https://kauth.kakao.com/oauth/authorize?client_id=1475b617eab69841d5cabd68f1527015&redirect_uri=http://mydeli.me/account/oauth/kakao&response_type=code">
                        <img src="/resources/img/kakao_login.png" id="kakao_login_img">
                    </a>
                </div>
<%--                <a href="https://kauth.kakao.com/oauth/logout?client_id=1475b617eab69841d5cabd68f1527015&logout_redirect_uri=http://localhost/account/oauth/kakaoLogout">--%>
<%--                    카카오로그아웃--%>
<%--                </a>--%>
                <div class="clientSignUpLinkBox signUpBox">
                    <span>아직 딜리의 회원이 아니신가요?</span>
                    <a class="link" href="/account/signup">일반회원가입</a>
                </div>
                <div class="businessSignUpLinkBox signUpBox">
                    <span>아직 딜리의 사장님이 아니신가요?</span>
                    <a class="link" href="/ownerSignUp">사업자회원가입</a>
                </div>
            </form>
        </div>

    </div>


    <script src="/resources/js/main/home.js"></script>
</main>
</body>
</html>