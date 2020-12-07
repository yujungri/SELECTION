<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 하단 메뉴바 -->
<div id="bottom_bar">
    <ul>
        <li><a href="#"><img src="assets/image/menu.png"></a></li>
        <li>
	        <c:if test="${user != null}"><a href="UserLogout.do"><img src="assets/image/unlock.png"></a></c:if>
	        <c:if test="${user == null}"><a href="Login.do"><img src="assets/image/lock.png"></a></c:if>
        </li>
        <li><a href="index.do"><img src="assets/image/home.png"></a></li>
        <li><a href="myHeartList.do"><img src="assets/image/heart.png"></a></li>
        <li><a href="MyPage.do"><img src="assets/image/person.png"></a></li>
    </ul>
</div>

<!-- 카테고리 바 -->
<div id="category_bar">
    <ul>
    	<li><a href="ProductAll.do">ALL</a></li>
        <li><a href="Best.do">BEST</a></li>
        <li><a href="New.do">NEW</a></li>
        <li><a href="Recommend.do">RECOMMEND</a></li>
        <li><a href="Top.do">TOP</a></li>
        <li><a href="Dress.do">DRESS</a></li>
        <li><a href="Pants.do">PANTS</a></li>
        <li><a href="Outer.do">OUTER</a></li>
        <li><a href="Acc.do">ACCESSORY</a></li>
        <li><a href="Announcement.do">NOTICE</a></li>
        <li><a href="QnA.do">Q&A</a></li>
    </ul>
</div>