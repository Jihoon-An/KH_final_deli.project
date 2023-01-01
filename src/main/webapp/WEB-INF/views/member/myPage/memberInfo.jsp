<%--
  Created by IntelliJ IDEA.
  User: Minseop
  Date: 2022-12-17
  Time: 오후 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>딜리 - 내 정보 수정</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>

    <link rel="stylesheet" href=" /resources/css/member/myPage/memberInfo.css" type="text/css">

</head>
<body>
    <%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>

    <main id="memberInfo">

        <div class="container">

            <form id="modifyMemberInfo" action="/myPage/memberInfo/modify" method="post">

                <div class="titleBox">
                    내 정보 수정
                </div>

                <div class="nameBox">
                    <input type="text" id="nickName" name="mem_nick" value="${memberInfo.mem_nick}"
                           placeholder="닉네임">
                    <label id="nameRemoveLabel">X</label>
                </div>

                <div class="infoBox">
                    <div class="infoTitleBox">
                        <span>이메일</span>
                    </div>
                    <div class="infoInputBox emailBox">
                        <input type="hidden" id="email" name="acc_email" value="${accountInfo.acc_email}">
                        <div class="emailIconBox">
                            <span style="font-size: 14px; color: #645DAF;"><i class="fa-solid fa-at"></i></span>
                        </div>
                        <div class="emailSpanBox">
                            <span style="font-size: 12px;">${accountInfo.acc_email}</span>
                        </div>
                    </div>

                </div>

                <div class="infoBox">
                    <div class="infoTitleBox">
                        <span>비밀번호</span>
                    </div>
                    <div class="infoInputBox passWordBox">
                        <button type="button" id="passWordModifyBtn" class="deli_btn">변경</button>
                        <button type="button" id="passWordCloseBtn" class="deli_btn" style="display: none">변경</button>
                    </div>
                </div>


                <div class="infoBox modifyPwBox">
                    <div class="infoTitleBox">
                        <span class="pwSpan">현재 비밀번호</span>
                    </div>
                    <div class="infoInputBox passWordBox">
                        <input type="password" id="oldPassWord" name="oldPassWord" class="form-control">
                    </div>
                </div>
                <div class="infoBox modifyPwBox" style="margin-top: 10px;">
                    <div class="infoTitleBox">
                        <span class="pwSpan">새 비밀번호</span>
                    </div>
                    <div class="infoInputBox passWordBox">
                        <input type="password" id="newPassWord" name="newPassWord" class="form-control">
                    </div>
                </div>
                <div class="infoBox modifyPwBox" style="margin-top: 10px; margin-bottom: 10px;">
                    <div class="infoTitleBox">
                        <span class="pwSpan">새 비밀번호 확인</span>
                    </div>
                    <div class="infoInputBox passWordBox input-group">
                        <input type="password" id="confirmPassWord" class="form-control">
                        <button type="button" id="modifyPasswordConfirmBtn" class="deli_btn">확인</button>
                        <span id="pwCheckSpan"></span>
                    </div>
                </div>


                <div class="infoBox">
                    <div class="infoTitleBox">
                        <span>휴대폰번호</span>
                    </div>
                    <div class="infoInputBox phoneBox input-group">
                        <input type="hidden" id="oldPhoneNumber" value="${memberInfo.mem_phone}">
                        <input type="text" id="mem_phone" name="mem_phone" class="form-control" value="${memberInfo.mem_phone}"
                               placeholder="핸드폰 번호 숫자만 입력" maxlength='11' oninput=validNum() readonly>
                        <button type="button" id="reCertificationBtn" class="deli_btn">재인증</button>
                        <button type="button" id="phone_certi_btn" class="deli_btn">발송</button>
                        <div style="width: 100%;">
                            <span id="phone_msg" style="display: none">양식에 맞는지 확인 중입니다.</span>
                        </div>
                    </div>
                </div>

                <div class="infoBox" id="certificationBox">
                    <div class="infoTitleBox">
                        <span id="certificationNumberSpan">인증번호</span>
                    </div>
                    <div class="infoInputBox input-group">
                        <input type="text" placeholder="인증번호 6자리" name="phone_confirm_input" id="phone_confirm_input"
                               maxlength='6' oninput=validNum() class="form-control">
                        <button type="button" id="phone_confirm_btn" class="deli_btn">확인</button>
                        <div style="width: 100%;">
                            <p id="count" style="display: none;">인증번호 유효시간이 <span id="phone_count"></span> 남았습니다</p>
                        </div>
                    </div>
                </div>

                <div class="infoBox">
                    <div class="infoTitleBox">
                        <span>회원가입일</span>
                    </div>
                    <div class="infoInputBox signUpDateBox">
                        <span style="font-size: 14px; line-height: 25px;">
                            <fmt:formatDate value="${accountInfo.acc_signupdate}" pattern="yyyy-MM-dd"/>
                        </span>
                    </div>
                </div>

<%--                <button type="button" id="saveButton">저장</button>--%>



                <div class="buttonBox">
                    <a href="/account/logout">
                        <button type="button">로그아웃</button>
                    </a>
                    <br><br>
                    <form action="/account/withdrawal" id="withdrawalForm" method="post">
                        <button type="button" id="withdrawalButton">회원탈퇴</button>
                    </form>
                </div>

            </form>

        </div>



        <script src="/resources/js/member/myPage/memberInfo.js"></script>
    </main>
</body>
</html>