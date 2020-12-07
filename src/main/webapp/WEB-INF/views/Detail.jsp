<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>THE SELECTION</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/detail.css" />
</head>

<body>
<div id="body">
    <!-- 헤더 -->
    <div id="header">
        <ul>
            <li class="back"><a href="javascript:history.back()"><img src="${pageContext.request.contextPath}/assets/image/back.png"></a></li>
        </ul>
        <div>
			<form name="form2" method="post" id="heartForm">
				<input type="hidden" id="product_no" value="${product.product_no}" />
            	<input type="hidden" id="product_img" value="${product.product_img}" />
            	<input type="hidden" id="product_name" value="${product.product_name}" />
            	<input type="hidden" id="product_price" value="${product.product_price}" />
            	<input type="hidden" id="product_brand" value="${product.product_brand}" />
            	<input type="hidden" id="myHeart_no" value="${heart.myheart_no}" />
                <a class="btn btn-outline-dark heart">
                    <img id="heart" src="">
				</a>
				<div id="pop_container_myheart">
                  <div id="pop_myheart">
                       <span>로그인이 필요합니다.</span>
                       <img src="${pageContext.request.contextPath}/assets/image/close2.png">
                       <button type="button" id="button_myheart">확인</button>
                  </div>
              </div>
			</form>
		</div>
    </div>

    <!-- 내용 -->
    <div id="content">
        <div class="image">
            <img src="${pageContext.request.contextPath}/${product.product_img}" alt="사진">
        </div>
        <div class="summary">
            <div class="info">
                <div class="logo">
                    ${product.product_brand}
                </div>
                <div class="name">
                   	${product.product_name}
                </div>
                <div class="price">
                    <span>₩</span><fmt:formatNumber value="${product.product_price}" pattern="###,###,###"/>
                </div>
                <div class="pos_num" id="pn">
                    S2E0L2E0C0T9I2O0N_${product.product_no}
                </div>
            </div>

            <div class="size">
                <p>사이즈</p>
                <div class="size_area">
                	<button class="btn_free">free</button>
                    <button class="btn_size">S</button>
                    <button class="btn_size">L</button>
                </div>
            </div>
        </div>

        <div class="explanation">
            <p class="item_txt">
            	${product.product_content}
            <br>
            <br>
            - 피팅 정보 : 173cm, 45 사이즈 모델이 S 사이즈 착용
            </p>
            <div class="collapse-item">
                <a href="#content1" class="col_a">상품상세정보</a>
                <div id="content1" class="con">
                    <div>
                        <ul>
                            <li>
                                <span class="con1_tit">상품품번</span>
                                <span class="con1_txt">O22A8WTO107W</span>
                            </li>
                            <li>
                                <span class="con1_tit">품목</span>
                                <span class="con1_txt">의류</span>
                            </li>
                            <li>
                                <span class="con1_tit">소재</span>
                                <span class="con1_txt">겉감 PL : 폴리에스터 100%, 안감 PL : 폴리에스터 100%(BK)</span>
                            </li>
                            <li>
                                <span class="con1_tit">색상</span>
                                <span class="con1_txt">BK(BLACK)</span>
                            </li>
                            <li>
                                <span class="con1_tit">사이즈</span>
                                <span class="con1_txt">76, 82, 88</span>
                            </li>
                            <li>
                                <span class="con1_tit">제조국</span>
                                <span class="con1_txt">한국</span>
                            </li>
                            <li>
                                <span class="con1_tit">제조사</span>
                                <span class="con1_txt">(주)SELECT</span>
                            </li>
                            <li>
                                <span class="con1_tit">제조연월</span>
                                <span class="con1_txt">2020/07</span>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <ul>
                            <li>
                                <span class="con1_tit_2">품질보증기준</span>
                                <p>1. 본 제품은 정부 고시 소비자 분쟁해결 기준에 의거 고객의 정당한 피해를 보상해드립니다.
                                <br>
                                - 원단 불량, 부자재 불량, 봉제 불량, 사이즈 부정확, 부당 표시(미표시 및 부실표시) 및 소재 구성 부적합으로 인한 세탁 사고 : 구입일로부터 1년 이내분은 무상수리, 교환, 구입가 환불함. (단, 봉제 불량은 1년 경과 후에도 무상 수선 가능)
                                <br>
                                - 사이즈가 맞지 않거나 디자인, 색상 불만 제품 : 구입 후 7일 이내로서 제품에 손상이 없는 경우 동일 가격, 동일 제품으로 교환 가능.
                                <br>
                                - 상하의 한 벌(세트/일착)인 경우 한 쪽에만 이상이 있어도 한 벌(세트/일착)로 처리함. 단, 소재 및 디자인이 다른 경우에는 해당 의류만 교환 가능.
                                <br>
                                2. 소비자 부주의에 의한 제품 훼손, 세탁 잘못으로 인한 변형 및 품질 보증기간(1년)이 경과한 제품에 대해서는 보상의 책임을 지지 않으며, 수선 가능시에는 실비로 수선해드립니다.
                                <br>
                                3. 제품에 이상이 있는 경우 바로 본사로 연락주시면 수선/교환/환불이 가능하나, 타업체(일반 수선실 등)에서 수선했을 경우는 불가능합니다.
                                </p>
                            </li>
                            <li>
                                <span class="con1_tit_2">세탁방법 및 취급 시 주의사항</span>
                                <p>
                                본 제품은 반드시 드라이크리닝 하십시오. 세탁 시 이염, 변색, 탈색될 수 있으니 유의하시기 바랍니다. 단추나 악세서리는 세탁 시 손상될 수 있으므로 은박지로 싸거나 분리하여 주십시오. 특성상 마찰에 의해 올 뜯김 등 원단 손상이 발생할 수 있으니 취급 시 주의하시기 바랍니다.
                                </p>
                            </li>
                            <li>
                                <span class="con1_tit_2">AS 책임자와 연락처</span>
                                <p>
                                (주)SELECT/010-1234-5678
                                </p>
                            </li>
                        </ul>
                        <p class="btm_txt">위 내용은 상품정보제공 고시에 따라 작성되었습니다.</p>
                    </div>
                </div>
            </div>
            <div class="collapse-item">
                <span><a href="#content2" class="col_a">SNAPFIT</a></span>
                <div id="content2" class="con">
                    <div class="snap clear">
                        <p>
                            <span>키</span>
                            <input type="number" id="height">
                        </p>
                        <p>
                            <span>몸무게</span>
                            <input type="number" id="weight">
                        </p>
                        <p>
                            <span>허벅지</span>
                            <input type="number" id="thigh">
                        </p>
                        <p>
                            <span>허리둘레</span>
                            <input type="number" id="waist">
                        </p>
                        <p>
                            <button class="size_search">사이즈 찾기</button>
                        </p>
                    </div>
                    <div class="fit">
                        <p>고객님에게 맞는 사이즈 : <span id="snap_size"></span></p>
                    </div>
                </div>
            </div>
            <div class="collapse-item">
                <span><a href="#content3" class="col_a">배송 및 반품</a></span>
                <div id="content3" class="con">
                    <div class="con3_delivery">
                        <p class="con3_p">배송안내</p>
                        <ul>
                            <li>
                                <span class="con3_tit">배송방식</span>
                                <span class="con3_txt">우체국택배, CJ대한통운</span>
                            </li>
                            <li>
                                <span class="con3_tit">배송지역</span>
                                <span class="con3_txt">전국 (일부 지역 제외)</span>
                            </li>
                            <li>
                                <span class="con3_tit">배송정보</span>
                                <span class="con3_txt">평균 입금완료일 기준 2 ~ 4일 소요됩니다.
                                <br>
                                (토/일/공휴일 제외)
                                </span>
                            </li>
                            <li>
                                <span class="con3_tit">배송비</span>
                                <span class="con3_txt">결제금액 기준 30,000원 이상 결제 시 무료배송
                                <br>
                                30,000원 미만 결제 시 2,500원(기본 배송비)
                                <br>
                                * 도서산간 지역은 3,000원의 별도 배송비가 부과됩니다.
                                <br>
                                * 일부 도서지역은 도선료가 부가될 수 있습니다.
                                </span>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <p class="con3_p">반품안내</p>
                        <ul>
                            <li>
                                <span class="con3_tit">반품기간</span>
                                <span class="con3_txt">상품 수령 후, 7일 이내</span>
                            </li>
                            <li>
                                <span class="con3_tit">반품절차</span>
                                <span class="con3_txt">[배송완료] 7일 이내에 마이페이지 주문/배송/취소/반품 메뉴에서 [반품신청] 버튼을 클릭 시 가능합니다.</span>
                            </li>
                            <li>
                                <span class="con3_tit">반품<br>배송비</span>
                                <span class="con3_txt">판품비는 주문시 배송비 결제 유무에 따라 변동되며 상품 불량 등의 이유로 반품하실 경우, 배송비는 무료입니다.
                                </span>
                            </li>
                            <li>
                                <span class="con3_tit">반품 불가사유</span>
                                <span class="con3_txt">다음의 경우에는 반품이 불가합니다.
                                <br>
                                - 반품 기간(상품 수령 후 7일 이내)을 초과하였을 경우
                                <br>
                                <br>
                                - 고객님의 요청에 의해 제품 사양이 변경(이니셜 제품, 사이즈 맞춤 제품 등)된 경우
                                <br>
                                <br>
                                - 제품을 이미 사용하였거나, 제품 일부를 소비하였을 경우
                                <br>
                                <br>
                                - 식기류 : 제품 수령 후, 비닐포장을 개봉한 경우
                                <br>
                                <br>
                                - 고객님의 귀책사유로 인해 회수가 지연될 경우
                                <br>
                                <br>
                                - 국내외 환율 변동 등에 의해 가격이 변동되는 제품의 경우
                                <br>
                                <br>
                                - 문제소지가 있는 제품을 본사가 아닌, 타 업체(일반 수선실 등)에서 선처리가 된 경우
                                </span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="collapse-item">
                <span><a href="${pageContext.request.contextPath}/QnA.do">Q&A</a></span>
            </div>
        </div>
    </div>

    <div id="footer">
     <a id="insertCart" href="#none">쇼핑백담기</a>
    </div>
</div>

    <div id="modal">
        <div id="upperArea">
            <img id="modalClose" src="${pageContext.request.contextPath}/assets/image/close2.png">
        </div>
        <div id="lowerArea" class="checks">
            <form id="myform" action="${pageContext.request.contextPath}/cartInsert.do" name="form1" method="post">
                <input type="hidden" name="product_no" value="${product.product_no}">
                <div id="formColor">
                     <span class="select">컬러</span>
                    <input type="radio" name="color" value="Red" id="red"/><label for="red"></label><span>Red</span>
                    <input type="radio" name="color" value="Blue" id="blue"/><label for="blue"></label><span>Blue</span>
                </div>
                <div id="formSize">
                        <span class="select">사이즈</span>
                    <input type="radio" name="size" value="S" id="s"/><label for="s"></label><span>S</span>
                    <input type="radio" name="size" value="L" id="l"/><label for="l"></label><span>L</span>
                </div>
                <div id="formDelivery">
                        <span class="select">배송방법</span>
                     <input type="radio" name="delivery" value="택배" id="delivery"/><label for="delivery"></label><span>택배</span>
                     <input type="radio" name="delivery" value="방문수령" id="visited"/><label for="visited"></label><span>방문수령</span>
                </div>
                <div id="formCount">
                    <div id="numberChange">
                        <button type="button" class="minus">-</button>
                        <input id="cartQty" type="text" value="1" name="amount" readonly>
                        <button type="button" class="plus">+</button>
                    </div>
                    <!-- <p>₩<fmt:formatNumber value="${product.product_price}" pattern="###,###,###"/></p> -->
                    <p>₩${product.product_price}</p>
                </div>
                <button id="confirmButton" type="button">선택완료</button>

                <div id="pop_container">
                  <div id="pop">
                       <span>장바구니에 상품이 담겼습니다.</span>
                      <img src="${pageContext.request.contextPath}/assets/image/close2.png">
                       <button type="submit">장바구니로 이동</button>
                  </div>
              </div>

              <div id="pop_container_color">
                  <div id="pop_color">
                       <span>색상을 선택해 주세요.</span>
                      <img src="${pageContext.request.contextPath}/assets/image/close2.png">
                       <button type="button" id="button_color">확인</button>
                  </div>
              </div>

              <div id="pop_container_size">
                  <div id="pop_size">
                       <span>사이즈를 선택해 주세요.</span>
                      <img src="${pageContext.request.contextPath}/assets/image/close2.png">
                       <button type="button" id="button_size">확인</button>
                  </div>
              </div>

              <div id="pop_container_delivery">
                  <div id="pop_delivery">
                       <span>배송방법을 선택해 주세요.</span>
                      <img src="${pageContext.request.contextPath}/assets/image/close2.png">
                       <button type="button" id="button_delivery">확인</button>
                  </div>
              </div>
              
              <div id="pop_container_delivery">
                  <div id="pop_delivery">
                       <span>배송방법을 선택해 주세요.</span>
                      <img src="${pageContext.request.contextPath}/assets/image/close2.png">
                       <button type="button" id="button_delivery">확인</button>
                  </div>
              </div>
            </form>
        </div>

    </div>

    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
    $(function() {
        var price = ${product.product_price};
        $("#formCount p").html("₩" + price.toLocaleString());
		// 화면로드시 찜하기 초기값 설정
		var heartval = $("#myHeart_no").val();

        if(heartval > 0) {
            $("#heart").prop("src", "../assets/image/heart.png");
            $(".heart").prop('name',heartval)
        }
        else {
            $("#heart").prop("src", "../assets/image/heart_none.png");
            $(".heart").prop('name',heartval);

        };

        $(".heart").on("click", function () {

        	var that = $(".heart");
        	var heartVal = that.attr("name");
        	var setHeartVal = null;

        	// 찜하기 setHeartVal 선택->해제(0) 해제->선택(1)
        	if(heartVal > 0){
        		setHeartVal = 0;
        	} else {
        		setHeartVal = 1;
        	}
			var a = $('#product_no').val();
			console.log(heartVal);
            var sendData = {"setHeartVal":setHeartVal,"product_no":a};

            $.ajax({
                url :"${pageContext.request.contextPath}/myheartInsert.do",
                type :'POST',
                data : sendData,
                success : function(data){
					// Login return시 Login 페이지 이동
					if(data == "Login"){
						// alert("로그인이 필요합니다.");
						// return false;
						$("#pop_container_myheart").fadeIn(300);
                 		$("#pop_myheart").fadeIn(300);
                 		$("#button_myheart").fadeIn(300);
                 		$('.body').css({'overflow': 'hidden', 'height': '100%'});
                 		
                 		$("#button_myheart").click(function() {
                 			location.href = "${pageContext.request.contextPath}/Login.do";
                    	});
                 		
                 		// 팝업창 닫기
                        $("#pop_myheart img").click(function() {
                                $("#pop_container_myheart").fadeOut(300);
                                $("#pop_myheart").fadeOut(300);
                                $('.body').css({'overflow': 'auto', 'height': '100%'});
                        });	
					};

                    if(data==1) {
                        $('#heart').prop("src","../assets/image/heart.png");
                        that.prop('name',data);
                    }
                    else{
                        $('#heart').prop("src","../assets/image/heart_none.png");
                        that.prop('name',data);
                    }
                }
            });
        });

       	$("#insertCart").click(function(e) {
                e.preventDefault();
                $("#modal").addClass("open");
                $("#modal").css('overflow', 'auto');
                $('#body').css({'overflow': 'hidden', 'height': '100%'});
        });

        $("#modalClose").click(function(e) {
                $("#modal").removeClass("open");
                $('#body').css({'overflow': 'auto', 'height': '100%'});
        });

        // 팝업창 열기
        $("#confirmButton").click(function(e) {
               e.preventDefault();
               var color = $("input[name='color']:checked").val();
               var size = $("input[name='size']:checked").val();
               var delivery = $("input[name='delivery']:checked").val();

               if (!color) { // 색상선택 팝업창
                 $("#pop_container_color").fadeIn(300);
                 $("#pop_color").fadeIn(300);
                 $("#button_color").fadeIn(300);
                 $('#modal').css({'overflow': 'hidden', 'height': '100%'});
               } else if (!size) { // 사이즈선택 팝업창
                 $("#pop_container_size").fadeIn(300);
                 $("#pop_size").fadeIn(300);
                 $("#button_size").fadeIn(300);
                 $('#modal').css({'overflow': 'hidden', 'height': '100%'});
               } else if (!delivery) { // 배달방식선택 팝업창
                 $("#pop_container_delivery").fadeIn(300);
                 $("#pop_delivery").fadeIn(300);
                 $("#button_delivery").fadeIn(300);
                 $('#modal').css({'overflow': 'hidden', 'height': '100%'});
               } else { // 장바구니로 이동 팝업창
                 $("#pop_container").fadeIn(300);
                 $("#pop").fadeIn(300);
                 $("#button_color").fadeIn(300);
                 $('#modal').css({'overflow': 'hidden', 'height': '100%'});
               }
        });

        // 팝업창 닫기
        $("#pop img").click(function() {
                $("#pop_container").fadeOut(300);
                $("#pop").fadeOut(300);
                $('#modal').css({'overflow': 'auto', 'height': '100%'});
        });

        // 색상 팝업창 닫기
        $("#button_color").click(function() {
                $("#pop_container_color").fadeOut(300);
                $("#pop_color").fadeOut(300);
                $("#button_color").fadeOut(300);
                $('#modal').css({'overflow': 'hidden', 'height': '100%'});
        });

        $("#pop_color img").click(function() {
                $("#pop_container_color").fadeOut(300);
                $("#pop_color").fadeOut(300);
                $("#button_color").fadeOut(300);
                $('#modal').css({'overflow': 'hidden', 'height': '100%'});
        });

        // 사이즈 팝업창 닫기
        $("#button_size").click(function() {
                $("#pop_container_size").fadeOut(300);
                $("#pop_size").fadeOut(300);
                $("#button_size").fadeOut(300);
                $('#modal').css({'overflow': 'hidden', 'height': '100%'});
        });

        $("#pop_size img").click(function() {
                $("#pop_container_size").fadeOut(300);
                $("#pop_size").fadeOut(300);
                $("#button_size").fadeOut(300);
                $('#modal').css({'overflow': 'hidden', 'height': '100%'});
        });

        // 배달방식 팝업창 닫기
        $("#button_delivery").click(function() {
                $("#pop_container_delivery").fadeOut(300);
                $("#pop_delivery").fadeOut(300);
                $("#button_delivery").fadeOut(300);
                $('#modal').css({'overflow': 'hidden', 'height': '100%'});
        });

        $("#pop_delivery img").click(function() {
                $("#pop_container_delivery").fadeOut(300);
                $("#pop_delivery").fadeOut(300);
                $("#button_delivery").fadeOut(300);
                $('#modal').css({'overflow': 'hidden', 'height': '100%'});
        });

        // 수량 선택
        $("button.minus").click(function() {
                var price = ${product.product_price};
                var n = parseInt($("#cartQty").val());
                if (n > 1) {
                    n--;
                    $("#cartQty").val(n);
                }

                $("#formCount p").html("₩" + (price * n).toLocaleString());

        });

        // 수량 선택
        $("button.plus").click(function() {
                var price = ${product.product_price};
                var n = parseInt($("#cartQty").val());
                n++;
                $("#cartQty").val(n);

                $("#formCount p").html("₩" + (price * n).toLocaleString());
        });

        $(".btn_size").click(function() {
             $(this).addClass('btn_size2')
             $(".btn_size").not($(this)).removeClass('btn_size2');
        });

        $(".explanation .col_a").click(function(e) {
             e.preventDefault();
             var target = $(this).attr('href');
             $(target).slideToggle(100);
             $(".con").not($(target)).slideUp(100);
        });

        $(".size_search").click(function(){
             var height = $("#height").val() / 100;
             var weight = $("#weight").val();
             var size = $("#snap_size").val();
             var BMI = weight / (height * height);
             BMI = BMI.toFixed(2);
             if (BMI < 18.5) {
                 size = "S";
                 $("#snap_size").text(size);
             } else if (BMI >= 18.5) {
                 size = "L";
                 $("#snap_size").text(size);
             } else {
             	$("#snap_size").text(size);
             }
        });

         var pn = $("#pn").html().trim();
         var pn_len = pn.length;
         var pn_value = pn.substring(pn_len - 3, pn_len)
         if (pn_value > 200 && pn_value <= 250) {
             $(".btn_size").css("display", "none");
             $(".btn_free").css("display", "inline-block");
             $(".size_area").addClass("btn_free");

             $(".btn_free").click(function() {
                 $(this).addClass("btn_size2");
             });
         }
     });
    </script>
</body>
</html>