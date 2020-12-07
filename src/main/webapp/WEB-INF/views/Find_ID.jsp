<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<%@ include file="assets/inc/same_css.jsp"%>
	<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/Find_ID.css" />
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

    <!-- 아이디 찾기 -->
    <div class="content">
        <div class="image">
            <h2>아이디 찾기</h2>
        </div>
        <div class="certification">
            <ul class="choice">
                <p>아이디를 찾기 위해 인증방법을 선택해주세요.</p>
                <li id="email"><img src="assets/image/email_icon.png"><a href="FindByEmail.do"><button>이메일 인증</button></a></li>
                <li id="ipin"><img src="assets/image/ipin_icon.png"><a href="ready.do"><button>아이핀 본인 인증</button></a></li>
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