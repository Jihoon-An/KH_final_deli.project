<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>씨바구니</title>

    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <!-- font-awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href=" /resources/css/member/order/basket.css" type="text/css">

</head>
<body>
<main id="basket">

    <div class="container">

        <div class="topBox">
            <div class="topLeftBox">
                <a href="/"><i class="fa-solid fa-arrow-left"></i></a>
            </div>
            <div class="topRightBox">
                <a href="/"><i class="fa-solid fa-house"></i></a>
            </div>
        </div>

        <div class="titleBox">
            장바구니
        </div>
        상호명 : ${basket.store.store_name}<br>
        로고 : ${basket.store.store_name}<br>
        배달팁 : ${basket.store.store_deli_tip}원<br>
        <hr>
        <c:forEach var="menuList" items="${basket.menuList}">
            <div class="menuBox">
                메뉴 SEQ : ${menuList.menu.menu_seq}<br>
                메뉴명 : ${menuList.menu.menu_name}<br>
                메뉴 가격 : <span class="menuPrice">${menuList.menu.menu_price}</span><br>
                메뉴 이미지 : ${menuList.menu.menu_img}<br>
                <br>
                <c:forEach var="option" items="${menuList.options}" varStatus="i">
                    - 옵션 메뉴 SEQ : ${option.menu_seq}<br>
                    - 옵션 SEQ : ${option.option_seq}<br>
                    - 옵션 그룹 : ${option.option_group}<br>
                    - 옵션명 : ${option.option_name}<br>
                    - 옵션 가격 : <span class="optionPrice op${i.count}">${option.option_price}</span><br>
                    <br>
                </c:forEach>
                <br>
                <div class="priceBox">
                    <span class="priceSpan">${menuList.price}</span>원
                </div>
                <div class="countBox">
                    <button class="minus">-</button>
                    수량 : <span class="countSpan">${menuList.count}</span>개
                    <button class="plus">+</button>
                    <hr>
                </div>
            </div>
        </c:forEach>
        Total : <span id="totalPrice">${totalPrice}</span>원


        <div class="buttonBox">
            <a href="/">
                <button>결제</button>
            </a>
        </div>

    </div>
    <script src="/resources/js/member/order/basket.js"></script>
</main>
</body>
</html>
