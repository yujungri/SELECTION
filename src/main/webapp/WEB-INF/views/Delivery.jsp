<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>THE SELECTION</title>
    <link rel="stylesheet" type="text/css" href="assets/css/Delivery.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <%@ include file="assets/inc/same_css.jsp"%>   

</head>
<body>
	 <!-- 바디 -->
    <div id="body">
        <!-- 헤더 -->
        <div id="header">
            <ul>
                <li class="back"><a href="javascript:history.back()"><img src="assets/image/back.png"></a></li>
                <li class="title"><h1>주문/배송조회</h1></li>
                <li class="cart"><a href="cartList.do"><img src="assets/image/shopping_cart.png"></a></li>
            </ul>
        </div>

        <!-- 기간 검색 -->

        
        <c:choose>
        	<%-- 본문 주문 없을 때 --%>

        	<c:when test="${count == 0}">
        	<div id="search_wrap">
        	</div>       		
		        <div id="container_blk">
		            <div id="text_area"><p>주문 내역이 없습니다.</p></div>
		            <div id="blank_area"></div>
		            <div id="continue-button">
		                <a href="index.do">계속쇼핑하기</a>
		            </div>
		        </div> 
        	</c:when>
        
        	<%-- 본문 주문 있을 때 --%>
			<c:otherwise>	
					<div id="search_wrap2">
						<marquee loop="infinite" direction="left" ><span id="waitCount"></span>건이 입금대기 중입니다.</marquee>
	        		</div>      
			        <div id="order_list_wrap">	 
			        	<c:forEach var="row" items="${outer}">	       		        		        		
		        		<div class="order_box">
			                <div class="order_info pickup">
			                    <div class="deliv_method">${row.order_no}</div>
			                    <div class="deliv_sub">${row.order_date}</div>
			                    <div class="menu_vertical">
			                    	<c:if test="${row.order_status == 1}">			                    				                      
			                        	<img src="assets/image/bin.png" data-order_no="${row.order_no}" data-order_date="${row.order_date}" data-order_total="${row.order_total}">
			                        </c:if>
			                    </div>	                  
			                </div>
			                	    			                			                
		                	<c:forEach var="row2" items="${inner}">
		                		<c:if test="${row2.order_no == row.order_no}"> 															                		               		       
				                <ul class="order_item_ul">
				                    <li>
				                        <div class="order_item_content">
				                            <div class="order_item_img"><img src="${row2.product_img}"></div>
				                            <ul>
				                                <li class="first"><span class="item_name">${row2.product_brand}</span></li>
				                                <li class="first"><span>${row2.product_name}</span></li>
				                                <li class="second"><span>${row2.color} / ${row2.size} / ${row2.amount}개</span></li>
				                                <li class="third"><span>₩<fmt:formatNumber pattern="###,###,###" value="${row2.amount*row2.product_price}" /></span></li>
				                                <li class="fourth">
				                                	<span class="stage">
				                                	<c:if test="${row.order_status == 0}">
				                                	주문취소
				                                	</c:if>
				                                	<c:if test="${row.order_status == 1}">
				                                	입금대기
				                                	</c:if>
				                                	</span>
				                                	<span>${row.order_date}</span>
				                                </li>
				                            </ul>
				                        </div>
				                    </li>
				                </ul>
				                </c:if>   
		               		</c:forEach>
		            	</div>	      	        	
		       		</c:forEach>
		        </div>
	        </c:otherwise>
        </c:choose>

        <!-- 배송안내 -->
        <div id="info">
            <h3>주문 배송 조회 안내</h3>
            <ul>
                <li>반품신청은 배송완료 후 7일까지 가능합니다.</li>
                <li>배송지 수정은 주문완료 상태까지만 가능합니다.</li>
                <li>배송준비 중 단계에서는 주문 취소/변경이나 배송지 변경이 불가능합니다.</li>
                <li>가상계좌 결제 시, 4시간 내 입금하지 않으면 주문이 자동으로 취소됩니다.</li>
            </ul>
        </div>

	    <!-- 푸터 -->
	    <%@ include file="assets/inc/footer.jsp"%>    
	
		<!-- bottom_bar -->
	    <%@ include file="assets/inc/bottom_bar.jsp"%>
    </div>
     
	
	<div id="modal">
	        <div id="header">
	            <ul>
	                <li class="title"><h1>주문취소</h1></li>
	                <li class="delivery_cancel close_btn"><img src="assets/image/close2.png"></li>
	            </ul>
	        </div>
	
	        <div id="cancel_info_box">
	            <p id="cancel_order_num">주문번호 : <b></b></p>
	            <p id="cancel_order_date">(주문일자 : <span></span></p>
	        </div>
		
	        <div id="refund_box">
	            <ul>
	                <li>환불 예상내역</li>
	                <li></li>
	            </ul>
	        </div>
	
	        <div id="refund_info_box">
	            <div id="refund_info_box_inner_box">
	                <div class="title">
	                                             주문취소안내
	                    <img src="assets/image/plus.png">
	                </div>
	                <div class="content">
	                    <h5>주문취소처리</h5>
	                    <ul>
	                        <li>
	                            카드결제 취소 : 카드 결제는 카드사로 즉시 취소 요청합니다. <br/>
	                            단, 카드사에서 승인취소 처리를 하는데 2-3일이 소요될 수 있습니다.
	                        </li>
	                        <li>
	                            실시간 계좌 이체 : 결제를 진행하신 계좌로 환불 처리 됩니다.
	                        </li>
	                        <li>
	                            가상계좌: 등록하신 환불계좌로 2-3일내 입금처리 됩니다.
	                        </li>
	                        <li>
	                            포인트: 주문 취소 후 즉시 복원 됩니다.
	                        </li>
	                        <li>
	                            기프트 카드: 주문 취소 후 포인트로 복원 되며, 복원 비율은 1:1 입니다.
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	
	        <div id="cancel_button_final">
	            <span></span>
	        </div>
	

	        <div id="pop_container">
	            <div id="pop">
	                    <span>주문을 취소하시겠습니까?</span>
	                <img src="assets/image/close2.png">
	                <form action="${pageContext.request.contextPath}/orderCancel.do" method="post" id="cancelForm">
		                <input type="hidden" name="order_no" id="order_no" value="">
	                    <button type="button">확인</button>
                    </form>
	            </div>
	        </div>
	    </div>	
	   
    
    
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(function() {
        
        // 상단 입금대기 건 수 표시
 		var count = 0;
 		<c:forEach var="row" items="${outer}">
        if (${row.order_status == 1}) {
        	count++;
        }
        </c:forEach>
    	$("#waitCount").html(count);
    	
        $("#bottom_bar li:first-child").click(function(e) {
                e.preventDefault();
                $("#category_bar").slideToggle(100);
            });

        $("#cancelForm button").click(function() {
        		$("#cancelForm").submit();
        });
        
        // 모달창 열기
        $("#order_list_wrap .menu_vertical img").click(function(event) {
        	var order_no = $(this).data('order_no');
        	var order_date = $(this).data('order_date');
        	var order_total = $(this).data('order_total');
        	$("#cancel_order_num b").html(order_no);
        	$("#cancel_order_date span").html(order_date + ')');
        	$("#refund_box li:last-child").html(order_total.toLocaleString() + '원');
        	$("#cancel_button_final span").html(order_total.toLocaleString() + '원 주문취소');
       	
            $("#modal").addClass("open");
            $("#modal").css('overflow', 'auto');
            $('#body').css({'overflow': 'hidden', 'height': '100%'});
            
            $("#order_no").val(order_no);          
        });

        // + -> -
        $("#refund_info_box_inner_box .title img").click(function() {
            var src = $("#refund_info_box_inner_box .title img");
            if (src.attr("src") == "assets/image/plus.png") {
                src.attr("src", "assets/image/minus.png");
            } else {
                src.attr("src", "assets/image/plus.png");
            }
                $("#refund_info_box_inner_box .content").slideToggle(150);
            });

        // 모달창 닫기
        $("#modal .close_btn img").click(function() {
            $("#modal").removeClass("open");
            $('#body').css({'overflow': 'auto', 'height': '100%'});
        });

        // 팝업창 열기
        $("#cancel_button_final").click(function() {
            $("#pop_container").fadeIn(300);
            $("#pop").fadeIn(300);
            $('#modal').css({'overflow': 'hidden', 'height': '100%'});
        });

        // 팝업창 닫기
        $("#pop img").click(function() {
            $("#pop_container").fadeOut(300);
            $("#pop").fadeOut(300);
            $('#modal').css({'overflow': 'auto', 'height': '100%'});
        });

        // 팝업, 모달 닫기
        $("#pop button").click(function() {
            $("#pop_container").fadeOut(300);
            $("#pop").fadeOut(300);
            $("#modal").removeClass("open");
            $('#body').css({'overflow': 'auto', 'height': '100%'});
        });
    });

    </script>
</body>
</html>