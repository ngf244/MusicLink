<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
    <!-- Custom Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
    
	<script src="../js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/reset.css" />
    <link href="../css/slick.css" rel="stylesheet" />
    <link href="../css/slick-theme.css" rel="stylesheet" />
    <link href="../css/mfooter.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
<title>행사 지원</title>
<style>
    section {width:70%; min-height:105%; padding-bottom:60px; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 19.5%; position: relative;
    background: #fff; display: block;}
    
    .htext{text-align: center; font-size: 100px; height:0; position:absolute; top:47%; left: 50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
	
	#categoryArea{position: absolute; top: 3.3%; left: 3%; display: inline;}
	#contentArea{padding-top: 12%; text-align: center; display: inline-block;}
	
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; top: 5%; margin-left:1%;}
    
    #searchArea{width: 80%; height:40px; display: inline-block; text-align: center;}
    #searchArea select, input, #alignImg{vertical-align: middle; display: inline-block; text-align: center;}
    #alignImg{width:40px; height:40px; margin-left: 1.5%;}
    #icon{width: 30px; height: 30px; vertical-align: middle;}
    .dropdown{width: 20%; height: 40px; padding-left: 1.5%; margin-right: 4px; font-size:14px;}
    .selectdrop option{border-radius: 0.25rem;}
    .searchtext{width: 60%; height: 30px; margin-left: 1.5%; border-radius: 4px;}
    
    #listSort{font-size:14px; width:100%; text-align:right; float: right; margin-top:6%; margin-right:10%;}
    
    #listArea{margin-top:5%; margin-right:10%; /*background:yellow;*/ display: block; margin-left:10%;}
    #festivalList{display:block;}
    .promotionDetailImg{width:114px; height:150px; background:lightgray; display:inline-block; vertical-align:top; text-align:right;}
    .alignspanlist{font-weight: bold;}
    .festival{display:inline-block; width:80%; margin-top:25px; text-align:left;}
    .festivalInfo{display:inline-block; width:75%; margin-top: 5px; margin-left: 13px; /*background:orange;*/}
    .festivalInfo span, label, button{vertical-align:middle;}
    #artistNotice{font-size:13px; color: white; background: green; margin-right: 10px;}
    #festivalName{font-size:17px;}
    .festivalDetail{margin-top:5px; font-size:13px; line-height:2.1; /*border-spacing: 5px; border-collapse: separate;*/}
    
    .approachBtn{float: right; font-size: 13px; width: 90px; height: 25px; margin-top:-4px; line-height: 0.9; color:white;}
    
    #pagingarea{text-align:center; display:inline-block; margin-top:5%;}
    .listPaging{}
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
                <a href="member/login.html" class="icon-a"><img src="../img/user.png" alt="" /></a>
            </div>
            <div class="image2 icon">
                <a href="#" ><img src="../img/bell.png" alt="" /></a>
            </div>
            <div class="image3 icon">
                <img src="../img/pin.png" alt="" />
            </div>
            <div class="side-text">
                <p>&#169; 2019 MUSICLINK <sapn class=>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</sapn></p>
            </div>
        </div>
    </header>
    
    <!-- 행사 지원 코딩 시작 -->
	<section style="z-index: 1;">
		<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">FESTIVAL</label>
			<label id="inSmallCategory"> - Approach</label>
		</div>
		
		<div id="contentArea">
			<div id="listArea">
			
				<div id="searchArea">
					<div class="input-group">
						<select class="btn btn-outline-dark selectdrop dropdown">
							<option>검색 종류</option>
							<option>행사명</option>
							<option>주최사명</option>
						</select>
                        <input type="text" class="form-control input-default searchtext">
                        <div id="alignImg"><img src="../icons/search.png" id="icon" /></div>
					</div>
				</div>
				
				<div id="listSort">
					<label class="category">최근등록순</label>
					<label class="category">&nbsp; | &nbsp;</label>
					<label class="category">날짜순</label>
					<label class="category">&nbsp; | &nbsp;</label>
					<label class="category">공연비높은순</label>
					<label class="category">&nbsp; | &nbsp;</label>
					<label class="category">공연비낮은순</label>
				</div>
				
				<div id="festivalList">
					<div class="festival">
						<div class="promotionDetailImg"></div>
						<div class="festivalInfo">
							<span class="badge badge-pill badge-success alignspanlist">아티스트 모집 중</span> &nbsp;
							<label id="festivalName">행사명</label>
							<button type="button" class="btn mb-1 btn-warning approachBtn">행사 지원</button>
							
							<table class="festivalDetail">
								<tr>
									<td>행사 기간</td>
									<td rowspan=4>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>2020.08.30 ~ 2020.09.05</td>
								</tr>
								<tr>
									<td>아티스트 모집 기간</td>
									<td>2020.07.01 ~ 2020.07.21</td>
								</tr>
								<tr>
									<td>모집 아티스트 팀 수</td>
									<td>6팀</td>
								</tr>
								<tr>
									<td>확정 아티스트</td>
									<td>윤하</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="festival">
						<div class="promotionDetailImg"></div>
						<div class="festivalInfo">
							<span class="badge badge-pill badge-success alignspanlist">아티스트 모집 중</span> &nbsp;
							<label id="festivalName">행사명</label>
							<button type="button" class="btn mb-1 btn-warning approachBtn">행사 지원</button>

							
							<table class="festivalDetail">
								<tr>
									<td>행사 기간</td>
									<td rowspan=4>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>2020.08.30 ~ 2020.09.05</td>
								</tr>
								<tr>
									<td>아티스트 모집 기간</td>
									<td>2020.07.01 ~ 2020.07.21</td>
								</tr>
								<tr>
									<td>모집 아티스트 팀 수</td>
									<td>6팀</td>
								</tr>
								<tr>
									<td>확정 아티스트</td>
									<td>윤하</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="festival">
						<div class="promotionDetailImg"></div>
						<div class="festivalInfo">
							<span class="badge badge-pill badge-success alignspanlist">아티스트 모집 중</span> &nbsp;
							<label id="festivalName">행사명</label>
                            <button type="button" class="btn mb-1 btn-secondary approachBtn">지원 완료</button>

							
							<table class="festivalDetail">
								<tr>
									<td>행사 기간</td>
									<td rowspan=4>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>2020.08.30 ~ 2020.09.05</td>
								</tr>
								<tr>
									<td>아티스트 모집 기간</td>
									<td>2020.07.01 ~ 2020.07.21</td>
								</tr>
								<tr>
									<td>모집 아티스트 팀 수</td>
									<td>6팀</td>
								</tr>
								<tr>
									<td>확정 아티스트</td>
									<td>윤하</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				
				<div id="pagingarea">
                	<ul class="pagination">
                		<li class="page-item">
                			<a class="page-link" href="#" aria-label="Previous">
                				<span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
							</a>
                        </li>
                        <li class="page-item">
                        	<a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                        	<a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                        	<a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                        	<a class="page-link" href="#" aria-label="Next">
                        		<span aria-hidden="true">&raquo;</span>
                        		<span class="sr-only">Next</span>
                        	</a>
                        </li>
                	</ul>
				</div>
			</div>
		</div>
    </section>
    
    <script>
    </script>
    
    <h1 class="htext">F E S T I V A L</h1>
    <!-- 행사 지원 코딩 끝 -->
    
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
    
    <!--**********************************
        Scripts
    ***********************************-->
    <script src="../plugins/common/common.min.js"></script>
    <script src="../js/custom.min.js"></script>
    <script src="../js/settings.js"></script>
    <script src="../js/gleek.js"></script>
    <script src="../js/styleSwitcher.js"></script>
    
<script src="../js/respond.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../js/wow.min.js"></script>
<script src="../js/parallax.min.js"></script>
<script src="../js/slick.min.js"></script>
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