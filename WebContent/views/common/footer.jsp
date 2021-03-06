<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/footer.css" />
<title>Insert title here</title>
<style>
	footer{height:540px; background:rgb(253, 241, 241); }
	.ft-text{text-align: center; }
    .ft-text1{border-bottom: 5px solid #F7FE2E; display: inline-block; margin-bottom: 10px; }
    .ft-h2{margin-bottom: 80px; background:#f0f0f0;}
    .ft-txt1{margin-bottom:80px; text-align: center; font-size:3em; color: rgb(224, 224, 224);}
    .ft-txt2{font-size:80px; text-align:center; color: rgb(224, 224, 224); }
    
    .ft-content{width:60%; background:#000; margin: 0 auto; margin-top:22px; z-index:1; position: absolute; left:15%; color:#fff; padding:5%;}
    .content-left{width:70%; float: left;}
    .content-left li{color:darkslategray;}
    .content-right{width:30%; float: right;}
    .lt{width:30%; float:left; margin-bottom:30px;}
    .lt > li{margin: 10px 0; color:#F7FE2E; font-weight: bold;}
    .rt{width:70%; float:left; margin-bottom:30px;}
    .rt > li{margin: 10px 0;}
    
    .lbl{width:32%; display: inline-block;}
    .lbl > li{margin: 10px 0;}
    .lbm{width:32%; display: inline-block;}
    .lbm > li{margin: 10px 0;}
    .lbr{width:32%; display: inline-block;}
    .lbr > li{margin: 10px 0;}
    
    .content-right a{padding:15px 10px;}
    .content-right a:nth-child(1){color:#000; background: #F7FE2E; font-weight: bold; border-radius: 10px; margin-bottom:45px;}
    .content-right a:nth-child(2){color:#000; background: #ccc; font-weight: bold; border-radius: 10px;}
    .content-right a:nth-child(2):hover{background: #F7FE2E;}

    
    
    .map{background: rgba(0,0,0,0.8); height:100%; padding-top: 10%; position:fixed; bottom:0%; -webkit-transition:0.5s ease-out; transition:0.5s ease-out; display:none;  opacity:0; filter:alpha(opacity=0);}
    .map-bg{background: #fff; height:60%; width:70%; margin:12% auto; position: relative; border-radius: 15px;}
    .map-h1{position: absolute; left:45%; top:-65px; font-size:40px; width: 80px; height:80px; line-height: 70px; background:#F7FE2E; color:#000; border-radius: 50px; color:#fff; text-align: center;}
    .map-h1:hover{-webkit-transform:rotate(180deg) translateX(0px) translateY(0px); transform:rotate(180deg) translateX(0px) translateY(0px); background:#000; cursor: pointer;}
    .map-txt{position: absolute; top:50px; left:10%; border-top:5px solid black; line-height: 40px;}
    
    .map.on{ opacity:0.98; filter:alpha(opacity=98); display: block; width:100%; height:100%; padding-top: 10%; position:fixed; bottom:0%; z-index:9;}
    .map.hidden{display: none; opacity:0; filter:alpha(opacity=0); z-index: 0;}
    
    
    
    .map-cont{height: 300px; padding-top: 80px; width:80%; margin: 0 auto;}
    #map-cont-left{width:45%; height:300px; margin-top:5%; margin-right:10%; float: left;}
    .map-cont-right{width: 45%; display: inline-block; height:300px; margin-top:5%;}
    .cont-right1{border-bottom: 1px solid #ccc; }
    .cont-right1:nth-child(1){border-top:2px solid #ccc;}
    .cont-right1:nth-child(4){border-bottom:2px solid #ccc;}
    .right-txt1{width:40%; float:left; text-align: center; margin-top:20px; margin-bottom: 20px; font-weight: bold;}
    .right-txt2{width:60%; display: inline-block; margin-top:20px; margin-bottom: 20px;}
    .map-button{width: 70%; padding:15px 30px; background:#F7FE2E; margin-top:20px; text-align: center; color:#fff; font-weight: bold; border-radius:10px;}
    .map-button:hover{background:black; transition: 0.5s;}

	
</style>
</head> 
<body>
<footer id="footer">
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
                <div id="map"></div>
				
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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=80db889fc9ec7bbae521ed1f6bd06c6e"></script>	
<script>
var address = '서울 강남구 테헤란로14길 6';
var zonecode = "";

$(function(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            //content: '<div style="width:auto;display:inline-block;white-space:nowrap;text-align:center;padding:7px 0;">&nbsp;&nbsp;' + address + '&nbsp;&nbsp;</div>'
	        	content: '<div style="text-align:center;padding:7px 0;white-space:nowrap;">&nbsp;&nbsp;' + address + '&nbsp;&nbsp;</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
});
					
				
$(".map-h1").click(function(){
       $(".map").css("display","none");
   });
</script>
</body>
</html>