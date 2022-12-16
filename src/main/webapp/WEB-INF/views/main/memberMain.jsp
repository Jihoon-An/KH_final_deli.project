<%--
  Created by IntelliJ IDEA.
  User: xiati
  Date: 2022-12-12
  Time: 오후 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원 메인페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" href="/resources/css/main/memberMain.css" type="text/css">
</head>
<body>
<main id="memberMain">

    <div id="fucking">
        <h4><a href="/">임시 리모컨</a></h4><hr>
        <a href="/storeSearch">[유저]식당검색</a><br>
        <a href="/userMenu/toMyPage">[유저]마이페이지</a><br>
        <a href="/member/header/destination">[유저]배달지 선택 페이지</a><br>
        <a href="/myPage/reviewWrite/">[유저]리뷰 작성 페이지</a><br>
        <a href="/myPage/review/">[유저]리뷰 수정 페이지</a><br>
        <a href="/member/order">[유저]결제결과 페이지</a><br>
        <a href="/basket">[유저]장바구니</a><br>
        <a href="/">[유저]내주문내역unlink</a><br>
        <a href="/store/menu/detail">[유저]메뉴상세 장바구니 담기</a><br>
        <hr>
        <a href="/ownerSignUp">[오너]사업자회원가입</a><br>
        <a href="/store">[오너]식당추가</a><br>
        <a href="/menu">[오너]메뉴추가</a><br>
        <hr>
        <a href="/admin/coupon/add">[운영자]쿠폰 추가 페이지</a><br>
        <a href="/admin/coupon/list">[운영자]쿠폰 리스트 페이지</a><br>
        <a href="/admin/review/selectReview">[운영자]리뷰 관리 페이지</a><br>
        <hr>
        <a href="/account/logout">[유저+오너]로그아웃</a><br>
        <a href="/account/withdrawal">[유저+오너]회원탈퇴</a><br>
    </div>
    <div class="container">
        <table border="1px">
            <tr>
                <td><a><img src="/resources/img/memberMain/korean.png" class="categoryIcon"><div>한식</div></a></td>
                <td><a><img src="/resources/img/memberMain/bunsik.png" class="categoryIcon"> <div>분식</div></a></td>
                <td><a><img src="/resources/img/memberMain/jjim.png" class="categoryIcon"><div>찜</div></a></td>
                <td><a><img src="/resources/img/memberMain/chicken.png" class="categoryIcon"><div>치킨</div></a></td>
                <td><a><img src="/resources/img/memberMain/dosirak.png" class="categoryIcon"><div>도시락</div></a></td>
            </tr>
            <tr>
                <td><a><img src="/resources/img/memberMain/china.png" class="categoryIcon"><div>중식</div></a></td>
                <td><a><img src="/resources/img/memberMain/japan.png" class="categoryIcon"><div>일식</div></a></td>
                <td><a><img src="/resources/img/memberMain/western.png" class="categoryIcon"><div>양식</div></a></td>
                <td><a><img src="/resources/img/memberMain/pizza.png" class="categoryIcon"><div>피자</div></a></td>
                <td><a><img src="/resources/img/memberMain/burger.png" class="categoryIcon"><div>버거</div></a></td>
            </tr>
            <tr>
                <td><a><img src="/resources/img/memberMain/salad.png" class="categoryIcon"><div>샐러드</div></a></td>
                <td><a><img src="/resources/img/memberMain/cafe.png" class="categoryIcon"><div>카페</div></a></td>
                <td><a><img src="/resources/img/memberMain/dosirak.png" class="categoryIcon"><div>도시락</div></a></td>
                <td><a><img src="/resources/img/memberMain/franchise.png" class="categoryIcon"><div>프랜차이즈</div></a></td>
                <td><a><img src="/resources/img/memberMain/newstore.png" class="categoryIcon"><div>신규맛집</div></a></td>
            </tr>
        </table>
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach var="sysName" items="${list}" varStatus="status">
                    <hr>
                    <div>
                        <div>가게시퀀스 : ${sysName.store_seq}</div>
                        <c:choose>
                            <c:when test="${not empty starlist[status.index]}">
                                <div>평점: ${starlist[status.index]} </div>
                            </c:when>
                            <c:otherwise>
                                <div>평점: 0</div>
                            </c:otherwise>
                        </c:choose>
                        <div>가게이름 : ${sysName.store_name}</div>
                        <c:choose>
                            <c:when test="${sysName.store_logo !=null}">
                                <div>
                                    <img class="logoImg" src="/resources/img/store/${sysName.store_logo}">
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>이미지: 사진없음</div>
                            </c:otherwise>
                        </c:choose>
                        <div>최소금액 : ${sysName.store_min_price},</div>
                        <div>배달팁 : ${sysName.store_deli_tip},</div>
                        <div>배달시간 : ${sysName.store_deli_time}</div>
                    </div>
                </c:forEach>
            </c:when>
        </c:choose>
    </div>
</main>
</body>
</html>