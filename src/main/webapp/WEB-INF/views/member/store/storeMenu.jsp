<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="store_detail" style="margin-bottom: 80px;">
    <%@ include file="/WEB-INF/views/member/store/storeHeader.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_cart.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_nav.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_top.jsp" %>
    <%@ include file="/WEB-INF/views/customHeader/m_header.jsp" %>
    <div class="fieldBox" style="margin-bottom: -10px;">
        <div id="menu"><a onclick="loadCode1();"
                          style="font-weight: bold; font-size: 1.15em; cursor: pointer;">메뉴</a></div>
        <div id="info"><a onclick="loadCode2();" style="cursor: pointer;" id="to_info">정보</a></div>
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
        <c:choose>
            <c:when test="${not empty menuGroup}">
                <%--                                <c:forEach var="i" items="${reviews.menu_list}">--%>
                <%--                                    <div>메뉴명 : ${i}</div>--%>
                <div class="filter_box">
                    <div style="margin: 0 auto;" class="d-flex flex-row">
                        <c:forEach var="mGroup" items="${menuGroup}" varStatus="num">
                            <a onclick="scrollMove${num.count}()" style="text-decoration: none; color: black;">
                                <div class="filter menuCategory" style="margin-right: 7px">${mGroup}</div>
                            </a>
                            <script>
                                function scrollMove${num.count}() {
                                    let location = document.querySelector("#bottom_menu_group${num.count}").offsetTop;
                                    window.scrollTo({top: location - 50, behavior: "smooth"});
                                };
                            </script>
                        </c:forEach>
                    </div>
                </div>
            </c:when>
        </c:choose>

        <div style="height: 10px;"></div>
            <div class="menu_list">
                <c:choose>
                    <c:when test="${not empty categoryList}">
                    <c:forEach var="categories" items="${categoryList}" varStatus="num">
                    <div class="bottom_menu_group" id="bottom_menu_group${num.count}"
                         style="font-weight: bold; font-size: 18px; margin-bottom: 5px;">${categories.menu_group}
                        <div style="height: 10px;"></div>
                        <c:forEach var="menuList" items="${categories.menuList}">
                        <div class="menu_box">
                            <div class="box" style="margin-top:-5px; width: 300px;">
                                <a href="/menu/detail/${menuList.menu_seq}">
                                    <div class="menu_info">
                                        <c:choose>
                                            <c:when test="${not empty menuList.menu_img}">
                                                <div class="menu">
                                                    <div class="yyyy">
                                                        <div class="menu_name">${menuList.menu_name}</div>
                                                        <div class="menu_intro">${menuList.menu_intro}
                                                        </div>
                                                        <div class="menu_price">
                                                            <fmt:formatNumber value="${menuList.menu_price}" pattern="#,###"/>원
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="menu_img" style="width: 95px; height: 95px; margin-top: 5px; margin-left: 8px;">
                                                    <img class="img"
                                                         src="/resources/img/menu-img/${menuList.menu_img}" style="width: 95px;
            height: 95px;">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="menu">
                                                    <div class="yyyy">
                                                        <div class="menu_name">${menuList.menu_name}</div>
                                                        <div id="menu_intro"
                                                             style="width: 275px; text-overflow: unset; white-space: unset; overflow: unset; word-break:break-word">
                                                                ${menuList.menu_intro}
                                                        </div>
                                                        <div class="menu_price">
                                                            <fmt:formatNumber value="${menuList.menu_price}" pattern="#,###"/>원
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                    </c:choose>
                                </div>
                            </a>
                        </div>
                    </div>
                <div style="height:10px;"></div>
                </c:forEach>
                <hr>
            </div>
        </c:forEach>

            <%--원산지--%>
        <c:choose>
            <c:when test="${not empty storeInfoDTO.store_origin}">
                <div class="origin" style="margin-top: -10px;">
                    원산지 : ${storeInfoDTO.store_origin}
                </div>
            </c:when>
            <c:otherwise>
                원산지 없음
            </c:otherwise>
        </c:choose>

        </c:when>
        <c:otherwise>
            메뉴가 없어요
        </c:otherwise>
        </c:choose>
    </div>
</div>
</div>

<script src="/resources/js/member/store/storeDetail.js"></script>
</div>
</div>