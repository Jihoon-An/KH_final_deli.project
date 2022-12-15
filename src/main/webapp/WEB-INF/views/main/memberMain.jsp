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
        <h4><a href="/">임시 리모컨</a></h4>
        <hr>
        <a href="/storeSearch">[유저]식당검색</a><br>
        <a href="/userMenu/toMyPage">[유저]마이페이지</a><br>
        <a href="/member/header/destination">[유저]배달지 선택 페이지</a><br>
        <a href="/myPage/reviewWrite/">[유저]리뷰 작성 페이지</a><br>
        <a href="/myPage/review/">[유저]리뷰 수정 페이지</a><br>
        <a href="/member/order">[유저]결제결과 페이지</a><br>
        <a href="/basket">[유저]장바구니</a><br>
        <a href="/">[유저]내주문내역unlink</a><br>
        <hr>
        <a href="/store">[오너]식당추가</a><br>
        <a href="/menu">[오너]메뉴추가</a><br>
        <hr>
        <a href="/admin/review/selectReview">[운영자]리뷰 관리 페이지</a><br>
        <hr>
        <a href="/account/logout">[유저+오너]로그아웃</a><br>
        <a href="/account/withdrawal">[유저+오너]회원탈퇴</a><br>
    </div>
    <div class="container">
        <table border="1px">
            <tr>
                <td><a>한식</a></td>
                <td><a>양식</a></td>
                <td><a>중식</a></td>
                <td><a>일식</a></td>
            </tr>
            <tr>
                <td><a>야식</a></td>
                <td><a>디저트</a></td>
                <td><a>아시안</a></td>
                <td><a>분식</a></td>
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
                                <div>평점: 평점없음</div>
                            </c:otherwise>
                        </c:choose>
                        <div>가게이름 : ${sysName.store_name}</div>
                        <c:choose>
                            <c:when test="${sysName.store_logo !=null}">
                                <div>
                                    <img src="/resources/img/store/${sysName.store_logo}">
                                    이미지: ${sysName.store_logo}
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