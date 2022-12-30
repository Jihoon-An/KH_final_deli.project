<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>딜리 - Error</title>
    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>
    <style>
        .page_404 {
            padding: 50px 0;
            background: #fff;
        }

        .page_404 img {
            width: 100%;
        }

        .four_zero_four_bg {
            background-image: url(https://cdn.dribbble.com/users/1175431/screenshots/6188233/404-error-dribbble-800x600.gif);
            height: 400px;
            background-position: center;
        }

        .four_zero_four_bg h1 {
            font-size: 80px;
        }

        .four_zero_four_bg h3 {
            font-size: 80px;
        }

        .link_404 {
            color: #fff !important;
            padding: 10px 20px;
            background: #E84C4F;
            margin: 20px 0;
            display: inline-block;
        }
        .contant_box_404 {
            margin-top: -20px;
        }
    </style>
</head>
<body>
<section class="page_404">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-10 col-sm-offset-1 text-center">
                    <div class="four_zero_four_bg">
                        <!-- <h1 class="text-center">404</h1> -->
                    </div>

                    <div class="contant_box_404">
                        <h3 class="h2">현재 영업 중이 아닙니다</h3>
                        <a href="/" class="link_404">
                            딜리 메인으로 가기
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
