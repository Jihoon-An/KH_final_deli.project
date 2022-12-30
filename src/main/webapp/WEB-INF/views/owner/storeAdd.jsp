<%--
  Created by IntelliJ IDEA.
  User: ykm
  Date: 2022-12-13
  Time: 오전 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>딜리 - 식당추가</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2831f365f4c14d690cf0e21146e8dd99&libraries=services"></script>


    <!-- Bootstrap - css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/css/owner/storeAdd.css" type="text/css">


    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico"/>
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/customHeader/common.css" type="text/css">

    <!-- sweetalert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>


<body>
<%@ include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>
<main id="storeAdd">

    <form action="" id="frm" method="post" enctype="multipart/form-data">
        <div class="container">
            <input type="hidden" name="acc_seq" value="${acc_seq}">
            <div class="rowBox">
                <div class="title">상호명</div>
                <div class="contents">
                    <input type="text" name="store_name" placeholder="상호명입력" id="store_name" class="input">
                </div>
            </div>
            <div class="rowBox">
                <div class="title">핸드폰 번호</div>
                <div class="contents"><input type="text" name="store_phone" placeholder="폰번호입력" id="store_phone"
                                             oninput=validNum() class="input"></div>
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
                                             id="store_add_detail1" class="input"></div>
            </div>
            <div class="rowBox">
                <div class="title">상세주소</div>
                <div class="contents"><input type="text" id="add2" name="store_add_detail2" placeholder="상세주소"
                                             id="store_add_detail2" class="input"></div>
            </div>

            <input type="hidden" id="store_add_x" name="store_add_x" class="input">
            <input type="hidden" id="store_add_y" name="store_add_y" class="input">

            <div class="rowBox">
                <div class="title">음식카테고리</div>
                <div class="contents"><select name="store_category">
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
                    <option value="샐러드">
                       샐러드
                    </option>
                </select></div>
            </div>
            <div class="rowBox" style="height: 150px">
                <div class="title">대표사진</div>
                <div class="contents">
                    <div class="profile">
                        <div class="thumbnail">
                            <img src="/resources/img/store/no_storelogo.png" id="profile">
                        </div>
                        <div class="control">
                            <input type=file name="file" id="menu_img" accept=".png, .jpg, .jpg,.gif">
                        </div>
                    </div>
                </div>
            </div>

            <div class="rowBox" style="height:100px;">
                <div class="title">식당소개</div>
                <div class="contents" style="height:100px;"> <input type="text" name="store_intro" placeholder="식당소개란" id="store_intro"
                                                                    class="input_intro"></div>
            </div>
            <div class="rowBox" style="height:100px;" >
                <div class="title" >주요 원산지</div>
                <div class="contents" style="height:100px;" >  <input type="text" name="store_origin" placeholder="주요 원산지" id="store_origin"
                                                                      class="input_origin"></div>
            </div>



            <div class="rowBox">
                <div class="title">영업시간</div>
                <div class="contents" style="color: #9f1f20">오전 오후를 신경써서 입력해주세요 </div>
            </div>

            <div class="rowBox">
                <div class="title"> 월요일</div>
                <div class="contents">  <div class="bsns_div">

                    <input type="hidden" class="bsns" value="월요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option value="영업일">영업일</option>
                        <option>휴무일</option>
                    </select>
                    <span class="bs_time">
            <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
                </div></div>
            </div>

            <div class="rowBox">
                <div class="title">화요일</div>
                <div class="contents"> <div class="bsns_div">

                    <input type="hidden" class="bsns" value="화요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option value="영업일">영업일</option>
                        <option>휴무일</option>
                    </select>
                    <span class="bs_time">
            <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
                </div> </div>
            </div>

            <div class="rowBox">
                <div class="title">수요일</div>
                <div class="contents"><div class="bsns_div">
                    <input type="hidden" class="bsns" value="수요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option value="영업일">영업일</option>
                        <option>휴무일</option>
                    </select>
                    <span class="bs_time">
            <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
                </div> </div>
            </div>

            <div class="rowBox">
                <div class="title">목요일</div>
                <div class="contents">     <div class="bsns_div">

                    <input type="hidden" class="bsns" value="목요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option value="영업일">영업일</option>
                        <option>휴무일</option>
                    </select>
                    <span class="bs_time">
            <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
                </div> </div>
            </div>


            <div class="rowBox">
                <div class="title">금요일</div>
                <div class="contents"> <div class="bsns_div">

                    <input type="hidden" class="bsns" value="금요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option value="영업일">영업일</option>
                        <option>휴무일</option>
                    </select>
                    <span class="bs_time">
            <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
                </div> </div>
            </div>
            <div class="rowBox">
                <div class="title">토요일</div>
                <div class="contents"><div class="bsns_div">
                    <input type="hidden" class="bsns" value="토요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option value="영업일">영업일</option>
                        <option>휴무일</option>
                    </select>
                    <span class="bs_time">
             <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
                </div> </div>
            </div>

            <div class="rowBox">
                <div class="title">일요일</div>
                <div class="contents">  <div class="bsns_div">

                    <input type="hidden" class="bsns" value="일요일">
                    <select name="select_bs" class="bsns bs bs_open">
                        <option value="영업일">영업일</option>
                        <option>휴무일</option>
                    </select>
                    <span class="bs_time">
            <input type="time" class="bsns bs_open_time">
            <input type="time" class="bsns bs_close_time">
        </span>
                </div> </div>
            </div>
            <input type="hidden" id="bsns_data" name="store_bsns_hours">


            <div class="rowBox">
                <div class="title">휴무일</div>
                <div class="contents" style="display: inline; width: 220px" > <input type="text" name="store_close_day" placeholder="휴무일" class="input close_day"> </div>
                <div class="close_day_msg" style="font-size: 10px; line-height: 20px"></div>
            </div>


            <div class="rowBox">
                <div class="title">주문 최소 금액</div>
                <div class="contents"> <input type="text" name="store_min_price" placeholder="주문 최소 금액" id="store_min_price"
                                              class="input" oninput=validNum()>원</div>
            </div>



            <div class="rowBox">
                <div class="title">배달팁</div>
                <div class="contents"><input type="text" name="store_deli_tip" placeholder="배달팁" id="store_deli_tip" class="input"
                                             oninput=validNum()>원</div>
            </div>




            <div class="rowBox">
                <div class="title">배달 예상 시간</div>
                <div class="contents"><select name="store_deli_time" id="time">
                    <option value="20">20분</option>
                    <option value="30">30분</option>
                    <option value="40">40분</option>
                    <option value="60">60분</option>
                    <option value="90">90분</option>
                </select> </div>
            </div>



            <div class="rowBox">
                <div class="title">오픈여부</div>
                <div class="contents">   <label><input type="radio" name="store_open" value="Y"> Y</label>
                    <label><input type="radio" name="store_open" value="N"> N</label> </div>
            </div>


            <div class="rowBox">
                <div class="title">공개여부</div>
                <div class="contents">   <label><input type="radio" name="store_display" value="Y"> Y</label>
                    <label><input type="radio" name="store_display" value="N"> N</label></div>
            </div>


            <div class="rowBox">
                <div class="title">배달가능지역</div>
                <div class="contents"> <input type="text" name="store_destination" id="store_destination"
                                              placeholder="배달 가능 지역" class="input"></div>
            </div>

            <div class="foot_btn deli_btn"><button id=add type="button" >식당추가</button>
                <a href="/owner/store/list"><button type="button" class="deli_btn">취소</button></a></div>

        </div>


    </form>

</main>
<script src="/resources/js/owner/storeAdd.js"></script>
</body>


</html>
