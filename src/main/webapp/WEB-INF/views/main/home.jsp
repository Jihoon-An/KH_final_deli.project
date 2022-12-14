
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <a href="/admin/review/selectReview">운영자리뷰로</a>
    <a href="/member/order/payResult">결제결과페이지로</a>
    <a href="/myPage/review/">일반회원-리뷰수정페이지로</a>
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

        <p><a href="/member/header/destination">배달지선택페이지로</a></p>
        <c:choose>
            <c:when test="${loginEmail != null}">
                ${acc_seq}
                <div class="container">
                    <marquee>
                        <h1>로그인 성공이다 이 짜식아ㄴㄴ.</h1>
                        <br>
                        <a href="/memberMain/toMemberMain"><button>메인으로</button></a>
                        <br>
                        <h1>
                            <a href="/account/logout"><button>로그아웃</button></a>
                        </h1>
                        <h2>
                            <a href="/userMenu/toMyPage"><button>마이페이지</button></a>
                        </h2>
                        <h1>
                            <a href="/basket"><button>고추장바구니모를찾아서</button></a>
                        </h1>
                    </marquee>
                </div>
            </c:when>

            <c:otherwise>
                <div class="container">

                    <div class="loginBox">
                        <form id="loginForm" action="/account/login" method="post">
                            <input type="text" placeholder="이메일" name="email" <c:if test="${not empty saved_email}"> value="${saved_email}"</c:if>>
                            <input type="password" placeholder="비밀번호" name="pw">
                            <br>
                            <label for="emailSave">이메일저장</label>
                            <input type="checkbox" id="emailSave" name="emailSave" <c:if test="${not empty saved_email}">checked</c:if>>
                            <button>로그인</button>
                            <br><br>
                            <a href="#">이메일|비밀번호 찾기</a>
                            <br><br>
                            <a href="https://kauth.kakao.com/oauth/authorize?client_id=1475b617eab69841d5cabd68f1527015&redirect_uri=http://localhost/account/oauth/kakao&response_type=code">
                                <img src="/resources/img/kakao_login.png" id="kakao_login_img">
                            </a>
                            <br>
                            <a href="https://kauth.kakao.com/oauth/logout?client_id=1475b617eab69841d5cabd68f1527015&logout_redirect_uri=http://localhost/account/oauth/kakaoLogout">
                                카카오로그아웃
                            </a>
                            <br><br>
                            <span>아직 딜리의 회원이 아니신가요?</span>
                            <a href="/account/toMemberSignUp">회원가입</a>
                        </form>
                    </div>

                </div>
            </c:otherwise>
        </c:choose>

        <script src="/resources/js/main/home.js"></script>
    </main>
</body>
</html>
