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

            <hr class="line">

            <form id="destination_select_frm" method="post">
                <div id="destination_select_box">
                    <button type="button" class="deli_btn" id="destination_select">주소지 선택</button>

                    <c:choose>
                        <c:when test="${not empty address_List}">
                            <c:forEach var="i" items="${address_List}">
                                <hr class="line">
                                <hr style="width: 60%; margin: 0 auto; border-color: #999999;">
                                <hr class="line">
                                <div class="destination_box">
                                    <input type="hidden" name="add_seq" class="add_seq" value="${i.add_seq}">
                                    <input type="radio" name="radio_add_division"
                                           <c:if test="${i.add_division=='basics'}">id="basics" checked</c:if>>
                                    <span class="add_division">
                                        <c:if test="${i.add_division=='basics'}"><span class="pick">[기본]</span></c:if>
                                        <c:if test="${i.add_division!='basics'}"><span class="pick">[선택]</span></c:if>
                                    </span>
                                    <input type="hidden" name="add_division" class="hidden_add_division"
                                           value="${i.add_division}">
                                    <span class="add_name">${i.add_name}</span> <a class="del"><i
                                        class="fa-solid fa-square-xmark"></i></a><br>
                                    <span class="add_detail1"> ${i.add_detail1}<br>
                                    <span class="add_detail2"> 상세주소 : </span>${i.add_detail2}</span>
                                </div>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </div>
            </form>
            <hr style="width: 60%; margin: 0 auto; border-color: #999999;">
            <hr class="line">
            <button type="button" class="deli_btn" id="destination_add_box_btn"><i class="fa-solid fa-house"></i> 주소지 추가
            </button>
            <hr class="line">

        </div>

        <div class="modal_destination_add">
            <div style="width: 320px; margin: 0 auto">
                <hr class="line">
                <div onclick="closeDestinationAdd()"><i class="fa-solid fa-square-xmark"></i></div>
                <hr class="line">
                <form id="destination_add_frm" method="post">
<%--                    <h5 style="margin: 10px">배달지 주소 추가 등록</h5>--%>
                    <input type="text" placeholder="주소지 별명을 입력해주세요" id="add_name" name="add_name" maxlength="10"
                           class="form-control">

                    <hr class="mini_line">

                    <div class="input-group">
                        <input type="text" id="postcode" placeholder="우편번호검색을 눌러주세요" class="form-control" readonly>
                        <button type="button" class="postsearch deli_btn">우편번호검색</button>
                    </div>
                    <hr class="mini_line">

                    <input type="text" id="add_detail1" name="add_detail1" placeholder="기본주소가 입력됩니다" class="form-control"
                           readonly>
                    <hr class="mini_line">

                    <input type="text" id="add_detail2" name="add_detail2" placeholder="상세주소를 입력해주세요" maxlength="50"
                           class="form-control">
                    <hr class="line">

                    <input type="hidden" id="add_x" name="add_x">
                    <input type="hidden" id="add_y" name="add_y">
                    <input type="hidden" name="acc_seq" value="${acc_seq}">
                    <button type="button" id="destination_add_btn" class="deli_btn">배달지 추가 등록</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="/resources/js/member/header/destination.js"></script>