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
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>

    <link rel="stylesheet" href="/resources/css/owner/storeMng.css" type="text/css">
</head>


<body>
<main id="storeMng">
    <c:choose>
        <c:when test="${not empty store}">
            <h1>
                식당수정/삭제
            </h1>
            <form action="/store/mng/modify" id="frm" method="post" enctype="multipart/form-data">
                <div>

                        <%--store_seq--%>
                    <input type="hidden" name="store_seq" id="store_seq" value="${store.store_seq}">

                    <input type="text" name="store_name" value="${store.store_name}">
                    <br>
                    <input type="text" name="store_phone" value="${store.store_phone}">
                    <br>
                    <input type="text" id="postcode">
                    <button type="button" class="postsearch">우편검색</button>
                    <br>
                    <input type="text" id="add1" name="store_add_detail1" value="${store.store_add_detail1}">
                    <br>
                    <input type="text" id="add2" name="store_add_detail2" value="${store.store_add_detail2}">
                    <br>
                    <input type="hidden" id="store_add_x" name="store_add_x" value="${store.store_add_x}">
                    <input type="hidden" id="store_add_y" name="store_add_y" value="${store.store_add_y}">

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
                        </c:if>
                    </select>
                    <br>
                    <div class="profile">
                        <div class="thumbnail">
                            <img src="/resources/img/store/no_storelogo.png" id="profile">
                                <%--                            <img src="/resources" id="profile">--%>
                        </div>
                        <div class="control">
                            <input type=file name="file" id="menu_img" accept=".png, .jpg, .jpg,.gif">
                        </div>
                    </div>
                    <input type="text" name="store_intro" value="${store.store_intro}">
                    <br>
                    <input type="text" name="store_origin" value="${store.store_origin}">
                    <Br>

                    <div class="bsnsdiv">
                        <span>월요일</span>
                        <input type="hidden" class="bsns" value="월요일">
                        <select name="store_bsns_hours" class="bsns bs">
                            <option>영업일</option>
                            <option>휴무일</option>
                        </select>
                        <span class="bs_time">
            <input type="time" class="bsns">
            <input type="time" class="bsns">
        </span>
                    </div>
                    <div class="bsnsdiv">
                        <span>화요일</span>
                        <input type="hidden" class="bsns" value="화요일">
                        <select name="store_bsns_hours" class="bsns bs">
                            <option>영업일</option>
                            <option>휴무일</option>
                        </select>
                        <span class="bs_time">
            <input type="time" class="bsns">
            <input type="time" class="bsns">
        </span>
                    </div>
                    <div class="bsnsdiv">
                        <span>수요일</span>
                        <input type="hidden" class="bsns" value="수요일">
                        <select name="store_bsns_hours" class="bsns bs">
                            <option>영업일</option>
                            <option>휴무일</option>
                        </select>
                        <span class="bs_time">
            <input type="time" class="bsns">
            <input type="time" class="bsns">
        </span>
                    </div>
                    <div class="bsnsdiv">
                        <span>목요일</span>
                        <input type="hidden" class="bsns" value="목요일">
                        <select name="store_bsns_hours" class="bsns bs">
                            <option>영업일</option>
                            <option>휴무일</option>
                        </select>
                        <span class="bs_time">
            <input type="time" class="bsns">
            <input type="time" class="bsns">
        </span>
                    </div>
                    <div class="bsnsdiv">
                        <span>금요일</span>
                        <input type="hidden" class="bsns" value="금요일">
                        <select name="store_bsns_hours" class="bsns bs">
                            <option>영업일</option>
                            <option>휴무일</option>
                        </select>
                        <span class="bs_time">
            <input type="time" class="bsns">
            <input type="time" class="bsns">
        </span>
                    </div>
                    <div class="bsnsdiv">
                        <span>토요일</span>
                        <input type="hidden" class="bsns" value="토요일">
                        <select name="store_bsns_hours" class="bsns bs">
                            <option>영업일</option>
                            <option>휴무일</option>
                        </select>
                        <span class="bs_time">
            <input type="time" class="bsns">
            <input type="time" class="bsns">
        </span>
                    </div>
                    <div class="bsnsdiv">
                        <span>일요일</span>
                        <input type="hidden" class="bsns" value="일요일">
                        <select name="store_bsns_hours" class="bsns bs">
                            <option>영업일</option>
                            <option>휴무일</option>
                        </select>
                        <span class="bs_time">
            <input type="time" class="bsns">
            <input type="time" class="bsns">
        </span>
                    </div>
                    <input type="hidden" id="bsnsdata" name="store_bsns_hours">

                    <br>
                    <input type="text" name="store_close_day" value="${store.store_close_day}">
                    <br>
                    <input type="text" name="store_min_price" value="${store.store_min_price}">
                    <input type="text" name="store_deli_tip" value="${store.store_deli_tip}">
                    <br>

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


                    <p>오픈여부</p>
                    <c:if test="${store.store_open eq 'Y'}">
                        <label><input type="radio" name="store_open" value="Y" checked> Y</label>
                        <label><input type="radio" name="store_open" value="N"> N</label>
                    </c:if>

                    <c:if test="${store.store_open eq'N'}">
                        <label><input type="radio" name="store_open" value="Y"> Y</label>
                        <label><input type="radio" name="store_open" value="N" checked> N</label>
                    </c:if>

                    <p>공개여부</p>
                    <c:if test="${store.store_display eq'Y'}">
                        <label><input type="radio" name="store_display" value="Y" checked>Y</label>
                        <label><input type="radio" name="store_display" value="N">N</label>
                    </c:if>
                    <c:if test="${store.store_display eq'N'}">
                        <label><input type="radio" name="store_display" value="Y">Y</label>
                        <label><input type="radio" name="store_display" value="N" checked>N</label>
                    </c:if>
                    <br>
                    <input type="text" name="store_destination" value="${store.store_destination}">
                </div>
                <button id="modifyStoreBtn">수정</button>
                <button id="deleteStoreBtn" type="button">삭제</button>
            </form>
        </c:when>
        <c:otherwise>
            <div>식당이 존재하지 않습니다.</div>
        </c:otherwise>
    </c:choose>

</main>
<script src="/resources/js/owner/storeMng.js"></script>
</body>


</html>

