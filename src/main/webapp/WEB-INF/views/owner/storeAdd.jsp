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
    <title>딜리 - 식당추가</title>

    <%@ include file="/WEB-INF/views/global/pc-commonLib.jsp" %>

    <link rel="stylesheet" href="/resources/css/owner/storeAdd.css" type="text/css">


</head>


<body>
<%@ include file="/WEB-INF/views/customHeader/owner_nav.jsp" %>
<style>
    #deli_nav {
        min-height: 1700px;
    }
</style>
<main id="storeAdd">

    <form action="" id="frm" method="post" enctype="multipart/form-data">
        <div class="container">
            <input type="hidden" name="acc_seq" value="${acc_seq}" class="form-control">
            <div class="rowBox">
                <div class="title">상호명</div>
                <div class="contents">
                    <input type="text" name="store_name" placeholder="상호명입력" id="store_name" class="input form-control">
                </div>
            </div>
            <div class="rowBox">
                <div class="title">핸드폰 번호</div>
                <div class="contents"><input type="text" name="store_phone" placeholder="폰번호입력" id="store_phone"
                                             oninput=validNum() class="input form-control"></div>
            </div>
            <div class="rowBox">
                <div class="title">우편번호</div>
                <div class="contents input-group"><input style="height: 40px" type="text" id="postcode" placeholder="우편번호" class="input form-control">
                    <button style="height: 40px" type="button" class="postsearch deli_btn">우편검색</button>
                </div>
            </div>
            <div class="rowBox">
                <div class="title">기본주소</div>
                <div class="contents"><input type="text" id="add1" name="store_add_detail1" placeholder="기본주소"
                                             id="store_add_detail1" class="input  form-control"></div>
            </div>
            <div class="rowBox">
                <div class="title">상세주소</div>
                <div class="contents"><input type="text" id="add2" name="store_add_detail2" placeholder="상세주소"
                                             id="store_add_detail2" class="input form-control"></div>
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

                <div class="profile">
                    <div class="thumbnail">
                        <img src="/resources/img/store/no_storelogo.png" id="profile">
                    </div>
                    <div class="control">
                        <label id="btnCustom"> <i class="fa-solid fa-camera"></i>  사진 추가 (필수)
                            <input type=file name="file" id="menu_img" accept=".png, .jpg, .jpg,.gif">
                        </label>
                    </div>
                </div>

            </div>

            <div class="rowBox" style="height:100px; margin-top: 25px;">
                <div class="title">식당소개</div>
                <div class="contents" style="height:100px;">
<%--                    <input type="text" name="store_intro" placeholder="식당소개란" id="store_intro"--%>
<%--                                                                    class="input_intro">--%>
                    <textarea id="store_intro" name="store_intro" placeholder="식당 소개란"  class="input_intro form-control"></textarea>
                </div>
            </div>
            <div class="rowBox" style="height:100px; margin-top: 25px;" >
                <div class="title" >주요 원산지</div>
                <div class="contents" style="height:100px;" >
<%--                    <input type="text" name="store_origin" placeholder="주요 원산지" id="store_origin"--%>
<%--                                                                      class="input_origin">--%>
                    <textarea id="store_origin" name="store_origin" placeholder="주요 원산지"  class="input_origin form-control"></textarea></div>
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
                <div class="contents" style="display: inline; width: 220px" > <input type="text" name="store_close_day" placeholder="휴무일" class="input close_day form-control"> </div>
                <div class="close_day_msg" style="font-size: 10px; line-height: 20px"></div>
            </div>


            <div class="rowBox">
                <div class="title">주문 최소 금액</div>
                <div class="contents input-group" > <input style="width:50px; height: 40px " type="text" name="store_min_price" placeholder="주문 최소 금액" id="store_min_price"
                    class="input form-control" oninput=validNum()><div style='position: relative; top: 5px; left: -25px;'>원</div></div>
            </div>



            <div class="rowBox">
                <div class="title">배달팁</div>
                <div class="contents input-group"><input style="width:50px; height: 40px" type="text" name="store_deli_tip" placeholder="배달팁" id="store_deli_tip" class="input form-control"
                                             oninput=validNum()><div style='position: relative; top: 5px; left: -25px;'>원</div></div>
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
                <div class="contents">   <label><input type="radio" name="store_display" value="Y" > Y</label>
                    <label><input type="radio" name="store_display" value="N"> N</label></div>
            </div>


            <div class="rowBox">
                <div class="title">배달가능지역</div>
                <div class="contents"> <input type="text" name="store_destination" id="store_destination"
                                              placeholder="배달 가능 지역" class="input form-control"></div>
            </div>

            <div class="foot_btn"><button class="deli_btn" id=add type="button" >식당추가</button>
                <a href="/owner/store/list"><button type="button" class="deli_btn">취소</button></a>
            </div>

        </div>


    </form>

</main>
<script src="/resources/js/owner/storeAdd.js"></script>
</body>


</html>
