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
    <title>reviewList</title>
</head>
<script>
    <%--window.onload = function(){--%>
    <%--    var a = "${myPageReviewList}";--%>
    <%--    console.log(JSON.stringify(a));--%>
    <%--}--%>

</script>
<body>
<main id="myPageReviewList">

    <div class="container">
        <h2>내가 쓴 리뷰 리스트</h2>
        <div class="member_review">내가 쓴 리뷰 총 ${myPageReivewCount}개</div>
        <button id="modify_review">수정</button>
        <button id="delete_review">삭제</button>
        <div class="reviews">
        <c:choose>
            <c:when test="${not empty myPageReviewList}">
                <c:forEach var="reviews" items="${myPageReviewList}">
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
            <div class="member_content" >리뷰 내용</div>
    </div>
</main>
</body>
</html>
