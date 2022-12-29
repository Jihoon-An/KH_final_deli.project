<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>딜리 - 고객배달영수증</title>
    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico"/>
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <!-- sweetalert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <link rel="stylesheet" href="/resources/css/main/memberSignUp.css">
    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
</head>
<body>

<main id="deliveryDtl">
    <div class="container">
        <h1>고객배달영수증</h1>
        <h4>주문번호</h4>
        <div>${storeInfoDTO.order_seq}</div>
        <h4>주문시간</h4>
        <div>${storeInfoDTO.order_date}</div>
        <h4>배달 예상 시간</h4>
        <div>${storeInfoDTO.store_deli_time}분</div>
        <h4>주문내역</h4>
        <div>
            <c:forEach var="menuList" items="${basketMenu}">
                <div class="menuBox">
                    메뉴 : ${menuList.menu.menu_name} <br>
                    <c:forEach var="optionList" items="${menuList.optionList}">
                        그룹 : ${optionList.option_group}<br>
                        옵션 : ${optionList.option_name} <br>
                        옵션 수량 : ${optionList.option_multiple} <br>
                        가격 : ${optionList.option_price} <br><br>
                    </c:forEach>
                        ${menuList.count}개<br>
                        ${menuList.price}원
                </div>
                <hr>
            </c:forEach>
<%--            <c:forEach var="menuList" items="${orderDetailDTOList}">--%>
<%--                <div class="menuBox">--%>
<%--                    메뉴 : ${menuList.menuDTO.menu_name} <br>--%>
<%--                    <c:forEach var="optionList" items="${menuList.menuOptionDTO}">--%>
<%--                        그룹 : ${optionList.option_group}<br>--%>
<%--                        옵션 : ${optionList.option_name} <br><br>--%>
<%--                    </c:forEach>--%>
<%--                        ${menuList.count}개<br>--%>
<%--                        ${menuList.price}원--%>
<%--                </div>--%>
<%--                <hr>--%>
<%--            </c:forEach>--%>
        </div>
        <hr>
        <h1>주문자정보</h1>
        <h4>연락처</h4>
        <div>${ordererInfoDTO.mem_phone}</div>
        <h4>주소</h4>
        <div>${ordererInfoDTO.address_add_detail1} ${ordererInfoDTO.orders_add_detail2}</div>
        <h4>라이더님에게 전달하는 말</h4>
        <div>${ordererInfoDTO.order_rider_req}</div>
        <hr>
        <h1>식당정보</h1>
        <h4>식당명</h4>
        <div>${storeInfoDTO.store_name}</div>
        <h4>연락처</h4>
        <div>${storeInfoDTO.store_phone}</div>
        <h4>주소</h4>
        <div>${storeInfoDTO.store_add_detail1} ${storeInfoDTO.store_add_detail2}</div>
        <hr>
        <button id="status_btn">배달완료</button>
        <hr>
    </div>


</main>

<script>
    /**
     *상태 바꾸기 버튼 이벤트
     */
    $("#status_btn").click(() => {
        Swal.fire({
            title: '배달완료 처리하시겠습니까?',
            text: "다시 되돌릴 수 없습니다. 신중하세요.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '배달완료',
            cancelButtonText: '취소',
            reverseButtons: true, // 버튼 순서 거꾸로
        }).then((result) => {
            if (result.isConfirmed) {
                let newStatus = '배달완료';
                let checkedSeqList = new Array();
                checkedSeqList.push(parseInt(${storeInfoDTO.order_seq}));

                //DB변경 요청
                $.ajax({
                    url: "/owner/order/updateStatus",
                    type: "post",
                    contentType: 'application/json; charset=utf-8',
                    data: JSON.stringify({
                        checkedSeqListJson: JSON.stringify(checkedSeqList),
                        newStatus: newStatus
                    })
                });
            }
        })
    });
</script>

</body>
</html>