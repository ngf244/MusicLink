<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
	

    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    <link href="<%= request.getContextPath() %>/css/mfooter.css" rel="stylesheet" />
<title>userJoinForm</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
    section{width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height: 800px; font-family: "Roboto", sans-serif;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:300px; left:50%; transform: translateX(-50%); color: rgb(224, 224, 224);} 
    
	#enrollForm{width: 70%; height: 100%; position: absolute; left:50%; transform: translateX(-50%); text-align: center;}
	#insertInfo{text-align: left; display:inline-block; border-spacing: 10px; border-collapse: separate;}
	.mj{text-align: center; padding-top: 40px; padding-bottom: 20px;} 
	.label{width: 35%; font-size: 12pt;}
	#enrollBtn{margin-top:30px;}
	.text_input{height: 34.4px;}
	#idResult{height: 20px;}
    #btn{text-align: center; padding: 10px;}
	.btn{
		padding: 7px 18px;
		color: #fff;
    	background-color: #333333;
    	border-color: #333333;
    	text-align: center;
    	font-weight: 400;
        font-size: 0.875rem;
    	line-height: 1.5;
    	border-radius: 0.25rem;
    	font-family: "Roboto", sans-serif;
    	vertical-align: middle;
    	white-space: nowrap;
    	border: 1px solid transparent;
	}
	.form-control{
		width: 150px;
    	border-radius: 4px;
    	box-shadow: none;
    	padding: 0.375rem 0.75rem;
    	font-size: 0.875rem;
   		line-height: 1.5;
    	vertical-align: middle;
    	border: 1px solid #ced4da;
    	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	#user_year{width: 58px;}
    #user_month, #user_day{width: 40px;}
    
</style>
</head>
<body>
    <header>
        <nav>
            <div class="logo">
            logo
            </div>
            <div id="toggle">
                <div class="span" id="one"></div>
                <div class="span" id="two"></div>
                <div class="span" id="three"></div>
            </div>
        </nav>

        <div id="resize">
            <ul class="menu">
                <li class="m-name1 m-name">
                    <a href="#" class="m-mname m-mname1"> M u s i c L i n k</a>
                    <ul class="hidden-manu1 drop">
                        <li class="menu-h"><a href="#">About us</a></li>
                        <li class="menu-h"><a href="#">F A Q</a></li>
                        <li class="menu-h"><a href="#">Q &#38; A</a></li>
                    </ul>
                </li>
                <li class="m-name2 m-name">
                    <a href="#" class="m-mname m-mname2">A r t i s t</a>
                    <ul class="hidden-manu2 drop">
                        <li class="menu-h"><a href="#">p r o f i l e</a></li>
                        <li class="menu-h"><a href="#">A - l i s t</a></li>
                        <li class="menu-h"><a href="#">r a n k</a></li>
                    </ul>
                </li>
                <li class="m-name3 m-name">
                    <a href="#" class="m-mname m-mname3">F e s t i v a l</a>
                    <ul class="hidden-manu3 drop">
                        <li class="menu-h"><a href="#">F - l i s t</a></li>
                        <li class="menu-h"><a href="#">r a n k</a></li>
                    </ul>
                </li>
                <li class="m-name4 m-name">
                    <a href="#" class="m-mname m-mname4">C a n l d e r</a>
                </li>
            </ul>
        </div>
        <div class="side-icon">
            <div class="image1 icon">
                <a href="#" class="icon-a"><img src="<%= request.getContextPath() %>/img/user.png" alt="" /></a>
            </div>
            <div class="image2 icon">
                <a href="#" ><img src="<%= request.getContextPath() %>/img/bell.png" alt="" /></a>
            </div>
            <div class="image3 icon">
                <img src="<%= request.getContextPath() %>/img/pin.png" alt="" />
            </div>
            <div class="side-text">
                <p>&#169; 2019 MUSICLINK <sapn class=>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</sapn></p>
            </div>
        </div>    
    </header>

	<section style="z-index: 1;">
		<div id="contentArea">
			<form action="<%= request.getContextPath() %>/insert.me" method="post" id="enrollForm" name="enrollForm" onsubmit="return validate();">
			<h2 class="mj">MEMBER JOIN</h2>
				<table id="insertInfo">
					<tr>
						<td class="label" ><label>아이디</label></td>
						<td class="input">
						<input type="text" name="user_id" id="user_id" class="form-control input-default enroll" placeholder="아이디를 입력하세요">&nbsp;
						<input type="button" class="btn mb-1 btn-dark" id="id_check" onclick="idCheck();" value="중복확인"><br>
						<label id="idResult"></label></td>
					</tr>
					<tr>
						<td class="label"><label>비밀번호</label></td>
						<td class="input"><input type="password" name="user_pwd" id="user_pwd" class="form-control input-default enroll" placeholder="비밀번호를 입력하세요">
						<label id="pwdResult"></label></td>
					</tr>
					<tr>
						<td class="label"><label>비밀번호 재확인</label></td>
						<td class="input"><input type="password" id="user_pwd2" class="form-control input-default enroll" placeholder="비밀번호를 확인하세요">
						<label id="pwd2Result"></label></td>
					</tr>
					<tr>
						<td class="label"><label>이름</label></td>
						<td class="input">
						<input type="text" name="user_name" id="user_name" class="form-control input-default enroll" placeholder="이름를 입력하세요">
						<label id="nameResult"></label></td>
					</tr>
					<tr>
						<td class="label"><label>생년월일</label></td>
						<td class="input">
							<input type="text" name="user_year" id="user_year" class="form-control input-default enroll" placeholder="년">
							<input type="text" name="user_month" id="user_month" class="form-control input-default enroll" placeholder="월">
							<input type="text" name="user_day" id="user_day" class="form-control input-default enroll" placeholder="일">
       					</td>
					</tr>
					<tr>
						<td class="label"><label>성별</label></td>
						<td class="input">
							<input type="radio" class="text_input" name="gender" id="male" value="M">남자
       						<input type="radio" class="text_input" name="gender" id="female" value="F">여자
						</td>
					</tr>
					<tr>
						<td class="label"><label>이메일</label></td>
						<td class="input"><input type="email" name="user_email" id="user_email" class="form-control input-default enroll" placeholder="이메일을 입력하세요"></td>
					</tr>
					<tr>
						<td class="label"><label>전화번호</label></td>
						<td class="input"><input type="tel" name="user_phone" id="user_phone" class="form-control input-default enroll" placeholder="(-) 제외하고 입력하세요"></td>
					</tr>
					<tr>
						<td class="label"><label>아티스트</label></td>
						<td class="input">
							<input type="radio" class="text_input" id="artist_check_Y" value="Y">Y
       						<input type="radio" class="text_input" id="artist_check_N" value="N">N
						</td>
					</tr>
					<tr>
						<td class="input" colspan=2>
							개인정보 동의서<br>
       						<input type="checkbox" class="text_input" id="agree" value="agree_Y"><label style="font-size: 14px;">동의합니다.</label>
       						<br>자세한 내용은 구현할 때
						</td>
					</tr>
					<tr>
						<td class="input" id="btn" colspan=2>
							<input type="submit"  class="btn mb-1 btn-dark" id="enrollBtnSubmit" value="가입">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" onclick="location.href='ssj_loginForm.jsp'"  class="btn mb-1 btn-dark" id="enrollBtnCancel" value="취소">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<h1 class="htext">J O I N</h1>
    
    
    <footer>
        <div class="ft-text">
            <h2 class="ft-text1 ft-h1">The most important step is understanding and.</h2><br>
            <h2 class="ft-text1 ft-h2">Empathizing with project.</h2>
        </div>
        <h1 class="ft-txt1">뮤직링크는 e비지니스 엔터테인먼트 입니다.</h1>
        <h1 class="ft-txt2">MUSIC LINK</h1>
        <div class="ft-content">
            <div class="content-left">
                <div class="left-top">
                    <ul class="lt">COMPANY
                        <li>(주)뮤직링크</li>
                    </ul>
                    <ul class="rt">ADDRESS
                        <li>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F</li>
                    </ul>
                </div>
                <div class="left-bot">
                    <ul class="lbl">BUSINESS LICENSE
                        <li>000-11-22222</li>
                    </ul>
                    <ul class="lbm">TEL
                        <li>02-562-2378</li>
                    </ul>
                    <ul class="lbr">E-MAIL
                        <li>qkrtlsdn@qkr.tlsdn</li>
                    </ul>
                </div>
            </div>
            <div class="content-right">
                <a href="#">&nbsp;&nbsp;&nbsp;
                    R E Q E U S T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#62;</a>
                <a href="#">&nbsp;&nbsp;&nbsp;
                    L O C A T I O N&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#62;</a>
            </div>
        </div>
    </footer>
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
    
<script src="<%= request.getContextPath() %>/js/respond.min.js"></script>
<script src="<%= request.getContextPath() %>/js/wow.min.js"></script>
<script src="<%= request.getContextPath() %>/js/parallax.min.js"></script>
<script src="<%= request.getContextPath() %>/js/slick.min.js"></script>
<script>

	$("#toggle").click(function(){
		$(this).toggleClass("on");
		$("#resize").toggleClass("active");	
	});
    
    $(".image3").click(function(){
        $(".map").css({"display":"block","width":"100%","height":"80%","padding-top":"10%","opacity":"0.98", "z-index":"9"});
    });
    $(".map-h1").click(function(){
        $(".map").css("display","none");
    });
    
    
	//new WOW().init();
	
	
</script>

	<script>
		var isUsable = false;
		var inIdChecked = false;
		
		/* $('#user_id').on('change paste keyup', function(){
			isIdChecked = false;
		}); */
		
		var userIdCheck = /^[a-z](?=.*[0-9]).{5,14}$/;	
		
		function idCheck(){
			var userId = $('#user_id');
			
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
		
		/* $('#user_id').change(function(){
			
		}); */
		
		function validate(){
			if(isUsable && idIdChecked){
				return true;
			} else{
				alert('아이디 중복확인을 해주세요');
				return false;
			}
		}
		
		
		var nameCheck = /^[가-힣]{2,}$/;
		var pwdCheck = /^[a-zA-Z](?=.*[!*&])(?=.*[0-9]).{7,11}$/;
		
		$('#user_name').blur(function(){
			if(nameCheck.test($(this).val())){
				$('#nameResult').text('정상입력').css('color', 'green');
			} else{
				$(this).focus();
				$('#nameResult').text('알맞는 이름을 입력하세요').css('color', 'red');
			}
		});
		
		$('#user_pwd').blur(function(){
			if(pwdCheck.test($(this).val())){
				$('#pwdResult').text('정상입력').css('color', 'green');
			} else{
				$(this).focus();
				$('#pwdResult').text('조건에 만족하지 않습니다.').css('color', 'red');
			}
		});
		
		$('#user_pwd2').blur(function(){
			if(pwdCheck.test($(this).val())){
				$('#pwd2Result').text('정상입력').css('color', 'green');
			} else{
				$(this).focus();
				$('#pwd2Result').text('비밀번호가 일치하지 않습니다..').css('color', 'red');
			}
		});
		
		/* $('#user_year').blur(function(){
			if($(this))
		}); */
	</script>
</body>
</html>