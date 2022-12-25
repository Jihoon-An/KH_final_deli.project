<%--
  Created by IntelliJ IDEA.
  User: Minseop
  Date: 2022-12-24
  Time: 오전 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/owner/ownerInfo.css" type="text/css">
</head>
<body>

<main id="ownerInfo">

    <div class="container">
        <form action="" id="ownerFor">

            <div class="titleBox">
                사업자 회원 정보 수정
            </div>

            <div class="emailBox">
                <span>이메일</span><br>
                <input type="text" id="emailInput" name="acc_seq" placeholder="이메일" value="${acc_email}">
            </div>

            <div class="passWordBox">
                <span>비밀번호</span><br>
                <button type="button" id="modifyPassWordModalButton">비밀번호 변경</button>
            </div>

            <div class="nameBox">
                <span>이름</span><br>
                <input type="text" id="nameInput" name="mem_name" placeholder="이름" value="${ownerInfo.owner_name}">
            </div>

            <div class="phoneBox">
                <span>핸드폰번호</span><br>
                <input type="text" id="oldPhoneNumber" value="${ownerInfo.owner_phone}">
                <input type="text" id="phoneInput" name="mem_phone" placeholder="핸드폰번호" value="${ownerInfo.owner_phone}">
                <button id="certificationButton">인증</button>
            </div>

            <div class="ownerNumBox">
                <span>사업자번호</span><br>
                <input type="text" id="ownerNumInput" name="owner_num" placeholder="사업자번호" value="${ownerInfo.owner_num}">
            </div>

            <div class="ownerCardBox">
                <span>사업자등록증</span><br>
                <input type="text" id="ownerCardInput" name="owner_card" placeholder="사업자등록증">
                <button id="ownerCardUpLoadButton">업로드</button>
            </div>


            <div class="buttonBox">
                <button id="cancleButton">취소</button>
                <button id="modifyButton">수정</button>
            </div>


        </form>

    </div>

    <%--모달--%>
    <form id="modifyPassWordForm" action="/owner/info/modifyPassWord" method="post">
        <div class="modal">
            <div class="modal_content">
                <div class="modalHeadBox">
                    비밀번호 변경
                </div>

                <div class="infoBox modifyPwBox">
                    <div class="infoTitleBox">
                        <span class="pwSpan">현재 비밀번호</span>
                    </div>
                    <div class="infoInputBox passWordBox">
                        <input type="text" id="oldPassWord" name="oldPassWord">
                    </div>
                </div>
                <div class="infoBox modifyPwBox">
                    <div class="infoTitleBox">
                        <span class="pwSpan">새 비밀번호</span>
                    </div>
                    <div class="infoInputBox passWordBox">
                        <input type="text" id="newPassWord" name="newPassWord">
                    </div>
                </div>
                <div class="infoBox modifyPwBox">
                    <div class="infoTitleBox">
                        <span class="pwSpan">새 비밀번호 확인</span>
                    </div>
                    <div class="infoInputBox passWordBox">
                        <input type="text" id="confirmPassWord">
                        <span id="pwCheckSpan"></span>
                    </div>
                </div>
                <div class="modalButtonBox">
                    <button type="button" id="closeModalButton">닫기</button>
                    <button type="button" id="modifyPasswordConfirmBtn">변경</button>
                </div>
            </div>
        </div>
    </form>




    <script src="/resources/js/owner/ownerInfo.js"></script>
</main>

</body>
</html>
