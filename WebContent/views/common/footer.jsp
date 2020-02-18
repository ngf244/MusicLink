<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.ft-text{text-align: center; margin-top:100px; }
    .ft-text1{border-bottom: 5px solid #F7FE2E; display: inline-block; margin-bottom: 10px;}
    .ft-h2{margin-bottom: 80px;}
    .ft-txt1{margin-bottom:80px; text-align: center; font-size:3em; color: #fff;}
    .ft-txt2{position: relative; font-size:80px; text-align:center; color: rgb(224, 224, 224);}
    
    .ft-content{width:60%; background:#000; margin: 0 auto; margin-top:22px; z-index:2; position: absolute; left:15%; color:#fff; padding:5%;}
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
    
    
    
    /* 
html5doctor.com Reset Stylesheet v1.6.1
Last Updated: 2010-09-17
Author: Richard Clark - http://richclarkdesign.com 
*/
html, body, div, span, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
abbr, address, cite, code,
del, dfn, em, img, ins, kbd, q, samp, 
small, strong, sub, sup, var,
b, i,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section, summary,
time, mark, audio, video,{
    margin:0; padding:0; border:0; outline:0; vertical-align:baseline; background:transparent; }

html, body{height:100%; background: rgb(253, 241, 241);} /**/
    h1, h2, h3, h4, h5, h6, p, span, a{-webkit-transition:0.5s ease-out; transition:0.5s ease-out;}
    a:focus, a:hover{text-decoration:none;}
    ul{padding:0;}
    p{font-size:14px;}
body { line-height:1em; }

article,aside,details,figcaption,figure,
footer,header,hgroup,menu,nav,section { display:block; }

ul { list-style:none; }

blockquote, q { quotes:none;}

blockquote:before, blockquote:after,q:before, q:after { content:''; content:none;}

a { margin:0; padding:0; font-size:100%; vertical-align:baseline; background:transparent; text-decoration:none;	display:block;	-webkit-transition:0.5s ease-in; transition:0.5s ease-in; color:black;}
 
/* change colours to suit your needs */
ins {background-color:#ff9; color:#000;  text-decoration:none;}

/* change colours to suit your needs */
mark { background-color:#ff9; color:#000;  font-style:italic; font-weight:bold;}
del { text-decoration: line-through;}
abbr[title], dfn[title] { border-bottom:1px dotted; cursor:help;}
table {border-collapse:collapse; border-spacing:0;}
/* change border colour to suit your needs 
hr { display:block; height:1px;  border:0;  border-top:1px solid #cccccc; margin:0; padding:0;}*/
hr { display:block; border:0;  border-top:1px solid #F0F0F0; margin:0; padding:0;}
input, select {vertical-align:middle;}
img{	border:0;}
.clear-both{clear: both;}
	
</style>
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