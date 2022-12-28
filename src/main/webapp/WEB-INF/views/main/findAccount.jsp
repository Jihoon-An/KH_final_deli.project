<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 이메일 l 비밀번호 찾기</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <link href="/resources/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">

    <link rel="stylesheet" href="/resources/css/main/findAccount.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/customHeader/common.css" type="text/css">
</head>
<body>

    <main id="findAccount">

        <div class="container">


            <div class="titleBox">
                이메일 l 비밀번호 찾기
            </div>

            <div class="choiceBox">
                <input type="radio" id="choiceEmail" name="choice" style="display: none">
                <input type="radio" id="choicePassWord" name="choice" style="display: none">
                <label id="findEmailButton" for="choiceEmail">이메일 찾기</label>
                <label id="findPassWordButton" for="choicePassWord">비밀번호 찾기</label>
            </div>

            <div id="findEmailBox">
                <input type="text" placeholder="핸드폰 번호 숫자만 입력" name="mem_phone" id="mem_phone" maxlength='11' oninput=validNum()>
                <button type="button" id="phone_certi_btn">인증번호 발송</button><br>
                <p id="phone_msg" style="display: none">phone 양식에 맞게 썼는지 확인 중입니다.</p>

                <div id="phone_confirm_box" style="display: none">
                    <input type="text" placeholder="인증번호 6자리" name="phone_confirm_input" id="phone_confirm_input" maxlength='6' oninput=validNum()>
                    <button type="button" id="phone_confirm_btn">확인</button>
                    <div id="phoneCountBox">
                        <span id="phone_count"></span>
                    </div>
                </div>

                <div id="emailBox">

                </div>
            </div>

            <div id="findPassWordBox">

                 <input type="text" placeholder="이메일 입력" id="pw_emailInput">

                <input type="text" placeholder="핸드폰 번호 숫자만 입력" name="mem_phone" id="pw_mem_phone" maxlength='11' oninput=validNum()>
                <button type="button" id="pw_phone_certi_btn">인증</button><br>
                <p id="pw_phone_msg" style="display: none">phone 양식에 맞게 썼는지 확인 중입니다.</p>

                <div id="pw_phone_confirm_box" style="display: none">
                    <input type="text" placeholder="인증번호 6자리" name="phone_confirm_input" id="pw_phone_confirm_input" maxlength='6' oninput=validNum()>
                    <button type="button" id="pw_phone_confirm_btn">확인</button>
                    <div id="pw_phoneCountBox">
                        <span id="pw_phone_count"></span>
                    </div>
                </div>

                <div id="passWordBox">

                </div>

            </div>


        </div>

    </main>

    <script src="/resources/js/main/findAccount.js"></script>
</body>
</html>
