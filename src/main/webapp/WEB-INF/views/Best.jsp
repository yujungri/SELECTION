<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="assets/inc/same_css.jsp"%>
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/common_contents.css" />
</head>

<body>
    <!-- 헤더 -->
    <div id="header">
        <ul>
            <li class="back"><a href="javascript:history.back()"><img src="assets/image/back.png"></a></li>
            <li class="search"><a href="#"><img src="assets/image/search.png"></a></li>
            <form method="get" action="${pageContext.request.contextPath}/Best.do" id="form2">
            <div class="searchbox">
                <input placeholder="search..." type="search" name="search" id="search" />
                <input type="image" src="assets/image/search.png" onclick="$('#form2').submit();" id="search_image"/>
            </div>
            </form>
            <li class="title"><h1>베스트</h1></li>
            <li class="cart"><a href="cartList.do"><img src="assets/image/shopping_cart.png"></a></li>
        </ul>
    </div>

	<div id="content">
        <div id="menu_bar">
            <ul>
                <li><a href="Best.do">베스트</a></li>
                <li><a href="New.do">신상품</a></li>
                <li><a href="Recommend.do">추천상품</a></li>
                <li><a href="Top.do">탑</a></li>
                <li><a href="Dress.do">드레스</a></li>
                <li><a href="Pants.do">팬츠</a></li>
                <li><a href="Outer.do">아우터</a></li>
                <li><a href="Acc.do">잡화</a></li>
            </ul>
        </div>
        
        <div id="filter">
            <form method="get" action="${pageContext.request.contextPath}/Best.do">
            <input type="hidden" name="lowPrice" id="lowPrice" value="1"/>
            <button type="submit">가격낮은순</button>
            </form>
            <form method="get" action="${pageContext.request.contextPath}/Best.do">
            <span><img src="assets/image/filtering.png"> 필터링</span>
            <input type="hidden" name="highPrice" id="highPrice" value="1"/>
            <button type="submit">가격높은순</button>
            </form>
        </div>
        
    	<div id="product" class="clear">
            <ul id="grid">
            	<c:forEach var="row" items="${output}">
				<li>
		            <div class="img">
		                <a href="BestDetail.do/${row.product_no}">
		                    <img src="${pageContext.request.contextPath}/${row.product_img}" class="img_g">
		                </a>
		            </div>
		            <div class="info">
		                <p class="brand"><strong>${row.product_brand}</strong></p>
		                <p class="desc">${row.product_name}</p>
		                <p class="price"><span>₩</span><fmt:formatNumber value="${row.product_price}" pattern="###,###,###"/></p>
		            </div>
        		</li>
        		</c:forEach>
        		<c:forEach var="row" items="${output2}">
				<li>
		            <div class="img">
		                <a href="BestDetail.do/${row.product_no}">
		                    <img src="${pageContext.request.contextPath}/${row.product_img}" class="img_g">
		                </a>
		            </div>
		            <div class="info">
		                <p class="brand"><strong>${row.product_brand}</strong></p>
		                <p class="desc">${row.product_name}</p>
		                <p class="price"><span>₩</span><fmt:formatNumber value="${row.product_price}" pattern="###,###,###"/></p>
		            </div>
        		</li>
        		</c:forEach>
        		<c:forEach var="row" items="${output3}">
				<li>
		            <div class="img">
		                <a href="AccDetail.do/${row.product_no}">
		                    <img src="${pageContext.request.contextPath}/${row.product_img}" class="img_g">
		                </a>
		            </div>
		            <div class="info">
		                <p class="brand"><strong>${row.product_brand}</strong></p>
		                <p class="desc">${row.product_name}</p>
		                <p class="price"><span>₩</span><fmt:formatNumber value="${row.product_price}" pattern="###,###,###"/></p>
		            </div>
        		</li>
        		</c:forEach>
            </ul>
        </div>
        <div class="hs_paging">
	        <%-- 이전 그룹에 대한 링크 --%>
	        <c:choose>
	        	<%-- 이전 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.prevPage > 0}">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/Best.do" var="prevPageUrl">
						<c:param name="page" value="${pageData.prevPage}"></c:param>
						<c:param name="lowPrice" value="${lowPrice}"></c:param>
						<c:param name="highPrice" value="${highPrice}"></c:param>
						<c:param name="search" value="${search}"></c:param>
					</c:url>
					<a href="${prevPageUrl}" class="pre disabled"><<</a>
				</c:when>
				<c:otherwise>
						<<
				</c:otherwise>
			</c:choose>
	
			<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
			<c:forEach var="i" begin="${pageData.startPage}"
				end="${pageData.endPage}" varStatus="status">
				<%-- 이동할 URL 생성 --%>
				<c:url value="/Best.do" var="pageUrl">
					<c:param name="page" value="${i}" />
					<c:param name="lowPrice" value="${lowPrice}"></c:param>
					<c:param name="highPrice" value="${highPrice}"></c:param>
					<c:param name="search" value="${search}"></c:param>
				</c:url>
	
				<%-- 페이지 번호 출력 --%>
				<c:choose>
					<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
					<c:when test="${pageData.nowPage == i}">
						<strong>&nbsp;&nbsp; ${i}</strong>
					</c:when>
					<%-- 나머지 페이지의 경우 링크 적용함 --%>
					<c:otherwise>
						<a href="${pageUrl}">&nbsp;&nbsp; ${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<%-- 다음 그룹에 대한 링크 --%>
			<c:choose>
				<%-- 다음 그룹으로 이동 가능하다면? --%>
				<c:when test="${pageData.nextPage > 0}">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/Best.do" var="nextPageUrl">
						<c:param name="page" value="${pageData.nextPage}"></c:param>
						<c:param name="lowPrice" value="${lowPrice}"></c:param>
						<c:param name="highPrice" value="${highPrice}"></c:param>
						<c:param name="search" value="${search}"></c:param>
					</c:url>
					<a href="${nextPageUrl}" class="pre disabled">&nbsp;&nbsp; >></a>
				</c:when>
				<c:otherwise>
				&nbsp;&nbsp; >>
				</c:otherwise>
			</c:choose>
		</div>
    </div>

    <!-- footer -->
    <%@ include file="assets/inc/footer.jsp"%>

    <!-- top 버튼 -->
    <div id="side">
        <a href="#" class="top"><img src="assets/image/arrow_up.png"></a>
    </div>

    <!-- bottom_bar -->
    <%@ include file="assets/inc/bottom_bar.jsp"%>

    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="assets/plugins/handlebars/handlebars-v4.0.11.js"></script>
    <script type="text/javascript">
        $(function() {
            $(".search").click(function() {
                    $(".title").toggle();
                    $(".searchbox").toggle();
            });

            $("#bottom_bar li:first-child").click(function(e) {
                e.preventDefault();
                $("#category_bar").slideToggle(100);
            });

            $(".top").click(function() {
                $('html').animate({ scrollTop: 0 }, 400);
            });

            $("#btn").click(function() {  
                add_item();
            });
        });
    </script>
</body>
</html>