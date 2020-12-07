<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
    <%@ include file="assets/inc/same_css.jsp"%>
	<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
	
	<style type="text/css">
    #content {
        padding-bottom: 57px;
        padding-top: 50px;
        text-align: center;
    }

    .gray_tab {
        background-color: rgba(206, 204, 206, 0.8);
        height: 150px;
    }

    .gray_tab h2 {
        padding-top: 70px;
    }

    #header {
        border-bottom: 1px solid  #eee;
    }

    .go_main {
        padding:15px 60px;
    }

    .btn {
        margin-top:30px;
        color: #fff;
        background-color: #D0A793;
        height: 40px;
        font-weight: bold;
        font-size: 14px;
        outline: none;
        border:none;
        width: 100%;
    }
    </style>
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
            <li class="title"><h1><strong>준비중인 페이지</strong></h1></li>
            <li class="cart"><a href="cartList.do"><img src="assets/image/shopping_cart.png"></a></li>
        </ul>
    </div>
    
    <!-- 본문영역 -->
    <div id="content">
        <div class="gray_tab">
     		<h2> 해당 페이지는 준비중입니다.</h2>
        </div>
        <div class="go_main">
            <a href="index.do"><button class="btn">메인으로 돌아가기</button></a>
        </div>
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