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

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>


</head>
<body>
<main id="modify_review">
    <div>
        <form action="/myPage/review/modifyReview" id="reviewPost" method="post" enctype="multipart/form-data">
            <div>
                <div id="back">
                    <button>Back</button>
                </div>
                <div> 리뷰수정</div>
                <div>${store_dto.store_name}</div>
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
                        <c:forEach var="sysName" items="${review_img_list}">
                            <label class="review_img_label">
                                <img src="/resources/img/review/${sysName}">
                                <button type="button" class="del_img_btn">지우기</button>
                            </label>
                            <input name="review_img_label" id="review_img_label" type="file" class="review_img_label">
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

            </div>
            <div>
                <div> 주문한 메뉴</div>
                <input type="text" value="${orders_dto.order_seq}" name="order_seq">
                <input type="text" value="${orders_dto.acc_seq}" name="acc_seq">
                <input type="text" value="${orders_dto.store_seq}" name="store_seq">
                <input type="text" value="${orders_dto.order_price}">
                <c:choose>
                    <c:when test="${not empty orders_dto.menu_list}">
                        <c:forEach var="sysName" items="${orders_dto.menu_list}">
                            <input type="text" value="${sysName}"> <%-- [] 제거해야 함 --%>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>
            <div class="btns">
                <button id="modifyBtn">수정완료</button>
                <button type="button" id="cancleBtn">취소</button>
            </div>
        </form>
    </div>
</main>

<script>
    $("#cancleBtn").on("click", function () {
        location.reload();
    })

    // $(function () {
    //     let ext = $("#revImgBtn").val().split(".").pop().toLowerCase();
    //     let arr =
    //
    //
    //     // fileToBase64(document.getElementById("revImgBtn").files[0]);
    // })

    // $("#revImgBtn").on("change",function(){
    //     // if($("#revImgBtn").val()==""){
    //     //     $("#profile").attr("src","/images/profile.png");
    //     //     return;
    //     // }
    //     let ext = $("#revImgBtn").val().split(".").pop().toLowerCase();// 업로드한 파일명을 점을 기준으로 배열을 만들고 마지막 배열의 값을 꺼내고 소문자로 만들어줌
    //     // let accept =["png","jpg","jpeg","gif"]; // 업로드 가능한 파일 타입을 배열로 만듦
    //     // let result = $.inArray(ext,accept);// 첫번째 인자값이, 두번째 인자 배열안에 존재한다면 0이상, 존재하지 않는다면 -1을 반환
    //     // if(result == -1){
    //     //     alert("이미지만 사용 가능합니다.");
    //     //     $("#revImgBtn").val("");// accept에 없는 파일을 올릴 경우 경고창을 띄우면서 업로드한 파일을 지움
    //     // }
    //     fileToBase64(document.getElementById("revImgBtn").files[0]);
    // })
</script>

</body>
</html>