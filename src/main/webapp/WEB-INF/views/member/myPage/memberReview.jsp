<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>리뷰쓰기</title>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" href="/resources/css/member/myPage/memberReviewForm.css">

</head>
<body>
<main id="reviewWrite">
<div>
    <form action="/myPage/reviewWrite/reviewInsert" id="reviewPost" method="post" enctype="multipart/form-data">
        <div>
            <div id="back">
                <button>Back</button>
            </div>
            <div> 리뷰쓰기</div>
            <div> 식당명</div>
            <div>
                <fieldset>
                    <input type="radio" name="rev_star" value="1" id="rate1"><label
                        for="rate1">★</label>
                    <input type="radio" name="rev_star" value="2" id="rate2"><label
                        for="rate2">★</label>
                    <input type="radio" name="rev_star" value="3" id="rate3"><label
                        for="rate3">★</label>
                    <input type="radio" name="rev_star" value="4" id="rate4"><label
                        for="rate4">★</label>
                    <input type="radio" name="rev_star" value="5" id="rate5"><label
                        for="rate5">★</label>
                </fieldset>
            </div>
        </div>
        <div><textarea name="rev_content" placeholder="솔직한 평가를 남겨주세요"> </textarea></div>
        <div>글자수</div>
        <div>
            <div class="imgbox fileBtnBox">
                <input type="file" id="revImgBtn" name="files" accept=".png,.jpg,.jpeg,.gif" multiple>
            </div>

        </div>
        <div>
            <div> 주문한 메뉴</div>
            주문번호: <input type="text" value="${dto.order_seq}" name="order_seq">
            회원번호: <input type="text" value="${dto.acc_seq}" name="acc_seq">
            가게번호: <input type="text" value="${dto.store_seq}" name="store_seq">
            주문금액: <input type="text" value="${dto.order_price}">
            <input type="hidden" value="${dto.menu_list}" id="menu">
            <div class="menuBox"></div>
        </div>
        <div>
            <button type="button" id="writeBtn">작성하기</button>
        </div>
    </form>
</div>
    <script>
        var list = ${dto.menu_list};
    </script>
<script src="/resources/js/member/myPage/memberReview.js"></script>
</main>
</body>
</html>