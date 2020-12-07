<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="assets/css/SignUp.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/header.css" />
    <%@ include file="assets/inc/same_css.jsp"%>
</head>
<body>
    <!-- 헤더 -->
    <div id="header">
        <ul>
            <li class="back"><a href="javascript:history.back()"><img
                    src="assets/image/back.png"></a></li>
            <li class="search"><a href="#"><img src="assets/image/search.png"></a></li>
            <form method="get" action="${pageContext.request.contextPath}/ProductAll.do" id="form2">
            <div class="searchbox">
                <input placeholder="search..." type="search" name="search" id="search" />
                <input type="image" src="assets/image/search.png" onclick="$('#form2').submit();" id="search_image"/>
            </div>
            </form>
            <li class="title"><h1>회원가입</h1></li>
            <li class="cart"><a href="cartList.do"><img
                    src="assets/image/shopping_cart.png"></a></li>
        </ul>
    </div>

    <!-- 상단 이미지 -->
    <div id="Top_img">
        <h2>회원가입</h2>
    </div>

    <div id="essn_wrap">
        <div id="essn">
            <span class="identify">* </span><span> 필수입력</span>
        </div>
    </div>


    <!-- 가입폼 시작 -->
    <div id="form_wrap">
        <form method="post" action="UserRegister.do" class="form-horizontal" name="join_form" id="join_form">
            <div class="form-group">
                <label for="user_id" class="col-md-2">아이디 <span class="identify">*</span></label>
                <div id="idCheck_wrap" class="col-md-10">
                    <input type="text" name="user_id" id="user_id" class="form-control" />
                    <button id="idCheck" type="button" class="form-control">중복체크</button>
                    <p id="ajax" style="color: red; font-size: 12px; margin-top: 5px; margin-bottom: 5px;"></p>
                    <p id="id_blank_msg" class="join_form_msg">아이디를 입력해주세요.</p>
                    <p id="id_wrong_msg" class="join_form_msg">8~16자의 영문 소문자, 숫자만 입력 가능합니다.</p>
                </div>
            </div>
            <div class="form-group">
                <label for="user_pw" class="col-md-2">비밀번호 <span class="identify">*</span></label>
                <div class="col-md-10">
                    <input type="password" name="user_pw" id="user_pw" class="form-control" />
                    <p id="pw_blank_msg" class="join_form_msg">비밀번호를 입력해주세요.</p>
                    <p id="pw_wrong_msg" class="join_form_msg">8~16자의 영문 소문자, 숫자, 특수문자를 입력해주세요.</p>
                </div>
            </div>
            <div class="form-group">
                <label for="user_pw" class="col-md-2">비밀번호 확인 <span class="identify">*</span></label>
                <div class="col-md-10">
                    <input type="password" name="user_pw_re" id="user_pw_re" class="form-control" />
                    <p id="pw_re_blank_msg" class="join_form_msg">비밀번호를 다시 한번 입력해주세요.</p>
                    <p id="pw_re_wrong_msg" class="join_form_msg">비밀번호가 일치하지 않습니다.</p>
                </div>
            </div>
            <div class="form-group">
                <label for="user_name" class="col-md-2">이름 <span class="identify">*</span></label>
                <div class="col-md-10">
                    <input type="text" name="user_name" id="user_name" class="form-control" />
                    <p id="name_blank_msg" class="join_form_msg">이름을 입력해주세요.</p>
                    <p id="name_wrong_msg" class="join_form_msg">2~4글자의 한글만 입력해주세요.</p>
                </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-md-2">이메일 <span class="identify">*</span></label>
                <div class="col-md-10">
                    <input type="text" name="user_email" id="email" class="form-control" />
                    <p id="email_blank_msg" class="join_form_msg">이메일을 입력해주세요.</p>
                    <p id="email_wrong_msg" class="join_form_msg">올바르지 않은 이메일입니다.</p>
                </div>
            </div>
            <div class="form-group">
                <label for="tel" class="col-md-2">핸드폰 <span class="identify">*</span></label>
                <div class="col-md-10">
                    <input type="tel" name="user_tel" id="tel" class="form-control" />
                    <p id="tel_blank_msg" class="join_form_msg">핸드폰 번호를 입력해주세요.</p>
                    <p id="tel_wrong_msg" class="join_form_msg">올바르지 않은 핸드폰 번호입니다.</p>
                </div>
            </div>


            <div class="form-group">
                <label for='tel' class="col-md-2">주소 <span class='identify'>*</span></label>
                <p id="addr_blank_msg" class="join_form_msg">주소를 검색해주세요.</p>

                <div class="col-md-10">
                    <div id="findadd">
                        <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control postcode">
                        <input type="button" id="sample6_postcode_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="form-control postcode">
                        <input type="text" name="address" id="sample6_address" placeholder="주소" class="form-control">
                        <input type="text" name="address_detail" id="sample6_detailAddress" placeholder="상세주소" class="form-control">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="text-center">
                    <button type="reset">다시작성</button>
                    <button type="submit">가입하기</button>
                </div>
            </div>
        </form>
    </div>

    <!-- bottom_bar -->
    <%@ include file="assets/inc/bottom_bar.jsp"%>
     
    <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script type="text/javascript">
        <!-- 유효성 검사 -->
            $(function() {
            	$(".search").click(function() {
                    $(".title").toggle();
                    $(".searchbox").toggle();
                });

		        $("#bottom_bar li:first-child").click(function(e) {
		                e.preventDefault();
		                $("#category_bar").slideToggle(100);
		        });
		
		        $("#search2 .search2 li:last-child").click(function() {
	                $("#date").slideToggle(150);
	           	});
		        
		        /** id 중복확인 */
		        $("#idCheck").click(function() {
		        	var idCheck= RegExp(/^[a-z0-9]{8,16}$/);
		        	var id_val = $("#user_id").val();
		        	if (!id_val || id_val.trim() == "") {
                        $("#user_id").focus();
                        $("#id_blank_msg").show(); 
                        $("#ajax").html("");
		        	} else if (!idCheck.test(id_val)) {
                        $("#user_id").focus();
                        $(".join_form_msg").hide();
                        $("#id_wrong_msg").show();
                        $("#ajax").html("");
		        	} else {
		        		$("#id_blank_msg").hide(); 
		        		$("#id_wrong_msg").hide();
		        		$.ajax({
			        		url: "${pageContext.request.contextPath}/IdCheck.do",
			        		type: "post",
			        		data: {"user_id" : id_val},
			        		success: function(data){
			        			if(data == 1) {
			        				$("#ajax").html("이미 존재하는 아이디입니다.");
			        			} else if(data == 0){
			        				$("#ajax").html("사용가능한 아이디입니다.");
			        			}
			        		}
			        	})
		        	}
			     });
		        	
		        	
		        	  
		        	
		        
                

                $("#join_form").submit(function() {
                	var idCheck= RegExp(/^[a-z0-9]{8,16}$/);
                    var id_val = $("#user_id").val();

                    var pwCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
                    var pw_val = $("#user_pw").val();
                    var pw_re_val = $("#user_pw_re").val();

                    var nameCheck = RegExp(/^[가-힣]{2,4}$/);
                    var name_val = $("#user_name").val();

                    var emailCheck = RegExp(/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/);
                    var email_val = $("#email").val();

                    var telCheck = RegExp(/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/);
                    var tel_val = $("#tel").val();

                    var addr = $("#sample6_postcode").val();

                    if (!id_val || id_val.trim() == "") {
                        $("#user_id").focus();
                        $("#id_blank_msg").show();
                        $("#id_wrong_msg").hide();
                        return false;
                    } else if (!idCheck.test(id_val)) {
                        $("#user_id").focus();
                        $(".join_form_msg").hide();
                        $("#id_wrong_msg").show();
                        return false;
                    } else if (!pw_val || pw_val.trim() == "") {
                        $("#user_pw").focus();
                        $(".join_form_msg").hide();
                        $("#pw_blank_msg").show();
                        return false;
                    } else if (!pwCheck.test(pw_val)) {
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
                    } else if (!name_val || name_val.trim() == "") {
                        $("#user_name").focus();
                        $(".join_form_msg").hide();
                        $("#name_blank_msg").show();
                        return false;
                    } else if (!nameCheck.test(name_val)) {
                        $("#user_name").focus();
                        $(".join_form_msg").hide();
                        $("#name_wrong_msg").show();
                        return false;
                    } else if (!email_val || email_val.trim() == "") {
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
                    }

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