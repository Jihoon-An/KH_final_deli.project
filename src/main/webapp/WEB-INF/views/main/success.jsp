<%--
  Created by IntelliJ IDEA.
  User: jaeyoung
  Date: 2022-12-13
  Time: PM 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
결제 성공

<script>
$("#btn_menu_add").on("click", function () {

let add_box_main = $("
<div class='col-12 menu_add_box_main'>");
    let add_box = $("
    <div class='menu_add_box row gy-3'>")
        add_box_main.append(add_box)
        let delBtn = $("<a>")
            delBtn.append("<i class='fa-solid fa-x' style='color:#808080'>");
                delBtn.addClass("del").on("click", function () {
                $(this).closest(".menu_add_box_main").remove();
                });
                add_box.append(delBtn);

                add_box.append("<p>필수, 선택옵션</p><span><label><input type='radio' class='menu_option'
                                                                   name='option" + menuOptionCount++ + "' value='필수'>필수</label><label><input
                        type='radio' class='menu_option' name='option" + menuOptionCount++ + "'
                        value='선택'>선택</label></span>
                <div class='col-12 gy-3'>
                    <div class='text-start' style='width:350px'><span
                            style='color:#808080; font-size:x-small'>옵션명</span></div>
                    <input type='text' id='option_name_input' name='option_name' class='option_name'
                           placeholder='옵션명을 입력하세요' maxlength='20'>
                    <div class='text-start' style='width:350px'><span
                            style='color:#808080; font-size:x-small'>옵션가격</span></div>
                    <input type='text' id='option_price_input' name='option_price' class='option_price'
                           placeholder='옵션가격을 입력하세요' maxlength='15' oninput=validNum()>")

                    add_box_main.hide();

                    $("#btn_menu_add").before(add_box_main);

                    add_box_main.fadeIn(1000);

                    })
</script>

</body>
</html>
