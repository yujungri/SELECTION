<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>THE SELECTION</title>
    <link rel="stylesheet" type="text/css" href="assets/css/Update_Info.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <%@ include file="assets/inc/same_css.jsp"%>
</head>
<body>
	<!-- 헤더 -->
    <div id="header">
        <ul>
            <li class="back"><a href="javascript:history.back()"><img
                    src="assets/image/back.png"></a></li>
            <li class="title"><h1>회원정보변경</h1></li>
            <li class="cart"><a href="cartList.do"><img
                    src="assets/image/shopping_cart.png"></a></li>
        </ul>
    </div>

    <!-- 상단 이미지 -->
    <div id="Top_img">
        <h2>회원정보변경</h2>
    </div>

    <div id="essn_wrap">
        <div id="essn">
            <span class="identify">* </span><span> 변경불가</span>
        </div>
    </div>


    <!-- 가입폼 시작 -->
    <div id="form_wrap">
        <form method="post" action="${pageContext.request.contextPath}/UserUpdate.do" class="form-horizontal" name="join_form" id="join_form">
            <div class="form-group">
                <label for="user_name" class="col-md-2">이름 <span class="identify">*</span></label>
                <div class="col-md-10">
                    <input type="text" name="user_name" id="user_name" class="form-control" value="${user.user_name}" readonly/>
                </div>
            </div>
            <div class="form-group">
                <label for="user_id" class="col-md-2">아이디 <span class="identify">*</span></label>
                <div class="col-md-10">
                    <input type="text" name="user_id" id="user_id" class="form-control" value="${user.user_id}" readonly />
                </div>
            </div>
            <div class="form-group">
                <label for="user_pw" class="col-md-2">새로운 비밀번호</label>
                <div class="col-md-10">
                    <input type="password" name="user_pw" id="user_pw" class="form-control" />
                    <p id="pw_wrong_msg" class="join_form_msg">8~16자의 영문 소문자, 숫자, 특수문자를 입력해주세요.</p>
                </div>
            </div>
            <div class="form-group">
                <label for="user_pw" class="col-md-2">비밀번호 확인</label>
                <div class="col-md-10">
                    <input type="password" name="user_pw_re" id="user_pw_re" class="form-control" />
                    <p id="pw_re_wrong_msg" class="join_form_msg">비밀번호가 일치하지 않습니다.</p>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-md-2">이메일</label>
                <div class="col-md-10">
                    <input type="text" name="user_email" id="user_email" class="form-control" value="${user.user_email}"/>
                    <p id="email_wrong_msg" class="join_form_msg">올바르지 않은 이메일입니다.</p>
                </div>
            </div>
            <div class="form-group">
                <label for="tel" class="col-md-2">핸드폰</label>
                <div class="col-md-10">
                    <input type="tel" name="user_tel" id="user_tel" class="form-control" value="${user.user_tel}"/>
                    <p id="tel_wrong_msg" class="join_form_msg">올바르지 않은 핸드폰 번호입니다.</p>
                </div>
            </div>


            <div class="form-group">
                <label for='tel' class="col-md-2">주소</label>

                <div class="col-md-10">
                    <div id="findadd">
                        <input type="text" name="postcode" id="sample6_postcode" value="${user.postcode}" class="form-control postcode">
                        <input type="button" id="sample6_postcode_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="form-control postcode">
                        <input type="text" name="address" id="sample6_address" value="${user.address}" class="form-control">
                        <input type="text" name="address_detail" id="sample6_detailAddress" value="${user.address_detail}" class="form-control">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="text-center">
                    <button type="button" class="update_cancel">취소</button>
                    <button type="submit">변경</button>
                </div>
            </div>
        </form>
    </div>

    <div id="deleteUser">
        <a href="Check_PW.do">회원탈퇴</a>
    </div>
    
    <!-- bottom_bar -->
    <%@ include file="assets/inc/bottom_bar.jsp"%>

    <!-- 취소 팝업 -->
    <div id="pop_container">
        <div id="pop">
                <span>정보 변경을 취소하시겠습니까?</span>
                <img src="assets/image/close2.png">
                <span><a href="index.do">확인</a></span>
        </div>
    </div>

    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

                // 팝업창 열기
                $(".update_cancel").click(function() {
                    $("#pop_container").fadeIn(300);
                    $("#pop").fadeIn(300);
                    $('body').css({'overflow': 'hidden', 'height': '100%'});
                });

                // 팝업창 닫기
                $("#pop img").click(function() {
                    $("#pop_container").fadeOut(300);
                    $("#pop").fadeOut(300);
                    $('body').css({'overflow': 'auto', 'height': '100%'});
                });

                // 유효성 검사
                $("#join_form").submit(function() {
                    var pwCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
                    var pw_val = $("#user_pw").val();
                    var pw_re_val = $("#user_pw_re").val();

                    var emailCheck = RegExp(/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/);
                    var email_val = $("#email").val();

                    var telCheck = RegExp(/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/);
                    var tel_val = $("#tel").val();

                    var addr = $("#sample6_postcode").val();
			
                    if (pw_val && !pwCheck.test(pw_val)) {
                        $("#user_pw").focus();
                        $(".join_form_msg").hide();
                        $("#pw_wrong_msg").show();
                        return false;
                    } else if (!pw_re_val || pw_re_val.trim() == "") {
                        $("#user_pw_re").focus();
                        $(".join_form_msg").hide();
                        $("#pw_re_blank_msg").show();
                        return false;
                    } else if (pw_re_val != pw_val) {
                        $("#user_pw_re").focus();
                        $(".join_form_msg").hide();
                        $("#pw_re_wrong_msg").show();
                        return false;
                    } /* else if (!email_val || email_val.trim() == "") {
                        $("#email").focus();
                        $(".join_form_msg").hide();
                        $("#email_blank_msg").show();
                        return false;
                    } else if (!emailCheck.test(email_val)) {
                        $("#email").focus();
                        $(".join_form_msg").hide();
                        $("#email_wrong_msg").show();
                        return false;
                    } else if (!tel_val || tel_val.trim() == "") {
                        $("#tel").focus();
                        $(".join_form_msg").hide();
                        $("#tel_blank_msg").show();
                        return false;
                    } else if (!telCheck.test(tel_val)) {
                        $("#tel").focus();
                        $(".join_form_msg").hide();
                        $("#tel_wrong_msg").show();
                        return false;
                    } else if (!addr) {
                        $("#sample6_postcode").focus();
                        $(".join_form_msg").hide();
                        $("#addr_blank_msg").show();
                        return false;
                    } */
                   

            }); // submit() 끝 
                
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