<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>리뷰쓰기</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
</head>
<body>
    <div>
        <div>
            <form action="">
            <div> 리뷰쓰기</div>
            <div> 식당명</div>
            <div>
                <fieldset>
                    <input type="radio" name="reviewStar" value="5" id="rate1"><label
                        for="rate1">★</label>
                    <input type="radio" name="reviewStar" value="4" id="rate2"><label
                        for="rate2">★</label>
                    <input type="radio" name="reviewStar" value="3" id="rate3"><label
                        for="rate3">★</label>
                    <input type="radio" name="reviewStar" value="2" id="rate4"><label
                        for="rate4">★</label>
                    <input type="radio" name="reviewStar" value="1" id="rate5"><label
                        for="rate5">★</label>
                </fieldset>
            </div>
            <div> <textarea name="" placeholder="솔직한 평가를 남겨주세요"> </textarea> </div>
                <div>글자수</div>
                <div>
                    <span class="imgbox"><input type=""></span>
                    <span class="imgbox"></span>
                    <span class="imgbox"></span>
                    <span class="imgbox"></span>
                </div>
            </form>
        </div>
        <div>
            <div> 주문한 메뉴 </div>

        </div>
    </div>
</body>
</html>