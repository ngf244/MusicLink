<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    <link href="<%= request.getContextPath() %>/css/mfooter.css" rel="stylesheet" />
<title>companyInfo</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height:500px;} 
    
    .inline{position: relative; z-index: 2; width: 100%; height: 500px;
    background-image:url('<%= request.getContextPath() %>/img_s/ODRADI0.jpg');background-repeat : no-repeat; background-size : cover; opacity: 0.5;}
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:140px; left:50%; transform: translateX(-50%); color: rgb(224, 224, 224);} 
    
    .intro{ text-align: center; min-height: 100px;  font-family: 'Sunflower', sans-serif; 
    		z-index: 10; position: relative; margin-top: -410px;}
    .ml{color: navy; font-family: 'Titillium Web', sans-serif; font-size: 40px;}
    .text{font-family: 'Sunflower', sans-serif; font-size: 15px; text-align: center; font-weight: 600;}
    .cmt{font-family: 'Sunflower', sans-serif; font-weight: 600;}
    
    
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
   
    <section style="z-index: 1;">
    	<div class="inline"></div>
       	<div class="intro">
       		<span class="cmt"><b class="ml">MUSIC LINK </b>란?</span><br><br><br>
       		<p class="text">
       			아티스트와 행사장을 연결해주는 매칭 사이트입니다.<br><br>
				좋은 아티스트와 좋은 기획자가 만나는 것이<br><br> 
				생각보다 쉽지 않습니다.<br><br>
				아티스트는 필요한 공연에 기획자는<br><br> 
				필요한 아티스트를 만날 수 있게 되는 것.<br><br>
				단순하지만 여태껏 어렵기만했던 일들을<br><br>
				제대로 빛을 발할 수 있도록 MusicLink에서<br><br>
				아티스트와 기획자들의 소통을 할 수 있는 공간을 마련하겠습니다.<br><br>
       		</p>
       	</div>
    </section>
    <h1 class="htext">MUSIC LINK</h1>
    
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
    
</body>
</html>