<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>THE SELECTION</title>
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/Check_PW.css" />
    <%@ include file="assets/inc/same_css.jsp"%>  
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
            <li class="title"><h1>비밀번호 재확인</h1></li>
            <li class="cart"><a href="cartList.do"><img src="assets/image/shopping_cart.png"></a></li>
        </ul>
    </div>

    <div id="gray_area">고객님의 정보보호를 위하여 비밀번호를 다시 한 번 확인합니다.</div>

    <form id="container" method="post" action="checkPW.do">
        <div id="id_wrap"><span id="id">${user.user_id}님</span></div>
        <div id="input_box">
            <input type="password" id="pw" placeholder="비밀번호를 입력해주세요.">
        </div>
        <p id="enter_pw_msg">비밀번호를 입력하세요.</p>
        <p id="ajax" style="color: red; font-size: 12px; margin-top: 15px;"></p>
        
        <div id="hidden_msg_wrap">
            <a href="Find_PW.do"><span>비밀번호 찾기</span></a>
        </div>
				
        <div id="button_wrap">
            <button type="button" id="cancel" onclick="location.href='index.do' ">취소</button>
            <!-- <a href="Main.html" id="cancel"><span>취소</span></a> -->
            <button type="submit" id="ok">확인</button>
            <!-- <a href="#" id="ok"><span>확인</span></a> -->
        </div>
        
        <div id="modal">
			<div id="pop_container">
				<div id="pop">
					<span>정말 탈퇴하시겠습니까?</span> 
					<img src="${pageContext.request.contextPath}/assets/image/close2.png">
					<button id="button_y" type="submit">예</button>
					<button id="button_n" type="button">아니오</button>
				</div>
			</div>
		</div>
    </form>
	
	<!-- 푸터 -->
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
	
	        $("#pw").on({
	            focus: function() {
	                $("#pw").attr("placeholder", "");
	            },
	            blur: function() {
	                $("#pw").attr("placeholder", "비밀번호를 입력해주세요.");
	            }
	        });
		
	        /**
	        $("#ok").click(function(e) {
	            e.preventDefault();
	            if ($("#pw").val() == "") {
	                $("#enter_pw_msg").show();
	                $("#pw").focus();
	                $("#hidden_msg_wrap").hide();
	            } else {
	                $("#enter_pw_msg").hide();
	                $("#hidden_msg_wrap").show();
	            }
	        });
	       */
	        
	        $("#container").submit(function(e) {
	        	e.preventDefault();
	        	var pwd = $("#pw").val();
	        	if (!pwd || pwd.trim() == "") {
	        		$("#enter_pw_msg").show();
	        		$("#ajax").html("");
	        		$("#pw").focus();
	        		return false;
	        	} else {
	        		$("#enter_pw_msg").hide();
	        		$("#hidden_msg_wrap").show();
	        		$("#pw").focus();
	        		$.ajax({
	            		type: "post",
	            		url: "checkPW.do",
	            		data: {user_id: "${user.user_id}", user_pw: pwd},
	    				success: function(data) {
	    					if(data == 0) {
	    						$("#ajax").html("비밀번호가 일치하지 않습니다.");
	    					} else {
	    						$("#pop_container").fadeIn(300);
	    		                $("#pop").fadeIn(300);
	    		                $("#button_y").fadeIn(300);
	    		                $("#button_n").fadeIn(300);
	    		                $('#modal').css({'overflow': 'hidden', 'height': '100%'});	    		                
	    		                $("#button_y").click(function() {
	    		    	        	location.href="UserDelete.do";
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
	    						// if(confirm("탈퇴할래?")) {
	    							// location.href="UserDelete.do";
	    						// }
	    					}	
	    				}	    				            		
	            	});
	        	}	
	        }); // submit 끝
        }); // function 끝
    </script>	
</body>
</html>