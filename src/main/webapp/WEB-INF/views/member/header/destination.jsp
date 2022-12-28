<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--jQuery-->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

<!-- daumPostcode -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- kakaoMap -->
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2831f365f4c14d690cf0e21146e8dd99&libraries=services"></script>

<!-- bootstrap CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- bootstrap JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

<!-- sweetalert -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- font-awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">

<!-- StyleSheet-->
<link rel="stylesheet" href="/resources/css/member/header/destination.css" type="text/css">
<link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">

<div id="destination">
    <%--모달--%>
    <div class="modal">
        <div class="modal_destination_container">
            <button type="button" class="deli_btn" id="destination_add_box_btn"><i class="fa-solid fa-house"></i> 주소지 추가</button>

            <form id="destination_select_frm" method="post">
                <div id="destination_select_box">
                    <button type="button" class="deli_btn" id="destination_select">주소지 변경</button>
                    <hr>
                    <c:choose>
                        <c:when test="${not empty address_List}">
                            <c:forEach var="i" items="${address_List}">
                                <div class="destination_box form-check">
                                    <input type="hidden" name="add_seq" class="add_seq" value="${i.add_seq}">
                                    <input type="radio" name="radio_add_division"
                                           <c:if test="${i.add_division=='basics'}">id="basics" checked</c:if>>
                                    <span class="add_division">
                                        <c:if test="${i.add_division=='basics'}"><span class="pick">[기본]</span></c:if>
                                        <c:if test="${i.add_division!='basics'}"><span class="pick">[선택]</span></c:if>
                                    </span>
                                    <input type="hidden" name="add_division" class="hidden_add_division"
                                           value="${i.add_division}">
                                        <span class="add_name">${i.add_name}</span> <a class="del"><i class="fa-solid fa-xmark"></i></a><br>
                                        ${i.add_detail1} <br>
                                    상세주소 : ${i.add_detail2}
                                    <hr>
                                </div>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </div>
            </form>
        </div>

        <div class="modal_destination_add">
            <div onclick="closeDestinationAdd()">X</div>
            <form id="destination_add_frm" method="post">
                <h2>배달지 주소 등록</h2>
                <input type="text" placeholder="주소지 별명을 입력해주세요" id="add_name" name="add_name" maxlength='10'><br>
                <input type="text" id="postcode" placeholder="우편검색을 눌러주세요" readonly>
                <button type="button" class="postsearch">우편검색</button>
                <br>
                <input type="text" id="add_detail1" name="add_detail1" placeholder="기본주소" readonly>
                <br>
                <input type="text" id="add_detail2" name="add_detail2" placeholder="상세주소를 입력해주세요" maxlength='50'>
                <br>
                <input type="hidden" id="add_x" name="add_x">
                <input type="hidden" id="add_y" name="add_y">
                <input type="hidden" name="acc_seq" value="${acc_seq}">
                <button type="button" id="destination_add_btn">배달지 추가</button>
            </form>
        </div>
    </div>
</div>

<script src="/resources/js/member/header/destination.js"></script>