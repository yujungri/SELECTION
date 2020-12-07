<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="footer">
    <ul id="first_row">
        <li>
        	<c:if test="${user != null}"><a href="UserLogout.do">로그아웃</a></c:if>
            <c:if test="${user == null}"><a href="Login.do">로그인</a></c:if>
        </li>
        <li>
            <a href="CustomerService.do">고객센터</a>
        </li>
        <li>
            <a href="Store_Info.do">매장안내</a>
        </li>
    </ul>
    <ul id="second_row">
        <li>
            <a href="#">회원혜택</a>
        </li>
        <li>
            <a href="Staff.do">회사소개</a>
        </li>
        <li>
            <a href="http://itproject.ezenac.co.kr/springmyshop/">FAMILY SITE</a>
        </li>
    </ul>
    <ul id="third_row">
    	<li>(주)Group Three</li>
        <li>서울시 강남구 테헤란로 123</li>
        <li>고객센터 1800-3690</li>
    </ul>
    <ul id="last_row">
        <li>사업자등록번호 : 123-89-234567</li>
    </ul>
    <ul id="address" class="clear">
        <li>
            <address>COPYRIGHT © 2020 SELECTION. ALL RIGHT RESERVED</address>
        </li>
    </ul>
</div>