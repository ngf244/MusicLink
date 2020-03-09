<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="member.model.vo.Member" %> --%>
<%
	/* Member loginUser = (Member)session.getAttribute("loginUser"); */
	String msg = (String)request.getAttribute("msg");
	String msgA = (String)request.getAttribute("msgA");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    <link href="<%= request.getContextPath() %>/css/mfooter.css" rel="stylesheet" />
<title>loginFrom</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
    section{width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height:500px;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:140px; left:50%; transform: translateX(-50%); color: rgb(224, 224, 224);} 
    
    .section{width: 600px; padding: 50px 50px; text-align: center; vertical-align: middle; background: #D8BFD8; 
             position: absolute; margin-left: center; margin-top: center; left: 50%; top:50%; transform: translate(-50%, -50%);}
    /* .cnt_area{padding-top: 10px; margin-top: 15px;} */
    .log_submit{height: 84px;
    border-radius: 0.25rem;
    white-space: nowrap;
    	border: 1px solid transparent;
    	    background-color: #7780b7;
    	    font-family: "Roboto", sans-serif;
    	    color: white;
    	    font-size: 0.875rem;
    }
    .input_log{border-radius: 4px; box-shadow: none; padding: 0.375rem 0.7rem; border: 1px solid #ced4da; height: 20px;}
    .inputText{display: inline-block; vertical-align: middle;}
    .loginBtn{display: inline-block; vertical-align: middle;}
    .errorPop{color: red; font-size: 10px; height: 17px; vertical-align: middle;}
    #ml1{color: orange; font-size: 50px; font-weight: 900; margin: 0px;}
    #ml2{font-size: 35px; font-weight: 800;}
    .log_button{
    	border-radius: 0.25rem;
    	white-space: nowrap;
    	border: 1px solid transparent;
    	background-color: #7780b7;
    	font-family: "Roboto", sans-serif;
    	padding: 0.3rem 0.5rem;
    	color: white; line-height: 1.5; font-size: 0.875rem;
    }
    
    
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>   
   
    <section style="z-index: 1;">
       <form class="section" action="<%= request.getContextPath()%>/login.me" onsubmit="return validate();" method="post">
       		<p id="ml1">Music Link</p>
       		<p id="ml2">MEMBER LOGIN</p>
       		<div class="cnt_area">
	       		<div class="inputText">
	       			<input type="text" class="input_log" name="user_id" id="user_id" placeholder="아이디를 입력하세요"><br><br>
	       			<input type="password" class="input_log" name="user_password" id="user_password" placeholder="비밀번호를 입력하세요">
	       		</div>
	       		<div class="loginBtn">
	       			<input type="submit" class="log_submit" name="submit" id="submit" value="로그인">
	       		</div>
       		</div>
       		<div class="errorPop"><span id="errorbox"></span></div>
       		<div>
       			<div class="log_btn">
       				<input type="button" onclick="memberSearch();" class="log_button" id="memberSearchBtn" value="아이디/비밀번호 찾기">&nbsp;&nbsp;
       				<input type="button" onclick="memberJoin();" class="log_button" id="memberJoinBtn" value="회원가입"> 
       			</div>
       		</div>
       </form>
    </section>
    <h1 class="htext">L O G I N</h1>
    
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
		function validate(){
			if($('#user_id').val().trim().length == 0){
				alert('아이디를 입력해주세요.');
				$('#user_id').focus();
				
				return false;
			}
			
			if($('#user_password').val().trim().length == 0){
				alert('비밀번호를 입력해주세요.');
				$('#user_password').focus();
				
				return false;
			}
			
			return true;
		}
	
		function memberJoin(){
			location.href="<%= request.getContextPath() %>/views/member/ssj_joinPickForm.jsp";
		}
		
		var msg = "<%= msg %>";
		$(function(){
			if(msg != "null"){
				$('#errorbox').text(msg);
			}
		});
		
		var msgA = "<%= msgA %>";
		$(function(){
			if(msgA != "null"){
				alert("금지된 회원 입니다.");
			}
		});
		
		function memberSearch(){
			window.open('about:blank').location.href="<%= request.getContextPath() %>/views/member/FindIdPwd.jsp";
		}
	</script>

</body>
</html>