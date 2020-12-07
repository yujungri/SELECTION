<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="assets/inc/same_css.jsp"%>
<link rel="stylesheet" type="text/css" href="assets/css/header2.css" />
<link rel="stylesheet" type="text/css" href="assets/css/QnA.css" />
</head>

<body>
	<!-- 헤더 -->
	<div id="header">
		<ul>
			<li class="back"><a href="javascript:history.back()"><img
					src="assets/image/back.png"></a></li>
			<li class="home"><a href="index.do"><img
					src="assets/image/home.png"></a></li>
			<li class="search"><a href="#"><img
					src="assets/image/search.png"></a></li>
			<form method="get" action="${pageContext.request.contextPath}/ProductAll.do" id="form2">
            <div class="searchbox">
                <input placeholder="search..." type="search" name="search" id="search" />
                <input type="image" src="assets/image/search.png" onclick="$('#form2').submit();" id="search_image"/>
            </div>
            </form>
			<li class="title"><h1>Q&A</h1></li>
			<li class="cart"><a href="cartList.do"><img
					src="assets/image/shopping_cart.png"></a></li>
		</ul>
	</div>
	</div>
	<div class="btn_block" id="event">
		<h1>문의사항이나 불편사항을 알려주세요.</h1>
	</div>

	<!-- 전체박스 -->
	<div class="collapse">
		<c:forEach var="item" items="${output}" varStatus="status">
			<!-- 게시글 하나 단위 -->
			<div class="collapse-item">
				<!-- 게시글 제목영역 -->
				<div class="collapse-title">
					<c:if test="${user.user_no == 1 || user.user_no == item.user_no}">
						<form action="${pageContext.request.contextPath}/qna/delete_ok.do" method="get">
							<input type="hidden" name="qna_no" value="${item.qna_no}" />
							<input class="deleteQna" type="submit" value="x"/>
						</form>
					</c:if>
					<a href="#${item.qna_no}">
						<p id="date">${item.qna_type} | ${item.reg_date}</p>
						<br>
						<span class='high'>[QnA]</span> ${item.qna_title}
					</a>
				</div>
				<!-- 게시글 내용영역 -->
				<div id="${item.qna_no}" class="content">
					<div class=c.content><p>${item.qna_content}</p>
					<br>
					<br>
					</div>
					<c:forEach var="map" items="${output1}" varStatus="status">
						<c:if test="${map.qna_no == item.qna_no}">
							<form action="${pageContext.request.contextPath}/answer/delete_ok.do" method="get">
							<p class="ans">
								<img id=reply src="assets/image/reply.png"> &nbsp<strong>
									${map.answer_writer}</strong> :&nbsp&nbsp ${map.answer_content}
								&nbsp&nbsp&nbsp&nbsp- ${map.reg_date} &nbsp&nbsp
								<c:if test="${user.user_no == 1}">
									<input type="hidden" name="answer_no" value="${map.answer_no}" />
									<input class="deleteAnswer" type="submit" value="x"/>
								</c:if>
							</p>
							<br>
							</form>
						</c:if>
					</c:forEach>
					<form action="${pageContext.request.contextPath}/answer/add_ok.do" method="post">
						<c:if test="${user.user_no == 1}">
							<div id=answerb>
							댓글: <input type="text" name="answer_content" />
								<input type="hidden" name="qna_no" value="${item.qna_no}" />
								<input id=replybtn type="submit" value="답변 완료" />
							</div>
						</c:if>
					</form>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="btn_block">
		<button type="submit" id="btn_ask">
			<a href="Write_QnA.do"><h1>문의하기</h1>
		</button>
		</a>
	</div>
	<div id="pagination" class="hs_paging bottom">
		<c:choose>
			<c:when test="${pageData.prevPage > 0}">
				<c:url value="/QnA.do" var="prevPageUrl">
					<c:param name="page" value="${pageData.prevPage}"></c:param>
					<c:param name="keyword" value="${keyword}"></c:param>
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
			<c:url value="/QnA.do" var="pageUrl">
				<c:param name="page" value="${i}" />
				<c:param name="keyword" value="${keyword}" />
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

		<c:choose>
			<c:when test="${pageData.nextPage > 0}">
				<c:url value="/QnA.do" var="nextPageUrl">
					<c:param name="page" value="${pageData.nextPage}"></c:param>
					<c:param name="keyword" value="${keyword}"></c:param>
				</c:url>
				<a href="${nextPageUrl}" class="pre disabled">&nbsp;&nbsp; >></a>
			</c:when>
			<c:otherwise>
			&nbsp;&nbsp; >>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="section_bottom_bar">
		<div class="txt_box">
			<p id="cust">고객센터</p>
			<p id="tel">
				<strong>1800-1234</strong>
			</p>
			<p id="hour">운영시간</p>
			<p id="long">평일(월~금) 09:00 ~ 18:00 (토/일, 공휴일 휴무)</p>
		</div>
	</div>
	<!-- footer -->
	<%@ include file="assets/inc/footer.jsp"%>

	<!-- bottom_bar -->
	<%@ include file="assets/inc/bottom_bar.jsp"%>

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
        $(function() {
        $(".search").click(function() {
                    $(".title").toggle();
                    $(".searchbox").toggle();
                });
          });
         $(function() {

            $("#bottom_bar li:first-child").click(function(e) {
                e.preventDefault();
                $("#category_bar").slideToggle(100);
            });


            $(".top").click(function(e) {
                e.preventDefault();
                $("#container").moveTo($(this).index() + 1);
            });
        });
    </script>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
            $(function() {
                /** 게시글의 제목을 클릭한 경우 호출되는 이벤트 정의 */
                $(".collapse-title a").click(function(e) {
                    // 링크의 기본 동작(페이지 이동) 방지
                    e.preventDefault();

                    // 클릭한 요소의 href 속성을 가져온다 --> 내용영역의 id
                    var target = $(this).attr('href');
                    // 가져온 내용영역의 id를 화면에 표시한다.
                    $(target).slideToggle(100);
                    // 내용영역(.content)중에서
                    // 클릭한 요소가 지정한 항목만 제외(not($(target)))
                    // 하고 화면에서 숨긴다.
                    $(".content").not($(target)).slideUp(100);
                });
            });
    </script>
</body>
</html>