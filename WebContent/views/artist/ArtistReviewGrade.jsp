<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/reset.css" />
    <link href="css/slick.css" rel="stylesheet" />
    <link href="css/slick-theme.css" rel="stylesheet" /> 
    <link href="css/common.css" rel="stylesheet" />
    <link href="css/mfooter.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
<title>소통게시판</title>
<style>
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height:800px;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:30%; color: rgb(224, 224, 224);} 
    
    #categoryArea{position: absolute; top: 2%; left: 3%; display: inline;}
    #contentArea{padding-top: 8%; text-align:center;}

    #inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
    #inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; top: 5%; margin-left:1%;}
    
    .promotionArea{margin-top:1%;}
    .subTitle{font-size:20px; font-weight:bold;}
    #hrstyle{border:0.4px solid lightgray; margin-top:1%;}

    .artistBtn {width: 100%; height: 40px;}
    .newpage {float: left; width: 25%; height: 100%; border: 1px; outline: none; font-size: 16px; font-weight: bold; color: #fff; background-color: #a6a6a6;}

    .reviewtop{width:80%; height:16px; background-color: lightgray; margin-left:10%;}
    .score{width:28%; height:16px; float:left;}
    .coment{width:71.8%; height:16px; float:left;}

    .review{width:80%; height:520px; margin-left:10%;}
    table{width:100%; height:510px; border-top: 3px solid; border-bottom: 3px solid; border-color: black;}
    .tr1{border-bottom: 1px solid; border-color: lightgray;}
    .td1{width:28%;}
    .td2{width:71.8%; text-align:left;}

    .btn_style{margin-left: 0; border-radius: 0.25rem; position: relative; padding: 0.5rem 0.75rem;
        line-height: 1.25; color: #7571f9; background-color: #fff; border: 1px solid #dee2e6;}

</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
   
    <section style="z-index: 1;">
       <div id="categoryArea">
            <div id="block"></div><br>
            <label id="inBigCategory">ARTIST</label>
            <label id="inSmallCategory"> - Profile</label>
        </div>

        <div id="contentArea">
            <div class="promotionArea">
                <label class="subTitle">평점 및 리뷰</label><br>
                <hr id="hrstyle">
                <div class="artistBtn">
                    <button type="button" class="newpage" onClick="location.href='artistprofile.html'">프로필</button>
                    <button type="button" class="newpage" onClick="location.href='reviewgrade.html'">별점/리뷰</button>
                    <button type="button" class="newpage" onClick="location.href='community.html'">소통 게시판</button>
                    <button type="button" class="newpage" onClick="location.href='gallery.html'">갤러리 게시판</button>
                </div>
                <div class="reviewtop">
                    <div class="score">
                        	평점
                    </div>
                    <div class="coment">
                        	내용
                    </div>
                </div>
                <div class="review">
                    <table class="table1">
                        <tr class="tr1">
                            <td class="td1">☆☆☆☆☆</td>
                            <td class="td2">내용</td>
                        </tr>
                        <tr class="tr1">
                            <td class="td1">☆☆☆☆☆</td>
                            <td class="td2">내용</td>
                        </tr>
                        <tr class="tr1">
                            <td class="td1">☆☆☆☆☆</td>
                            <td class="td2">내용</td>
                        </tr>
                        <tr class="tr1">
                            <td class="td1">☆☆☆☆☆</td>
                            <td class="td2">내용</td>
                        </tr>
                        <tr class="tr1">
                            <td class="td1">☆☆☆☆☆</td>
                            <td class="td2">내용</td>
                        </tr>
                        <tr class="tr1">
                            <td class="td1">☆☆☆☆☆</td>
                            <td class="td2">내용</td>
                        </tr>        
                    </table>
                </div>    
           </div>
             <div class='paginaArea' align='center'>
            <!-- 맨 처음으로 -->
                <button class="btn_style">&lt;&lt;</button>
                
                <!-- 이전 페이지로 -->
                <button class="btn_style" id="beforeBtn">&lt;</button>
                
                <!-- 10개의 페이지 목록 -->
                <button class="btn_style" id="numBtn">1</button>
                <button class="btn_style" id="numBtn">2</button>
                <button class="btn_style" id="numBtn">3</button>
                <button class="btn_style" id="numBtn">4</button>
                
                
                <!-- 다음 페이지로 -->
                <button class="btn_style" id="afterBtn">&gt;</button>
                
                <!-- 맨 끝으로 -->
                <button class="btn_style">&gt;&gt;</button>
            </div>
        </div>
    </section>
    <h1 class="htext">A - r a n k</h1>
    
    
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
    
<script src="js/respond.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/parallax.min.js"></script>
<script src="js/slick.min.js"></script>
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
</body>
</html>