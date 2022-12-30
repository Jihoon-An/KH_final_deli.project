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
    <title>딜리 - 회원 정보</title>

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <!-- sweetAlert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/owner/ownerInfo.css" type="text/css">
</head>
<body>

<main id="ownerInfo">

    <div class="container">
        <form action="/owner/info/modifyOwner" id="ownerForm" method="post" enctype="multipart/form-data">
            <img src="/resources/img/owner-card/${ownerInfo.owner_card_img}">
            <div class="titleBox">
                사업자 회원 정보 수정
            </div>

            <div class="emailBox">
                <span>이메일</span><br>
                <input type="text" id="emailInput" name="acc_email" placeholder="이메일" value="${acc_email}" readonly>
            </div>

            <div class="passWordBox">
                <span>비밀번호</span><br>
                <button type="button" id="modifyPassWordModalButton">비밀번호 변경</button>
            </div>

            <div class="nameBox">
                <span>이름</span><br>
                <input type="text" id="nameInput" name="owner_name" placeholder="이름" value="${ownerInfo.owner_name}">
            </div>

            <div class="phoneBox">
                <span>핸드폰번호</span><br>
                <input type="hidden" id="oldPhoneNumber" value="${ownerInfo.owner_phone}">
                <input type="text" id="phoneInput" name="owner_phone" placeholder="핸드폰번호" value="${ownerInfo.owner_phone}" maxlength='11' oninput=validNum() readonly>
                <button type="button" id="modifyPhoneButton">변경</button>
                <button type="button" id="phone_certi_btn" style="display: none">발송</button>
                <br><br>
                <p id="phone_msg" style="display: none">양식에 맞는지 확인 중입니다.</p>
            </div>

            <div id="certificationBox" style="height: 200px; display: none;">
                <span id="certificationNumberSpan">인증번호</span>
                <div class="infoInputBox">
                    <input type="text" placeholder="인증번호 6자리" name="phone_confirm_input" id="phone_confirm_input" maxlength='6' oninput=validNum()>
                    <button type="button" id="phone_confirm_btn">확인</button>
                    <span id="phone_count"></span>
                </div>
            </div>

            <div class="ownerNumBox">
                <span>사업자번호</span><br>
                <input type="text" id="ownerNumInput" name="owner_num" placeholder="사업자번호" value="${ownerInfo.owner_num}">
            </div>

            <div class="ownerCardBox">
                <span>사업자등록증</span><br>
                <input type="file" id="ownerCardInput" name="file" placeholder="사업자등록증">
                <button id="ownerCardUpLoadButton">업로드</button>
            </div>


            <div class="buttonBox">
                <a href="">
                    <button type="button" id="cancleButton">취소</button>
                </a>
                <button type="button" id="modifyButton">수정</button>
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

    <div class="logOutBox">
        <form action="/account/withdrawal" id="withdrawalForm" method="post">
            <button type="button" id="withdrawalButton">회원탈퇴</button>
        </form>
    </div>



    <script src="/resources/js/owner/ownerInfo.js"></script>
</main>

</body>
</html>
