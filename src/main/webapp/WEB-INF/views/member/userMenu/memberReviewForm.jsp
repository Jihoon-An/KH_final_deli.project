<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>리뷰쓰기</title>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" href="/resources/css/member/userMenu/memberReviewForm.css">


</head>
<body>
    <div>
        <div>
            <form action="/memberReviewForm/reviewInsert" id="reviewPost" method="post" enctype="multipart/form-data">
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
            <div> <textarea name="rev_content" placeholder="솔직한 평가를 남겨주세요"> </textarea> </div>
                <div>글자수</div>
                <div>
<%--                    <div class="imgbox fileBtnBox">--%>
<%--                        <input type="file" id="revImgBtn" name="rev_sysname" accept=".png,.jpg,.jpeg,.gif" multiple>--%>
<%--                    </div>--%>
                    <div class="imgbox" id="profile"></div>
                    <div class="imgbox"></div>
                    <div class="imgbox"></div>
                </div>
            </div>
        <hr>
        <div>
            <div> 주문한 메뉴 </div>
<%--            <input type="hidden" value="${order_seq}" name="order_seq">--%>
<%--            <input type="hidden" value="${acc_seq}" name="acc_seq">--%>
<%--            <input type="hidden" value="${store_seq}" name="store_seq">--%>
            <input type="hidden" value="9999" name="order_seq">
            <input type="hidden" value="이미지" name="rev_sysname">
            <input type="hidden" value="9999" name="acc_seq">
            <input type="hidden" value="9999" name="store_seq">
            <c:choose>
                <c:when test="${not empty menu_list}">
                    <c:forEach var="i" items="${list}">
                        <div>{i}</div>
                    </c:forEach>
                </c:when>
            </c:choose>
        </div>
        <div>
            <button>작성하기</button>
        </div>
    </div>
    </form>
    <script src="/resources/js/member/userMenu/memberReviewForm.js"></script>
</body>
</html>