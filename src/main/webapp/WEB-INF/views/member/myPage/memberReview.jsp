<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <title>리뷰쓰기</title>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" href="/resources/css/member/myPage/memberReviewForm.css">

    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico" />
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">

    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
</head>
<body>

<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>

<main id="reviewWrite">
    <div class="container">
        <form action="/myPage/reviewWrite/reviewInsert" id="reviewPost" method="post" enctype="multipart/form-data">

            <div id="pageTitle">리뷰쓰기</div>
            <div id="storeName">${store_name}</div>
            <div id="starSec">
                <fieldset id="starFiled">
                    <input type="radio" name="rev_star" value="5" id="rate1"><label
                        for="rate1"><i class="fa-solid fa-star"></i></label>
                    <input type="radio" name="rev_star" value="4" id="rate2"><label
                        for="rate2"><i class="fa-solid fa-star"></i></label>
                    <input type="radio" name="rev_star" value="3" id="rate3"><label
                        for="rate3"><i class="fa-solid fa-star"></i></label>
                    <input type="radio" name="rev_star" value="2" id="rate4"><label
                        for="rate4"><i class="fa-solid fa-star"></i></label>
                    <input type="radio" name="rev_star" value="1" id="rate5"><label
                        for="rate5"><i class="fa-solid fa-star"></i></label>
                </fieldset>
            </div>

            <div>
                <textarea id="revContent" name="rev_content" placeholder="솔직한 평가를 남겨주세요"> </textarea>
            </div>
            <div id="count">0 / 300</div>
            <div>
                <div class="imgBox fileBtnBox">
                    <input type="hidden" name="rev_sysname" id="rev_sysmname">
                    <input type="file" id="revImgBtn" name="files" accept=".png,.jpg,.jpeg,.gif" multiple>
                </div>
                <div class="imgName"></div>
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
        </form>
    </div>

    <script src="/resources/js/member/myPage/memberReview.js"></script>
</main>
</body>
</html>