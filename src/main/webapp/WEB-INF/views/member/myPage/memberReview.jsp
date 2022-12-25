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
</head>
<body>
<main id="reviewWrite">
    <div class="container">
        <form action="/myPage/reviewWrite/reviewInsert" id="reviewPost" method="post" enctype="multipart/form-data">

            <div id="pageTitle"> 리뷰쓰기</div>
            <div id="storeName">식당명</div>
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
            <div>글자수<i class="fa-solid fa-star"></i> <i class="fa-regular fa-star"></i></div>
            <div>
                <div class="imgbox fileBtnBox">
                    <input type="hidden" name="rev_sysname" id="rev_sysmname">
                    <input type="file" id="revImgBtn" name="files" accept=".png,.jpg,.jpeg,.gif" multiple>
                </div>
                <div class="imgName"></div>
            </div>
            <div>
                <div> 주문한 메뉴</div>
                주문번호: <input type="text" value="${dto.order_seq}" name="order_seq">
                가게번호: <input type="text" value="${dto.store_seq}" name="store_seq">
                주문금액: <input type="text" value="${dto.order_price}">
                <input type="hidden" value="${dto.menu_list}" id="menu">
                <div class="menuBox">주문 메뉴</div>
                <c:choose>
                    <c:when test="${not empty menuNameList}">
                        <c:forEach var="i" items="${menuNameList}">
                            <div>${i}</div>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
            <div>
                <button type="button" id="writeBtn">작성하기</button>
            </div>
        </form>
    </div>

    <script src="/resources/js/member/myPage/memberReview.js"></script>
</main>
</body>
</html>