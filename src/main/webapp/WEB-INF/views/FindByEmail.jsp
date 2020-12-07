<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
    <%@ include file="assets/inc/same_css.jsp"%>
	<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/FindByEmail.css" />
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
            <li class="title"><h1><strong>아이디 찾기</strong></h1></li>
            <li class="cart"><a href="cartList.do"><img src="assets/image/shopping_cart.png"></a></li>
        </ul>
    </div>

    <!-- 이메일로 찾기 -->
    <div class="content">
        <div class="image">
            <h2>아이디 찾기</h2>
        </div>
        <div class="input_form">
        	<form action="FindID.do" method="post" id="find_id">
	            <div class="input_email">
	                <p>회원가입 시 등록한 이메일을 입력해 주세요.</p>
	                <input name="user_email" type='email' name="이메일 입력" id="email" placeholder="selection@selection.com" />
	                <p id="ajax" style="color: red; font-size: 12px; text-align: left; padding:0; margin-top: 5px; margin-bottom: 5px;"></p>
	            </div>
	            <div class="nxt_bttn">
	                <button type="submit" id="nxt">확인</button>
	            </div>
            </form>
        </div>
    </div>
    
    <!-- footer -->
    <%@ include file="assets/inc/footer.jsp"%>

    <!-- bottom_bar -->
    <%@ include file="assets/inc/bottom_bar.jsp"%>
    
    <!-- 스크립트 영역 -->
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

            $("#email").focus(function() {
                $("#email").attr("placeholder", "");
            });

            $("#email").blur(function() {
                $("#email").attr("placeholder", "selection@selection.com");
            });
            /** 이메일 유무 확인 */
	        $("#nxt").click(function(e) {
	        	e.preventDefault();
	        	var emailCheck = RegExp(/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/);
                var email_val = $("#email").val();

	        	if (!email_val || email_val.trim() == "") {
                    $("#ajax").html("이메일을 입력해주세요.");
	        	} else if (!emailCheck.test(email_val)) {
                    $("#ajax").html("이메일 형식이 잘못되었습니다.");
	        	} else {
	        		$.ajax({
		        		url: "${pageContext.request.contextPath}/EmailCheck.do",
		        		type: "post",
		        		data: {"user_email" : email_val},
		        		success: function(data){
		        			if(data == 1) {
		        				$("#find_id").submit();
		        			}  else {
		        				$("#ajax").html("존재하지 않는 이메일입니다.");
		        			} 
		        		}
		        	})
	        	 }
		     }); 
        });
    </script>
</body>
</html>