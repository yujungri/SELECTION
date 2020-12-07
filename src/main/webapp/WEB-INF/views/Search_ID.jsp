<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
    <%@ include file="assets/inc/same_css.jsp"%>
	<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/Search_ID.css" />
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
    
    <!-- 아이디 정보 -->
    <div class="content">
        <div class="info_ID">
            <ul>
                <li class="msg">
                    <p>안녕하세요, SELECTION 고객님,<br/>고객님의 아이디는 아래와 같습니다.</p>
                </li>
                <li class="my_ID">
                    <p><span id="my_name">${output.user_name}님</span>의 아이디는</p>
                    <p><span id="my_ID">${output.user_id}</span> 입니다.</p>
                </li>
            </ul>
        </div>
        <div class="bttn">
            <ul>
                <li><a href="Login.do"><button id="go_login">로그인 하기</button></a></li>
                <li><a href="Find_PW.do"><button id="find_pw">비밀번호 찾기</button></a></li>
            </ul>
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
    });
    </script>
</body>
</html>