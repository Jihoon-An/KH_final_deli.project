<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 리뷰쓰기</title>

    <link rel="stylesheet" href="/resources/css/member/myPage/memberReviewForm.css">
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>
</head>
<body>

<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>

<main id="reviewWrite">
    <hr class="mt55">
    <div class="container">
        <form action="/myPage/reviewWrite/reviewInsert" id="reviewPost" method="post" enctype="multipart/form-data">

            <div id="pageTitle">리뷰쓰기</div>
            <div id="storeName">${store_name}</div>
            <div id="starSec">
                <fieldset id="starFiled">
                    <input type="radio" name="rev_star" value="5" id="rate1"><label
                        for="rate1" class="starCustom"><i class="fa-solid fa-star"></i></label>
                    <input type="radio" name="rev_star" value="4" id="rate2"><label
                        for="rate2" class="starCustom"><i class="fa-solid fa-star"></i></label>
                    <input type="radio" name="rev_star" value="3" id="rate3"><label
                        for="rate3" class="starCustom"><i class="fa-solid fa-star"></i></label>
                    <input type="radio" name="rev_star" value="2" id="rate4"><label
                        for="rate4" class="starCustom"><i class="fa-solid fa-star"></i></label>
                    <input type="radio" name="rev_star" value="1" id="rate5"><label
                        for="rate5" class="starCustom"><i class="fa-solid fa-star"></i></label>
                </fieldset>
            </div>

            <div>
                <textarea id="revContent" name="rev_content" placeholder="솔직한 평가를 남겨주세요"> </textarea>
            </div>
            <div id="count">0 / 300</div>
            <div>
                <div class="imgBox fileBtnBox">
                    <input type="hidden" name="rev_sysname" id="rev_sysmname">
                    <label id="btnCustom"> <i class="fa-solid fa-camera"></i>  사진추가 <span class="imgMsg">(최대 4개)</span>
                    <input type="file" id="revImgBtn" name="files" accept=".png,.jpg,.jpeg,.gif" multiple>
                    </label>
                </div>
                <div id="imgSec">
                </div>
            </div>
            <hr>
            <div>
                 <input type="hidden" value="${dto.order_seq}" name="order_seq">
                 <input type="hidden" value="${dto.store_seq}" name="store_seq">
                <div class="menuBox">주문 메뉴</div>
                <c:choose>
                    <c:when test="${not empty menuNameList}">
                        <c:forEach var="i" items="${menuNameList}">
                            <div class="menuList">${i}</div>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
            <div id="btnBox">
                <button type="button" id="writeBtn">작성하기</button>
            </div>
        </form>
    </div>

    <script src="/resources/js/member/myPage/memberReview.js"></script>
</main>
</body>
</html>