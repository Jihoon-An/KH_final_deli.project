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
    <title>딜리 - 내 정보</title>
    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>
    <link rel="stylesheet" href="/resources/css/owner/ownerInfo.css" type="text/css">
</head>
<body>

<%@ include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>

<main id="ownerInfo">

    <div class="container">
        <form action="/owner/info/modifyOwner" id="ownerForm" method="post" enctype="multipart/form-data">

            <div class="titleBox">
                사업자 회원 정보 수정
            </div>

            <div class="emailBox">
                <span>이메일</span><br>
                <input type="text" id="emailInput" class="form-control" name="acc_email"
                       placeholder="이메일" value="${acc_email}" readonly>
            </div>

            <div class="passWordBox">
                <span>비밀번호</span><br>
                <button type="button" id="modifyPassWordModalButton" class="deli_btn">비밀번호 변경</button>
            </div>

            <div class="nameBox">
                <span>이름</span><br>
                <input type="text" id="nameInput" class="form-control" name="owner_name"
                       placeholder="이름" value="${ownerInfo.owner_name}" maxlength="6">
            </div>

            <div class="phoneBox">
                <span>핸드폰번호</span>
                <input type="hidden" id="oldPhoneNumber" value="${ownerInfo.owner_phone}">
                <div class="input-group">
                    <input type="text" id="phoneInput" name="owner_phone" class="form-control"
                           placeholder="핸드폰번호" value="${ownerInfo.owner_phone}" maxlength='11' oninput=validNum() readonly>
                    <button type="button" id="modifyPhoneButton" class="deli_btn">변경</button>
                    <button type="button" id="phone_certi_btn" class="deli_btn" style="display: none">발송</button>
                </div>
                <p id="phone_msg" style="display: none">양식에 맞는지 확인 중입니다.</p>
            </div>

            <div id="certificationBox" style="height: 75px; display: none;">
                <span id="certificationNumberSpan">인증번호</span>
                <div class="infoInputBox input-group">
                    <input type="text" id="phone_confirm_input" class="form-control" name="phone_confirm_input"
                           placeholder="인증번호 6자리" maxlength='6' oninput=validNum()>
                    <button type="button" id="phone_confirm_btn" class="deli_btn" style="height: 35px;">
                        확인
                    </button>
                </div>
                <span id="phone_count"></span>
            </div>

            <div class="ownerNumBox">
                <span>사업자번호</span><br>
                <input type="text" id="ownerNumInput" class="form-control" name="owner_num"
                       placeholder="사업자번호" value="${ownerInfo.owner_num}">
            </div>

            <div class="ownerCardBox">
                <span>사업자등록증</span><br>
                <input type="file" id="ownerCardInput" class="form-control" name="file" placeholder="사업자등록증">
            </div>

            <div class="ownerCardImgBox">
                <img src="/resources/img/owner-card/${ownerInfo.owner_card_img}">
            </div>


            <div class="buttonBox">
                <a href="">
                    <button type="button" id="cancleButton" class="deli_btn">취소</button>
                </a>
                <button type="button" id="modifyButton" class="deli_btn">수정</button>
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
                    <div class="infoInputBox passWordBox" style="width: 230px;">
                        <input type="password" id="oldPassWord" class="form-control" name="oldPassWord">
                    </div>
                </div>
                <div class="infoBox modifyPwBox">
                    <div class="infoTitleBox">
                        <span class="pwSpan">새 비밀번호</span>
                    </div>
                    <div class="infoInputBox passWordBox" style="width: 230px;">
                        <input type="password" id="newPassWord" class="form-control" name="newPassWord">
                    </div>
                </div>
                <div class="infoBox modifyPwBox">
                    <div class="infoTitleBox">
                        <span class="pwSpan">새 비밀번호 확인</span>
                    </div>
                    <div class="infoInputBox passWordBox" style="width: 230px;">
                        <input type="password" id="confirmPassWord" class="form-control">
                        <span id="pwCheckSpan" style="font-size: 12px;"></span>
                    </div>
                </div>
                <div class="modalButtonBox">
                    <button type="button" id="closeModalButton" class="deli_btn">닫기</button>
                    <button type="button" id="modifyPasswordConfirmBtn" class="deli_btn">변경</button>
                </div>
            </div>
        </div>
    </form>

    <div class="withdrawalBox">
        <form action="/account/withdrawal" id="withdrawalForm" method="post">
            <button type="button" id="withdrawalButton" class="deli_btn">회원탈퇴</button>
        </form>
    </div>



    <script src="/resources/js/owner/ownerInfo.js"></script>
</main>

</body>
</html>
