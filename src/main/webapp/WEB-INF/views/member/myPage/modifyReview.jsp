<%@ page import="com.google.gson.Gson" %>
<%@ page import="kh.deli.global.entity.ReviewDTO" %>
<%@ page import="com.google.gson.reflect.TypeToken" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.reflect.Type" %>
<%@ page import="java.lang.String" %>
<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-14
  Time: 오후 12:00
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - 리뷰수정</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>
    <link rel="stylesheet" href="/resources/css/member/myPage/modifyReview.css">
</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
<main id="modify_review">
    <hr class="mt65">
    <div class="container">
        <form action="/myPage/review/modify" id="reviewPost" method="post"
              enctype="multipart/form-data">
            <div id="pageTitle">리뷰수정</div>
            <div id="storeName">${store_dto.store_name}</div>
            <div id="starSec">
                <div class="star-rating space-x-4 mx-auto" style="position: relative;">
                    <input type="radio" id="5-stars" class="star" name="rev_star" value="5"
                           <c:if test="${review_dto.rev_star == '5'}">checked</c:if>>
                    <label for="5-stars" id="star_5" class="startext pr-4"><i class="fa-solid fa-star"
                                                                              style="position:relative;"></i></label>
                    <input type="radio" id="4-stars" class="star" name="rev_star" value="4"
                           <c:if test="${review_dto.rev_star == '4'}">checked</c:if>>
                    <label for="4-stars" id="star_4" class="startext"><i class="fa-solid fa-star"
                                                                         style="position:relative;"></i></label>
                    <input type="radio" id="3-stars" class="star" name="rev_star" value="3"
                           <c:if test="${review_dto.rev_star == '3'}">checked</c:if>>
                    <label for="3-stars" id="star_3" class="startext"><i class="fa-solid fa-star"
                                                                         style="position:relative;"></i></label>
                    <input type="radio" id="2-stars" class="star" name="rev_star" value="2"
                           <c:if test="${review_dto.rev_star == '2'}">checked</c:if>>
                    <label for="2-stars" id="star_2" class="startext"><i class="fa-solid fa-star"
                                                                         style="position:relative;"></i></label>
                    <input type="radio" id="1-star" class="star" name="rev_star" value="1"
                           <c:if test="${review_dto.rev_star == '1'}">checked</c:if>>
                    <label for="1-star" id="star_1" class="startext"><i class="fa-solid fa-star"
                                                                        style="position:relative;"></i></label>
                </div>
            </div>
            <div>
                <textarea id="revContent" name="rev_content"
                          placeholder="솔직한 평가를 남겨주세요">${review_dto.rev_content}</textarea>
            </div>
            <div id="count"><span id="text_count"></span>/300</div>
            <div>
                <div class="imgBox fileBtnBox">
                    <input type="hidden" name="rev_sysname" id="rev_sysmname">
                    <label id="btnCustom"> <i class="fa-solid fa-camera"></i>  사진 수정 <span class="imgMsg">(최대 4개)</span>
                        <%--                    <label id="btnCustom"> <i class="fa-solid fa-camera"></i> 사진 추가--%>
                        <input type="file" id="revImgBtn" name="files" accept=".png,.jpg,.jpeg,.gif"
                               multiple>
                    </label>
                </div>

                <div id="rev_imgs_area" style="margin: 0 auto" >
                    <c:choose>
                        <c:when test="${not empty review_dto}">
                            <%
                                ReviewDTO reviewDTO = (ReviewDTO) request.getAttribute("review_dto");
                                String reviewSysName = reviewDTO.getRev_sysname();
                                Gson gson = new Gson();
                                Type type = new TypeToken<List<String>>() {
                                }.getType();
                                request.setAttribute("review_img_list", gson.fromJson(reviewSysName, type));
                            %>
                            <c:forEach var="revImg" items="${review_img_list}">
                                <div class="review_img_div" class="preimg_img" style="display: inline-block; padding: 2px; margin-top:5px;">
                                    <i class="fa-solid fa-x del_img_btn" style="position: relative; left:140px; z-index: 10"></i>
                                    <img src="/resources/img/review/${revImg}" style="width: 100%; height: 100%; object-fit: cover; position: relative; top:-16px;">
                                    <input type="hidden" class="img_name" value="${revImg}">
                                </div>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </div>
            </div>
            <hr>
            <div>
                <input type="hidden" value="${dto.menu_list}" id="menu">
                <div class="menuBox">주문 메뉴</div>
                <c:choose>
                    <c:when test="${not empty menuNameList}">
                        <c:forEach var="i" items="${menuNameList}">
                            <div class="menuList">${i}</div>
                        </c:forEach>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${not empty orders_dto.menu_list}">
                        <c:forEach var="sysName" items="${orders_dto.menu_list}">
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>

            <div id="btnBox">
                <button type="button" id="backBtn">취소</button>
                <button type="submit" id="modifyBtn">수정완료</button>
            </div>

            <input type="hidden" id="rev_seq" name="rev_seq" value="${review_dto.rev_seq}">
            <input type="hidden" name="del_files_json" id="del_files_json">

            <input type="hidden" value="${orders_dto.order_seq}" name="order_seq">
            <input type="hidden" value="${orders_dto.acc_seq}" name="acc_seq">
            <input type="hidden" value="${orders_dto.store_seq}" name="store_seq">
        </form>
    </div>
</main>
<script src="/resources/js/member/myPage/modifyReview.js"></script>
</body>
</html>