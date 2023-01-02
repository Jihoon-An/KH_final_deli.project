<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>딜리 - 고객배달영수증</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>

    <link rel="stylesheet" href="/resources/css/owner/deliveryDtl.css">
</head>
<body>
<main id="deliveryDtl">
    <div class="container">
        <div class="store">
            <h2 class="title">${storeInfoDTO.store_name} 배달 영수증</h2>
            <h2 class="info">주문자정보</h2>
            <div>주문시간 :
                <fmt:parseDate value="${storeInfoDTO.order_date}" var="registered"
                               pattern="yyyy-MM-dd HH:mm:ss"/>
                <fmt:formatDate value="${registered}" pattern="yyyy년 MM월 dd일 a h:mm"/>
            </div>
            <div>배달예상시간 : ${storeInfoDTO.store_deli_time}분</div>
            <div>연락처 :
                <fmt:formatNumber var="phoneNo" value="${ordererInfoDTO.order_phone}" pattern="##,####,####"/>
                0<c:out value="${fn:replace(phoneNo, ',', '-')}" /></div>
            <div>주소 : ${ordererInfoDTO.address_add_detail1} ${ordererInfoDTO.orders_add_detail2}</div>
            <div>라이더님에게 전달하는 말 : ${ordererInfoDTO.order_rider_req}</div>
            <hr>
            <h2 class="info">주문내역</h2>
            <div>주문번호 : ${storeInfoDTO.order_seq}</div>
            <c:forEach var="menuList" items="${basketMenu}">
                <div class="menuBox">
                    <div>메뉴 : ${menuList.menu.menu_name} x ${menuList.count}개</div>
                    <c:forEach var="optionList" items="${menuList.optionList}">
                        <div> 옵션 : ${optionList.option_name}</div>
                    </c:forEach>
                </div>
            </c:forEach>
            <hr>

            <c:if test="${payInfoDTO.pay_method!='현금결제'}">
                <div class="field pay_field">
                    <div>결제방법</div>
                </div>
                <div class="pay_method">
                    <div>결제 완료 건입니다</div>
                </div>
            </c:if>

            <c:if test="${payInfoDTO.pay_method=='현금결제'}">
                <div class="field pay_field">
                    <div>총 결제금액</div>
                    <div>결제방법</div>
                </div>
                <div class="pay_method">
                    <c:choose>
                        <c:when test="${payInfoDTO.cp_type eq 'percent'}">
                            <div><fmt:formatNumber value="${payInfoDTO.pay_price1}" pattern="#,###"/>원</div>
                        </c:when>
                        <c:when test="${payInfoDTO.cp_type eq 'amount'}">
                            <div><fmt:formatNumber value="${payInfoDTO.pay_price2}" pattern="#,###"/>원</div>
                        </c:when>
                        <c:otherwise>
                            <div><fmt:formatNumber value="${payInfoDTO.pay_price3}" pattern="#,###"/>원</div>
                        </c:otherwise>
                    </c:choose>
                    <div>현금결제</div>
                </div>
            </c:if>

            <hr>
            <h2 class="info">식당정보</h2>
            <div>식당명 : ${storeInfoDTO.store_name}</div>
            <div>연락처 : <fmt:formatNumber var="phoneNo" value="${storeInfoDTO.store_phone}" pattern="##,####,####"/>
                0<c:out value="${fn:replace(phoneNo, ',', '-')}" /></div>
            <div>주소 : ${storeInfoDTO.store_add_detail1} ${storeInfoDTO.store_add_detail2}</div>

            <div style="text-align: center">
                <button id="status_btn" class="complete">배달완료</button>
            </div>
        </div>
    </div>
</main>

<script>
    let urlKey = "";
    window.onload = function (){
        let url = window.location.pathname;
        urlKey = url.split('/')[2];
        console.log(urlKey)
    }
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
                }).done(
                    // Swal.fire({
                    //     title: `배달완료 처리가 되었습니다.`
                    // })
                    Swal.fire('배달완료 처리가 되었습니다.', '', 'success').then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url: "/deliveryDtl/confirm",
                                type: "post",
                                data: {'redisKey':urlKey}
                            }).done(function(resp){
                                console.log(resp);
                                location.href = resp;
                            });
                        }
                    })
                );

            }
        })
    });
</script>

</body>
</html>
