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
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2831f365f4c14d690cf0e21146e8dd99"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico"/>
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/member/myPage/modifyReview.css">
</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
<main id="modify_review">
    <hr class="mt65">
    <div class="container">
        <form action="/myPage/review/modify" id="reviewPost" method="post" enctype="multipart/form-data">
<%--            <div>--%>
<%--                <div id="back">--%>
<%--                    <button id="backBtn" type="button">Back</button>--%>
<%--                </div>--%>
<%--                <div> 리뷰수정</div>--%>
<%--                <div>${store_dto.store_name}</div>--%>
<%--                <div>--%>
<%--                    <fieldset>--%>
<%--                        <c:if test="${review_dto.rev_star eq 1}">--%>
<%--                            <input type="radio" name="rev_star" value="1" id="rate1" checked><label--%>
<%--                                for="rate1">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="2" id="rate2"><label--%>
<%--                                for="rate2">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="3" id="rate3"><label--%>
<%--                                for="rate3">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="4" id="rate4"><label--%>
<%--                                for="rate4">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="5" id="rate5"><label--%>
<%--                                for="rate5">★</label>--%>
<%--                        </c:if>--%>

<%--                        <c:if test="${review_dto.rev_star eq 2}">--%>
<%--                            <input type="radio" name="rev_star" value="1" id="rate1"><label--%>
<%--                                for="rate1">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="2" id="rate2" checked><label--%>
<%--                                for="rate2">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="3" id="rate3"><label--%>
<%--                                for="rate3">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="4" id="rate4"><label--%>
<%--                                for="rate4">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="5" id="rate5"><label--%>
<%--                                for="rate5">★</label>--%>
<%--                        </c:if>--%>

<%--                        <c:if test="${review_dto.rev_star eq 3}">--%>
<%--                            <input type="radio" name="rev_star" value="1" id="rate1"><label--%>
<%--                                for="rate1">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="2" id="rate2"><label--%>
<%--                                for="rate2">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="3" id="rate3" checked><label--%>
<%--                                for="rate3">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="4" id="rate4"><label--%>
<%--                                for="rate4">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="5" id="rate5"><label--%>
<%--                                for="rate5">★</label>--%>
<%--                        </c:if>--%>

<%--                        <c:if test="${review_dto.rev_star eq 4}">--%>
<%--                            <input type="radio" name="rev_star" value="1" id="rate1"><label--%>
<%--                                for="rate1">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="2" id="rate2"><label--%>
<%--                                for="rate2">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="3" id="rate3"><label--%>
<%--                                for="rate3">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="4" id="rate4" checked><label--%>
<%--                                for="rate4">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="5" id="rate5"><label--%>
<%--                                for="rate5">★</label>--%>
<%--                        </c:if>--%>

<%--                        <c:if test="${review_dto.rev_star eq 5}">--%>
<%--                            <input type="radio" name="rev_star" value="1" id="rate1"><label--%>
<%--                                for="rate1">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="2" id="rate2"><label--%>
<%--                                for="rate2">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="3" id="rate3"><label--%>
<%--                                for="rate3">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="4" id="rate4"><label--%>
<%--                                for="rate4">★</label>--%>
<%--                            <input type="radio" name="rev_star" value="5" id="rate5" checked><label--%>
<%--                                for="rate5">★</label>--%>
<%--                        </c:if>--%>
<%--                    </fieldset>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            리뷰사진--%>
<%--            <div class="imgs">--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${not empty review_dto}">--%>
<%--                        <%--%>
<%--                            ReviewDTO reviewDTO = (ReviewDTO) request.getAttribute("review_dto");--%>
<%--                            String reviewSysName = reviewDTO.getRev_sysname();--%>
<%--//                            System.out.println("ddddddddddddddddddddddddddddddddd" + reviewSysName);--%>
<%--                            Gson gson = new Gson();--%>
<%--                            Type type = new TypeToken<List<String>>() {--%>
<%--                            }.getType();--%>
<%--                            request.setAttribute("review_img_list", gson.fromJson(reviewSysName, type));--%>
<%--                        %>--%>
<%--                        &lt;%&ndash;                        <c:forEach var="sysName" items="${review_img_list}">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                            <div class="review_img_div">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <img src="/resources/img/review/${sysName}">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <input type="hidden" class="img_name" value="${sysName}">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                                <button type="button" class="del_img_btn">지우기</button>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                        </c:forEach>&ndash;%&gt;--%>
<%--                        <c:forEach var="store" items="${review_img_list}">--%>
<%--                            <div class="review_img_div">--%>
<%--                                <img src="/resources/img/review/${store}">--%>
<%--                                <input type="hidden" class="img_name" value="${store}">--%>
<%--                                <button type="button" class="del_img_btn">지우기</button>--%>
<%--                            </div>--%>
<%--                        </c:forEach>--%>
<%--                    </c:when>--%>
<%--                </c:choose>--%>
<%--            </div>--%>

<%--            <div><textarea name="rev_content" placeholder="솔직한 평가를 남겨주세요">${review_dto.rev_content}</textarea></div>--%>
<%--            <div>글자수</div>--%>
<%--            <div>--%>
<%--                <div class="imgbox fileBtnBox">--%>
<%--                    <input type="file" id="revImgBtn" name="files" accept=".png,.jpg,.jpeg,.gif" multiple>--%>
<%--                </div>--%>
<%--                <div id="new_file_name_list"></div>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <div> 주문한 메뉴</div>--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${not empty menuNameList}">--%>
<%--                        <c:forEach var="i" items="${menuNameList}">--%>
<%--                            <div>${i}</div>--%>
<%--                        </c:forEach>--%>
<%--                    </c:when>--%>
<%--                </c:choose>--%>
<%--                <input type="text" value="${orders_dto.order_seq}" name="order_seq">--%>
<%--                <input type="text" value="${orders_dto.acc_seq}" name="acc_seq">--%>
<%--                <input type="text" value="${orders_dto.store_seq}" name="store_seq">--%>
<%--                <input type="text" value="${orders_dto.order_price}">--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${not empty orders_dto.menu_list}">--%>
<%--                        &lt;%&ndash;                        <c:forEach var="sysName" items="${orders_dto.menu_list}">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                        </c:forEach>&ndash;%&gt;--%>
<%--                    </c:when>--%>
<%--                </c:choose>--%>
<%--            </div>--%>

    <div id="pageTitle">리뷰수정</div>
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
            <label id="btnCustom"> <i class="fa-solid fa-camera"></i>  사진 추가
                <input type="file" id="revImgBtn" name="files" accept=".png,.jpg,.jpeg,.gif" multiple>
            </label>
        </div>
        <div>
            <div class="imgName imgName1"><img id="img1" src=""></div>
            <div class="imgName imgName2"><img id="img2" src=""></div>
            <div class="imgName imgName3"><img id="img3" src=""></div>
            <div class="imgName imgName4"><img id="img4" src=""></div>
        </div>
    </div>
    <hr>
    <div>
        <%--                주문번호: <input type="text" value="${dto.order_seq}" name="order_seq">--%>
        <%--                가게번호: <input type="text" value="${dto.store_seq}" name="store_seq">--%>
        <%--                주문금액: <input type="text" value="${dto.order_price}">--%>
        <%--                <input type="hidden" value="${dto.menu_list}" id="menu">--%>
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