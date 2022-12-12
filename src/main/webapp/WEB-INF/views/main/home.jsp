<%--
  Created by IntelliJ IDEA.
  User: abg14
  Date: 2022-12-11
  Time: 오후 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home</title>

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

    <link rel="stylesheet" href="/resources/css/main/home.css" type="text/css">
</head>
<body>
    <main id="home">
        <c:choose>
            <c:when test="${loginEmail != null}">
                <div class="container">
                    <marquee>
                        <h1>로그인 성공이다 이 짜식아.</h1>
                        <br>
                        <a href="/member/toMemberMain"><button>메인으로</button></a>
                        <br>
                        <h1>
                            <a href="/account/logout"><button>로그아웃</button></a>
                        </h1>
                    </marquee>
                </div>
            </c:when>

            <c:otherwise>
                <div class="container">

                    <div class="loginBox">
                        <form id="loginForm" action="/account/login" method="post">
                            <input type="text" placeholder="이메일" name="email">
                            <input type="text" placeholder="비밀번호" name="pw">
                            <button>로그인</button>
                        </form>
                        <label for="emailSave">이메일저장</label>
                        <input type="checkbox" id="emailSave" name="emailSave">
                        <a href="#">이메일|비밀번호 찾기</a>
                        <button>카카오로그인</button><br>
                        <span>아직 딜리의 회원이 아니신가요?</span>
                        <a href="/account/toMemberSignUp">회원가입</a>
                    </div>

                </div>
            </c:otherwise>
        </c:choose>


    </main>
</body>
</html>
