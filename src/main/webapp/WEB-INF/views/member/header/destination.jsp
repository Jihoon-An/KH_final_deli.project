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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>

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

      <input type="radio" name="add_select">[기본] 우리집(주소지별명)<br>
      서울시 강동구 상암로12길 2<br>
      상세주소 : 천호빌 102호<br>
      <br>
      <input type="radio" name="add_select">[선택] 저쪽집(주소지별명)<br>
      서울시 종로구 을지로2길 4<br>
      상세주소 : 천둥빌딩 1101호<br>
      <br>
      <input type="radio" name="add_select">[선택] 회사(주소지별명)<br>
      부산시 사하구 이리온8길 92<br>
      상세주소 : 이리온아파트 A동 814호<br>
      <br>

      <hr>

      <p>배달지 주소 등록</p>
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

      <button>배달지 추가</button>

  </div>
</main>

<script>
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
