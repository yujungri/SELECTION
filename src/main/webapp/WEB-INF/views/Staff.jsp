<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
    <%@ include file="assets/inc/same_css.jsp"%>
	<link rel="stylesheet" type="text/css" href="assets/css/header.css" />

	<style type="text/css">
	.staff li {
		padding: 20px 0;
		float:left;
		text-align:center;
		width: calc(50% - 2px);
    	border: 1px solid #eee;
        line-height: 20px;
        font-size:13px;
	}
	
	.staff li span {
		font-weight:bold;
        font-size:15px;
	}
	
	.staff li img {
		width: 50px;
    	height: 50px;
    	margin: 10px;
    	color: #000;
	}
	
	.clear {
        float: none;
        clear: both;
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
            <li class="title"><h1><strong>운영진</strong></h1></li>
            <li class="cart"><a href="cartList.do"><img src="assets/image/shopping_cart.png"></a></li>
        </ul>
    </div>

    <!-- 본문영역 -->
    <div id="content">
    	<div class="staff">
    	<ul>
    		<li><img src="assets/image/kyw.png"><br /><span>김영우</span><br />ewige239@gmail.com</li>
    		<li><img src="assets/image/lyj.png"><br /><span>이유정</span><br />jamie.leeyujung@gmail.com</li>
    		<li><img src="assets/image/lcy.png"><br /><span>이충연</span><br />choongyeon4344@gmail.com</li>
    		<li><img src="assets/image/jyj.png"><br /><span>정영재</span><br />jyj960330@gmail.com</li>
    		<li><img src="assets/image/cah.png"><br /><span>최아현</span><br />klley814@hanmail.net</li>
    		<li><img src="assets/image/hcg.png"><br /><span>한철규</span><br />hckckck1124@gmail.com</li>
    	</ul>
    	</div>
    	<div class="clear"></div>
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