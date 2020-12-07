<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    <link rel="stylesheet" type="text/css" href="assets/css/header2.css">
    <link rel="stylesheet" type="text/css" href="assets/css/payment.css">



</head>
<body>
     <div id="header">
        <ul>
            <li class="back"><a href="#" class="back2" onclick="history.back(); return false;"><img src="assets/image/back.png"></a></li>
            <li class="home"><a href="index.do"><img src="assets/image/home.png"></a></li>
            <li class="logo"><a href="#" class="logo2"><span> <strong>배송&결제정보 입력</strong></span></a></li>
            <li class="cart"><a href="cartList.do" class="cart2"><img src="assets/image/shopping_cart.png"></a></li>
        </ul>
    </div>
    <hr />

    <div id="container">
            <c:set var="sum" value="0" />
            <c:forEach var="row" items="${list}">
                <div class="order_box">
                    <ul class="order_item_ul">
                        <li>
                            <div class="order_item_content">
                                <div class="order_item_img"><img src="${pageContext.request.contextPath}/${row.product_img}"></div>
                                <ul>
                                    <li class="first"><span class="item_name">${row.product_brand}</span>
                                    <li class="first_half"><span>${row.product_name}</span></li>
                                    <li class="second"><span>${row.color} / ${row.size} / ${row.amount}개</span></li>
                                    <li class="third"><span>₩<fmt:formatNumber pattern="###,###,###" value="${row.product_price*row.amount}" /></span></li>
                                    <li class="fourth"><span class="stage">${row.delivery}</span></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            <c:set var="sum" value="${sum + (row.product_price * row.amount)}" />
            </c:forEach>
            <div id="delivery_info">
               <h1 class="dcc">사용자 배송지 정보</h1>
               <h2>(${user.postcode})&nbsp ${user.address} ${user.address_detail}</h2>
            </div>
    </div>

    <div class="total">
       <ul>
           <li class="payall">
                <a href=""><span class="btn_t_1">최종 결제금액</span><span class="btn_t_2">
                <b><fmt:formatNumber pattern="###,###,###" value="${sum}" /> 원</b></span></a>
           </li>
           <li>
               <div class="story">상품합계</div>
               <div class="money"><fmt:formatNumber pattern="###,###,###" value="${sum}" /> 원</div>
           </li>
           <li>
               <div class="story">배송비</div>
               <div class="money">0 원</div>
           </li>
       </ul>
    </div>

    <div>
        <form method="post" action="${pageContext.request.contextPath}/orderInsert.do" id="orderForm">
            <input type="hidden" name="prodArr" id="prodArr" value="" />
            <input type="hidden" name="cartArr" id="cartArr" value="" />
            <input type="hidden" name="amountArr" id="amountArr" value="" />
            <input type="hidden" name="deliveryArr" id="deliveryArr" value="" />
            <input type="hidden" name="sizeArr" id="sizeArr" value="" />
            <input type="hidden" name="colorArr" id="colorArr" value="" />
            <input type="hidden" name="order_total" value="${sum}" />
                <div id="delivery_form">
                    <div>
                        <label for="">수령인</label>
                        <input type="text" name="rec" value="${user.user_name}" />
                    </div>
                <div class="form-group">
                    <div class="col-md-10">
                        <div id="findadd">
                            <label for="">우편번호</label><input type="text" name="postcode" id="sample6_postcode" value="${user.postcode}" class="form-control postcode">
                            <input type="button" id="sample6_postcode_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="form-control postcode">
                            <label for="">주소</label><input type="text" name="address" id="sample6_address" value="${user.address}" class="form-control">
                            <label for="">상세주소</label><input type="text" name="address_detail" id="sample6_detailAddress" value="${user.address_detail}" class="form-control">
                        </div>
                    </div>
                </div>
                    <div class="orderbtn">
                        <button type="button" id="orderSubmit">주문</button>
                        <button type="button" id="ordercancel" onclick="history.back();">취소</button>
                    </div>

                    <div id="modal">
                        <div id="pop_container">
                            <div id="pop">
                                <span>상품을 주문하시겠습니까?</span>
                                <img src="${pageContext.request.contextPath}/assets/image/close2.png">
                                <button id="button_y" type="button">예</button>
                                <button id="button_n" type="button">아니오</button>
                            </div>
                        </div>

                        <div id="pop_container_ok">
                            <div id="pop_ok">
                                <span>주문이 완료되었습니다.</br>메인 페이지로 이동합니다.</span>
                                <%-- <img src="${pageContext.request.contextPath}/assets/image/close2.png"> --%>
                                <button id="button_ok" type="submit">확인</button>
                            </div>
                        </div>
                    </div>
            </div>
        </form>
    </div>

    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
            $(function() {

                var prodArr = new Array();
                <c:forEach var="row" items="${list}">
                prodArr.push("${row.product_no}");
                </c:forEach>
                $("#prodArr").val(prodArr);

                var cartArr = new Array();
                <c:forEach var="row" items="${list}">
                cartArr.push("${row.cart_no}");
                </c:forEach>
                $("#cartArr").val(cartArr);

                var deliveryArr = new Array();
                <c:forEach var="row" items="${list}">
                deliveryArr.push("${row.delivery}");
                </c:forEach>
                $("#deliveryArr").val(deliveryArr);

                $("#orderSubmit").click(function() {
                    // 주문확인 팝업 모달창
                    $("#pop_container").fadeIn(300);
                    $("#pop").fadeIn(300);
                    $("#button_y").fadeIn(300);
                    $("#button_n").fadeIn(300);
                    $('#modal').css({'overflow': 'hidden', 'height': '100%'});
                    $("#button_y").click(function() {
                        $("#pop_container_ok").fadeIn(300);
                        $("#pop_ok").fadeIn(300);
                        $("#button_ok").fadeIn(300);
                        $('#modal').css({'overflow': 'hidden', 'height': '100%'});
                   });

                   $("#button_ok").click(function() {
                        $("#orderForm").submit();
                   });

                   $("#button_n").click(function() {
                       $("#pop_container").fadeOut(300);
                       $("#pop").fadeOut(300);
                       $("#button_n").fadeOut(300);
                       $('#modal').css({'overflow': 'hidden', 'height': '100%'});
                   });

                   $("#pop img").click(function() {
                       $("#pop_container").fadeOut(300);
                       $("#pop").fadeOut(300);
                       $("#button_y").fadeOut(300);
                       $("#button_n").fadeOut(300);
                       $('#modal').css({'overflow': 'hidden', 'height': '100%'});
                   });
                });
            }); // $(function()) 끝

            // 주소 API
            function sample6_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수

                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample6_postcode').value = data.zonecode;
                        document.getElementById("sample6_address").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("sample6_detailAddress").focus();
                    }
                }).open();
            }

    </script>
</body>
</html>