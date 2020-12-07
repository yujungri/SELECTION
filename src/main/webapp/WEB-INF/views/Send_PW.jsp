<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <%@ include file="assets/inc/same_css.jsp"%>
	<link rel="stylesheet" type="text/css" href="assets/css/header.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/Send_PW.css" />
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
    
    <!-- 이메일로 비밀번호 발송 -->
    <div class="content">
        <div class="msg">
            <p>안녕하세요, SELECTION 고객님,<br />요청하신 비밀번호는 <br />입력하신 메일 주소로 발송되었습니다.</p>
        </div>
        <div class="my_email">
            <ul>
                <li><p>발급시간 : <span id="e_time"></span></p></li>
            </ul>
        </div>
        <div class="msg_etc">
            <ul>
                <li>
                    <p>비밀번호는 메일로 발송되어 보안에 취약할 수 있으므로, <span>로그인 시 비밀번호 변경</span>을 해 주시기 바랍니다.</p>
                </li>
                <li>
                    <p>다른 문의사항이 있으시면<br />고객센터(02-1234-5678)로 문의해 주시기 바랍니다.
                    </p>
                </li>
                <li>
                    <p>감사합니다.</p>
                </li>
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

        // 이메일 전송시각(현재시각) 출력하기
        function print_time() {
            var dateString = "";
            var newDate = new Date();

            //String.slice(-2) : 문자열을 뒤에서 2자리만 출력한다. (문자열 자르기)
            dateString += newDate.getFullYear() + "년 ";
            dateString += ("0" + (newDate.getMonth() + 1)).slice(-2) + "월 "; //월은 0부터 시작하므로 +1을 해줘야 한다.
            dateString += ("0" + newDate.getDate()).slice(-2) + "일 ";
            dateString += ("0" + newDate.getHours()).slice(-2) + ":";
            dateString += ("0" + newDate.getMinutes()).slice(-2) + ":";
            dateString += ("0" + newDate.getSeconds()).slice(-2);
            //document.getElementById("#e_time").innerHTML = dateString;
            return dateString;
        }
        $("#e_time").html(print_time());
    });
    </script>
</body>
</html>