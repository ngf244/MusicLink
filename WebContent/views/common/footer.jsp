<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
                <div id="map-cont-left"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=80db889fc9ec7bbae521ed1f6bd06c6e"></script>	
				<script>
					$(function(){
						var container = document.getElementById('map-cont-left');
						var options = {
							center: new kakao.maps.LatLng(37.49896717315922, 127.03284925485772),
							level: 3
						};
		
						var map = new kakao.maps.Map(container, options);
                        
					});
					
				</script>
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