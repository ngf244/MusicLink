<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    <link href="<%= request.getContextPath() %>/css/mfooter.css" rel="stylesheet" />
<title>joinPickForm</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
    section{width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height:500px;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:140px; left:50%; transform: translateX(-50%); color: rgb(224, 224, 224);} 
    
    .section{width: 600px; padding: 30px 30px; vertical-align: middle; text-align: center;
             position: absolute; margin-left: center; margin-top: center; left: 50%; top:50%; transform: translate(-50%, -50%);}
    .login1{margin-left: center; margin-top: center; left: 50%; top: 50;}
    #ment1{font-weight: bold; font-size: 35px;}
    #ment2{font-size: 16px; margin-top: 15px; color: #7780b7;}
    #ml{font-size: 60px; color: orange; display: inline-block;}
    #choose{margin-top: 20px; margin-bottom: 10px;}
    .div_ch{text-align: center; display: inline-block; margin: 20px; background: lightgray; font-size: 17px;
    		width: 150px; padding: 20px; font-weight: 800; color: white; border-radius: 0.25rem;}
    .icon{width: 50px; height: 50px;}
    
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %> 
	   
    <section style="z-index: 1;">
       <div class="section">
       		<div class="login1" id="ment1">
       			<p id="ml">Music Link</p>에 오신것을<br>
       			진심으로 환영합니다.<br>
       		</div>
       		<br>
       		<div class="login1" id="ment2">
       			일반 회원가입 후 회원 종류(아티스트와 기획자)를 변경할 수 있습니다.
       		</div>
       		<div class="login1" id="choose">
       			<div class="div_ch" id="userJoin" onclick="userJoin();">
       				<img src="<%= request.getContextPath() %>/img_s/icon.png" class="icon" id="icon1"><br>
       				일반 회원가입
       			</div>
       			<div class="div_ch" id="companyJoin" onclick="companyJoin();">
       				<img src="<%= request.getContextPath() %>/img_s/company.png" class="icon" id="icon2"><br>
       				기획자 회원가입
       			</div>
       		</div>
       </div>
    </section>
    <h1 class="htext">J O I N</h1>
    
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
		function userJoin(){
			location.href="<%= request.getContextPath() %>/views/member/ssj_userJoinForm.jsp";
		}
		
		function companyJoin(){
			location.href="<%= request.getContextPath() %>/views/member/ssj_companyJoinForm.jsp";
		}
		
	</script>
</body>
</html>