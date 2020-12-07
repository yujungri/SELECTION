<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<%@ include file="assets/inc/same_css.jsp"%>
	<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/Find_PW.css" />
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
            <li class="title"><h1><strong>비밀번호 찾기</strong></h1></li>
            <li class="cart"><a href="cartList.do"><img src="assets/image/shopping_cart.png"></a></li>
        </ul>
    </div>

    <!-- 아이디로 찾기 -->
    <div class="content1">
        <div class="image">
            <h2>비밀번호 찾기</h2>
        </div>
        <div class="content2">
        <form action="searchPw.do" id="find_pw">
            <div class="input_ID">
                <p>아이디와 이메일 주소를 입력하세요.</p>
                <input type='text' name="user_id" id="user_id" placeholder="아이디를 입력하세요." />
                <input type='email' name="user_email" id="user_email" placeholder="이메일을 입력하세요." />
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

        $("#user_id").focus(function() {
            $("#user_id").attr("placeholder", "");
        });

        $("#user_id").blur(function() {
            $("#user_id").attr("placeholder", "아이디를 입력하세요.");
        });
        
        $("#user_email").focus(function() {
            $("#user_id").attr("placeholder", "");
        });

        $("#user_email").blur(function() {
            $("#user_id").attr("placeholder", "아이디를 입력하세요.");
        });
        
        /** 비밀번호 찾기 회원정보 존재여부 체크 */
        $("#nxt").click(function(e) {
        	e.preventDefault();
        	// 입력값을 취득하고, 내용의 존재여부를 검사한다.
        	var emailCheck = RegExp(/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/);
            var id_val = $("#user_id").val();
            var email_val = $("#user_email").val();

        	if (!id_val || id_val.trim() == "") {
                $("#ajax").html("아이디를 입력해주세요.");
        	} else if (!email_val || email_val.trim() == "") {
                $("#ajax").html("이메일을 입력해주세요.");
        	} else if (!emailCheck.test(email_val)) {
                $("#ajax").html("이메일 형식이 잘못되었습니다.");
        	} else {      		
        		$.ajax({
	        		url: "${pageContext.request.contextPath}/PWCheck.do",
	        		type: "post",
	        		data: {"user_id" : id_val, "user_email" : email_val},
	        		success: function(data){
	        			if(data == 1) {
	        				$("#find_pw").submit();
	        			}  else {
	        				$("#ajax").html("동일한 회원정보가 존재하지 않습니다.");
	        			} 
	        		}
	        	});
        	 }
		});
    });
    </script>
</body>
</html>