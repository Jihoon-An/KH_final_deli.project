<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>딜리 - 식당정보</title>
    <%@ include file="/WEB-INF/views/global/m-commonLib.jsp" %>
    <link rel="stylesheet" href="/resources/css/member/store/storeInfo.css">
</head>
<body>
<%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_back.jsp" %>
<%@ include file="/WEB-INF/views/customHeader/m_home.jsp" %>
<main id="store_info">
    <div class="container">
        <%@ include file="/WEB-INF/views/member/store/storeHeader.jsp" %>
        <hr style="margin-top: 10px;">
        <div id="map" style="width:100%; height:200px;"></div>
<%--        <hr>--%>
            <div style="height: 25px;"></div>
        <div class="store store_box">
            <div class="field">영업정보</div>
            <div class="d-flex flex-row">
                <div class="title">상호명</div>
                <div class="detail_contents" id="store_name">${storeInfoDTO.store_name}</div>
            </div>

            <div class="d-flex flex-row">
                <div class="title">전화번호</div>
                <div class="detail_contents" id="store_phone">${storeInfoDTO.store_phone}</div>
            </div>

            <div class="d-flex flex-row">
                <div class="title">영업시간</div>
                <div class="detail_contents" id="time">
                    <div class="time">
                        <div>월(${bsnsHours.get("mon").get("open")})
                            <c:if test="${bsnsHours.get('mon').get('open') eq '영업일'}">
                                <fmt:parseDate value="${bsnsHours.get('mon').get('open_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                ~
                                <fmt:parseDate value="${bsnsHours.get('mon').get('close_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                            </c:if>
                        </div>

                        <div>화(${bsnsHours.get("thu").get("open")})
                            <c:if test="${bsnsHours.get('thu').get('open') eq '영업일'}">
                                <fmt:parseDate value="${bsnsHours.get('thu').get('open_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                ~
                                <fmt:parseDate value="${bsnsHours.get('thu').get('close_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                            </c:if>
                        </div>

                        <div>수(${bsnsHours.get("wed").get("open")})
                            <c:if test="${bsnsHours.get('wed').get('open') eq '영업일'}">
                                <fmt:parseDate value="${bsnsHours.get('wed').get('open_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                ~
                                <fmt:parseDate value="${bsnsHours.get('wed').get('close_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                            </c:if>
                        </div>

                        <div>목(${bsnsHours.get("thu").get("open")})
                            <c:if test="${bsnsHours.get('thu').get('open') eq '영업일'}">
                                <fmt:parseDate value="${bsnsHours.get('thu').get('open_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                ~
                                <fmt:parseDate value="${bsnsHours.get('thu').get('close_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                            </c:if>
                        </div>

                        <div>금(${bsnsHours.get("fri").get("open")})
                            <c:if test="${bsnsHours.get('fri').get('open') eq '영업일'}">
                                <fmt:parseDate value="${bsnsHours.get('fri').get('open_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                ~
                                <fmt:parseDate value="${bsnsHours.get('fri').get('close_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                            </c:if>
                        </div>

                        <div>토(${bsnsHours.get("sat").get("open")})
                            <c:if test="${bsnsHours.get('sat').get('open') eq '영업일'}">
                                <fmt:parseDate value="${bsnsHours.get('sat').get('open_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                ~
                                <fmt:parseDate value="${bsnsHours.get('sat').get('close_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                            </c:if>
                        </div>

                        <div>일(${bsnsHours.get("sun").get("open")})
                            <c:if test="${bsnsHours.get('sun').get('open') eq '영업일'}">
                                <fmt:parseDate value="${bsnsHours.get('sun').get('open_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                ~
                                <fmt:parseDate value="${bsnsHours.get('sun').get('close_time')}" var="registered"
                                               pattern="HH:mm"/>
                                <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                            </c:if>
                        </div>
                    </div>

                </div>
            </div>

            <div class="d-flex flex-row">
                <div class="title">휴무일</div>
                <div class="detail_contents" id="holiday">${storeInfoDTO.store_close_day}</div>
            </div>
        </div>
        <div style="height:25px"></div>

        <div class="delivery delivery_box">
            <div class="field">배달정보</div>
            <div class="d-flex flex-row">
                <div class="title">최소주문금액</div>
                <div class="detail_contents" id="min_price"><fmt:formatNumber value="${storeInfoDTO.store_min_price}"
                                                                              pattern="#,###"/>원
                </div>
            </div>

            <div class="d-flex flex-row">
                <div class="title">배달팁</div>
                <div class="detail_contents" id="tip"><fmt:formatNumber value="${storeInfoDTO.store_deli_tip}"
                                                                        pattern="#,###"/>원
                </div>
            </div>

            <div class="d-flex flex-row">
                <div class="title">배달가능지역</div>
                <div class="detail_contents" id="del_des">${storeInfoDTO.store_destination}</div>
            </div>

            <div class="d-flex flex-row">
                <div class="title">배달예상시간</div>
                <div class="detail_contents" id="del_time">${storeInfoDTO.store_deli_time}분</div>
            </div>
        </div>
        <div style="height:25px"></div>
        <div class="businessman businessman_box">
            <div class="field">사업자정보</div>
            <div class="d-flex flex-row">
                <div class="title">대표자명</div>
                <div class="detail_contents" id="bs_name">${ownerInfoDTO.owner_name}</div>
            </div>

            <div class="d-flex flex-row">
                <div class="title">상호명</div>
                <div class="detail_contents" id="bs_store_name">${storeInfoDTO.store_name}</div>
            </div>
            <div class="d-flex flex-row">
                <div class="title">사업자주소</div>
                <div class="detail_contents" id="bs_store_des">${storeInfoDTO.store_add_detail1}
                    ${storeInfoDTO.store_add_detail2}</div>
            </div>

            <div class="d-flex flex-row">
                <div class="title">사업자등록번호</div>
                <div class="detail_contents" id="bs_code">${ownerInfoDTO.owner_num}</div>
            </div>
        </div>
        <script>
            var latitude =${storeInfoDTO.store_add_x};
            var longitude =${storeInfoDTO.store_add_y};
        </script>
        <script src="/resources/js/member/store/storeInfo.js"></script>
</main>
</body>
</html>