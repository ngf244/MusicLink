<%@page import="authorPage.model.vo.CompanyJoinInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% CompanyJoinInfo cj = (CompanyJoinInfo)request.getAttribute("cj"); %>
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
	.gobackbtn{color: blue; background-color: red; position: fixed; top: 50%; right: 17%; width: 80px; height: 60px;}
	
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %> 

	<section style="z-index: 1;">
		<div id="contentArea">
			<form action="<%= request.getContextPath() %>/accept.at" method="post" id="enrollForm" name="enrollForm_co" onsubmit="return check();">
			<input type="hidden" name="where" value="com">
			<input type="hidden" id = "userCode" name="userCode" value="<%=cj.getCoCode()%>">
			<h2 class="mj">COMPANY JOIN</h2>
				<table id="insertInfo">
					<tr>
						<td class="label"><label>회사명</label></td>
						<td class="input"><input type="text" name="company_name" id="company_name" class="form-control input-default enroll" value="<%=cj.getCoName()%>" readonly></td>
					</tr>
					<tr>
						<td class="label"><label>회사 주소</label></td>
						<td class="input">
		                     <input type="text" class="form-control input-default enroll inputValCk" id="zonecodeInput" name="zonecodeInput" value="<%=cj.getCoAddress()%>" readonly/>&nbsp;
		                     <div id="wrap" style="display:none;border:1px solid #DDDDDD;width:500px;margin-top:5px"></div>
		                </td>

					</tr>
					<tr>
						<td class="label"><label>회사 전화번호</label></td>
						<td class="input"><input type="tel" name="company_tel" id="company_tel" class="form-control input-default enroll" value="<%=cj.getCoPhone()%>" readonly></td>
					</tr>
					<tr>
						<td class="label"><label>담당자 이름</label></td>
						<td class="input"><input type="text" name="user_name" id="user_name" class="form-control input-default enroll" value="<%=cj.getChargePerson()%>" readonly>
						<br><label id="nameResult"></label></td>
					</tr>
					<tr>
						<td class="label"><label>전화번호</label></td>
						<td class="input"><input type="tel" name="user_phone" id="user_phone" class="form-control input-default enroll" value="<%=cj.getChargePhone()%>" readonly></td>
					</tr>
					<tr>
						<td class="label"><label>이메일</label></td>
						<td class="input"><input type="email" name="user_email" id="user_email" class="form-control input-default enroll" value="<%=cj.getEmail()%>" readonly></td>
					</tr>
					<tr>
						<td id="btn" colspan=2>
							<input type="submit"  class="btn mb-1 btn-dark" id="enrollBtnSubmit" value="가입">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" onclick="refuse();" class="btn mb-1 btn-dark" id="enrollBtnCancel" value="거절 및 사유보내기">
						</td>
					</tr>
				</table>
					<button type="button" class="gobackbtn" onclick="history.go(-1)">돌아가기</button>
			</form>
		</div>
	</section>
	<h1 class="htext">J O I N</h1>
	
	<script>
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
		function check() {
			var check = false;
			check = confirm("정말 수락하시겠습니까?");
	
			if(check){
				return true;
			} else {
				return false;
			}
		}
		
		function refuse() {
			window.open("views/authorPage/sendmessageForm.jsp", "message", "width=500, height=300");
		}
	</script>
</body>
</html>