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
<title>갤러리 게시판</title>
<style>
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height:800px;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:30%; color: rgb(224, 224, 224);} 
    
    #categoryArea{position: absolute; top: 2%; left: 3%; display: inline;}
    #contentArea{padding-top: 10%; text-align:center;}

    #inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
    #inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; top: 5%; margin-left:1%;}
    
    .promotionArea{margin-top:1%;}
    .subTitle{font-size:20px; font-weight:bold;}
    #hrstyle{border:0.4px solid lightgray; margin-top:1%;}
    
    .artistBtn {width: 100%; height: 40px;}
    .newpage {float: left; width: 25%; height: 100%; border: 1px; outline: none; font-size: 16px; font-weight: bold; color: #fff; background-color: #a6a6a6;}

    .table-responsive {text-align: center; border-radius: 3px; box-shadow: 0px;}
    
    th {text-align: inherit;}
    
    .table {width: 90%; margin-left: 5%; margin-bottom: 1rem; text-align: center;}
    
    .table th, .table td {padding:0.75rem; vertical-align: top; border-top: 1px solid #dee2e6;}
    
    .table thead th {vertical-align: bottom; border-bottom: 2px solid #dee2e6;}
    
    .table tbody+tbody {border-top: 2px solid #dee2e6;}
    
    .badge-primary {background-color: #7571f9;}
    
    .badge-success {background-color: #6fd96f;}
    
    .px-2 {padding-left: 0.5rem !important; padding-right: 0.5rem !important; border-radius: 0.25rem; padding: 5px;}
    
    #write_box{display: inline-block; margin-left: 60%;}
    
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
            <label id="inSmallCategory"> - Community</label>
        </div>

        <div id="contentArea">
            <div class="promotionArea">
                <label class="subTitle">갤러리 게시판</label><br>
                <hr id="hrstyle">
                <div class="artistBtn">
                    <button type="button" class="newpage" onClick="location.href='artistprofile.html'">프로필</button>
                    <button type="button" class="newpage" onClick="location.href='reviewgrade.html'">별점/리뷰</button>
                    <button type="button" class="newpage" onClick="location.href='community.html'">소통 게시판</button>
                    <button type="button" class="newpage" onClick="location.href='gallery.html'">갤러리 게시판</button>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>작성자</th>
                            <th>제목</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>1</th>
                            <td>게시판 주인</td>
                            <td>A</td>
                            <td>2020-02-06</td>
                        </tr>
                        <tr>
                            <th>2</th>
                            <td>게시판 주인</td>
                            <td>R</td>
                            <td>2020-02-06</td>
                        </tr>
                        <tr>
                            <th>3</th>
                            <td>게시판 주인</td>
                            <td>T</td>
                            <td>2020-02-06</td>
                        </tr>
                        <tr>
                            <th>4</th>
                            <td>게시판 주인</td>
                            <td>I</td>
                            <td>2020-02-06</td>
                        </tr>
                        <tr>
                            <th>5</th>
                            <td>게시판 주인</td>
                            <td>S</td>
                            <td>2020-02-06</td>
                        </tr>
                        <tr>
                            <th>6</th>
                            <td>게시판 주인</td>
                            <td>T</td>
                            <td>2020-02-06</td>
                        </tr>
                        <tr>
                            <th>7</th>
                            <td>게시판 주인</td>
                            <td>!!</td>
                            <td>2020-02-06</td>
                        </tr>
                        <tr>
                            <th>8</th>
                            <td>게시판 주인</td>
                            <td>!!!</td>
                            <td>2020-02-06</td>
                        </tr>
                        <tr>
                            <th>9</th>
                            <td>게시판 주인</td>
                            <td>!!!!</td>
                            <td>2020-02-06</td>
                        </tr>
                        <tr>
                            <th>10</th>
                            <td>게시판 주인</td>
                            <td>?????</td>
                            <td>2020-02-06</td>
                        </tr>
                    </tbody>
                </table>
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
                
                <div id="write_box">
                    <button class="btn_style" id="write">글쓰기</button>
                </div>
            </div>
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