<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="assets/inc/same_css.jsp"%>
<link rel="stylesheet" type="text/css" href="assets/css/CustomerService.css" />
<link rel="stylesheet" type="text/css" href="assets/css/header.css" />

</head>
<body>
	<div id="container">
		<!-- 헤더 -->
		<div id="header">
			<ul>
				<li class="back"><a href="javascript:history.back()"><img
						src="assets/image/back.png"></a></li>
				<li class="search"><a href="#"><img src="assets/image/search.png"></a></li>
				<form method="get" action="${pageContext.request.contextPath}/ProductAll.do" id="form2">
	            	<div class="searchbox">
	                	<input placeholder="search..." type="search" name="search" id="search" />
	                	<input type="image" src="assets/image/search.png" onclick="$('#form2').submit();" id="search_image"/>
	            	</div>
            	</form>
				<li class="title"><h1>고객센터</h1></li>
				<li class="cart"><a href="cartList.do"><img
						src="assets/image/shopping_cart.png"></a></li>
			</ul>
		</div>
		<div content>
			<div id="body" class="CS_page">
				<h1>1800-1234</h1>
				<li>운영시간</li>
				<li>평일(월~금) 10:00 ~ 18:00 <br />(토/일, 공휴일 휴무)
				</li>
			</div>

			<table id="CS_table" class="clear">
				<div class="table_list">
					<ul id="table_row">
						<a href="Announcement.do"><li><img
								src="assets/image/notice.png">
								<p class="pt">
									<strong>공지사항</strong>
								</p></li></a>
						<a href="QnA.do"><li><img src="assets/image/QnA.png">
								<p class="pt">
									<strong>Q&A</strong>
								</p></li></a>
						<a href="Store_Info.do"><li><img src="assets/image/store.png">
								<p class="pt">
									<strong>매장안내</strong>
								</p></li></a>
						<a href="Staff.do"><li><img src="assets/image/staff.png">
								<p class="pt">
									<strong>운영진</strong>
								</p></li></a>
				</div>
			</table>
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

				$("#bottom_bar li:first-child").click(function(e) {
					e.preventDefault();
					$("#category_bar").slideToggle(100);
				});
			});
		</script>
</body>
</html>