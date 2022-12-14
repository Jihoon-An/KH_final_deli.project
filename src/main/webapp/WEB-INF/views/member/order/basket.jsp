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
    <link rel="stylesheet" href="/resources/css/member/order/basket.css" type="text/css">

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



            <div class="buttonBox">
                <a href="/account/logout">
                    <button>로그아웃</button>
                </a>
            </div>

        </div>

    </main>
</body>
</html>
