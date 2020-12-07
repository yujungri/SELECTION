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
    <link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/index.css" />
    <link rel="stylesheet" href="assets/plugins/onepage/onepage-scroll.css" />

</head>
<body>
    <div id="header">
        <ul>
            <li class="search"><a href="#"><img src="assets/image/search.png"></a></li>
            <li class="logo"><a href="index.do"><span>THE <strong>SELECTION</strong>.COM</span></a></li>
            <li class="cart"><a href="cartList.do"><img src="assets/image/shopping_cart.png"></a></li>

            <form method="get" action="${pageContext.request.contextPath}/ProductAll.do" id="form2">
            <div class="searchbox">
                <input placeholder="search..." type="search" name="search" id="search" />
                <input type="image" src="assets/image/search.png" onclick="$('#form2').submit();" id="search_image"/>
            </div>
            </form>
        </ul>

        <div id="menu_bar">
            <ul>
                <li><a href="Best.do">베스트</a></li>
                <li><a href="New.do">신상품</a></li>
                <li><a href="Recommend.do">추천상품</a></li>
                <li><a href="Top.do">탑</a></li>
                <li><a href="Dress.do">드레스</a></li>
                <li><a href="Pants.do">팬츠</a></li>
                <li><a href="Outer.do">아우터</a></li>
                <li><a href="Acc.do">잡화</a></li>
            </ul>
        </div>
    </div>

    <div id="container">
        <div class="page" id="page1">
            <a href="Best.do" class="image_link"><img src="assets/image/2.jpg"></a>
            <div class="text">
                <h1>베스트 +</h1>
            </div>
            <div id="page_to_2" class="btn_down">
                <a href="#page2" class="active"><img src="assets/image/arrow_down2.png"></a>
            </div>
        </div>
        <div class="page" id="page2">
            <a href="New.do" class="image_link"><img src="assets/image/10.jpg"></a>
            <div class="text">
                <h1>신상품 +</h1>
            </div>
            <div id="page_to_3" class="btn_down">
                <a href="#page3"><img src="assets/image/arrow_down2.png"></a>
            </div>
        </div>
        <div class="page" id="page3">
            <a href="Recommend.do" class="image_link"><img src="assets/image/4.jpg"></a>
            <div class="text">
                <h1>추천상품 +</h1>
            </div>
            <div id="page_to_4" class="btn_down">
                <a href="#page4"><img src="assets/image/arrow_down2.png"></a>
            </div>
        </div>
        <div class="page" id="page4">
            <a href="Best.do" class="image_link"><img src="assets/image/5.jpg"></a>
            <div class="text">
                <h1>베스트 +</h1>
            </div>
            <div id="page_to_5" class="btn_down">
                <a href="#page5"><img src="assets/image/arrow_down2.png"></a>
            </div>
        </div>
        <div class="page" id="page5">
            <a href="New.do" class="image_link"><img src="assets/image/6.jpg"></a>
            <div class="text">
                <h1>신상품 +</h1>
            </div>
            <div id="page_to_6" class="btn_down">
                <a href="#page6"><img src="assets/image/arrow_down2.png"></a>
            </div>
        </div>
        <div class="page" id="page6">
            <div class="p_service">
                <br>
                <ul id="second_row" class="clear">
                    <li>
                        <img src="assets/image/box.png">
                        <p class="pt"><strong>무료배송</strong></p>
                        <p>모든 주문 건에 대해 무료 배송 서비스를 제공합니다.</p>
                    </li>
                    <li>
                        <img src="assets/image/gift.png">
                        <p class="pt"><strong>선물 포장</strong></p>
                        <p>고객님의 기프트는 개인 메시지와 함께 배송됩니다.</p>
                    </li>
                    <li>
                        <img src="assets/image/refund.png">
                        <p class="pt"><strong>7일 이내 무료 반품</strong></p>
                        <p>제품 수령 후 7일 이내에 무료 반품이 가능합니다.</p>
                    </li>
                    <li>
                        <img src="assets/image/heart1.png">
                        <p class="pt"><strong>complimentary 서비스</strong></p>
                        <p>첫 구매 시 소정의 셀렉션 기프트 박스 증정</p>
                    </li>
                </ul>
            </div>
            <ul id="first_row">
                <li>
                 	<c:if test="${user != null}"><a href="UserLogout.do">로그아웃<img src="assets/image/next.png"></a></c:if>
					<c:if test="${user == null}"><a href="Login.do">로그인<img src="assets/image/next.png"></a></c:if>

                </li>
                <li>
                    <a href="CustomerService.do">고객센터<img src="assets/image/next.png"></a>
                </li>
                <li>
                    <a href="Store_Info.do">매장안내<img src="assets/image/next.png"></a>
                </li>
            </ul>
            <ul id="last_row">
                <li>고객센터 1800-3690 &nbsp;&nbsp; | &nbsp;&nbsp; 서울시 강남구 테헤란로 123 &nbsp;&nbsp; | &nbsp;&nbsp; (주)Group Three</li>
                <li>사업자등록번호 : 123-89-234567</li>
                <li>
                    <address>COPYRIGHT © 2020 SELECTION. ALL RIGHT RESERVED</address>
                </li>
            </ul>
        </div>
    </div>

    <div id="side">
        <a href="#page1" class="top"><img src="assets/image/arrow_up.png"></a>
    </div>

    <!-- bottom_bar -->
    <%@ include file="assets/inc/bottom_bar.jsp"%>


    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="assets/plugins/onepage/jquery.onepage-scroll.min.js"></script>
    <script src="assets/js/click.js"></script>
    <script type="text/javascript">
        $(function() {
            /** 섹션들을 묶는 박스에게 플러그인 함수 적용  */
            $("#container").onepage_scroll({
                sectionContainer: ".page",      // 하나의 섹션을 구성하는 클래스이름
                easing: "ease",         // 애니메이션 가속 종류 (ease,linear,ease-in,ease-out,ease-in-out)
                animationTime: 700,     // 재생시간
                pagination: false,       // 페이지 위치 표시여부(화면 오른쪽의 동그란 버튼)
                loop: false,             // 페이지 반복 표시 여부 (3페이지-->1페이지)
                keyboard: true,         // 키보드 처리 여부(방향키에 따른 화면 전환)
                direction: "vertical",  // 스크롤 방향 (vertical=세로, horizontal=가로)
            });
        });
    </script>
</body>
</html>