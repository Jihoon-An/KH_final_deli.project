<%--
  Created by IntelliJ IDEA.
  User: ykm
  Date: 2022-12-15
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
</head>
<style>
    * {
        box-sizing: border-box;
    }

    div {
        border: 1px solid black;
    }

    .container {
        width: 375px;
        height: 800px;
        margin-top: 30px;
        overflow: hidden;
    }
    .box1{
        width: 100%;
        height: 100px;
        margin-top: 40px;
    }
    .box2{
        width: 100%;
        height: 15%;
        /* font-size: 10px; */
    }
    .box3{
        width: 100%;
        height: 85%;
    }

    .headdeli{
        margin-right: 15px;
        height: 100%;
        padding-left: 3px;
    }
    .headdate{
        margin-right: 10px;
        padding-left: 3px;
    }
    .headstatus{
        float:right;
        padding-right: 3px;
    }
    .photodiv{
        margin: 10px;

        width: 20%;
        height: 60px;
        float: left;
    }
    .info{
        margin: 9px;
        width: 65%;
        height: 60px;
        float: left;

    }

    .storename{
        margin-left :2px;
        /* font-size: 10px; */
    }
    .storeloca{
        /* font-size: 10px; */
    }
    p{
        height: 10px;
    }
    .meinfo{
        /* font-size: 8px; */
    }
</style>
<body>

<div class="container">

    <div class="box1">
        <div class="box2">
            <span class="headdeli">배달주문</span>
            <span class="headdate">2011-151515</span>
            <span class="headstatus">배달완료</span>
        </div>
        <div class="box3">
            <div class="photodiv">사진</div>
            <div class="info">
                <span class="storename ">굽네치킨</span>
                <span class="storeloca ">-공릉1호점</span>
                <p><span class="meinfo">고추바사삭</span><span class="meinfo">30000</span></p>
                <button>리뷰작성</button>
                <button>주문상세</button>
                <button>재주문</button>
            </div>
        </div>

    </div>

</div>



</body>
</html>