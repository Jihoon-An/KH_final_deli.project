<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-20
  Time: 오후 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
  #fucking{
    width: 250px;
    height: 700px;
    overflow-y: auto;
    position: absolute;
    top:10px;
    left: 10px;
    border: 7px solid #e84c4f;
    box-shadow: 3px 3px 15px 3px #9f1f20;
    background-color: #f8f5f2;
    border-radius: 15px;
    line-height: 30px;
    text-align: center;
    font-size: 13px;
    z-index: 100;
  }
  #fucking a{
    color: #3e4462;
    font-weight: bolder;
    text-decoration: none;
  }

  #fucking hr{border: 2px dashed #e84c4f;}
</style>

<div id="fucking">
  <a href="/store/search">[유저]식당검색</a><br>
  <a href="/myPage">[유저]마이페이지</a><br>
  <a href="/member/header/destination">[유저]배달지 선택 페이지</a><br>
  <a href="/myPage/reviewWrite/">[유저]리뷰 작성 페이지</a><br>
  <a href="/myPage/review/">[유저]리뷰 수정 페이지</a><br>
  <a href="/member/order/detail?order_seq=17">[유저]결제결과 페이지</a><br>
  <a href="/basket">[유저]장바구니</a><br>
  <a href="/member/order/history">[유저]내주문내역</a><br>
  <a href="/store/menu">[유저]식당상세(메뉴/정보/리뷰)</a><br>
  <a href="/menu/detail/0">[유저]메뉴상세페이지</a><br>
  <a href="/order/orders">[유저]결제하기</a><br>
  <a href="/account/toMemberSignUp">[유저]일반회원가입</a><br>
<%--  <a href="/account/toKakaoSignUp">[유저]카카오회원가입-삭제예정</a><br>--%>
  <hr>
  <a href="/ownerSignUp">[오너]사업자회원가입</a><br>
  <a href="/store/add">[오너]식당추가</a><br>
  <a href="/menu/add">[오너]메뉴추가</a><br>
  <a href="/store/mng">[오너]식당 수정/삭제</a><br>
  <a href="/owner/order">[오너]주문관리</a><br>
  <hr>
  <a href="/admin">[운영자]메인 페이지</a><br>
  <a href="/admin/coupon/add">[운영자]쿠폰 추가페이지</a><br>
  <a href="/admin/coupon/list">[운영자]쿠폰 리스트페이지</a><br>
  <a href="/admin/review/">[운영자]리뷰 관리페이지</a><br>
  <a href="/admin/account/list/">[운영자]일반회원 관리페이지</a><br>
  <a href="/admin/owner/list">[운영자]오너회원 관리페이지</a><br>
  <hr>
  <a href="/deliveryDtl?order_seq=17">[배달기사]고객배달영수증</a><br>
  <a href="/account/logout">[유저+오너]로그아웃</a><br>
  <a href="/account/withdrawal">[유저+오너]회원탈퇴</a><br>
</div>