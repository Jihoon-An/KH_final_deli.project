<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-16
  Time: 오전 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>딜리 - 식당정보</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2831f365f4c14d690cf0e21146e8dd99&libraries=services"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">
    <!-- bootstrap CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <!-- bootstrap JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/customHeader/m_common.css" type="text/css">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/favicon.ico"/>
    <link rel="icon" href="/resources/favicon.ico" type="image/x-icon">
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