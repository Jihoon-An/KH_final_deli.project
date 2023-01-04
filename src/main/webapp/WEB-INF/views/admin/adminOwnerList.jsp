<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-13
  Time: 오전 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>딜리 - 운영자 사업자회원관리</title>

    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="/resources/css/admin/ownerList.css" type="text/css">
</head>

<body>
<%@ include file="/WEB-INF/views/customHeader/admin_nav.jsp" %>
<main id="owner_list">
    <table id="myTable" class="display">
        <thead>
        <tr>
            <th>사업자 회원번호</th>
            <th>사업자 번호</th>
            <th>회원번호</th>
            <th>사업자 이름</th>
            <th>연락처</th>
            <th>이메일</th>
            <th>보유 식당 갯수</th>
            <th>가입일</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty owner_list}">
            <c:forEach var="ow" items="${owner_list}">
                <tr class="owner_tr">
                    <td class="owner_seq">${ow.owner_seq}</td>
                    <td class="owner_num"> ${ow.owner_num}</td>
                    <td class="acc_seq">${ow.acc_seq}</td>
                    <td class="owner_name">${ow.owner_name}</td>
                    <td class="owner_phone">${ow.owner_phone} </td>
                    <td class="acc_email">${ow.acc_email} </td>
                    <td class="store_count">${ow.store_count}</td>
                    <td class="acc_signupdate">${ow.acc_signupdate} </td>

                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>

    <%--모달--%>
    <form action="/admin/deleteReview" id="frm">
        <div class="modal">
            <div class="modal_content">
                <div class="closeBtn"><i class="fa-solid fa-xmark fa-2xl"></i></div>
                <div class="modalInfo">

                    <span class="modalTitle">사업자회원번호</span>
                    <input type="text" placeholder="사업자 회원번호" disabled id="owner_seq" class="owner_seq">

                </div>
                <div class="modalInfo">
                    <span class="modalTitle">사업자 번호 </span>
                    <input type="text" placeholder="사업자 번호" id="ownernum" class="ownernum" disabled>
                </div>

                <div class="modalInfo">
                    <span class="modalTitle">회원번호</span>
                    <input type="text" placeholder="회원번호" disabled id="acc_seq" class="acc_seq">
                </div>

                <div class="modalInfo">
                    <span class="modalTitle">사업자 이름</span>
                    <input
                            type="text" placeholder="사업자 이름" disabled id="name" class="name">
                </div>

                <div class="modalInfo">
                    <span class="modalTitle">연락처</span>
                    <input
                            type="text" placeholder="연락처" disabled id="ownerPhone" class="ownerPhone">
                </div>

                <div class="modalInfo">
                    <span class="modalTitle">이메일</span>
                    <input `type="text" placeholder="이메일" disabled id="email" class="email">
                </div>

                <div class="modalInfo">
                    <span class="modalTitle">보유 식당 갯수 </span>
                    <input type="text" placeholder="식당갯수" disabled id="scount" class="scount">
                </div>

                <div class="modalInfo">
                    <span class="modalTitle">가입일 </span>
                    <input type="text" placeholder="가입일" disabled id="signdate" class="signdate">
                </div>




                <button type="button" id="deleteOwner" type="button" class="deli_btn">삭제</button>
            </div>
        </div>
    </form>


    <script src="/resources/js/admin/ownerList.js"></script>
</main>
</body>
</html>
