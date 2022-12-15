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
        #destination .container {
            width: 375px;
            height: 800px;
            border: 1px solid black;
            margin: auto;
            text-align: center;
            padding-top: 50px;
        }
    </style>
</head>
<body>

<main id="destination">
    <div class="container">
        <h1>주소 설정</h1>
        <form id="destination_select_frm" method="post">
            <c:choose>
                <c:when test="${not empty address_List}">
                    <c:forEach var="i" items="${address_List}">
                        <input type="hidden" name="add_seq" value="${i.add_seq}">
                        <input type="radio" name="add_division" <c:if test="${i.add_division=='basics'}">checked</c:if>>
                        <c:if test="${i.add_division=='basics'}">[기본]</c:if>
                        <c:if test="${i.add_division!='basics'}">[선택]</c:if>

                        <input type="text" name="add_division" value="${i.add_division}">
                        <!-- 벨류에 딴값 넣어도 됨 -->

                        ${i.add_name} <a href="delete">x</a> <br>
                        ${i.add_detail1} <br>
                        상세주소 : ${i.add_detail2} <br>
                        ${i.add_msg} <br>
                        <hr>
                    </c:forEach>
                </c:when>
            </c:choose>
            <button id="destination_select">기본 주소지 선택</button>
        </form>
        <hr><hr>
        아래 다음 화면
        <button id="destination_add_box_btn">주소지 추가 등록</button>
        <hr>
        <div id="destination_add_box" style="display: none">
            <form id="destination_add_frm" method="post">
            <h1>배달지 주소 등록</h1>
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
                <button id="destination_add_btn">배달지 추가</button>
            </form>
        </div>
    </div>
</main>

<script>

    $("#destination_select").on("click", function () {

        $("input[name='add_division']:checked").val("basics");
        $("input[name='add_division']:not(:checked)").val("add");


        $.ajax({
            url: "/member/header/destination/divisionChange",
            type: "post",
            data: $("#destination_select_frm").serialize(),
            dataType: 'JSON'
        }).done(function () {
            alert("선택지 변경 성공/모달 사라져야함");
        });
    });

    $("#destination_add_box_btn").on("click", function () {
        $("input:not([name=acc_seq])").val("");
        $("#destination_add_box").show();
    });

    $("#destination_add_btn").on("click", function () {
        $.ajax({
            url: "/member/header/destination/insert",
            type: "post",
            data: $("#destination_add_frm").serialize()
        }).done(function () {
            alert("추가 성공");
            $("#destination_add_box").hide();
        });
    });

    $(document).on("click", ".postsearch", function () {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = ''; // 주소 변수
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                var geocoder = new kakao.maps.services.Geocoder();
                var callback = function (result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        let x = result[0].x;
                        let y = result[0].y;
                        document.getElementById("add_y").value = x;
                        document.getElementById("add_x").value = y;
                    }
                };
                geocoder.addressSearch(addr, callback);
                document.getElementById("postcode").value = data.zonecode;
                document.getElementById("add_detail1").value = data.jibunAddress;
                document.getElementById("add_detail2").focus();
            }
        }).open();
    })
</script>
</body>
</html>
