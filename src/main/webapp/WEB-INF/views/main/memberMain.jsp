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
        <a href="/myPage">[유저]마이페이지</a><br>
        <a href="/member/header/destination">[유저]배달지 선택 페이지</a><br>
        <a href="/myPage/reviewWrite/">[유저]리뷰 작성 페이지</a><br>
        <a href="/myPage/review/">[유저]리뷰 수정 페이지</a><br>
        <a href="/member/order/detail">[유저]결제결과 페이지</a><br>
        <a href="/basket">[유저]장바구니</a><br>
        <a href="/member/order/history">[유저]내주문내역</a><br>
        <a href="/store/menu">[유저]식당상세(메뉴/정보/리뷰)</a><br>
        <a href="/account/toMemberSignUp">[유저]일반회원가입</a><br>
        <a href="/account/toKakaoSignUp">[유저]카카오회원가입</a><br>
        <hr>
        <a href="/ownerSignUp">[오너]사업자회원가입</a><br>
        <a href="/store">[오너]식당추가</a><br>
        <a href="/menu">[오너]메뉴추가</a><br>
        <hr>
        <a href="/admin/coupon/add">[운영자]쿠폰 추가 페이지</a><br>
        <a href="/admin/coupon/list">[운영자]쿠폰 리스트 페이지</a><br>
        <a href="/admin/review/">[운영자]리뷰 관리 페이지</a><br>
        <a href="/admin/account/list/">[운영자]일반회원 관리 페이지</a><br>
        <hr>
        <hr>
        <a href="/deliveryDtl">[배달기사]고객배달영수증</a><br>
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
            <c:when test="${not empty store_list}">
                <c:forEach var="store_list" items="${store_list}" varStatus="status">
                    <hr>
                    <div class="store_list d-inline-flex m-2">
                        <div class="m-2 store_logo_box">
                            <img class="store_logo"
                                 src="https://shop-phinf.pstatic.net/20221209_61/1670570397926XRLOY_JPEG/%ED%8C%A8%EC%85%98%ED%83%80%EC%9A%B4_%ED%96%89%EC%82%AC%EB%B0%B0%EB%84%88%EC%9A%B4%EC%98%81%EA%B0%80%EC%9D%B4%EB%93%9C.jpg">
                        </div>
                            ${store_list.STORE_LOGO}
                        <div class="m-2 store_info_box">
                            최소주문금액${store_list.STORE_MIN_PRICE}<BR>
                            <div>식당명: ${store_list.STORE_NAME}</div>
                            <div>★${store_list.AVERAGE_STARS} / 리뷰개수:${store_list.COUNT_REVIEW}
                                / ${store_list.DISTANCE}m
                            </div>
                            <div>배달요금: ${store_list.STORE_DELI_TIP}원</div>
                            <div class="menu_name">
                                메뉴명:
                                <c:forEach var="menu_list" items="${menu_list[status.index].menu_name}" varStatus="status2">
                                    ${menu_list}<c:if test="${!status2.last}">, </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div>근처에 주문할 수 있는 가게가 없습니다.</div>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>