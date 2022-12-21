<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-14
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>배송지 선택</title>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>

    <style>

        .modal_destination_container::-webkit-scrollbar { width: 5px; }
        .modal_destination_container::-webkit-scrollbar-thumb { background-color: #ddd; border-radius: 10px; }
        .modal_destination_container::-webkit-scrollbar-track { background-color: #ffffff; border-radius: 10px; }
        .modal_destination_container::-webkit-scrollbar-corner { display: none; }
        .modal_destination_container::-webkit-scrollbar-button:start { opacity: 0; }
        .modal_destination_container::-webkit-scrollbar-button:end { opacity: 0; }

        .modal {
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            top: 0;
            left: 0;
            display: none;
        }

        .modal_destination_add {
            padding-top: 20px;
            position: fixed;
            margin: 0 auto;
            left: 0;
            right: 0;
            bottom: 0;
            width: 375px;
            height: 300px;
            background: #ffffff;
            border-radius: 10px 10px 0 0;
            overflow: hidden;
            text-align: center;
            box-sizing: border-box;
            display: none;
        }

        .modal_destination_container {
            position: fixed;
            margin: 0 auto;
            left: 0;
            right: 0;
            bottom: 0;
            width: 375px;
            height: 300px;
            background: #ffffff;
            border-radius: 10px 10px 0 0;
            text-align: center;
            overflow-y: scroll;
            display: none;
        }

    </style>
</head>
<body>

<button id="destination_change">주소지 변경</button>

<main id="destination">
    <%--모달--%>
    <div class="modal">
        <div class="modal_destination_container">
            <h2>주소지 변경</h2>
            <button type="button" id="destination_add_box_btn">주소지 추가 등록</button>
            <hr>
            <form id="destination_select_frm" method="post">
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
            </form>
        </div>


        <div class="modal_destination_add">
            <div onclick="closeDestinationAdd()">X</div>
            <form id="destination_add_frm" method="post">
                <h2>배달지 주소 등록</h2>
                <input type="text" placeholder="주소지 별명을 입력해주세요." name="add_name"><br>
                <input type="text" id="postcode" placeholder="우편번호">
                <button type="button" class="postsearch">우편검색</button>
                <br>
                <input type="text" id="add_detail1" name="add_detail1" placeholder="기본주소">
                <br>
                <input type="text" id="add_detail2" name="add_detail2" placeholder="상세주소">
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
