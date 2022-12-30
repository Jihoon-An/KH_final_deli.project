<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-18
  Time: 오후 5:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <title>딜리 - 식당관리</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>

    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico"/>
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/customHeader/common.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owner/storeMng.css" type="text/css">
</head>

<body>
<%@ include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>
<main id="storeMng">
    <form action="/owner/store/mng/modify" id="frm" method="post" enctype="multipart/form-data">
        <div class="container">
            <c:choose>
            <c:when test="${not empty store}">
            <input type="hidden" name="acc_seq" value="${acc_seq}">
            <input type="hidden" name="store_seq" id="store_seq" value="${store.store_seq}">
            <div class="rowBox">
                <div class="title">상호명</div>
                <div class="contents">
                    <input type="text" name="store_name" placeholder="상호명입력" id="store_name" class="input"
                           value="${store.store_name}">
                </div>
            </div>
            <div class="rowBox">
                <div class="title">핸드폰 번호</div>
                <div class="contents"><input type="text" name="store_phone" placeholder="폰번호입력" id="store_phone"
                                             oninput=validNum() class="input" value="${store.store_phone}"></div>
            </div>
            <div class="rowBox">
                <div class="title">우편번호</div>
                <div class="contents"><input type="text" id="postcode" placeholder="우편번호" class="input">
                    <button type="button" class="postsearch">우편검색</button>
                </div>
            </div>
            <div class="rowBox">
                <div class="title">기본주소</div>
                <div class="contents"><input type="text" id="add1" name="store_add_detail1" placeholder="기본주소"
                                             id="store_add_detail1" class="input" value="${store.store_add_detail1}">
                </div>
            </div>
            <div class="rowBox">
                <div class="title">상세주소</div>
                <div class="contents"><input type="text" id="add2" name="store_add_detail2" placeholder="상세주소"
                                             id="store_add_detail2" class="input" value="${store.store_add_detail2}">
                </div>
            </div>

            <input type="hidden" id="store_add_x" name="store_add_x" class="input" value="${store.store_add_x}">
            <input type="hidden" id="store_add_y" name="store_add_y" class="input" value="${store.store_add_y}">

            <div class="rowBox">
                <div class="title">음식카테고리</div>
                <div class="contents">
                    <select name="store_category">
                        <c:if test="${store.store_category eq '한식'}">
                            <option value="한식" selected>
                                한식
                            </option>
                            <option value="양식">
                                양식
                            </option>
                            <option value="일식">
                                일식
                            </option>
                            <option value="중식">
                                중식
                            </option>
                            <option value="분식">
                                분식
                            </option>
                            <option value="찜·탕·찌개">
                                찜·탕·찌개
                            </option>
                            <option value="치킨">
                                치킨
                            </option>
                            <option value="피자">
                                피자
                            </option>
                            <option value="버거">
                                버거
                            </option>
                            <option value="도시락">
                                도시락
                            </option>
                            <option value="카페·디저트">
                                카페·디저트
                            </option>
                            <option value="샐러드">
                                샐러드
                            </option>
                        </c:if>

                        <c:if test="${store.store_category eq '양식'}">
                            <option value="한식">
                                한식
                            </option>
                            <option value="양식" selected>
                                양식
                            </option>
                            <option value="일식">
                                일식
                            </option>
                            <option value="중식">
                                중식
                            </option>
                            <option value="분식">
                                분식
                            </option>
                            <option value="찜·탕·찌개">
                                찜·탕·찌개
                            </option>
                            <option value="치킨">
                                치킨
                            </option>
                            <option value="피자">
                                피자
                            </option>
                            <option value="버거">
                                버거
                            </option>
                            <option value="도시락">
                                도시락
                            </option>
                            <option value="카페·디저트">
                                카페·디저트
                            </option>
                            <option value="샐러드">
                                샐러드
                            </option>
                        </c:if>

                        <c:if test="${store.store_category eq '일식'}">
                            <option value="한식">
                                한식
                            </option>
                            <option value="양식">
                                양식
                            </option>
                            <option value="일식" selected>
                                일식
                            </option>
                            <option value="중식">
                                중식
                            </option>
                            <option value="분식">
                                분식
                            </option>
                            <option value="찜·탕·찌개">
                                찜·탕·찌개
                            </option>
                            <option value="치킨">
                                치킨
                            </option>
                            <option value="피자">
                                피자
                            </option>
                            <option value="버거">
                                버거
                            </option>
                            <option value="도시락">
                                도시락
                            </option>
                            <option value="카페·디저트">
                                카페·디저트
                            </option>
                            <option value="샐러드">
                                샐러드
                            </option>
                        </c:if>


                        <c:if test="${store.store_category eq '중식'}">
                            <option value="한식">
                                한식
                            </option>
                            <option value="양식">
                                양식
                            </option>
                            <option value="일식">
                                일식
                            </option>
                            <option value="중식" selected>
                                중식
                            </option>
                            <option value="분식">
                                분식
                            </option>
                            <option value="찜·탕·찌개">
                                찜·탕·찌개
                            </option>
                            <option value="치킨">
                                치킨
                            </option>
                            <option value="피자">
                                피자
                            </option>
                            <option value="버거">
                                버거
                            </option>
                            <option value="도시락">
                                도시락
                            </option>
                            <option value="카페·디저트">
                                카페·디저트
                            </option>
                            <option value="샐러드">
                                샐러드
                            </option>
                        </c:if>

                        <c:if test="${store.store_category eq '분식'}">
                            <option value="한식">
                                한식
                            </option>
                            <option value="양식">
                                양식
                            </option>
                            <option value="일식">
                                일식
                            </option>
                            <option value="중식">
                                중식
                            </option>
                            <option value="분식" selected>
                                분식
                            </option>
                            <option value="찜·탕·찌개">
                                찜·탕·찌개
                            </option>
                            <option value="치킨">
                                치킨
                            </option>
                            <option value="피자">
                                피자
                            </option>
                            <option value="버거">
                                버거
                            </option>
                            <option value="도시락">
                                도시락
                            </option>
                            <option value="카페·디저트">
                                카페·디저트
                            </option>
                            <option value="샐러드">
                                샐러드
                            </option>
                        </c:if>

                        <c:if test="${store.store_category eq '찜·탕·찌개'}">
                            <option value="한식">
                                한식
                            </option>
                            <option value="양식">
                                양식
                            </option>
                            <option value="일식">
                                일식
                            </option>
                            <option value="중식">
                                중식
                            </option>
                            <option value="분식">
                                분식
                            </option>
                            <option value="찜·탕·찌개" selected>
                                찜·탕·찌개
                            </option>
                            <option value="치킨">
                                치킨
                            </option>
                            <option value="피자">
                                피자
                            </option>
                            <option value="버거">
                                버거
                            </option>
                            <option value="도시락">
                                도시락
                            </option>
                            <option value="카페·디저트">
                                카페·디저트
                            </option>
                            <option value="샐러드">
                                샐러드
                            </option>
                        </c:if>

                        <c:if test="${store.store_category eq '치킨'}">
                            <option value="한식">
                                한식
                            </option>
                            <option value="양식">
                                양식
                            </option>
                            <option value="일식">
                                일식
                            </option>
                            <option value="중식">
                                중식
                            </option>
                            <option value="분식">
                                분식
                            </option>
                            <option value="찜·탕·찌개">
                                찜·탕·찌개
                            </option>
                            <option value="치킨" selected>
                                치킨
                            </option>
                            <option value="피자">
                                피자
                            </option>
                            <option value="버거">
                                버거
                            </option>
                            <option value="도시락">
                                도시락
                            </option>
                            <option value="카페·디저트">
                                카페·디저트
                            </option>
                            <option value="샐러드">
                                샐러드
                            </option>
                        </c:if>

                        <c:if test="${store.store_category eq '피자'}">
                            <option value="한식">
                                한식
                            </option>
                            <option value="양식">
                                양식
                            </option>
                            <option value="일식">
                                일식
                            </option>
                            <option value="중식">
                                중식
                            </option>
                            <option value="분식">
                                분식
                            </option>
                            <option value="찜·탕·찌개">
                                찜·탕·찌개
                            </option>
                            <option value="치킨">
                                치킨
                            </option>
                            <option value="피자" selected>
                                피자
                            </option>
                            <option value="버거">
                                버거
                            </option>
                            <option value="도시락">
                                도시락
                            </option>
                            <option value="카페·디저트">
                                카페·디저트
                            </option>
                            <option value="샐러드">
                                샐러드
                            </option>
                        </c:if>

                        <c:if test="${store.store_category eq '버거'}">
                            <option value="한식">
                                한식
                            </option>
                            <option value="양식">
                                양식
                            </option>
                            <option value="일식">
                                일식
                            </option>
                            <option value="중식">
                                중식
                            </option>
                            <option value="분식">
                                분식
                            </option>
                            <option value="찜·탕·찌개">
                                찜·탕·찌개
                            </option>
                            <option value="치킨">
                                치킨
                            </option>
                            <option value="피자">
                                피자
                            </option>
                            <option value="버거" selected>
                                버거
                            </option>
                            <option value="도시락">
                                도시락
                            </option>
                            <option value="카페·디저트">
                                카페·디저트
                            </option>
                            <option value="샐러드">
                                샐러드
                            </option>
                        </c:if>

                        <c:if test="${store.store_category eq '도시락'}">
                            <option value="한식">
                                한식
                            </option>
                            <option value="양식">
                                양식
                            </option>
                            <option value="일식">
                                일식
                            </option>
                            <option value="중식">
                                중식
                            </option>
                            <option value="분식">
                                분식
                            </option>
                            <option value="찜·탕·찌개">
                                찜·탕·찌개
                            </option>
                            <option value="치킨">
                                치킨
                            </option>
                            <option value="피자">
                                피자
                            </option>
                            <option value="버거">
                                버거
                            </option>
                            <option value="도시락" selected>
                                도시락
                            </option>
                            <option value="카페·디저트">
                                카페·디저트
                            </option>
                            <option value="샐러드">
                                샐러드
                            </option>
                        </c:if>

                        <c:if test="${store.store_category eq '카페·디저트'}">
                            <option value="한식">
                                한식
                            </option>
                            <option value="양식">
                                양식
                            </option>
                            <option value="일식">
                                일식
                            </option>
                            <option value="중식">
                                중식
                            </option>
                            <option value="분식">
                                분식
                            </option>
                            <option value="찜·탕·찌개">
                                찜·탕·찌개
                            </option>
                            <option value="치킨">
                                치킨
                            </option>
                            <option value="피자">
                                피자
                            </option>
                            <option value="버거">
                                버거
                            </option>
                            <option value="도시락">
                                도시락
                            </option>
                            <option value="카페·디저트" selected>
                                카페·디저트
                            </option>
                            <option value="샐러드">
                                샐러드
                            </option>
                        </c:if>

                        <c:if test="${store.store_category eq '샐러드'}">
                            <option value="한식">
                                한식
                            </option>
                            <option value="양식">
                                양식
                            </option>
                            <option value="일식">
                                일식
                            </option>
                            <option value="중식">
                                중식
                            </option>
                            <option value="분식">
                                분식
                            </option>
                            <option value="찜·탕·찌개">
                                찜·탕·찌개
                            </option>
                            <option value="치킨">
                                치킨
                            </option>
                            <option value="피자">
                                피자
                            </option>
                            <option value="버거">
                                버거
                            </option>
                            <option value="도시락">
                                도시락
                            </option>
                            <option value="카페·디저트">
                                카페·디저트
                            </option>
                            <option value="샐러드" selected>
                                샐러드
                            </option>
                        </c:if>

                    </select>
                </div>
            </div>
        </div>
        <div class="rowBox" style="height: 150px">
            <div class="title">대표사진</div>
            <input type="text" value="${store.store_logo}">
            <div class="contents">
                <div class="profile">
                    <div class="thumbnail">
                        <c:choose>
                            <c:when test="${store.store_logo!=null}">
                                <img src="/resources/img/store/${store.store_logo}" class="profile_img">
                            </c:when>
                            <c:otherwise>
                                <img src="/resources/img/store/no_storelogo.png" class="profile_img">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="control">
                        <input type=file name="file" id="store_img" accept=".png, .jpg, .jpg,.gif">
                    </div>
                </div>
            </div>
        </div>

        <div class="rowBox" style="height:100px;">
            <div class="title">식당소개</div>
            <div class="contents" style="height:100px;"><input type="text" name="store_intro" placeholder="식당소개란"
                                                               id="store_intro"
                                                               class="input_intro" value="${store.store_intro}"></div>
        </div>
        <div class="rowBox" style="height:100px;">
            <div class="title">주요 원산지</div>
            <div class="contents" style="height:100px;"><input type="text" name="store_origin" placeholder="주요 원산지"
                                                               id="store_origin"
                                                               class="input_origin" value="${store.store_origin}"></div>
        </div>


        <div class="rowBox">
            <div class="title">영업시간</div>
            <div class="contents" style="color: #9f1f20">오전 오후를 신경써서 입력해주세요</div>
        </div>

        <div class="rowBox">
            <div class="title"> 월요일</div>
            <div class="contents">
                <div class="bsns_div">

                    <input type="hidden" class="bsns" value="월요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option <c:if test="${parsingStr.get('mon').get('open') eq '영업일'}">selected</c:if>>영업일
                        </option>
                        <option <c:if test="${parsingStr.get('mon').get('open') eq '휴무일'}">selected</c:if>>휴무일
                        </option>
                    </select>
                    <span class="bs_time">
    <input type="time" class="bsns bs_open_time" value="${parsingStr.get("mon").get("open_time")}">
    <input type="time" class="bsns bs_close_time" value="${parsingStr.get("mon").get("close_time")}">
    </span>
                </div>
            </div>
        </div>

        <div class="rowBox">
            <div class="title">화요일</div>
            <div class="contents">
                <div class="bsns_div">

                    <input type="hidden" class="bsns" value="화요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option <c:if test="${parsingStr.get('tue').get('open') eq '영업일'}">selected</c:if>>영업일
                        </option>
                        <option <c:if test="${parsingStr.get('tue').get('open') eq '휴무일'}">selected</c:if>>휴무일
                        </option>
                    </select>
                    <span class="bs_time">
    <input type="time" class="bsns bs_open_time" value="${parsingStr.get("tue").get("open_time")}">
<input type="time" class="bsns bs_close_time" value="${parsingStr.get("tue").get("close_time")}">
    </span>
                </div>
            </div>
        </div>

        <div class="rowBox">
            <div class="title">수요일</div>
            <div class="contents">
                <div class="bsns_div">
                    <input type="hidden" class="bsns" value="수요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option <c:if test="${parsingStr.get('wed').get('open') eq '영업일'}">selected</c:if>>영업일
                        </option>
                        <option <c:if test="${parsingStr.get('wed').get('open') eq '휴무일'}">selected</c:if>>휴무일
                        </option>
                    </select>
                    <span class="bs_time">
   <input type="time" class="bsns bs_open_time" value="${parsingStr.get("wed").get("open_time")}">
<input type="time" class="bsns bs_close_time" value="${parsingStr.get("wed").get("close_time")}">
    </span>
                </div>
            </div>
        </div>

        <div class="rowBox">
            <div class="title">목요일</div>
            <div class="contents">
                <div class="bsns_div">

                    <input type="hidden" class="bsns" value="목요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option <c:if test="${parsingStr.get('thu').get('open') eq '영업일'}">selected</c:if>>영업일
                        </option>
                        <option <c:if test="${parsingStr.get('thu').get('open') eq '휴무일'}">selected</c:if>>휴무일
                        </option>
                    </select>
                    <span class="bs_time">
   <input type="time" class="bsns bs_open_time" value="${parsingStr.get("thu").get("open_time")}">
<input type="time" class="bsns bs_close_time" value="${parsingStr.get("thu").get("close_time")}">

    </span>
                </div>
            </div>
        </div>


        <div class="rowBox">
            <div class="title">금요일</div>
            <div class="contents">
                <div class="bsns_div">

                    <input type="hidden" class="bsns" value="금요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option <c:if test="${parsingStr.get('fri').get('open') eq '영업일'}">selected</c:if>>영업일
                        </option>
                        <option <c:if test="${parsingStr.get('fri').get('open') eq '휴무일'}">selected</c:if>>휴무일
                        </option>
                    </select>
                    <span class="bs_time">
   <input type="time" class="bsns bs_open_time" value="${parsingStr.get("fri").get("open_time")}">
<input type="time" class="bsns bs_close_time" value="${parsingStr.get("fri").get("close_time")}">
    </span>
                </div>
            </div>
        </div>
        <div class="rowBox">
            <div class="title">토요일</div>
            <div class="contents">
                <div class="bsns_div">
                    <input type="hidden" class="bsns" value="토요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option <c:if test="${parsingStr.get('sat').get('open') eq '영업일'}">selected</c:if>>영업일
                        </option>
                        <option <c:if test="${parsingStr.get('sat').get('open') eq '휴무일'}">selected</c:if>>휴무일
                        </option>
                    </select>
                    <span class="bs_time">
    <input type="time" class="bsns bs_open_time" value="${parsingStr.get("sat").get("open_time")}">
<input type="time" class="bsns bs_close_time" value="${parsingStr.get("sat").get("close_time")}">
    </span>
                </div>
            </div>
        </div>

        <div class="rowBox">
            <div class="title">일요일</div>
            <div class="contents">
                <div class="bsns_div">

                    <input type="hidden" class="bsns" value="일요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option <c:if test="${parsingStr.get('sun').get('open') eq '영업일'}">selected</c:if>>영업일
                        </option>
                        <option <c:if test="${parsingStr.get('sun').get('open') eq '휴무일'}">selected</c:if>>휴무일
                        </option>
                    </select>
                    <span class="bs_time">
   <input type="time" class="bsns bs_open_time" value="${parsingStr.get("sun").get("open_time")}">
<input type="time" class="bsns bs_close_time" value="${parsingStr.get("sun").get("close_time")}">
    </span>
                </div>
            </div>
        </div>
        <input type="hidden" id="bsns_data" name="store_bsns_hours">


        <div class="rowBox">
            <div class="title">휴무일</div>
            <div class="contents" style="display: inline; width: 220px"><input type="text" name="store_close_day"
                                                                               placeholder="휴무일"
                                                                               class="input close_day"
                                                                               value="${store.store_close_day}"></div>
            <div class="close_day_msg" style="font-size: 10px; line-height: 20px"></div>
        </div>


        <div class="rowBox">
            <div class="title">주문 최소 금액</div>
            <div class="contents"><input type="text" name="store_min_price" placeholder="주문 최소 금액"
                                         id="store_min_price"
                                         class="input" oninput=validNum() value="${store.store_min_price}">원
            </div>
        </div>


        <div class="rowBox">
            <div class="title">배달팁</div>
            <div class="contents"><input type="text" name="store_deli_tip" placeholder="배달팁" id="store_deli_tip"
                                         class="input"
                                         oninput=validNum() value="${store.store_deli_tip}">원
            </div>
        </div>


        <div class="rowBox">
            <div class="title">배달 예상 시간</div>
            <div class="contents">
                <select name="store_deli_time" id="time">
                    <c:if test="${store.store_deli_time eq '20'}">
                        <option value="20" selected>20분</option>
                        <option value="30">30분</option>
                        <option value="40">40분</option>
                        <option value="60">60분</option>
                        <option value="90">90분</option>
                    </c:if>

                    <c:if test="${store.store_deli_time eq '30'}">
                        <option value="20">20분</option>
                        <option value="30" selected>30분</option>
                        <option value="40">40분</option>
                        <option value="60">60분</option>
                        <option value="90">90분</option>
                    </c:if>


                    <c:if test="${store.store_deli_time eq '40'}">
                        <option value="20">20분</option>
                        <option value="30">30분</option>
                        <option value="40" selected>40분</option>
                        <option value="60">60분</option>
                        <option value="90">90분</option>
                    </c:if>


                    <c:if test="${store.store_deli_time eq '60'}">
                        <option value="20">20분</option>
                        <option value="30">30분</option>
                        <option value="40">40분</option>
                        <option value="60" selected>60분</option>
                        <option value="90">90분</option>
                    </c:if>

                    <c:if test="${store.store_deli_time eq '90'}">
                        <option value="20">20분</option>
                        <option value="30">30분</option>
                        <option value="40">40분</option>
                        <option value="60">60분</option>
                        <option value="90" selected>90분</option>
                    </c:if>
                </select>
            </div>
        </div>


        <div class="rowBox">
            <div class="title">오픈여부</div>
            <div class="contents">
                <c:if test="${store.store_open eq 'Y'}">
                    <label><input type="radio" name="store_open" value="Y" checked> Y</label>
                    <label><input type="radio" name="store_open" value="N"> N</label>
                </c:if>

                <c:if test="${store.store_open eq'N'}">
                    <label><input type="radio" name="store_open" value="Y"> Y</label>
                    <label><input type="radio" name="store_open" value="N" checked> N</label>
                </c:if>
            </div>
        </div>


        <div class="rowBox">
            <div class="title">공개여부</div>
            <div class="contents">
                <c:if test="${store.store_display eq'Y'}">
                    <label><input type="radio" name="store_display" value="Y" checked>Y</label>
                    <label><input type="radio" name="store_display" value="N">N</label>
                </c:if>
                <c:if test="${store.store_display eq'N'}">
                    <label><input type="radio" name="store_display" value="Y">Y</label>
                    <label><input type="radio" name="store_display" value="N" checked>N</label>
                </c:if>
            </div>
        </div>


        <div class="rowBox">
            <div class="title">배달가능지역</div>
            <div class="contents"><input type="text" name="store_destination" id="store_destination"
                                         placeholder="배달 가능 지역" class="input" value="${store.store_destination}"></div>
        </div>

        <div class="foot_btn">
            <button class="deli_btn" id=modifyStoreBtn type="button">수정완료</button>
            <a href="/owner/store/list">
                <button class="deli_btn" id="deleteStoreBtn" type="button">취소</button>
            </a></div>

        </div>

        </c:when>
        </c:choose>
    </form>
</main>
<script src="/resources/js/owner/storeMng.js"></script>
</body>


</html>

