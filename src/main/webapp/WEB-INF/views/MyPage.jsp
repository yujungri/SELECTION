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
    <link rel="stylesheet" type="text/css" href="assets/css/MyPage.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <%@ include file="assets/inc/same_css.jsp"%>
</head>

<body>
   <div id="header">
        <h2>마이페이지</h2>
        <a href="index.do"><img src="assets/image/close2.png"></a>
    </div>
    
   <div id="bottom">      
       <b class="user_name">${user.user_name}님 환영합니다.</b>
         <a href="UserLogout.do" class="logout"><img alt="로그아웃" src="assets/image/unlock.png"></a>
    </div>

     <div id="inner_container">
        <ul id="menu_bottom">
            <li><strong>배송중인 상품</strong></li>
            <li><strong>마이하트에 담긴 상품</strong></li>
            <li><span id="waitCount"></span></li>
            <li>${count}</li>
            <li><img src="assets/image/fix.png"><a href="Update_Info.do">개인정보변경</a></li>
            <li><img src="assets/image/del.png"><a href="${pageContext.request.contextPath}/orderList.do">주문/배송조회</a></li>
            <li><img src="assets/image/QnA.png"><a href="QnA.do">QnA</a></li>
            <li><img src="assets/image/ann.png"><a href="Announcement.do">공지사항</a></li>
            <li><img src="assets/image/out.png"><a href="Check_PW.do">회원탈퇴</a></li>
        </ul>
    </div>

    <!-- footer -->
    <%@ include file="assets/inc/footer.jsp"%>
    
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
    	});
    </script>
</body>
</html>