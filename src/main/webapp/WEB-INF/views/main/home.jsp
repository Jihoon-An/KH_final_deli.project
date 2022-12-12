<%--
  Created by IntelliJ IDEA.
  User: abg14
  Date: 2022-12-11
  Time: 오후 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Home</title>

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
    <style>
        .container{
            border: 1px solid black;
            width: 375px;
            height: 100%;
        }
    </style>

</head>
<body>
Home
<img src="/img/favicon.ico">
<img src="/favicon.ico">
        <div class="container">
            <h2>배달 정보</h2>
            <div id="address1">address1출력
            </div>

            <input type="text" placeholder="Address2">
            <button type="button">변경</button>
            <div>핸드폰 번호
                <button type="button">변경</button>
            </div>
            <div>요청사항</div>
            <div>
                체크박스 수저 포크 / 단무지
            </div>
            <input type="text" placeholder="사장님한테 전달할 말">
            <input type="text" placeholder="라이더님한테 전달할 말">
            <div>결제수단
                <div>선택한 결제수단</div>
            </div>
            <button type="button">다른 결제 수단</button>
            <div>
                <button>할인쿠폰</button>
                <div>할인쿠폰 출력</div>
            </div>
            <div>포인트
                <div>보유 포인트 출력
                    <input type="text">사용할 포인트
                </div>
                <div>총 결제 금액
                    <div>주문 내역 출력</div>
                </div>
                <div>쿠폰할인
                    <div>쿠폰 할인 금액 출력</div>
                </div>
                <div>포인트 할인
                    <div>포인트 할인 금액 출력</div>
                </div>
                <div>배달팁
                    <div>배달팁 출력</div>
                </div>
                <hr>
                <button type="button">***원 결제하기</button>
            </div>

        </div>
</body>
</html>
