<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="assets/inc/same_css.jsp"%>
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/Store_Info.css" />
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
            <li class="title"><h1>매장안내</h1></li>
            <li class="cart"><a href="cartList.do"><img src="assets/image/shopping_cart.png"></a></li>
        </ul>
    </div>

    <div id="content">
    
    <div id="map" style="width:100%;height:300px;"></div>


        <div class="parent" id="box2">
        </div>

        <div class="address">
            <hr>
            <li> 주소: 서울특별시 서초구 서초대로77길 54 서초 W타워 13,14층</li>
            <hr />
            <li> 위치: 강남역 10번출구 150M</li>
            <hr />
            <li> 전화: 02-532-6500 </li>
            <hr />
            <li> 팩스: 02-532-6508</li>
            <hr />
      </div>
  </div>
  
 	<!-- footer -->
    <%@ include file="assets/inc/footer.jsp"%>

    <!-- bottom_bar -->
    <%@ include file="assets/inc/bottom_bar.jsp"%>
    
    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
  	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=845343db37c73939663ec4d07bfd5259"></script>
	<script>
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
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(37.502243, 127.024388), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다
		var markerPosition = new kakao.maps.LatLng(37.502243, 127.024388);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 마커가 드래그 가능하도록 설정합니다
		marker.setDraggable(true);
	</script>
</body>
</html>