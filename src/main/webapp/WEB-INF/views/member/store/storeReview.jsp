<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="storeReview" style="margin-bottom: 80px;">
    <%@ include file="/WEB-INF/views/member/store/storeHeader.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_cart.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_top.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
    <div class="fieldBox" style="margin-bottom: -10px;">
        <div id="menu"><a onclick="loadCode1();" style="cursor: pointer;">메뉴</a></div>
        <div id="info"><a onclick="loadCode2();" style="cursor: pointer;" id="to_info">정보</a></div>
        <div id="review"><a onclick="loadCode3();" style="font-weight: bold; font-size: 1.15em; cursor: pointer;">리뷰</a>
        </div>
    </div>

    <script>
        function loadCode1() {
            $('.container').load('/store/menu/menu/${storeInfoDTO.store_seq}');
        }

        function loadCode2() {
            $('.container').load('/store/info/${storeInfoDTO.store_seq}');
        }

        function loadCode3() {
            $('.container').load('/store/review/${storeInfoDTO.store_seq}');
        }
    </script>

    <hr style="margin-top: 10px; margin-bottom: 5px;">
    <div class="reviews">
        <c:choose>
            <c:when test="${not empty storeReviewList}">
                <c:forEach var="reviews" items="${storeReviewList}" varStatus="status">
                    <div class="review_box">
                        <div class="review_header">
                            <div id="nickname">${reviews.mem_nick} <span class="storeEtc"> <i
                                    class="fa-solid fa-star"></i> ${reviews.rev_star}</span></div>
                                <%--                            <fmt:parseDate value="${reviews.rev_writedate}" var="registered"--%>
                                <%--                                           pattern="yyyy-MM-dd HH:mm:ss"/>--%>
                                <%--                            <fmt:formatDate value="${registered}" pattern="yyyy년 MM월 dd일 a h:mm"/>--%>
                            <div id="writeDate"><%--작성일자 : --%>
                                <fmt:parseDate value="${reviews.rev_writedate}"
                                               var="registered"
                                               pattern="yyyy-MM-dd HH:mm:ss"/>
                                <fmt:formatDate value="${registered}" pattern="yyyy.MM.dd"/></div>
                        </div>
                            <%--<div id="reviewStar">별점 : ${reviews.rev_star}</div>--%>
                            <%--임시--%>
                            <%--                            <img src="/resources/img/review/84eae9ab-6e0d-4172-936c-e8d23c3b84ac_다운로드.jpg" style="width: 250px; height: 150px; margin-left: 20px;">--%>
                            <%--                            <img src="/resources/img/review/1bbefed6-5039-4683-9af7-6bfe7950ead5_ifsp.png" style="width: 250px; height: 150px;">--%>

                        <c:choose>
                            <c:when test="${not empty reviews.rev_sysname}">
                                <c:forEach var="reviewImg" items="${reviews.rev_sysname}">
                                    <div id="reviewImgs" style="width: 15px;">
                                        <img src="/resources/img/review/${reviewImg}"
                                             style="width: 250px; height: 150px; margin-left: 20px;">
                                    </div>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${not empty reviews.rev_content}">
                                <div id="r_content">${reviews.rev_content}</div>
                            </c:when>
                        </c:choose>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div style="text-align: center; margin-top: 50px; font-size: 20px;">리뷰가 없어요</div>
            </c:otherwise>
        </c:choose>
        <script src="/resources/js/member/store/storeReview.js"></script>
    </div>
</div>

<style>
    <c:forEach var="num" items="${storeReviewList}" varStatus="status">
    .filter_box${status.index} {
        width: 98%;
        height: 40px;
        border-radius: 10px 10px 0 0;
        text-align: center;
        margin-top: 10px;
        overflow-y:scroll;
        cursor: pointer;
    }
    .filter_box${status.index}::-webkit-scrollbar {
        height: 0px;
    }
    </c:forEach>
</style>

<script>
    <c:forEach var="num" items="${storeReviewList}" varStatus="status">
    var x, left, down;

    $(".filter_box${status.index}").mousedown(function (e) {
        e.preventDefault();
        down = true;
        x = e.pageX;
        left = $(this).scrollLeft();
    });

    $(".filter_box${status.index}").mousemove(function (e) {
        if (down) {
            var newX = e.pageX;
            $(".filter_box${status.index}").scrollLeft(left - newX + x);
        }
    });

    $("body").mouseup(function (e) {
        down = false;
    });
    </c:forEach>
</script>