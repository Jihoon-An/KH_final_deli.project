<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>딜리 - 결제하기</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>
    <link rel="stylesheet" href="/resources/css/member/order/orderPay.css">

    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
<body>

<c:import url="/member/header/destination" />
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>

<main>
    <hr class="mt55">
<form name="dataForm" id="insertForm" action="/order/orders/insertOrder" method="post">

    <div class="container">
        <h2>배달 정보</h2>
        <hr>
        <div id="mainAddress">
            <div id="address1"></div>
<%--            <input type="text" id="address1" name="address1" placeholder="Address1" readonly style="border: none;border-radius: 7px">--%>
            <button type="button" id="destination_change">주소 변경</button>
            <div id="modal2" class="modal-overlay">
                <div class="modal-window">
                    <div class="title"></div>
                    <div class="close-area">X</div>
                    <div class="content" id="couponList">
                    </div>
                </div>
            </div>

        </div>
        <input type="text" id="address2" name="address2" placeholder="Address2" style="border: none;border-radius: 7px;margin-bottom: 10px;">
        <input type="text" id="phoneNum" name="phoneNum" placeholder="phoneNum" style="border: none;border-radius: 7px">
        <hr>
        <div style="margin-bottom: 10px">요청사항</div>
        <div style="border: 1px solid black;margin-bottom: 10px;padding-left: 5px;border-radius: 7px;width: 58%">
            <input type="checkbox" name="order_disposable" value="N">일회용 수저,포크 안주셔도 돼요!<br>
        </div>
        <input type="text" name="order_store_req" value="" placeholder="사장님한테 전달할 말" style="margin-bottom: 10px;border: 1px solid black;border-radius: 7px;width:100%" maxlength="30">
        <input type="text" name="order_rider_req" value="" placeholder="라이더님한테 전달할 말" style="border-radius: 7px;border: 1px solid black;width:100%" maxlength="30">
        <hr>
        <div>결제수단
            <select id="payment" name="pay_method" onchange="onchangePayment()" style="border-radius: 7px">
                <option name="payMethod" value="">선택</option>
                <option name="payMethod" value="kakaoPay">카카오페이</option>
                <option name="payMethod" value="creditCard">카드 결제</option>
            </select>
        </div>
        <hr>

        <%--할인쿠폰 리스트 모달--%>
        <div>
            <button type="button" id="btn_modal2">할인쿠폰</button>
            <ul id="choiceCoupon">

            </ul>
        </div>
        <div>포인트 할인</div>
            <div id="ownPointOut">보유 포인트</div>
            <div id="ownPoint"></div>
                <input type="hidden" name="ownPoint" id="ownPointInput">
<%--                       onchange="onchangeOwnPoint()" style="border-radius: 7px;width: 50px">--%>
                <input type="number" id="usePoint" name="usePoint" onchange="onchangeUsePoint()" min="0" style="width: 220px;border-radius: 7px">

            <hr>
            <div id="total_price">결제 금액</div>

        <div class="orderPriceRowBox">
            <div id="order_price_out">주문 금액</div>
            <div class="wonBox">원</div>
            <div id="order_price"></div>
            <input type="hidden" id="orderPriceInput" name="order_price">
        </div>

        <div class="couponRowBox">
            <div id="selectCoupon">쿠폰할인</div>
            <div class="wonBox">원</div>
            <div id="discountPrice">0</div>
        </div>
                <input type="hidden" id="cp_seq" name="cp_seq">
                <input type="hidden" id="mc_seq" name="mc_seq">

<%--                <input type="text" value=0 id="discountPrice" name="discountPrice" disabled="disabled"--%>
<%--                       placeholder="쿠폰 할인 금액 출력">--%>
        <div class="pointRowBox">
            <div id="salePoint">포인트 할인</div>
            <div class="wonBox">원</div>
            <div id="use_point">0</div>
        </div>
        <div class="tipRowBox">
            <div id="delivery_tip_out">배달팁</div>
            <div class="wonBox">원</div>
            <div id="delivery_tip"></div>
        </div>
<%--                <input type="text" id="delivery_tip" name="delivery_tip" placeholder="배달팁" readonly>--%>

        <div class="payPriceRowBox">
            <div id="pay_price_out">총 결제 금액</div>
            <div class="wonBox">원</div>
            <div id="pay_price"></div>
            <input type="hidden" id="payPriceInput" name="pay_price" placeholder="총 결제 금액">
        </div>
            <hr>
            <div id="pay_method">
            <button type="button" id="payKakao" onclick="requestPay()">카카오 페이 결제</button>
            <button type="button" id="payCard" class="btn_payment">카드 결제</button>
            </div>
        </div>
        <input type="hidden" id="accEmail" name="accEmail" value="${userInfo.accEmail}"/>
        <input type="hidden" id="memName" name="memName" value="${userInfo.memName}"/>
        <input type="hidden" id="add_seq" name="add_seq"/>
    </div>
</form>
</main>
<script>
    var addSeq;
    var address1;
    var address2;
    var phoneNum;
    var ownPoint;
    var deliTip;


    window.onload = function () {
        $("#payCard").hide();
        $("#payment").val('kakaoPay');
        $("#acc_seq").val();


        parseInt($("#order_price").html(${orderOrdersDTO.order_price}));
        parseInt($("#delivery_tip").html(${orderOrdersDTO.delivery_tip}));

        <%--$("#order_price").val(${orderOrdersDTO.order_price});--%>
        <%--$("#delivery_tip").val(${orderOrdersDTO.delivery_tip})--%>

        initPage();
        setCouponList();
        // var orderPrice = parseInt($("#order_price").html());
        // var deliveryPrice = parseInt($("#delivery_tip").html());
        $("#pay_price").html(${orderOrdersDTO.order_price}+${orderOrdersDTO.delivery_tip});
        <%--$("#pay_price").val(${orderOrdersDTO.order_price}+${orderOrdersDTO.delivery_tip});--%>

    }

    // 글로벌 변수 및 페이지 초기화
    function initPage() {
        $.ajax({
            url: "/order/orders/selectInitInfo",
            type: "post",
            dataType: "json",
            success: function (data) {
                addSeq = data.add_seq;
                address1 = data.address1;
                address2 = data.address2;
                phoneNum = data.phoneNum;
                ownPoint = data.ownPoint;
                //deliTip = data.delivery_tip;

                $("#add_seq").val(addSeq);
                $("#address1").html(address1);
                $("#address2").val(address2);
                $("#phoneNum").val(phoneNum);
                $("#ownPoint").html(ownPoint);
                // $("#ownPoint").val(ownPoint);
                //$("#delivery_tip").val(deliTip);

                onchangeOwnPoint();
            },
            error: function (data) {
            }
        }).done(function (result) {

        });
    }

    function setCouponList() {
        $.ajax({
            url: "/order/orders/selectCouponList",
            type: "post",
            dataType: "json",
            success: function (data) {
                var html = "";
                if (data.length > 0) {
                    html += '<p style="color: #e84c4f;margin-top: -50px;font-size: 20px;text-align: center">< 사용가능한 쿠폰 목록 ></p>';
                    html += '<div style="color:black;float: left;"> 쿠폰 이름 || 할인율 </div><br>';

                    for (var i = 0; i < data.length; i++) {
                        var type = '';
                        if (data[i].cpType == 'percent') type = '%';
                        else if(data[i].cpType == 'amount') type = '원';
                        // else (type = data[i].cpType);
                        html += '<a class="couponInfo" id="coupon' + i + '" href="javascript:choiceCoupon(' + i + ');">' + data[i].cpName + " || " + data[i].discount_coupon + type + '</a><br>';
                        html += '<input type="hidden" value="' + data[i].cp_seq + '" id="cpSeq' + i + '"> ';
                        html += '<input type="hidden" value="' + data[i].cpName + '" id="cpName' + i + '"> ';
                        html += '<input type="hidden" value="' + data[i].discount_coupon + '" id="cpDiscount' + i + '"> ';
                        html += '<input type="hidden" value="' + data[i].cpType + '" id="cpType' + i + '"> ';
                        html += '<input type="hidden" value="' + data[i].mc_seq + '" id="mcSeq' + i + '"> ';
                    }

                } else {
                    html += '<p style="color:black;">사용 가능한 쿠폰이 없습니다.</p>';
                }
                $("#couponList").html(html);
            },
            error: function (data) {
                $("#couponList").html('<p>사용 가능한 쿠폰이 없습니다.</p>');
            }
        }).done(function (result) {

        });
    }

    function choiceCoupon(param) {
        //넘겨줘야하는 거 ==> 쿠폰 이름, 시퀀스, 할인율 (discount, type)
        var cpName = $("#cpName" + param).val();
        var cpSeq = $("#cpSeq" + param).val();
        var cpDiscount = $("#cpDiscount" + param).val();
        var cpType = $("#cpType" + param).val();
        var mcSeq = $("#mcSeq" + param).val();

        var html = "";
        html += "<li id='chCp' cpSeq = '" + cpSeq + "' cpName = '" + cpName + "' cpDiscount = '" + cpDiscount + "' cpType = '" + cpType + "' style='margin-top: 5px;margin-bottom: -15px;'>" + cpName + " </li>";

        $("#choiceCoupon").html(html);
        var modal2 = document.getElementById('modal2');
        modal2.style.display = "none";
        $("#cp_seq").val(cpSeq);
        $("#mc_seq").val(mcSeq);

        // 결제금액 출력
        var orderPrice = ($("#order_price").html());
        console.log(orderPrice);
        // var discountPrice = $("#discount_coupon").val();
        // var discountPrice = orderPrice * (1 - cpName.replace(/\D/g,'')/100);

        if(cpType == 'percent') {
            var discountPrice = Math.floor(orderPrice * Number(cpDiscount) / 100);
        }else {
            var discountPrice = Math.floor(Number(cpDiscount));
        }
        var usePoint = Number($("#use_point").val());
        var deliveryTip = parseInt($("#delivery_tip").html());
        var payPrice = orderPrice - (discountPrice + usePoint) + deliveryTip;
        console.log(cpDiscount);
        console.log(deliveryTip);
        console.log(cpType);
        console.log(usePoint);
        console.log(payPrice);
        if(payPrice < 0){
            payPrice = 0;
        }
        $("#discountPrice").html(discountPrice);
        $("#pay_price").html(payPrice);
        // $("#discountPrice").val(discountPrice);
        // $("#discount_coupon").val(discountPrice);
        // $("#discount_coupon").text(discountPrice);

    }

    function onclickBtnChgAddr() {
        var postCd = $("#postcode").val();
        var address1 = $("#add1").val();
        var address2 = $("#add2").val();
        var msg = "";
        var inptFlag = 0;

        if (postCd == "") {
            msg = "우편번호";
            inptFlag = 1;
        }
        if (address1 == "") {
            msg = "도로명/지번";
            inptFlag = 1;
        }
        if (address2 == "") {
            msg = "상세주소";
            inptFlag = 1;
        }
        if (inptFlag == 1) {
            msg += "을/를 입력해주세요.";
            alert(msg);
            return;
        } else {
            $.ajax({
                url: "/order/orders/updateMemberAddr",
                type: "post",
                dataType: "json",
                data: {
                    acc_seq: accSeq,
                    address1: address1,
                    address2: address2
                },
                success: function (e) {
                    if (e == 1) {
                        alert("주소가 변경되었습니다.")
                        var modal = document.getElementById('modal');
                        modal.style.display = "none";
                        $("#address1").val(address1);
                        $("#address2").val(address2);
                    }
                },
                error: function () {
                }
            }).done(function () {
                // alert("주소변경 되었습니다.");
                // location.href="/home";
            });
        }
    }

    function onchangePayment() {
        $("#payKakao").hide();
        $("#payCard").hide();
        var payMth = $("#payment").val();
        switch (payMth) {
            case "" :
                break;
            case "kakaoPay" :
                $("#payKakao").show();
                break;
            case "creditCard" :
                $("#payCard").show();
                break;
        }
    }

    function onchangeOwnPoint() {
        if (ownPoint == "0") {
            $("#usePoint").attr('readonly', true);
            $("#usePoint").attr('placeholder', '사용 가능 포인트가 없습니다');
            $("#usePoint").html(0);
        } else {
            $("#usePoint").removeAttr('readonly');
            $("#usePoint").attr('placeholder', '사용 할 포인트를 입력해주세요.');
        }
    }

    function onchangeUsePoint() {
        var orderPrice = Number($("#order_price").html());
        var usePoint = Math.floor($("#usePoint").val());

        if(usePoint > ownPoint){
            usePoint = ownPoint;
            Math.floor($("#use_point").html(ownPoint));
        }else if (usePoint < 0) {
            usePoint = 0;
            $("#use_point").html(0);
        }


        let cpDiscount = Number($("#discountPrice").html());
        $("#use_point").html(usePoint);
        var deliveryTip = Number($("#delivery_tip").html());
        var payPrice = (orderPrice + deliveryTip) - usePoint - cpDiscount;
        $("#pay_price").html(payPrice);
    }

    // 버튼 클릭 시 쿠폰리스트 모달창 오픈
    const modal2 = document.getElementById("modal2");
    const btnModal2 = document.getElementById("btn_modal2");
    btnModal2.addEventListener("click", e => {
        modal2.style.display = "flex"
    })

    // 쿠폰리스트 모달창 클로즈(X) 버튼 누를시 모달 종료
    const closeBtn2 = modal2.querySelector(".close-area")
    closeBtn2.addEventListener("click", e => {
        modal2.style.display = "none"
    })

    // 쿠폰리스트 모달창 바깥 영역 클릭 시 모달 종료
    modal2.addEventListener("click", e => {
        const evTarget = e.target
        if (evTarget.classList.contains("modal-overlay")) {
            modal2.style.display = "none"
        }
    })

    //  모달창 켜진 상태에서 ESC 버튼 클릭시 모달 종료
    window.addEventListener("keyup", e => {
        if (modal2.style.display === "flex" && e.key === "Escape") {
            modal2.style.display = "none"
        }
    })

    // kg 이니시스 결제
    $(".btn_payment").click(function () {
        IMP.init("imp52685667");
        //결제시 전달되는 정보
        var email = $("#accEmail").val();
        var name = $("#memName").val();
        var phoneNum = $("#phoneNum").val();
        var address = $("#add1").val() + " " + $("#add2").val();
        var payPrice = $("#pay_price").val();

        IMP.request_pay({
            pg: 'html5_inicis',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: 'Test 결제',// 상품명,
            amount: 100,//상품 가격,
            buyer_email: email,//구매자 이메일,
            buyer_name: name,
            buyer_tel: phoneNum,//구매자 연락처
            buyer_addr: address,//구매자 주소

        }, function (rsp) {
            var result = '';
            if (rsp.success) {
                $("#orderPriceInput").val(parseInt($("#order_price").html()));
                $("#payPriceInput").val(parseInt($("#pay_price").html()));
                $("#ownPointInput").val(parseInt($("#ownPoint").html()));
                $("#insertForm").submit();
                var msg = '결제가 완료되었습니다.';

            } else {
                var msg = '결제에 실패하였습니다.';

            }
            alert(msg);
        });
    });


    // 카카오페이 결제
    var IMP = window.IMP;
    IMP.init("imp52685667");

    function requestPay() {
        var email = $("#accEmail").val();
        var name = $("#memName").val();
        var phoneNum = $("#phoneNum").val();
        var address = $("#add1").val() + " " + $("#add2").val();
        var payPrice = $("#pay_price").val();

        //결재정보  JSON
        var payInfo = {
            pg: 'kakaopay',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: 'Test 결제',
            amount: 100,//'가격 입력',
            buyer_email: email,//'구매자 이메일',
            buyer_name: name,//'구매자 이름'
            buyer_tel: phoneNum,
            buyer_addr: address
        };

        IMP.request_pay(payInfo, function (rsp) {
            if (rsp.success) {

                var msg = '결제가 완료되었습니다.';
                $("#orderPriceInput").val(parseInt($("#order_price").html()));
                $("#payPriceInput").val(parseInt($("#pay_price").html()));
                $("#ownPointInput").val(parseInt($("#ownPoint").html()));
                $("#insertForm").submit();

            } else {
                var msg = '결제에 실패하였습니다.';
            }
            alert(msg);
        });
    }

</script>

</body>
</html>
