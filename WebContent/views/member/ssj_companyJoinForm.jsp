<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    <link href="<%= request.getContextPath() %>/css/mfooter.css" rel="stylesheet" />
<title>companyJoinForm</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
    section{width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height:1100px; font-family: "Roboto", sans-serif;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:140px; left:50%; transform: translateX(-50%); color: rgb(224, 224, 224);} 
    
	#enrollForm{width: 70%; position: absolute; left:50%; transform: translateX(-50%); text-align: right;}
	#insertInfo{text-align: left; display:inline-block; border-spacing: 10px; border-collapse: separate; font-size: 20px;}
	.mj{text-align: center; padding-top: 40px; padding-bottom: 20px; font-size: 40px; color: #6600cc;} 
	
	.input{width: 510px;}
	.label{width: 250px; font-weight: 600; color: #76838f;}
	
	#enrollBtn{margin-top:30px;}
	#enrollBtnSubmit{margin-left: 230px;}
	.text_input{height: 34.4px;}
	label[id$=Result]{height: 30px; font-size: 14px;}
    #btn{padding: 10px;}
    
    .btn{
		padding: 12.5px 18px;
		color: #fff;
    	background-color: #7780b7;
    	border-color: #333333;
    	text-align: center;
    	font-weight: 400;
        font-size: 0.99rem;
    	line-height: 1.5;
    	border-radius: 0.25rem;
    	font-family: "Roboto", sans-serif;
    	vertical-align: middle;
    	white-space: nowrap;
    	border: 1px solid transparent;
	}
	.form-control{
		width: 200px;
    	border-radius: 4px;
    	box-shadow: none;
    	padding: 0.8rem 0.75rem;
    	font-size: 0.99rem;
   		line-height: 1.5;
    	vertical-align: middle;
    	border: 1px solid #ced4da;
    	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	#user_year{width: 58px;}
    #user_month, #user_day{width: 40px;}
    
    #zonecodeInput{display:inline-block; margin-bottom: 7px; vertical-align: middle;}
    #addressInput{display:inline-block;}
    #detailAddressInput{display:inline-block;}
    
    #infor_agree{overflow: scroll; width: 600px; height: 100px; border: 1px solid lightgray; font-size: 15px;}
	
	
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %> 

	<section style="z-index: 1;">
		<div id="contentArea">
			<form action="<%= request.getContextPath() %>/insert.co" method="post" id="enrollForm" name="enrollForm" onsubmit="return validate();">
			<h2 class="mj">COMPANY JOIN</h2>
				<table id="insertInfo">
					<tr>
						<td class="label"><label>아이디</label></td>
						<td class="input">
						<input type="text" name="company_id" id="company_id" class="form-control input-default enroll" placeholder="아이디를 입력하세요">&nbsp;
						<input type="button" class="btn mb-1 btn-dark" id="id_check" onclick="idCheck();" value="중복확인">
						<br><label id="idResult">6~15자 영문 소문자와 숫자를 조합하세요</label></td>
					</tr>
					<tr>
						<td class="label"><label>비밀번호</label></td>
						<td class="input"><input type="password" name="company_pwd" id="company_pwd" class="form-control input-default enroll" placeholder="비밀번호를 입력하세요">
						<br><label id="pwdResult">6자 이상의 영문,숫자,특수기호를 조합하세요</label></td>
					</tr>
					<tr>
						<td class="label"><label>비밀번호 재확인</label></td>
						<td class="input"><input type="password" id="company_pwd2" class="form-control input-default enroll" placeholder="비밀번호를 확인하세요">
						<br><label id="pwd2Result"></label></td>
					</tr>
					<tr>
						<td class="label"><label>회사명</label></td>
						<td class="input"><input type="text" name="company_name" id="company_name" class="form-control input-default enroll" placeholder="회사명을 입력하세요"></td>
					</tr>
					<tr>
						<td class="label"><label>회사 주소</label></td>
						<td class="input">
		                     <input type="text" class="form-control input-default enroll inputValCk" id="zonecodeInput" name="zonecodeInput" readonly/>&nbsp;
		                     <input type="button" class="btn mb-1 btn-dark" onClick="openDaumZipAddress();" value = "우편번호"/><br>
		                     
		                     <input type="text" class="form-control input-default enroll inputValCk" id="addressInput" name="addressInput" readonly/>
		                     <input type="text" class="form-control input-default enroll" id="detailAddressInput" name="detailAddressInput" placeholder="상세주소"/>
		                     <div id="wrap" style="display:none;border:1px solid #DDDDDD;width:500px;margin-top:5px"></div>
		                </td>

					</tr>
					<tr>
						<td class="label"><label>회사 전화번호</label></td>
						<td class="input"><input type="tel" name="company_tel" id="company_tel" class="form-control input-default enroll" placeholder="(-)제외하고 입력하세요"></td>
					</tr>
					<tr>
						<td class="label"><label>담당자 이름</label></td>
						<td class="input"><input type="text" name="user_name" id="user_name" class="form-control input-default enroll" placeholder="담당자 이름을 입력하세요">
						<br><label id="nameResult"></label></td>
					</tr>
					<tr>
						<td class="label"><label>전화번호</label></td>
						<td class="input"><input type="tel" name="user_phone" id="user_phone" class="form-control input-default enroll" placeholder="(-)제외하고 입력하세요"></td>
					</tr>
					<tr>
						<td class="label"><label>이메일</label></td>
						<td class="input"><input type="email" name="user_email" id="user_email" class="form-control input-default enroll" placeholder="이메일을 입력하세요"></td>
					</tr>
					<tr>
						<td colspan=2>
							<span class="label">개인정보 동의서</span><br><br>
							<div id="infor_agree">
							정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
							<br><br>
							1. 수집하는 개인정보<br><br>
							이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
							<br>
							회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>
							- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필 정보를 수집합니다.
							- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.<br>
							서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>
							NAVER 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
							<br>
							서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.<br>
							구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,<br>
							2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
							네이버에서 제공하는 위치기반 서비스에 대해서는 '네이버 위치정보 이용약관'에서 자세하게 규정하고 있습니다.<br>
							이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.<br>
							</div>
       						<input type="checkbox" class="text_input" id="agree" value="agree_Y"><label style="font-size: 18px;">동의합니다.</label>
						</td>
					</tr>
					<tr>
						<td id="btn" colspan=2>
							<input type="submit"  class="btn mb-1 btn-dark" id="enrollBtnSubmit" value="가입">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" onclick="location.href='ssj_loginForm.jsp'" class="btn mb-1 btn-dark" id="enrollBtnCancel" value="취소">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<h1 class="htext">J O I N</h1>
	
	<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		var address = '서울 강남구 테헤란로14길 6';
		var zonecode = "";

		function openDaumZipAddress() {
			// 우편번호 찾기 화면을 넣을 element를 지정
			var element_wrap = document.getElementById("wrap");

			// wrap 레이어가 off된 상태라면 다음 우편번호 레이어를 open 한다.
			if (jQuery("#wrap").css("display") == "none") {
				new daum.Postcode({
					oncomplete : function(data) {
						jQuery("#zonecode").val(data.zonecode);
						jQuery("#address").val(data.address);
						jQuery("#address_detail").focus();
						address = data.address;
						zonecode = data.zonecode;
						console.log(data.zonecode);
						$('#addressInput').val(address);
						$('#zonecodeInput').val(zonecode);
					}

					// 사용자가 값을 주소를 선택해서 레이어를 닫을 경우
					// 다음 주소록 레이어를 완전히 종료 시킨다.
					,
					onclose : function(state) {
						if (state === "COMPLETE_CLOSE") {

							// 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
							offDaumZipAddress(function() {
								element_wrap.style.display = "none";
							});
						}
					}
				}).embed(element_wrap);

				// 슬라이드 다운 기능을 이용해 레이어 창을 오픈한다.
				jQuery("#wrap").slideDown();
				$('section').css('height','1620px');
			}

			// warp 레이어가 open된 상태라면 다음 우편번호 레이어를 off 상태로 변경한다.
			else {

				// 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
				offDaumZipAddress(function() {
					element_wrap.style.display = "none";
					return false;
				});
			}
		}

		function offDaumZipAddress() {
			// 슬라이드 업 기능을 이용해 레이어 창을 닫는다.
			jQuery("#wrap").slideUp();
			$('section').css('height','1100px');
		}
	</script>
    
    <%@ include file="../common/footer.jsp" %>
    
    <div class="map">
        <div class="map-bg">
            <h1 class="map-h1">&#215;</h1>
            <h1 class="map-txt">오시는길</h1>
            <div class="map-cont">
                <div class="map-cont-left"></div>
                <div class="map-cont-right">
                    <div class="cont-right1">
                        <div class="right-txt1">ADDRESS</div>
                        <div class="right-txt2">서울시 강남구..</div>
                    </div>
                    <div class="cont-right1">
                        <div class="right-txt1">TEL</div>
                        <div class="right-txt2">02-1111-1111</div>
                    </div>
                    <div class="cont-right1">
                        <div class="right-txt1">SUB</div>
                        <div class="right-txt2">2호선 - 강남, 역삼역</div>
                    </div>
                    <div class="cont-right1">
                        <div class="right-txt1">BUS</div>
                        <div class="right-txt2">146번, 360번</div>
                    </div>
                    <div class="cont-right2">
                        <a href="#" class="map-button">NAVER 지도로 바로 보기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

	<script>
	var isUsable = false;
	var inIdChecked = false;
	var pwdChecked = false;
	var pwd2Chedcked = false;
	var nameChecked = false;
	
	var userIdCheck = /^[a-z](?=.*[0-9]).{5,14}$/;	
	var nameCheck = /^[가-힣]{2,}$/;
	var pwdCheck = /^[a-zA-Z](?=.*[~!@\#$%<>^&*])(?=.*[0-9]).{7,11}$/;
	
	function idCheck(){
		var userId = $('#company_id');
		
		if(userIdCheck.test(userId.val())){
			$.ajax({
				url: "<%= request.getContextPath() %>/idCheck.me",
				type: 'post',
				data: {userId: userId.val()},
				success: function(data){
					if(data == 'success'){
						$('#idResult').text('사용 가능합니다.').css('color', 'green');
						isUsable = true;
						isIdChecked = true;
					} else {
						$('#idResult').text('사용 불가능합니다.').css('color', 'red');
						isUsable = false;
						idIdChecked = false;
						userId.focus();
					}
				},
				error: function(data){
					console.log(data);
				}
			});
		} else{
			$('#idResult').text('6~15자 영문 소문자와 숫자 조합 조건을 만족하지 않았습니다.').css('color', 'red');;
			userId.focus();
		}
	}
	
	$('#user_name').change(function(){
		if(nameCheck.test($(this).val())){
			nameChecked = true;
			$('#nameResult').text('');
		} else{
			$('#nameResult').text('알맞는 이름을 입력하세요').css('color', 'red');
		}
	});
	
	$('#company_pwd').change(function(){
		if(pwdCheck.test($(this).val())){
			$('#pwdResult').text('정상입력').css('color', 'green');
			pwdChecked = true;
		} else{
			$('#pwdResult').text('조건에 만족하지 않습니다.').css('color', 'red');
		}
	});
	
	$('#company_pwd2').change(function(){
		if(pwdCheck.test($(this).val())){
			$('#pwd2Result').text('정상입력').css('color', 'green');
			pwd2Chedcked = true;
		} else{
			$('#pwd2Result').text('비밀번호가 일치하지 않습니다..').css('color', 'red');
		}
	});
	
	function validate(){
		if(!isUsable && !idIdChecked){
			alert("아이디 중복체크를 해주세요.");
			return false;
		} else if(pwdChecked == false){
			alert("비밀번호를 입력해주세요.");
			return false;
		} else if(pwd2Chedcked == false){
			alert("비밀번호 확인을 해주세요.");
			return false;
		} else if($('#company_name').val() == "") {
			alert("회사명을 입력헤주세요.");
			return false;
		} else if($('#zonecodeInput').val() == "" || $('#addressInput').val() == ""){
			alert("회사 주소를 입력해주세요.")
			return false;
		} else if($('#company_tel').val() == ""){
			alert("회사 전화번호를 입력해주세요.")
			return false;
		} else if(nameChecked == false){
			alert("이름을 제대로 입력헤주세요.");
			return false;
		} else if($('#user_phone').val() == ""){
			alert("전화번호를 입력해주세요.")
			return false;
		} else if($('#user_email').val() == ""){
			alert("이메일을 입력해주세요.")
			return false;
		}  else if(!($('#agree').is(":checked"))) {
			alert("개인정보 동의서를 동의해주세요.")
			return false;
		} else {
			return true;
		}
	}
	
	</script>
</body>
</html>