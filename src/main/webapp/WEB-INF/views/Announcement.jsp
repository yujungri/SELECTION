<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
     <%@ include file="assets/inc/same_css.jsp"%>
    <link rel="stylesheet" type="text/css" href="assets/css/header2.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/Announcement.css" />
</head>

<body>
     <!-- 헤더 -->
    <div id="header">
        <ul>
            <li class="back"><a href="javascript:history.back()"><img src="assets/image/back.png"></a></li>
            <li class="home"><a href="index.do"><img src="assets/image/home.png"></a></li>
            <li class="search"><a href="#"><img src="assets/image/search.png"></a></li>
            <form method="get" action="${pageContext.request.contextPath}/ProductAll.do" id="form2">
            <div class="searchbox">
                <input placeholder="search..." type="search" name="search" id="search" />
                <input type="image" src="assets/image/search.png" onclick="$('#form2').submit();" id="search_image"/>
            </div>
            </form>
            <li class="title"><h1>공지사항</h1></li>
            <li class="cart"><a href="cartList.do"><img src="assets/image/shopping_cart.png"></a></li>
        </ul>
    </div>
      </div>

    <div class="btn_block" id="event">
       <br> <br><h1>새로운 소식과 이벤트 및 기획전을 알려드립니다.</h1>

    </div>
     <!-- 전체박스 -->
        <div class="collapse">
            <!-- 게시글 하나 단위 -->
            <div class="collapse-item">
                <!-- 게시글 제목영역 -->
                <div class="collapse-title"><a href="#content1"> <p id="date"> 2020.09.27</p><br>
                    <span class='high'>[공지]</span> 셀렉션닷컴 개인정보처리방침 개정 안내</a></div>
                <!-- 게시글 내용영역 -->
                <div id="content1" class="content"><p><br><br>안녕하세요. 더셀렉션닷컴입니다.<br>
                개인정보처리방침이 일부 개정되어 아래와 같이 변경하오니 안내 드립니다.<br><br>


              <br> ■ 개인정보처리방침 개정 안내<br>
                    - 개정일자 : 2020. 07. 23<br>
                    - 개정내용 <br>

                <br> <br>
               1. 제2조 개인정보의 수집항목 및 이용목적 <br>
             <br>- 회원가입 및 주문 등 필요시점에 수집하는 개인정보의 범위 수정
            <br>- 서비스 이용과정에서 생성되는 정보 수정
            <br>- 앱 설치 시 접근권한 안내 수정
            <br>

                <br>
                감사합니다.<br><br>


                </p>
                 </div>
                  </div>

            <!-- 게시글 하나 단위 -->
            <div class="collapse-item">
                <!-- 게시글 제목영역 -->
                <div class="collapse-title"><a href="#content2"> <p id="date"> 2020.06.12</p><br>
                 <span class='high'>[공지]</span> 서비스 점검 안내 (6/16, 03시 ~ 04시)</a></div>
                <!-- 게시글 내용영역 -->
                <div id="content2" class="content"><p><br><br>안녕하세요, 더셀렉션닷컴 입니다.<br>
                6월 16일 새벽 03시 ~ 04시 더셀렉션닷컴 서비스 점검 안내드립니다.<br><br>

                더설셀렉션닷컴 서비스 품질 향상을 위한 시스템 작업이 있을 예정입니다.<br>
                고객님의 서비스 이용에 불편을 드려 죄송합니다.<br><br>

              <br>  ■ 더셀렉션닷컴 서비스 점검
               <br> - 서비스 점검일시 : 2020. 06. 16(화) 03:00 ~ 04:00
              <br>  - 중단 서비스 : 더한섬닷컴 사이트 다운
               <br> - 점검내용 : 더한섬닷컴 시스템 작업<br><br>

            </div>
            </div>
            <!-- 게시글 하나 단위 -->
            <div class="collapse-item">
                <!-- 게시글 제목영역 -->
                <div class="collapse-title"><a href="#content3"> <p id="date"> 2020.05.29</p><br>
                <span class='high'>[이벤트]&nbsp [당첨자발표]</span> 5월 베스트 리뷰 TOP5 안내</a></div>
                <!-- 게시글 내용영역 -->
                <div id="content3" class="content">
                    <p><br><br>안녕하세요, 더셀렉션닷컴입니다.<br>

                    더한섬닷컴 5월 베스트 리뷰 TOP5 이벤트의 당첨자를 발표합니다 ♥<br><br>

                    [이벤트 정보]<br>
                    ㅇ이벤트명 : 더셀렉션닷컴 5월 베스트 리뷰 TOP5 이벤트<br>
                    ㅇ기간 : 2020년 5월 1일 ~ 5월 31일<br>
                    ㅇ대상 : 매월 1일 ~ 매월 말일 상품평 작성하여 베스트 리뷰로 선정된 고객(온라인&오프라인 전체)<br>
                    ㅇ혜택 : 베스트 리뷰 TOP5로 선정된 5명에게 더설렉션닷컴 10만원 바우처 증정<br>
                    * 바우처 사용 조건 : 발급일로부터 1개월 내 더설렉션닷컴에서 구매 시 사용 가능(캐시미어 띵즈 제외)<br><br>

                    바우처는 '20.6/14일에 발급되었으며, 마이페이지>나의 쿠폰함에서 확인하실 수 있습니다.<br><br>

                    [대상자 발표]<br>

                    더설렉션닷컴 10만원 바우처 (5명)<br>
                a**cia0528<br>
                k**269<br>
                l**amint<br>
                s**ngwone<br>
                s**jsy@naver.com<br><br>

                앞으로도 베스트 리뷰어 이벤트에 많은 참여 부탁드립니다.<br>
                    감사합니다.<br><br><br>

                    </p>
                </div>
            </div>
        </div>
<div id="pagination" class="hs_paging bottom">
    <a href="javascript:void(0);" class="pre disabled"> << </a>
    <a href="javascript:void(0);" class="cur">1</a>
    <a href="javascript:#" class="nxt"> >> </a>
</div>

    <div class="section_bottom_bar">
    <div class="txt_box">
        <p id="cust">고객센터 </p>
        <p id="tel"><strong>1800-1234</strong></p>
        <p id="hour">운영시간</p>
        <p id="long">평일(월~금) 09:00 ~ 18:00 (토/일, 공휴일 휴무)</p>
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
          });
         $(function() {

            $("#bottom_bar li:first-child").click(function(e) {
                e.preventDefault();
                $("#category_bar").slideToggle(100);
            });


            $(".top").click(function(e) {
                e.preventDefault();
                $("#container").moveTo($(this).index() + 1);
            });
        });
    </script>
     <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript">
            $(function() {
                /** 게시글의 제목을 클릭한 경우 호출되는 이벤트 정의 */
                $(".collapse-title a").click(function(e) {
                    // 링크의 기본 동작(페이지 이동) 방지
                    e.preventDefault();

                    // 클릭한 요소의 href 속성을 가져온다 --> 내용영역의 id
                    var target = $(this).attr('href');
                    // 가져온 내용영역의 id를 화면에 표시한다.
                    $(target).slideToggle(100);
                    // 내용영역(.content)중에서
                    // 클릭한 요소가 지정한 항목만 제외(not($(target)))
                    // 하고 화면에서 숨긴다.
                    $(".content").not($(target)).slideUp(100);
                });
            });
        </script>
</body>
</html>