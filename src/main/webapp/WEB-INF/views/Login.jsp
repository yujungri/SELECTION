<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
    <%@ include file="assets/inc/same_css.jsp"%>
	<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/Login.css" />
    <link rel="stylesheet" href="assets/plugins/sweetalert/sweetalert2.min.css" />
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
            <li class="title"><h1><strong>로그인</strong></h1></li>
            <li class="cart"><a href="cartList.do"><img src="assets/image/shopping_cart.png"></a></li>
        </ul>
    </div>

    <!-- 로그인 정보 입력 -->
	<div class="content">
    <div class="login_input_area">
        <form id="loginForm" class="form-inline" method="post" action="/UserLogin.do" >
            <input id="user_id" type="text" name="user_id" class="form-control" placeholder="아이디를 입력하세요." />
            <br />
            <input id="user_pw" type="password" name="user_pw" class="form-control" placeholder="비밀번호를 입력하세요." />
            <!-- ajax 결과를 출력하기 위한 HTML -->
			<p id="ajax" style="color: red; font-size: 12px; margin-top: 15px; margin-bottom: -15px;"></p>
            <br />
            <button type="submit" class="btn btn-primary" id="btn">로그인</button>     
        <div class="login_checking">
            <input type="checkbox" id="cb1" name="useCookie" />
            <label id="cb2" for="cb1"><span>자동 로그인</span></label>
        </div>
        </form>
        <div class="borderline">
            <p name="구분선"></p>
        </div>
        <div class="signup">
            <a href="SignUp.do">회원가입</a>
        </div>
    </div>
    <div id="find_info">
        <p>아이디/비밀번호를 잊으셨나요?</p>
        <a href="Find_ID.do"><button id="find_id">아이디 찾기</button></a>
        <a href="Find_PW.do"><button id="find_pw">비밀번호 찾기</button></a>
    </div>
	</div>

	<!-- footer -->
    <%@ include file="assets/inc/footer.jsp"%>

    <!-- bottom_bar -->
    <%@ include file="assets/inc/bottom_bar.jsp"%>

    <!-- 스크립트 영역 -->
    <script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
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

            $("#user_pw").focus(function() {
                $("#user_pw").attr("placeholder", "");
            });

            $("#user_id").blur(function() {
                $("#user_id").attr("placeholder", "아이디를 입력하세요.");
            });

            $("#user_pw").blur(function() {
                $("#user_pw").attr("placeholder", "비밀번호를 입력하세요.");
            });

            $("#loginForm").submit(function(e) {
            	e.preventDefault();
            	var uid = $("#user_id").val();
            	var pwd = $("#user_pw").val();
                //자동로그인 반환할 변수
                const useCookie = $('input[name=useCookie]').is(":checked");
				
                if (!uid || uid.trim() == "") {
                    $("#ajax").html("아이디를 입력해주세요.");
            	} else if (!pwd || pwd.trim() == "") {
                    $("#ajax").html("비밀번호를 입력해주세요.");
            	} else {
            	$.ajax({
            		type: "post",
            		url: "${pageContext.request.contextPath}/UserLogin.do",
            		data: {user_id: uid, user_pw: pwd, useCookie: useCookie},
					success: function(data) {
						if(data == "false")
					   		$("#ajax").html("아이디 또는 비밀번호가 맞지  않습니다.");
						else
							location.href="${pageContext.request.contextPath}/index.do";
							// location.href="javascript:history.back()";
					}
            	});
                }
			});
        });
    </script>
</body>
</html>