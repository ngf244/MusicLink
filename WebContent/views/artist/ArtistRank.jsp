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
<title>아티스트 랭킹</title>
<style>
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height:800px;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:30%; color: rgb(224, 224, 224);} 
    
    #categoryArea{position: absolute; top: 2%; left: 3%; display: inline;}
    #contentArea{padding-top: 12%; text-align:center;}

    #inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
    #inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; top: 5%; margin-left:1%;}
    
    .promotionArea{margin-top:1%;}
    .subTitle{font-size:20px; font-weight:bold;}
    #hrstyle{border:0.4px solid lightgray; margin-top:1%;}

    .ar-line{width:100%; height:40px; background:rgba(0,0,0,0.8);}
    .line-box{width:80%; margin: 0 auto; height:40px; background:rgba(0,0,0,0.7); }
    .select-box{width:25%; height:30px; border-radius: 7px; margin-top:5px; font-size:12px; text-align: center; float:left;}

    .ranking-box{margin: 2%; height:453px;}
    .vedio-left{width:34%; margin-right:2%; height:inherit; background:#000; float:left;}
    .rank-right{width:64%; height:inherit; float:right; box-sizing: border-box; border-top:2px solid #000; border-bottom:2px solid #000;}
    .rank-left-1{width:15%; height:inherit; float:left;}
    .lrank{width:100%; background:rgba(100,100,100,0.4); height:89px; line-height: 89px; text-align: center; font-size:25px; font-weight: bold;}
    .lr-mid1{border-top:1px solid #000; border-bottom:1px solid #000;}
    .lr-mid3{border-top:1px solid #000; border-bottom:1px solid #000;}
    
    .rank-right-1{width:85%; height:inherit; float: right;}
    .rrank{width:100%; background:#fff; height:89px; overflow: hidden;}
    .rr-top{border-bottom:1px solid #000;}
    .rr-mid1{border-bottom:1px solid #000;}
    .rr-mid2{border-bottom:1px solid #000;}
    .rr-mid3{border-bottom:1px solid #000;}
    
    .at-photo{width: 14%; height:90%; margin-left:1%; padding-top:0.5%; border-radius: 30px; overflow: hidden; float:left;}
    .at-photo > img{width:100%; height: inherit;}
    .at-nickName{width:20%; height:80%; float:left; margin-left:1%; display: inline-block; text-align: center; padding-top: 3%; font-weight: bold;}
    .at-nickName >p{margin:0; padding:5px 0;}
    .genre{width:25%; margin-left:1%; height: inherit; float:left; text-align: center; line-height: 89px; font-size:16px; font-weight: bold;}
    .at-icon{width:37%; height:80%; float: left; padding-top:3%;}
    .at-icon-wrap{width:70%;; margin:0 auto;}
    .at-icon-wrap > a{width:25%; float:left; margin-left:5%;}
    .at-icon-wrap > a > img{width:100%;}
    #pagingarea{text-align:center; display:inline-block;}

    .paging .hide {display:block;height:0;width:0;font-size:0;line-height:0;margin:0;padding:0;overflow:hidden;}
    .paging{padding:19px;text-align:center;}
    .paging a{display:inline-block;width:23px;height:23px;padding-top:2px;vertical-align:middle;}
    .paging a:hover{text-decoration:underline;}
    .paging .btn_arr{text-decoration:none;}
    .paging .btn_arr, .paging .on{margin:0 3px;padding-top:0;border:1px solid #ddd; border-radius:30px;}
    .paging .on{padding-top:1px;height:22px;color:#fff;font-weight:bold;background:#000;}
    .paging .on:hover{text-decoration:none;}

</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
   
    <section style="z-index: 1;">
       <div id="categoryArea">
            <div id="block"></div><br>
            <label id="inBigCategory">ARTIST</label>
            <label id="inSmallCategory"> - Rank</label>
        </div>

        <div id="contentArea">
            <div class="promotionArea">
                <label class="subTitle">아티스트 랭킹</label><br>
                <hr id="hrstyle">
                
                    <div class="ar-line">
                    <div class="line-box">
                    <select class="select-box">
                        <option>카테고리를 선택하세요.</option>
                        <option>주간</option>
                        <option>팔로우</option>
                        <option>등등</option>
                        <option>기타</option>
                    </select>
                    </div>
                    </div>
           </div>

           <div class="ranking-box">
                <div class="vedio-left"></div>
                <div class="rank-right">
                    <div class="rank-left-1">
                        <div class="lr-top lrank">1</div>
                        <div class="lr-mid1 lrank">2</div>
                        <div class="lr-mid2 lrank">3</div>
                        <div class="lr-mid3 lrank">4</div>
                        <div class="lr-bot lrank">5</div>
                    </div>
                    <div class="rank-right-1">
                        <div class="rr-top rrank">
                            <div class="at-photo">
                                <img src="img/jungseonghwan01.jpg">
                            </div>
                            <div class="at-nickName">
                                <p>그룹명(활동명)</p>
                                <p>팔로워</p>
                            </div>
                            <div class="genre">
                                장르
                            </div>
                            <div class="at-icon">
                                <div class="at-icon-wrap">
                                    <a href="#">
                                        <img src="img/facebook.png">
                                    </a>
                                    <a href="#">
                                        <img src="img/instagram.png">
                                    </a>
                                    <a href="#">
                                        <img src="img/twitter.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rr-mid1 rrank">
                            <div class="at-photo">
                                <img src="img/pappertones01.jpg">
                            </div>
                            <div class="at-nickName">
                                <p>그룹명(활동명)</p>
                                <p>팔로워</p>
                            </div>
                            <div class="genre">
                                장르
                            </div>
                            <div class="at-icon">
                                <div class="at-icon-wrap">
                                    <a href="#">
                                        <img src="img/facebook.png">
                                    </a>
                                    <a href="#">
                                        <img src="img/instagram.png">
                                    </a>
                                    <a href="#">
                                        <img src="img/twitter.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rr-mid2 rrank">
                            <div class="at-photo">
                                <img src="img/pappertones01.jpg">
                            </div>
                            <div class="at-nickName">
                                <p>그룹명(활동명)</p>
                                <p>팔로워</p>
                            </div>
                            <div class="genre">
                                장르
                            </div>
                            <div class="at-icon">
                                <div class="at-icon-wrap">
                                    <a href="#">
                                        <img src="img/facebook.png">
                                    </a>
                                    <a href="#">
                                        <img src="img/instagram.png">
                                    </a>
                                    <a href="#">
                                        <img src="img/twitter.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rr-mid3 rrank">
                            <div class="at-photo">
                                <img src="img/pappertones01.jpg">
                            </div>
                            <div class="at-nickName">
                                <p>그룹명(활동명)</p>
                                <p>팔로워</p>
                            </div>
                            <div class="genre">
                                장르
                            </div>
                            <div class="at-icon">
                                <div class="at-icon-wrap">
                                    <a href="#">
                                        <img src="img/facebook.png">
                                    </a>
                                    <a href="#">
                                        <img src="img/instagram.png">
                                    </a>
                                    <a href="#">
                                        <img src="img/twitter.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="rr-bot rrank">
                            <div class="at-photo">
                                <img src="img/taeyeon01.jpg">
                            </div>
                            <div class="at-nickName">
                                <p>그룹명(활동명)</p>
                                <p>팔로워</p>
                            </div>
                            <div class="genre">
                                장르
                            </div>
                            <div class="at-icon">
                                <div class="at-icon-wrap">
                                    <a href="#">
                                        <img src="img/facebook.png">
                                    </a>
                                    <a href="#">
                                        <img src="img/instagram.png">
                                    </a>
                                    <a href="#">
                                        <img src="img/twitter.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <div class="paging">
          <a href="#" class="on">1</a>
          <a href="#">2</a>
          <a href="#">3</a>
          <a href="#">4</a>
          <a href="#">5</a>
          <a href="#">5</a>
          <a href="#">6</a>
          <a href="#">7</a>
          <a href="#">8</a>
          <a href="#">9</a>
          <a href="#">10</a>      
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