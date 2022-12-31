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
<main id="menuAdd">
    <form action="" id="frm" method="post" enctype="multipart/form-data">

        <div class="container">
            <div class="rowBox">
                <div class="title">메뉴그룹</div>
                <div class="contents" style="display: inline"><input tpye="text" id="menu_group" name="menu_group"
                                                                     placeholder="메뉴그룹명을 입력하세요"></div>
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
                            <input type=file name="file" id="menu_img" accept=".png, .jpg, .jpg,.gif">
                        </div>
                    </div>

                </div>


                <div class="rowBoxRight">
                    <div class="rowBox">
                        <span>주문여부</span>
                        <div class="contents" style="display: inline"><input type="radio" name="menu_sold_out"
                                                                             value="Y">주문가능
                            <input type="radio" name="menu_sold_out" value="N">주문불가능
                        </div>
                    </div>
                    <div class="rowBox">
                        <span>공개여부</span>
                        <div class="contents" style="display: inline"><input type="radio" name="menu_display" value="Y">공개
                            <input type="radio" name="menu_display" value="N">비공개
                        </div>
                    </div>
                    <div class="rightContents">
                        <input type="text" id="menu_name" name="menu_name" placeholder="메뉴명을 입력하세요"><br>
                        <input type="text" id="menu_price" name="menu_price" placeholder="메뉴가격을 입력하세요"
                               oninput=validNum()><br>
                        <input type="text" id="menu_intro" name="menu_intro" placeholder="메뉴소개">
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


            <div class="option_div">
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
                <button type="button" class="btn_option_add" style="float: right">옵션그룹추가</button>
            </div>


            <hr>

            <button type="button">취소하기</button>
            <button class="btn btn-outline-secondary btn_add" type="button"
                    style="--bs-btn-border-color: rgb(206,212,218);">등록하기
            </button>

        </div>
    </form>

</main>
</body>

</html>
<script src="/resources/js/owner/menuAdd.js"></script>