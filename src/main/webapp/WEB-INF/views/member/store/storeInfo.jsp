<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="store_info" style="margin-bottom: 80px;">
    <%@ include file="/WEB-INF/views/member/store/storeHeader.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_cart.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_top.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
    <div class="fieldBox" style="margin-bottom: -10px;">
        <div id="menu"><a onclick="loadCode1();" style="cursor: pointer;">메뉴</a></div>
        <div id="info"><a onclick="loadCode2();" style="font-weight: bold; font-size: 1.15em; cursor: pointer;"
                          id="to_info">정보</a></div>
        <div id="review"><a onclick="loadCode3();" style="cursor: pointer;">리뷰</a></div>
    </div>

    <script>
        function loadCode1() {
            $('.container').load('/store/menu/menu/${storeInfoDTO.store_seq}');
        }

        function loadCode2() {
            $('.container').load('/store/info/${storeInfoDTO.store_seq}');
        }

        function loadCode3() {
            $('.container').load('/store/review/${storeInfoDTO.store_seq}');
        }
    </script>

    <hr style="margin-top: 10px; margin-bottom: 5px;">
    <div class="contents">
        <div id="map" style="width:100%; height:200px; margin-top: 10px;"></div>
        <div style="height: 25px;"></div>
        <div class="store store_box">
            <div class="field">영업정보</div>
            <div class="d-flex flex-row">
                <div class="title">상호명</div>
                <div class="detail_contents" id="store_name">${storeInfoDTO.store_name}</div>
            </div>

            <div class="d-flex flex-row">
                <div class="title">전화번호</div>
                <c:if test="${fn:length(storeInfoDTO.store_phone)==9}">
                    ${fn:substring(storeInfoDTO.store_phone, 0, 2)}-${fn:substring(storeInfoDTO.store_phone, 2, 5)}-${fn:substring(storeInfoDTO.store_phone, 5, 9)}
                </c:if>
                <c:if test="${fn:length(storeInfoDTO.store_phone)==11}">
                    <fmt:formatNumber var="phoneNo" value="${storeInfoDTO.store_phone}" pattern="##,####,####"/>
                    <div class="detail_contents" id="store_phone">0<c:out
                            value="${fn:replace(phoneNo, ',', '-')}"/></div>
                </c:if>
                <c:if test="${fn:length(storeInfoDTO.store_phone)==12}">
                    ${fn:substring(storeInfoDTO.store_phone, 0, 4)}-${fn:substring(storeInfoDTO.store_phone, 4,8)}-${fn:substring(storeInfoDTO.store_phone, 8, 12)}
                </c:if>
            </div>

            <div class="d-flex flex-row">
                <div class="title">영업시간</div>
                <div class="detail_contents" id="time">
                    <div class="time">
                        <c:choose>
                            <c:when test="${bsnsHours.get('mon').get('open') eq '영업일'}">
                                <div>월 :
                                    <c:if test="${bsnsHours.get('mon').get('open') eq '영업일'}">
                                        <fmt:parseDate value="${bsnsHours.get('mon').get('open_time')}" var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                        ~
                                        <fmt:parseDate value="${bsnsHours.get('mon').get('close_time')}"
                                                       var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                    </c:if>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>월 : ${bsnsHours.get('mon').get('open')}</div>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${bsnsHours.get('tue').get('open') eq '영업일'}">
                                <div>화 :
                                    <c:if test="${bsnsHours.get('tue').get('open') eq '영업일'}">
                                        <fmt:parseDate value="${bsnsHours.get('tue').get('open_time')}" var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                        ~
                                        <fmt:parseDate value="${bsnsHours.get('tue').get('close_time')}"
                                                       var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                    </c:if>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>화 : ${bsnsHours.get('tue').get('open')})</div>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${bsnsHours.get('wed').get('open') eq '영업일'}">
                                <div>수 :
                                    <c:if test="${bsnsHours.get('wed').get('open') eq '영업일'}">
                                        <fmt:parseDate value="${bsnsHours.get('wed').get('open_time')}" var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                        ~
                                        <fmt:parseDate value="${bsnsHours.get('wed').get('close_time')}"
                                                       var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                    </c:if>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>수 : ${bsnsHours.get('wed').get('open')}</div>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${bsnsHours.get('thu').get('open') eq '영업일'}">
                                <div>목 :
                                    <c:if test="${bsnsHours.get('thu').get('open') eq '영업일'}">
                                        <fmt:parseDate value="${bsnsHours.get('thu').get('open_time')}" var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                        ~
                                        <fmt:parseDate value="${bsnsHours.get('thu').get('close_time')}"
                                                       var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                    </c:if>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>목 : ${bsnsHours.get('thu').get('open')}</div>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${bsnsHours.get('fri').get('open') eq '영업일'}">
                                <div>금 :
                                    <c:if test="${bsnsHours.get('fri').get('open') eq '영업일'}">
                                        <fmt:parseDate value="${bsnsHours.get('fri').get('open_time')}" var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                        ~
                                        <fmt:parseDate value="${bsnsHours.get('fri').get('close_time')}"
                                                       var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                    </c:if>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>금 : ${bsnsHours.get('fri').get('open')}</div>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${bsnsHours.get('sat').get('open') eq '영업일'}">
                                <div>토 :
                                    <c:if test="${bsnsHours.get('sat').get('open') eq '영업일'}">
                                        <fmt:parseDate value="${bsnsHours.get('sat').get('open_time')}" var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                        ~
                                        <fmt:parseDate value="${bsnsHours.get('sat').get('close_time')}"
                                                       var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                    </c:if>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>토 : ${bsnsHours.get('sat').get('open')}</div>
                            </c:otherwise>
                        </c:choose>

                        <c:choose>
                            <c:when test="${bsnsHours.get('sun').get('open') eq '영업일'}">
                                <div>일 :
                                    <c:if test="${bsnsHours.get('sun').get('open') eq '영업일'}">
                                        <fmt:parseDate value="${bsnsHours.get('sun').get('open_time')}" var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                        ~
                                        <fmt:parseDate value="${bsnsHours.get('sun').get('close_time')}"
                                                       var="registered"
                                                       pattern="HH:mm"/>
                                        <fmt:formatDate value="${registered}" pattern="a h:mm"/>
                                    </c:if>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>일 : ${bsnsHours.get('sun').get('open')}</div>
                            </c:otherwise>
                        </c:choose>
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
                <div class="detail_contents" id="min_price"><fmt:formatNumber
                        value="${storeInfoDTO.store_min_price}"
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
                <div><c:out value="${fn:substring(ownerInfoDTO.owner_num,0,3)}"/>-<c:out
                        value="${fn:substring(ownerInfoDTO.owner_num,3,5)}"/>-<c:out
                        value="${fn:substring(ownerInfoDTO.owner_num,5,10)}"/>
                </div>
            </div>
        </div>
        <script>
            var latitude =${storeInfoDTO.store_add_x};
            var longitude =${storeInfoDTO.store_add_y};
        </script>
        <script src="/resources/js/member/store/storeInfo.js"></script>
    </div>
</div>
