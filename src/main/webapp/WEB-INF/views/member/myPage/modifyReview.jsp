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
    <title>리뷰수정페이지</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="/resources/css/member/myPage/modifyReview.css">
</head>
<body>
<main id="modify_review">
    <div>
        <form action="/myPage/review/modify" id="reviewPost" method="post" enctype="multipart/form-data">
            <div>
                <div id="back">
                    <button id="backBtn" type="button">Back</button>
                </div>
                <div> 리뷰수정</div>
                <div>${store_dto.store_name}</div>
                <div>
                    <fieldset>
                        <c:if test="${review_dto.rev_star eq 1}">
                        <input type="radio" name="rev_star" value="1" id="rate1" checked><label
                            for="rate1" >★</label>
                        <input type="radio" name="rev_star" value="2" id="rate2"><label
                            for="rate2">★</label>
                        <input type="radio" name="rev_star" value="3" id="rate3"><label
                            for="rate3">★</label>
                        <input type="radio" name="rev_star" value="4" id="rate4"><label
                            for="rate4">★</label>
                        <input type="radio" name="rev_star" value="5" id="rate5"><label
                            for="rate5">★</label>
                        </c:if>

                        <c:if test="${review_dto.rev_star eq 2}">
                            <input type="radio" name="rev_star" value="1" id="rate1"><label
                                for="rate1" >★</label>
                            <input type="radio" name="rev_star" value="2" id="rate2" checked><label
                                for="rate2">★</label>
                            <input type="radio" name="rev_star" value="3" id="rate3"><label
                                for="rate3">★</label>
                            <input type="radio" name="rev_star" value="4" id="rate4"><label
                                for="rate4">★</label>
                            <input type="radio" name="rev_star" value="5" id="rate5"><label
                                for="rate5">★</label>
                        </c:if>

                        <c:if test="${review_dto.rev_star eq 3}">
                            <input type="radio" name="rev_star" value="1" id="rate1"><label
                                for="rate1" >★</label>
                            <input type="radio" name="rev_star" value="2" id="rate2"><label
                                for="rate2">★</label>
                            <input type="radio" name="rev_star" value="3" id="rate3" checked><label
                                for="rate3">★</label>
                            <input type="radio" name="rev_star" value="4" id="rate4"><label
                                for="rate4">★</label>
                            <input type="radio" name="rev_star" value="5" id="rate5"><label
                                for="rate5">★</label>
                        </c:if>

                        <c:if test="${review_dto.rev_star eq 4}">
                            <input type="radio" name="rev_star" value="1" id="rate1"><label
                                for="rate1" >★</label>
                            <input type="radio" name="rev_star" value="2" id="rate2"><label
                                for="rate2">★</label>
                            <input type="radio" name="rev_star" value="3" id="rate3"><label
                                for="rate3">★</label>
                            <input type="radio" name="rev_star" value="4" id="rate4" checked><label
                                for="rate4">★</label>
                            <input type="radio" name="rev_star" value="5" id="rate5"><label
                                for="rate5">★</label>
                        </c:if>

                        <c:if test="${review_dto.rev_star eq 5}">
                            <input type="radio" name="rev_star" value="1" id="rate1"><label
                                for="rate1" >★</label>
                            <input type="radio" name="rev_star" value="2" id="rate2"><label
                                for="rate2">★</label>
                            <input type="radio" name="rev_star" value="3" id="rate3"><label
                                for="rate3">★</label>
                            <input type="radio" name="rev_star" value="4" id="rate4"><label
                                for="rate4">★</label>
                            <input type="radio" name="rev_star" value="5" id="rate5" checked><label
                                for="rate5">★</label>
                        </c:if>
                    </fieldset>
                </div>
            </div>
            리뷰사진
            <div class="imgs">
                <c:choose>
                    <c:when test="${not empty review_dto}">
                        <%
                            ReviewDTO reviewDTO = (ReviewDTO) request.getAttribute("review_dto");
                            String reviewSysName = reviewDTO.getRev_sysname();
                            //System.out.println("ddddddddddddddddddddddddddddddddd"+reviewSysName);
                            Gson gson = new Gson();
                            Type type = new TypeToken<List<String>>(){}.getType();
                            request.setAttribute("review_img_list", gson.fromJson(reviewSysName, type));
                        %>
<%--                        <c:forEach var="sysName" items="${review_img_list}">--%>
<%--                            <div class="review_img_div">--%>
<%--                                <img src="/resources/img/review/${sysName}">--%>
<%--                                <input type="hidden" class="img_name" value="${sysName}">--%>
<%--                                <button type="button" class="del_img_btn">지우기</button>--%>
<%--                            </div>--%>
<%--                        </c:forEach>--%>
                        <c:forEach var="sysName" items="${frmImg}">
                            <div class="review_img_div">
                                <img src="/resources/img/review/${sysName}">
                                <input type="hidden" class="img_name" value="${sysName}">
                                <button type="button" class="del_img_btn">지우기</button>
                            </div>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>

            <div><textarea name="rev_content" placeholder="솔직한 평가를 남겨주세요">${review_dto.rev_content}</textarea></div>
            <div>글자수</div>
            <div>
                <div class="imgbox fileBtnBox">
                    <input type="file" id="revImgBtn" name="files" accept=".png,.jpg,.jpeg,.gif" multiple>
                </div>
                <div id="new_file_name_list"></div>
            </div>
            <div>
                <div> 주문한 메뉴</div>
                <c:choose>
                    <c:when test="${not empty menu}">
                        <c:forEach var="i" items="${menu}">
                            <div>${i.menu_name}</div>
                        </c:forEach>
                    </c:when>
                </c:choose>
                <input type="text" value="${orders_dto.order_seq}" name="order_seq">
                <input type="text" value="${orders_dto.acc_seq}" name="acc_seq">
                <input type="text" value="${orders_dto.store_seq}" name="store_seq">
                <input type="text" value="${orders_dto.order_price}">
                <c:choose>
                    <c:when test="${not empty orders_dto.menu_list}">
<%--                        <c:forEach var="sysName" items="${orders_dto.menu_list}">--%>
<%--                        </c:forEach>--%>
                    </c:when>
                </c:choose>
            </div>
            <div class="btns">
                <button id="modifyBtn">수정완료</button>
                <button type="button" id="cancleBtn">취소</button>
            </div>

            <input type="hidden" id="rev_seq" name="rev_seq" value="${review_dto.rev_seq}">
            <input type="hidden" name="del_files_json" id="del_files_json">
        </form>
    </div>
</main>
<script src="/resources/js/member/myPage/modifyReview.js"></script>
</body>
</html>