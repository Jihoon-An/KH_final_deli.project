<%--
  Created by IntelliJ IDEA.
  User: jaeyoung
  Date: 2022-12-18
  Time: PM 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 내 리뷰</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>

</head>
<script>
    window.onload = function () {
        debugger;
    }
    function onclickDeleteBtn(param){
        debugger;
        var revSeq = param.getAttribute('revSeq');
    }

</script>
<body>
<main id="myPageReviewList">

    <div class="container">
        <h2>내가 쓴 리뷰 리스트</h2>
        <div class="member_review">내가 쓴 리뷰 총 ${myPageReviewCount}개</div>

        <div class="reviews">
            <c:choose>
            <c:when test="${not empty myPageReviewList}">
            <c:forEach var="reviews" items="${myPageReviewList}">
                <c:choose>
                <c:when test="${reviews.flag_udt == 'N'}">

                    <button name="modify_review" disabled>수정</button>

                </c:when>
                <c:otherwise>
                <a href="/myPage/review?rev_seq=${reviews.rev_seq}&order_seq=${reviews.order_seq}&store_seq=${reviews.store_seq}"><button name="modify_review" revSeq="${reviews.rev_seq}">수정</button></a>

                    <input type="text" value="${reviews.rev_seq}">
                    <input type="text" value="${reviews.store_seq}">
                    <input type="text" value="${reviews.order_seq}">

                </c:otherwise>
                </c:choose>
                <button name="delete_review" onclick="onclickDeleteBtn(this)" revSeq="${reviews.rev_seq}">삭제</button>
            <c:choose>
            <c:when test="${not empty reviews.menu}">
            <div>메뉴명 :
                <c:forEach var="i" items="${reviews.menu}">
                    ${i.menuDTO.menu_name}
                <c:choose>
                <c:when test="${not empty i.menuOptionDTO}">
                <c:forEach var="k" items="${i.menuOptionDTO}">
                    <span> ${k.option_name} </span>
                </c:forEach>
            </div>
            </c:when>
            <c:otherwise>
        </div>
        </c:otherwise>
        </c:choose>
        </c:forEach>
        </c:when>

        </c:choose>

        <div class="store_name">식당명 : ${reviews.store_name}</div>
        <div id="writeTime">작성일자 : ${reviews.rev_writetime}</div>
        <div id="reviewStar">별점 : ${reviews.rev_star}</div>
        <c:choose>
            <c:when test="${not empty reviews.rev_sysname}">
                <c:forEach var="reviewImg" items="${reviews.rev_sysname}">
                    <div>
                        <img src="/resources/img/review/${reviewImg}">
                    </div>
                </c:forEach>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${not empty reviews.rev_content}">
                <div>리뷰 내용 : ${reviews.rev_content}</div>
            </c:when>
        </c:choose>
        </c:forEach>
        </c:when>
        <c:otherwise>
            <h2>작성한 리뷰가 없습니다.</h2>
        </c:otherwise>
        </c:choose>
    </div>
    <div class="store_name">상호명</div>
    <div class="member_nick_name">작성자</div>
    <div class="member_review_star">별점</div>
    <div class="member_menu_img">사진</div>
    <div class="member_content">리뷰 내용</div>
    </div>
</main>
</body>
</html>
