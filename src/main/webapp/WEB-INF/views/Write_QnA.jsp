<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="assets/inc/same_css.jsp"%>
<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
<link rel="stylesheet" type="text/css" href="assets/css/Write_QnA.css" />
</head>

<body>
	<div id="header">
		<ul>
			<li class="back"><a href="javascript:history.back()"><img
					src="assets/image/back.png"></a></li>
			<li class="search"><a href="#"><img
					src="assets/image/search.png"></a></li>
			<form method="get" action="${pageContext.request.contextPath}/ProductAll.do" id="form2">
            <div class="searchbox">
                <input placeholder="search..." type="search" name="search" id="search" />
                <input type="image" src="assets/image/search.png" onclick="$('#form2').submit();" id="search_image"/>
            </div>
            </form>
			<li class="title"><h1>Q&A 작성</h1></li>
			<li class="cart"><a href="cartList.do"><img
					src="assets/image/shopping_cart.png"></a></li>
		</ul>
	</div>

	<div class="container">
		<form class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath}/qna/add_ok.do">
			<fieldset>
				<!-- 입력양식 -->
				<div class="form-group">
					<label for="subject" id="title">문의 제목</label><br>
					<div class="col-md-10">
						<input type="text" class="form-control" id="subject" name="qna_title"
							placeholder="제목을 입력하세요.">
					</div>
				</div>
				<!--// 입력양식 -->

				<!-- 입력양식 -->
				<div class="form-group">
					<label for="content" id="sent">문의 내용(2000자 이내 )</label><br>
					<div class="col-md-10">
						<textarea id="content" class="form-control" rows="5" name="qna_content"
							placeholder="내용을 입력하세요."></textarea>
					</div>
				</div>

				<!--// 입력양식 -->

				<!-- 입력양식 -->
				<div class="form-group">
					<div class="col-md-offset-2_col-md-10">
						<input type="hidden" name="user_no" value="${user.user_no}" />
						<button type="button" class="btn_block" onclick="location.href='QnA.do'">
							취소
						</button>
						
						<button type="submit" id="btn_submit" class="btn_block">
							등록
						</button>
					</div>
				</div>
				<div id="pop_container">
					<div id="pop">
						<span>Q&A를 등록하시겠습니까?</span> <img
							src="${pageContext.request.contextPath}/assets/image/close2.png">
						<button id="button_y" type="button">예</button>
						<button id="button_n" type="button">아니오</button>
					</div>
				</div>


				<!--// 입력양식 -->
			</fieldset>
		</form>
	</div>
	<!-- footer -->
	<%@ include file="assets/inc/footer.jsp"%>

	<!-- bottom_bar -->
	<%@ include file="assets/inc/bottom_bar.jsp"%>

	
	<!-- Javascript -->

	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#bottom_bar li:first-child").click(function(e) {
				e.preventDefault();
				$("#category_bar").slideToggle(100);
			});

			$(".top").click(function(e) {
				e.preventDefault();
				$("#container").moveTo($(this).index() + 1);
			});

			$(".search").click(function() {
				$(".title").toggle();
				$(".searchbox").toggle();
			});

			$("#btn_submit").click(function(e) {
				e.preventDefault();
				
				$("#pop_container").fadeIn(300);
                $("#pop").fadeIn(300);
                $("#button_y").fadeIn(300);
                $("#button_n").fadeIn(300);
                $('#modal').css({'overflow': 'hidden', 'height': '100%'});
                $("#button_y").click(function() {
                	$('.form-horizontal').submit();
                });
                
                $("#button_n").click(function() {
                    $("#pop_container").fadeOut(300);
                    $("#pop").fadeOut(300);
                    $("#button_n").fadeOut(300);
                    $('#modal').css({'overflow': 'hidden', 'height': '100%'});
                });

                $("#pop img").click(function() {
                    $("#pop_container").fadeOut(300);
                    $("#pop").fadeOut(300);
                    $("#button_y").fadeOut(300);
                    $("#button_n").fadeOut(300);
                    $('#modal').css({'overflow': 'hidden', 'height': '100%'});
                });

				/* var answer = confirm("Q&A를 등록하시겠습니까?");

				if (answer == true) {
					$('.form-horizontal').submit();
				} */
			});
		});
	</script>
</body>
</html>