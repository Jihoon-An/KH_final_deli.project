<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-17
  Time: 오전 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>식당상세리뷰</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/member/store/storeReview.css">
</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
<main id="storeReview">
    <%--영업정보--%>
    <%--    <div class="container">--%>
    <%--        <div class="storeIntro">--%>
    <%--            <div class="store_name">상호명 : ${storeInfoDTO.store_name}</div>--%>
    <%--            <div><button class="heart">찜<input type="hidden" value="${storeInfoDTO.store_seq}"></button></div>--%>
    <%--            <div class="store_deli_time">배달시간 : ${storeInfoDTO.store_deli_time}분</div>--%>
    <%--            <div class="store_deli_tip">배달팁 : ${storeInfoDTO.store_deli_tip}원</div>--%>
    <%--            <div class="store_deli_tip">식당소개 : ${storeInfoDTO.store_intro}</div>--%>
    <%--            <div class="store_deli_tip">리뷰개수 : ${storeReviewCount}</div>--%>
    <%--            <div>리뷰 평균 : ${storeReviewAvg}</div--%>
    <%--        </div>--%>

    <%--        <div class="fieldBox">--%>
    <%--            <div id="menu"><a href="/store/menu">메뉴</a></div>--%>
    <%--            <div id="info"><a href="/store/info">정보</a></div>--%>
    <%--            <div id="review"><a href="#"><h2>리뷰</h2></a></div>--%>
    <%--        </div>--%>

    <%--        <div class="reviews">--%>
    <%--            <c:choose>--%>
    <%--                <c:when test="${not empty storeReviewList}">--%>
    <%--                    <c:forEach var="reviews" items="${storeReviewList}">--%>
    <%--                        <div id="nickname">닉네임 : ${reviews.mem_nick}</div>--%>
    <%--                        <div id="writeDate">작성일자 : ${reviews.rev_writedate}</div>--%>
    <%--                        <div id="modifiedDate">수정일자 : ${reviews.rev_modified_date}</div>--%>
    <%--                        <div id="reviewStar">별점 : ${reviews.rev_star}</div>--%>
    <%--                        <c:choose>--%>
    <%--                            <c:when test="${not empty reviews.rev_sysname}">--%>
    <%--                                <c:forEach var="reviewImg" items="${reviews.rev_sysname}">--%>
    <%--                                    <div id="reviewImgs">--%>
    <%--                                        <img src="/resources/img/review/${reviewImg}">--%>
    <%--                                    </div>--%>
    <%--                                </c:forEach>--%>
    <%--                            </c:when>--%>
    <%--                        </c:choose>--%>
    <%--                        <c:choose>--%>
    <%--                            <c:when test="${not empty reviews.rev_content}">--%>
    <%--                                <div>리뷰 내용 : ${reviews.rev_content}</div>--%>
    <%--                            </c:when>--%>
    <%--                        </c:choose>--%>
    <%--                        <c:choose>--%>
    <%--                            <c:when test="${not empty reviews.menu_list}">--%>
    <%--                                <c:forEach var="i" items="${reviews.menu_list}">--%>
    <%--                                    <div>메뉴명 : ${i}</div>--%>
    <%--                                </c:forEach>--%>
    <%--                            </c:when>--%>
    <%--                        </c:choose>--%>
    <%--                        <br>--%>
    <%--                    </c:forEach>--%>
    <%--                </c:when>--%>
    <%--            </c:choose>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <div class="container">
        <%@ include file="/WEB-INF/views/member/store/storeHeader.jsp" %>
        <hr>
        <div class="reviews">
            <c:choose>
                <c:when test="${not empty storeReviewList}">
                    <c:forEach var="reviews" items="${storeReviewList}">
                        <div class="review_box">
                            <div class="review_header">
                                <div id="nickname">${reviews.mem_nick}</div>
                                    <%--                            <fmt:parseDate value="${reviews.rev_writedate}" var="registered"--%>
                                    <%--                                           pattern="yyyy-MM-dd HH:mm:ss"/>--%>
                                    <%--                            <fmt:formatDate value="${registered}" pattern="yyyy년 MM월 dd일 a h:mm"/>--%>
                                <div id="writeDate"><%--작성일자 : --%><fmt:parseDate value="${reviews.rev_writedate}"
                                                                          var="registered"
                                                                          pattern="yyyy-MM-dd HH:mm:ss"/>
                                    <fmt:formatDate value="${registered}" pattern="yyyy.MM.dd"/></div>
                            </div>
                            <div id="reviewStar">별점 : ${reviews.rev_star}</div>
                            <c:choose>
                                <c:when test="${not empty reviews.rev_sysname}">
                                    <c:forEach var="reviewImg" items="${reviews.rev_sysname}">
                                        <div id="reviewImgs">
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
                        </div>
                        <c:choose>
                            <c:when test="${not empty reviews.menu_list}">
<%--                                <c:forEach var="i" items="${reviews.menu_list}">--%>
<%--                                    <div>메뉴명 : ${i}</div>--%>
                                    <div class="filter_box">
                                        <div style="margin: 0 auto" class="d-inline-flex">
                                <c:forEach var="i" items="${reviews.menu_list}">
                                                <div class="filter" style="margin-right: 7px">${i}</div>
                                                <div class="filter" style="margin-right: 7px">국밥돼지국밥</div>
                                                <div class="filter" style="margin-right: 7px">sdfffffffffff</div>
                                                <div class="filter" style="margin-right: 7px">sdffffffff</div>
                                </c:forEach>
                                        </div>
                                    </div>
<%--                                </c:forEach>--%>
                            </c:when>
                        </c:choose>
                        <br>
                    </c:forEach>
                </c:when>
            </c:choose>
        </div>
    </div>

    <script src="/resources/js/member/store/storeReview.js"></script>
</main>
</body>
</html>
