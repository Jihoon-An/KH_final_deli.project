<%--
  Created by IntelliJ IDEA.
  User: ykm
  Date: 2022-12-14
  Time: 오후 7:01
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

    <link rel="stylesheet" href="/resources/css/owner/menuAdd.css" type="text/css">
</head>

<body>
<main id ="menuAdd">
<form action="/menu/add/menuAdd" id="frm" method="post" enctype="multipart/form-data">
    <div class="container">
        <div class="menufrm">
            <input tpye="text" id="menu_group" name="menu_group" placeholder="메뉴그룹명을 입력하세요">
            <div class="profile">
                <div class="thumbnail">
                    <img src="/resources/img/store/no_foodlogo.png" class="image-thumbnail" id="profile">
                </div>
                <div class="control">
                    <input type=file name="file" id="menu_img" accept=".png, .jpg, .jpg,.gif">
                </div>
            </div>
            <p>주문여부</p>
            <input type="radio" name="menu_sold_out" value="Y">주문가능
            <input type="radio" name="menu_sold_out" value="N">주문불가능
            <hr>
            <p>공개여부</p>
            <input type="radio" name="menu_display" value="Y">공개
            <input type="radio" name="menu_display" value="N">비공개
            <hr>
            <input type="text" id="menu_name" name="menu_name" placeholder="메뉴명을 입력하세요"><br>
            <input type="text" id="menu_price" name="menu_price" placeholder="메뉴가격을 입력하세요"><br>
            <input type="text" id="menu_intro" name="menu_intro" placeholder="메뉴소개">
            <input type="text" id="menu_num" name="menu_num" placeholder="메뉴순서">
            <input type="hidden" name="store_seq" value="2">
            <hr>

            <button class="btn btn-outline-secondary modify_btn" type="submit"
                    style="--bs-btn-border-color: rgb(206,212,218);">등록
            </button>


        </div>
    </div>
</form>





</main>
<script src="/resources/js/owner/menuAdd.js"></script>
</body>

</html>