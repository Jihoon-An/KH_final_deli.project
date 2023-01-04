<%--
  Created by IntelliJ IDEA.
  User: ykm
  Date: 2022-12-19
  Time: 오전 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <title>딜리 - 메뉴추가</title>
    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

    <link rel="stylesheet" href="/resources/css/owner/menuAdd.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/customHeader/common.css" type="text/css">

</head>

<head>

<body>
<%@ include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>
<style>
    #deli_nav_back {
        position: fixed;
        z-index: 1;
        background: #353535;
        min-height: 1000px;
        min-width: 250px;
    }
</style>
<div id="deli_nav_back"></div>
<main id="menuAdd">
    <form action="" id="frm" method="post" enctype="multipart/form-data">

        <div class="container">
            <div class="rowBox">
                <div class="title">메뉴그룹</div>
                <div class="contents" style="display: inline"><input style="width: 200px" tpye="text" id="menu_group"
                                                                     name="menu_group"
                                                                     placeholder="메뉴그룹명을 입력하세요" class="form-control">
                </div>
                <div style="display: inline; font-size: 12px" class="menu_group_msg"></div>
            </div>

            <div class="topContents">

                <div class="img_div">

                    <div class="titleImg">메뉴사진</div>
                    <div class="profile">
                        <div class="thumbnail">
                            <img src="/resources/img/menu-img/no_foodlogo.png" class="image-thumbnail" id="profile">
                        </div>

                        <div class="control">
                            <label id="btnCustom"> <i class="fa-solid fa-camera"></i> 사진 추가 (필수)
                                <input type=file name="file" id="menu_img" accept=".png, .jpg, .jpg,.gif">
                            </label>
                        </div>

                    </div>

                </div>


                <div class="rowBoxRight">
                    <div class="rowBox ">
                        <span>주문여부 : </span>
                        <div class="contents" style="display: inline"><input type="radio" name="menu_sold_out"
                                                                             value="Y" checked>주문가능
                            <input type="radio" name="menu_sold_out" value="N">주문불가능
                        </div>
                    </div>
                    <div class="rowBox" style="display: none">
                        <span>공개여부 : </span>
                        <div class="contents" style="display: inline"><input type="radio" name="menu_display" value="Y" checked>공개
                            <input type="radio" name="menu_display" value="N">비공개
                        </div>
                    </div>
                    <div class="rightContents">
                        <div class="input-group" style="width: 517px;">
                            <input type="text" id="menu_name" name="menu_name" placeholder="메뉴명을 입력하세요"
                                   class="form-control" style="width: 150px"><br>
                            <input type="text" id="menu_price" name="menu_price" placeholder="메뉴가격"
                                   oninput=validNum() class="form-control">
                            <div style='position: relative; top: 5px; left: -25px;'>원</div>
                        </div>

                        <textarea id="menu_intro" name="menu_intro" placeholder="메뉴 소개란"
                                  class="input_menu_intro"></textarea>
                        <%--                        <input type="text" id="menu_intro" name="menu_intro" placeholder="메뉴소개">--%>

                        <input type="hidden" name="store_seq" value="${store_seq}">


                    </div>
                </div>
            </div>


            <%--                <div class="option_div">--%>

            <%--                    <select name="option_required" class="required">--%>
            <%--                        <option value="Y">필수옵션</option>--%>
            <%--                        <option value="N">선택옵션</option>--%>
            <%--                    </select>--%>
            <%--                    <select name="option_multiple" class="op_multi">--%>
            <%--                        <option value="Y">중복가능</option>--%>
            <%--                        <option value="N">중복불가능</option>--%>
            <%--                    </select>--%>
            <%--                    <input type="text" placeholder="옵션그룹명을 입력하세요" name="option_group" class="op_group"><br>--%>
            <%--                    <div class="group">--%>
            <%--                        <div class="optionName_div">--%>
            <%--                            <input type="text" placeholder="옵션명을 입력하세요" name="option_name" class="op_name">--%>
            <%--                            <input type="text" placeholder="옵션가격을 입력하세요" name="option_price" class="op_price" oninput=validNum()>--%>
            <%--                        </div>--%>
            <%--                        <button type="button" class="btn_opnameadd">옵션명추가</button>--%>
            <%--                        <br>--%>
            <%--                    </div>--%>
            <%--                </div>--%>


            <div class="option_div" style=" padding-left: 50px">
                <div class="option_div2">
                    <%--                        <select name="option_required" class="required">--%>
                    <%--                            <option value="Y">필수옵션</option>--%>
                    <%--                            <option value="N">선택옵션</option>--%>
                    <%--                        </select>--%>
                    <%--                        <select name="option_multiple" class="op_multi">--%>
                    <%--                            <option value="Y">중복가능</option>--%>
                    <%--                            <option value="N">중복불가능</option>--%>
                    <%--                        </select>--%>
                    <%--                        <input type="text" placeholder="옵션그룹명을 입력하세요" name="option_group" class="op_group"><br>--%>
                    <%--                        <div class="group">--%>
                    <%--                            <div class="optionName_div">--%>
                    <%--                                <input type="text" placeholder="옵션명을 입력하세요" name="option_name" class="op_name">--%>
                    <%--                                <input type="text" placeholder="옵션가격을 입력하세요" name="option_price"--%>
                    <%--                                       class="op_price" oninput=validNum()>--%>
                    <%--                            </div>--%>
                    <%--                            <button type="button" class="btn_opnameadd">옵션명추가</button>--%>
                    <%--                            <br>--%>
                    <%--                        </div>--%>
                </div>
                <button type="button" class="btn_option_add deli_btn" style="float: right">옵션그룹추가</button>
            </div>


            <div class="foot_btn">
                <a href="/owner/store/list">
                    <button type="button" class="deli_btn">취소하기</button>
                </a>
                <button class="btn btn-outline-secondary btn_add deli_btn" type="button"
                        style="--bs-btn-border-color: rgb(206,212,218);">등록하기
                </button>


            </div>

        </div>
    </form>

</main>
</body>

</html>
<script src="/resources/js/owner/menuAdd.js"></script>