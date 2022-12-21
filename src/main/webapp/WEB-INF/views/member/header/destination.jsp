<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-12-14
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>배송지 선택</title>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>

    <style>
        .modal {
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            top: 0;
            left: 0;
            display: none;
        }

        .modal_content {
            width: 400px;
            height: auto;
            background: #fff;
            border-radius: 10px;
            position: relative;
            top: 40%;
            left: 50%;
            margin-top: -150px;
            margin-left: -200px;
            text-align: center;
            box-sizing: border-box;
            padding: 74px 0;
            /*line-height: 23px;*/
            cursor: pointer;
        }


        #destination .container {
            width: 375px;
            height: 800px;
            border: 1px solid black;
            margin: auto;
            text-align: center;
            padding-top: 50px;
        }
    </style>
</head>
<body>

<main id="destination">
    <div class="container">
        <h1>주소 설정</h1>
        <form id="destination_select_frm" method="post">
            <c:choose>
                <c:when test="${not empty address_List}">
                    <c:forEach var="i" items="${address_List}">
                        <div class="destination_box">
                            <input type="hidden" name="add_seq" class="add_seq" value="${i.add_seq}">
                            <input type="radio" name="radio_add_division" <c:if test="${i.add_division=='basics'}">checked</c:if>>
                            <c:if test="${i.add_division=='basics'}"><span class="pick">[기본]</span></c:if>
                            <c:if test="${i.add_division!='basics'}"><span class="pick">[선택]</span></c:if>
                            <input type="hidden" name="add_division" class="hidden_add_division" value="${i.add_division}">
                            ${i.add_name} <a class="del">x</a> <br>
                            ${i.add_detail1} <br>
                            상세주소 : ${i.add_detail2} <br>
                            ${i.add_msg} <br>
                            <hr>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>
            <button id="destination_select">기본 주소지 선택</button>
        </form>
        <hr><hr>
        아래 다음 화면
        <button id="destination_add_box_btn">주소지 추가 등록</button>
        <hr>
    </div>

</main>


<%--모달--%>
<div class="modal">
    <div class="modal_content">
        <div class="closeModal" style="background-color: yellow">X</div>
        <div id="destination_add_box" style="display: none">
            <form id="destination_add_frm" method="post">
                <h1>배달지 주소 등록</h1>
                <input type="text" placeholder="주소지 별명을 입력해주세요." name="add_name"><br>
                <input type="text" id="postcode" placeholder="우편번호">
                <button type="button" class="postsearch">우편검색</button>
                <br>
                <input type="text" id="add_detail1" name="add_detail1" placeholder="기본주소">
                <br>
                <input type="text" id="add_detail2" name="add_detail2" placeholder="상세주소">
                <br>
                <input type="hidden" id="add_x" name="add_x">
                <input type="hidden" id="add_y" name="add_y">
                <input type="hidden" name="acc_seq" value="${acc_seq}">
                <button id="destination_add_btn">배달지 추가</button>
            </form>
        </div>
    </div>
</div>





<div id="loginModal" class="loginModal-overlay" align="center">
    <div class="window">

        <div class="col-12 text-end close-area" onclick=hideLoginModal()>
            <a><i class="fa-solid fa-x" style="color: #808080"></i></a>
        </div>

        <div class="text_title title">회원 로그인</div>

        <!-- 로그인 폼 -->
        <form id="form_login">
            <div class="row justify-content-center mt-3">
                <div class="col-12 gy-3">
                    <div class="text-start" style="width: 250px">
                        <span style="color: #808080; font-size: x-small">이메일</span>
                    </div>
                    <input type="text" name="login_id" id="login_id"
                           placeholder="이메일을 입력하세요." maxlength="40">
                </div>
                <div class="col-12 gy-4">
                    <div class="text-start" style="width: 250px">
                        <span style="color: #808080; font-size: x-small">비밀번호</span>
                    </div>
                    <input type="password" name="login_pw" id="login_pw"
                           placeholder="비밀번호를 입력하세요." maxlength="20">
                </div>
                <div class="col-12 gy-4">
                    <button type="button" class="btn_base" id="btn_login">로그인</button>
                </div>
                <div class="col-12 gy-1">

                    <div class="checkbox-bsLogin">
                        <label class="form-check-label" for="login_bs" style="color: #404040; font-size: 14px; letter-spacing: -1px;">
                            <input class="form-check-input" type="checkbox" id="login_bs">
                            <span class="checkbox__label"></span>
                            사업자 로그인</label>
                    </div>

                </div>
                <div class="col-12 gy-4" style="letter-spacing: -1px;">
                    <span style="color: #404040;">계정이 없으신가요?</span> <a href="#"
                                                                       onclick="showSignupModal(); return false;">회원가입</a>
                </div>
                <div class="col-12 gy-1"
                     style="color: #808080; font-size: small; letter-spacing: -1px;">
                    <a onclick="showSearchPw()">비밀번호를 잊으셨나요?</a>
                </div>
            </div>
        </form>
        <!-- 비밀번호 찾기 폼 -->
        <form class="search" id="form_searchPw">
            <div class="row justify-content-center mt-4">
                <div class="col-12 gy-4">
                    <input type="text" name="email" id="searchPw_email"
                           placeholder="이메일" maxlength="40">
                    <div class="text-start mt-1 mb-1" style="width: 250px">
						<span style="color: #808080; font-size: x-small">회원 가입시 사용한
							이메일을 입력하세요.</span>
                    </div>
                </div>
                <div class="col-12 gy-3">
                    <input type="text" name="phone" id="searchPw_phone"
                           placeholder="핸드폰 번호" maxlength="14" oninput="validNum()">
                    <div class="text-start mt-1 mb-1" style="width: 250px">
						<span style="color: #808080; font-size: x-small">회원 가입시 사용한
							핸드폰 번호를 입력하세요.</span>
                    </div>
                </div>
                <div class="col-12 gy-3">
                    <button class="btn_base" type="button" id="btn_search">찾기</button>
                </div>
                <div class="col-12 gy-1">
                    <div class="checkbox-bsLogin">
                        <label class="form-check-label" for="searchPw_bs" style="color: #404040; font-size: 14px; letter-spacing: -1px;">
                            <input class="form-check-input" type="checkbox" id="searchPw_bs">
                            <span class="checkbox__label"></span>
                            사업자 입니다.</label>
                    </div>
                </div>
                <div class="col-12 gy-3">
                    <a style="color: #808080" onclick="toBackward()">Back</a>
                </div>
            </div>
        </form>
    </div>
</div>

<li class="float-end">
    <a class="header_a_tag" onclick="showLoginModal()">로그인</a>
</li>


<script>

    // 버튼 누르면 모달닫기
    $(".closeModal").click(function () {
        $(".modal").fadeOut();
    });
    // ESC 누르면 Modal 닫기
    $(window).on("keyup", e => {
        if ($(".modal")[0].style.display == "block" && e.keyCode == 27) { $(".modal").fadeOut(); }
    });


    // 창 바깥쪽 클릭하면 Modal 닫기
    $(".modal").on("click", e => {
        if (e.target.classList.contains("modal")) { $(".modal").fadeOut(); }
    });

    // 모달 열기
    $("#destination_add_box_btn").click(function () {
        $(".modal").fadeIn();
    });



    // 비밀번호 찾기 페이지 처리
    function showSearchPw() {
        $("#form_login").attr("style", "display:none");
        $("#form_searchPw").attr("style", "display:inline");
        $("#loginModal .title").text("비밀번호 찾기");
        $("#loginModal .window").attr("style", "height:450px");
    }

    // 뒤로가기 처리
    function toBackward() {
        $(".search").attr("style", "display:none");
        $("#loginModal input:not([type='checkbox']").val("");
        $("#form_login").attr("style", "display:inline");
        $("#loginModal .title").text("회원 로그인");
        $("#loginModal .window").attr("style", "height:475px");
    }

    // ESC 누르면 Modal 닫기
    $(window).on("keyup", e => {
        if ($("#loginModal")[0].style.display == "inline-flex" && e.keyCode == 27) { hideLoginModal(); }
    });

    // 창 바깥쪽 클릭하면 Modal 닫기
    $("#loginModal").on("click", e => {
        if (e.target.classList.contains("loginModal-overlay")) { hideLoginModal(); }
    });

    // 엔터 = 버튼 클릭
    $("#login_id, #login_pw").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_login").click() } });
    $("#searchPw_email, #searchPw_phone").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_search").click() } });;


















    $(".del").on("click", function () {
        if($(this).closest(".destination_box").find(".pick").html() == "[기본]"){
            confirm("기본 배송지는 삭제 불가합니다.기본 주소지 변경 후 삭제해주세요.")
        } else {
            if(confirm("정말 삭제 하시겠습니까?")){
                // $(this).closest(".destination_box").remove();
                $.ajax({
                    url: "/member/header/destination/delete",
                    type: "post",
                    data: {add_seq:$(this).closest(".destination_box").find(".add_seq").val()}
                }).done(function () {
                    alert("삭제 성공/모달 새고고침처럼 다시 보여야함/지웠다가 다시 띄우기");
                });
            }
        }
    });


    $("#destination_select").on("click", function () {
        $("input[name='radio_add_division']").closest($(".destination_box")).find($(".hidden_add_division")).val("add");
        if($("input[name='radio_add_division']:checked")){
            $("input[name='radio_add_division']:checked").closest($(".destination_box")).find($(".hidden_add_division")).val("basics");
        } else {
            $("input[name='radio_add_division']:not(:checked)").closest($(".destination_box")).find($(".hidden_add_division")).val("add");
        }

        $.ajax({
            url: "/member/header/destination/divisionChange",
            type: "post",
            data: $("#destination_select_frm").serialize(),
            dataType: 'JSON'
        }).done(function () {
            alert("선택지 변경 성공/모달 사라지고 메인으로 돌아가야함");
        });
    });

    $("#destination_add_box_btn").on("click", function () {
        $("input:not([name=acc_seq])").val("");
        $("#destination_add_box").show();
    });


    $(document).on("click", ".postsearch", function () {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = ''; // 주소 변수
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                var geocoder = new kakao.maps.services.Geocoder();
                var callback = function (result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        let x = result[0].x;
                        let y = result[0].y;
                        document.getElementById("add_y").value = x;
                        document.getElementById("add_x").value = y;
                    }
                };
                geocoder.addressSearch(addr, callback);
                document.getElementById("postcode").value = data.zonecode;
                document.getElementById("add_detail1").value = data.jibunAddress;
                document.getElementById("add_detail1").value = data.roadAddress;
                document.getElementById("add_detail2").focus();
            }
        }).open();
    })

    let addNameRegex = /^[가-힣a-zA-Z0-9]{1,10}$/;

    $("#destination_add_btn").on("click", function () {
        if (!addNameRegex.test($("#add_name").val())) {
            Swal.fire({
                icon: 'error',
                title: '옳바르지 않은 입력입니다.',
                text: '주소지 별명을 다시 확인해주세요.',
            });
            $("#add_name").focus();
            return;
        }
        if($("#postcode").val()=="") {
            Swal.fire({
                icon: 'error',
                title: '옳바르지 않은 입력입니다.',
                text: '우편검색 버튼 눌러 주소를 입력해주세요.',
            });
            $("#postcode").focus();
            return;
        }
        if($("#add_detail2").val()=="") {
            Swal.fire({
                icon: 'error',
                title: '옳바르지 않은 입력입니다.',
                text: '상세주소를 입력해주세요.',
            });
            $("#add_detail2").focus();
            return;
        }

        $.ajax({
            url: "/member/header/destination/insert",
            type: "post",
            data: $("#destination_add_frm").serialize()
        }).done(function () {
            $("#destination_add_box").hide();
        });
    });




</script>
</body>
</html>
