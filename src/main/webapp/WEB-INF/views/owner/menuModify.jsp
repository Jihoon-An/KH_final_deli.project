<%--
  Created by IntelliJ IDEA.
  User: jaeyoung
  Date: 2022-12-22
  Time: AM 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <main class="menuModify">
        <form action="" id="frm" method="post" enctype="multipart/form-data">
            <button type="button">메뉴 그룹 수정</button>
            <hr>

            <div class="container">
                <input tpye="text" id="menu_group" name="menu_group" placeholder="메뉴그룹명을 입력하세요"> <button
                    type="button">X</button>
                <hr>
                <button type="button">메뉴 수정</button>

                <div class="menufrm">
                    <div class="profile">
                        <div class="thumbnail">
                            <img src="/resources/img/menu-img/no_foodlogo.png" class="image-thumbnail" id="profile">
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
                    <input type="hidden" name="store_seq" value="21">
                    <hr>

                    <div>
                        <select name="option_required" class="required">
                            <option value="Y">필수옵션</option>
                            <option value="N">선택옵션</option>
                        </select>
                        <input type="text" placeholder="옵션그룹명을 입력하세요" name="option_group" class="opgroup"><br>
                        <div class="group">
                            <button type="button">X</button> <input type="text" placeholder="옵션명을 입력하세요" name="option_name" class="opname">
                            <input type="text" placeholder="옵션가격을 입력하세요" name="option_price" class="opprice"><br>
                            <button type="button">X</button> <input type="text" placeholder="옵션명을 입력하세요" name="option_name" class="opname">
                            <input type="text" placeholder="옵션가격을 입력하세요" name="option_price" class="opprice">
                            <button type="button">+</button>
                            <br>
                        </div>
                    </div>
                    <div>
                        <select name="option_required"  class="required">
                            <option value="Y">필수옵션</option>
                            <option value="N">선택옵션</option>
                        </select>
                        <input type="text" placeholder="옵션그룹명을 입력하세요" name="option_group" class="opgroup"><br>
                        <div class="group">
                            <button type="button">X</button> <input type="text" placeholder="옵션명을 입력하세요" name="option_name" class="opname">
                            <input type="text" placeholder="옵션가격을 입력하세요" name="option_price" class="opprice"><br>
                            <button type="button">X</button> <input type="text" placeholder="옵션명을 입력하세요" name="option_name" class="opname">
                            <input type="text" placeholder="옵션가격을 입력하세요" name="option_price" class="opprice">
                            <button type="button"  class="btn_opnameadd">+</button> <br>
                        </div>

                    </div>

                </div>

                <hr>

                <button type="button">취소하기</button>
                <button class="btn btn-outline-secondary btn_modify" type="button"
                        style="--bs-btn-border-color: rgb(206,212,218);">수정하기
                </button>

            </div>
        </form>
    </main>
</body>
</html>
