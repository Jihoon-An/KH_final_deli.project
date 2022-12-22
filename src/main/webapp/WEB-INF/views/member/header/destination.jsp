<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-14
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/WEB-INF/views/member/header/header.jsp" %>

${acc_seq}
<button id="destination_change">주소지 변경</button>

<main id="destination">
    <%--모달--%>
    <div class="modal">
        <div class="modal_destination_container">
            <h2>주소지 변경</h2>
            <button type="button" id="destination_add_box_btn">주소지 추가 등록</button>
            <hr>

            <form id="destination_select_frm" method="post">
                <div id="destination_select_box">
                    <button type="button" id="destination_select">기본 주소지 선택</button>
                    <hr>
                    <c:choose>
                        <c:when test="${not empty address_List}">
                            <c:forEach var="i" items="${address_List}">
                                <div class="destination_box">
                                    <input type="hidden" name="add_seq" class="add_seq" value="${i.add_seq}">
                                    <input type="radio" name="radio_add_division"
                                           <c:if test="${i.add_division=='basics'}">checked</c:if>>
                                    <c:if test="${i.add_division=='basics'}"><span class="pick">[기본]</span></c:if>
                                    <c:if test="${i.add_division!='basics'}"><span class="pick">[선택]</span></c:if>
                                    <input type="hidden" name="add_division" class="hidden_add_division"
                                           value="${i.add_division}">
                                        ${i.add_name} <a class="del">x</a> <br>
                                        ${i.add_detail1} <br>
                                    상세주소 : ${i.add_detail2} <br>
                                        ${i.add_msg} <br>
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


</main>

<script src="/resources/js/member/header/destination.js"></script>

</body>
</html>
