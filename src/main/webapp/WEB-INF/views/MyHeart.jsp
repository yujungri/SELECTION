<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="assets/inc/same_css.jsp"%>
<link rel="stylesheet" type="text/css" href="assets/css/header.css">
<link rel="stylesheet" type="text/css" href="assets/css/MyHeart.css">
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<ul>
			<li class="back"><a href="javascript:history.back()"><img src="assets/image/back.png"></a></li>
			<li class="search"><a href="#"><img src="assets/image/search.png"></a></li>
			<form method="get" action="${pageContext.request.contextPath}/ProductAll.do" id="form2">
            <div class="searchbox">
                <input placeholder="search..." type="search" name="search" id="search" />
                <input type="image" src="assets/image/search.png" onclick="$('#form2').submit();" id="search_image"/>
            </div>
            </form>
			<li class="title"><h1>마이하트</h1></li>
			<li class="cart"><a href="cartList.do"><img
					src="assets/image/shopping_cart.png"></a></li>
		</ul>
	</div>
	<div class="page-header">
		<ul>
			<li>ㆍ위시리스트에는 상품이 최대 50개까지 저장됩니다.</li>
			<li>ㆍ마이하트에 담은 상품 중 판매종료가 된 상품은 자동삭제됩니다.</li>
		</ul>
	</div>
	<div class="container">
		<c:choose>
			<c:when test="${map.count == 0}">
				<div id="checkBox">
				<span>담은 상품(0개)</span>
				</div>
				<div id="container">
					<div id="text-area">마이하트에 담긴 상품이 없습니다.</div>

					<div id="continue-button">
						<a href="${pageContext.request.contextPath}/index.do">쇼핑계속하기</a>
					</div>
				</div>

				<!-- bottom_bar -->
				<%@ include file="assets/inc/bottom_bar.jsp"%>
			</c:when>

			<c:otherwise>
				<div id="order_list_wrap">
					<div id="checkBox">
						<input type="checkbox" id="allCheck" /> <label for="allCheck"></label>
						<span>담은 상품(${map.count}개)</span>
					</div>
					<c:forEach var="row" items="${map.list}">
						<div class="order_box">
							<input type="checkbox" id="${row.myheart_no}" class="chkBox"
								data-myheart_no="${row.myheart_no}" /> <label
								for="${row.myheart_no}"></label>
							<ul class="order_item_ul">
								<li>
									<div class="order_item_content">
										<div class="order_item_img">
											<a href="Detail.do/${row.product_no}"><img src="${pageContext.request.contextPath}/${row.product_img}"></a>
										</div>
										<ul>
											<li class="first"><span class="item_name">${row.product_brand}</span>
											<li class="second"><span>${row.product_name}</span></li>
											<li class="second"><span>Red / Blue</span></li>
											<li class="second"><span>S / L</span></li>
											<li class="second"><span>₩<fmt:formatNumber pattern="###,###,###" value="${row.product_price}" /></span></li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</c:forEach>
				</div>

				<div id="button_container">
					<div class="btn3">
						<button class="chod">선택상품삭제</button>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	

	<div id="pop_container_delete" class="pop_container">
		<div id="pop_delete" class="pop">
			<span>선택하신 상품을 삭제하시겠습니까?</span> <img
				src="${pageContext.request.contextPath}/assets/image/close2.png">
			<button id="button_delete_y" type="button">예</button>
			<button id="button_delete_n" type="button">아니오</button>
		</div>
	</div>


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
			
			/** 전체 체크 */
			$("#allCheck").click(function() {
				var chk = $("#allCheck").prop("checked");
				if (chk) {
					$(".chkBox").prop("checked", true);
				} else {
					$(".chkBox").prop("checked", false);
				}
			});

			/** 개별 체크박스 선택 시 전체 체크 해제 */
			$(".chkBox").click(function() {
				$("#allCheck").prop("checked", false);
			});

			/** 선택된 항목 삭제 */
			$("button.chod")
					.click(
							function() {
								// 삭제확인 팝업 모달창
								$("#pop_container_delete").fadeIn(300);
				                $("#pop_delete").fadeIn(300);
				                $("#button_delete_y").fadeIn(300);
				                $("#button_delete_n").fadeIn(300);
				                $('.body').css({'overflow': 'hidden', 'height': '100%'}); 
				                
				             // 삭제하시겠습니까? -> 예
				                $("#button_delete_y").click(function() {

									var checkArr = new Array();

									$("input[class='chkBox']:checked").each(
											function() {
												checkArr.push($(this).attr(
														"data-myheart_no"));
											});

									$.ajax({
												url : "${pageContext.request.contextPath}/myheartDelete.do",
												type : "post",
												data : {
													chbox : checkArr
												},
												success : function(result) {
													if (result == 1) {
														location.href = "${pageContext.request.contextPath}/myHeartList.do";
													} 
												}
											});
							});
				             
				             	// 삭제하시겠습니까? -> 아니오
				    	        $("#button_delete_n").click(function() {
				    	    	    $("#pop_container_delete").fadeOut(300);
				                    $("#pop_delete").fadeOut(300);
				                    $("#button_delete_y").fadeOut(300);
				                    $("#button_delete_n").fadeOut(300);
				                    $('#modal').css({'overflow': 'hidden', 'height': '100%'});
				    	        }); 
				               
				    	        // 엑스버튼
				                $("#pop_delete img").click(function() {
				              	   $("#pop_container_delete").fadeOut(300);
				                   $("#pop_delete").fadeOut(300);
				                   $("#button_delete_y").fadeOut(300);
				                   $("#button_delete_n").fadeOut(300);
				                   $('#modal').css({'overflow': 'hidden', 'height': '100%'});
				                }); 
						});

	 		$("#insertCart").click(function(e) {
	 					e.preventDefault();
								
						var object = new Object();
						object.color = $('#lowerArea input[name=color]:checked').val();
						object.size = $('#lowerArea input[name=size]:checked').val();
						object.delivery = $('#lowerArea input[name=delivery]:checked').val();
				
						$.ajax({
								url : '${pageContext.request.contextPath}/moveMyHeart.do',
								data : object,
								datatype : 'text',
								success : 
									function(data) {
										if (data > 0) {
											window.location('${pageContext.request.contextPath}/cartList.do')
										}
								}
						}); 
					}); 

			$("button.minus").click(function() {
				var n = parseInt($("#cartQty").val());

				if (n > 1) {
					n--;
					$("#cartQty").val(n);
				}
			});

			$("button.plus").click(function() {
				var n = parseInt($("#cartQty").val());
				n++;
				$("#cartQty").val(n);
			});
		});
	</script>
</body>
</html>