<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, artist.model.vo.*" %>
<%
	ArrayList<Artist> list = (ArrayList<Artist>)request.getAttribute("aList");
	boolean isReceive = true;
	if(list == null) {
		isReceive = false;
	}
	
%>
<!DOCTYPE html> 
<html>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/menu.css" />
<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Baloo+Bhai&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Fugaz+One&display=swap" rel="stylesheet">

 

<head>
<meta charset="UTF-8">
<title>뮤링 메인</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f12f8983e3395277ce748044a97f80ae&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		if(<%=isReceive%> == false){
			location.href="<%=request.getContextPath()%>/start.do";
		}
	});
</script>

<style>
	.cm {color:#ffe618 }	/* 메인 */
	.cs {color:#c0dae9 }	/* 서브 */
	.ck {color:#111427 }	/* 검은색 */
	.cw {color:#fff }	/* 흰색 */
	.ci {color:#fff079 }	/* 옅은 노랑*/
	.cb {color:#80828d }	/* 옅은 회색1 */
	.cg {color:#a8a9b5 }	/* 옅은 회색2 */
	.ca {color:#c9cbd7 }	/* 옅은 회색3 */

	
    body{margin:0;}
    /*베너*/
    #banner{width:100%; height:967px; position: fixed; top:0; background:rgb(253, 241, 241); z-index:-11;} 
    .bar-left{width:50%; height: inherit; position: absolute; top:0; left:0;/*background:#fff;*/}
    .bar-right{width:50%; height: inherit; position: absolute; top:0; left:50%; /*background:#fff;*/}
    .slide-bg{width:100%; height: inherit; float: right; }
    .bg-1{width:70%; float: right;}
    .bg-1 > img{width:100%; height:969px;}
    .bg-h-top{position: absolute; top: 22%; left:57%;}
    .bg-h-top > h2:nth-child(1), .bg-h-top > h2:nth-child(2){margin: 10px 0; color:#fff;}
    .bg-h-top > h2:nth-child(3){margin:15px 0 0 0; font-weight: bold;}
    .bg-h-mid{position: absolute; top: 32%; left: 58%;}
    .bg-h-mid > h1{font-family: 'Baloo Bhai', cursive; font-weight: itaric;}
    .bg-h-mid > h1:nth-child(2){margin-left:35px; margin-top: -60px;}
    .bg-h-mid > h1:nth-child(1) > p{display: inline-block; font-size:50px; }
    .bg-h-mid > h1:nth-child(2) > p{display: inline-block; font-size:100px; margin-top:0;}
    .bg-h-bot{position: absolute; bottom: 35%; left:56%;}
    .bg-h-bot > h2{margin-bottom: 50px;}
    .peo-num{margin-left:10px; font-size:100px; font-weight: bold; color:#fff;}
    .bg-2{float:right;}
    .bg-2>img{width:50%; height:969px;}
    
    .slide-btn{position: absolute; bottom:5%; left:60%;}
    .sbtn-1{width:15px; padding:5px 15px; background:#000; margin-right:15px; display: inline-block;}
    .sbtn-2{width:15px; padding:5px 15px; background:#fff; display: inline-block;}
    
    .bar-right{position: absolute; top:0;}
    .ban-mid-txt{position: absolute; top:40%; left:15%;}
    .ban-mid-txt > p{font-size:130px; font-weight:bold; line-height:90px; margin:0; padding: 0; color:#fff;}
    .ban-top-txt{position: absolute; top: 49%; left:22%;}
    .ban-top-txt > h4{margin:0; padding:0; font-weight: 800; margin-bottom:5px;}
    .banner-more{position: absolute; bottom: 27%; left:15%;}
    .banner-more > a{ font-weight: bold; color:#000; padding:15px 30px; background: #fff; box-sizing: border-box; box-shadow: 1px 1px 10px black; border-radius: 5px;} 
    
    .bg-scroll{width: 50px; height:30px; text-align: center; position: absolute; bottom:3%; left: 48.7%;}
    .scroll-line{width:20px; height: 30px; border:1px solid black; margin: 0 auto; box-sizing: border-box; border-radius: 8px;}
    .scr-point{width:5px; height:8px; background:#000; margin:0 auto; border-radius:8px;}
    .scr-txt{}
    
    
    /* 섹션 */
    #sWrap{width:100%; height:1404px; margin-top:969px; position: relative; background: rgb(253, 241, 241); padding-top:150px; z-index:1;}
    .section-txt{font-size:60px; width:45%; margin:0 auto; font-weight: bold; color:#fff; text-shadow: 1px 1px 15px #ccc;
                    position: absolute; bottom:-25%; left:28%;}
    #section {width:70%; margin:0 auto; box-shadow: 5px 5px 35px black;/*  margin-top:969px;position: absolute;*/  
    background: #fff; height:1404px;} 
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:1%; left:36%; color: rgb(224, 224, 224); } 
    
    .s-header{width:100%; padding-top:100px; padding-left:8%;}
    .msec-line{width:7%; height:10px; background: rgb(138, 255, 0); margin-bottom:-65px;}
    .s-header > h1{float:left; font-size:70px;}
    .s-header > h1 > p{display: inline-block; font-size:45px;}
    .ar-line{width:100%; height:50px; background:rgba(0,0,0,0.8);}
    .line-box{width:80%; margin: 0 auto; height:50px; background:rgba(0,0,0,0.7); }
    .select-box{width:25%; height:40px; border-radius: 7px; margin-top:5px; margin-left: 5%; font-size:16px; text-align: center;}
    .ranking-box{margin: 2%; height:350px;}
    .vedio-left{width:34%; margin-right:2%; height:inherit; background:#000; float:left;}
    .rank-right{width:64%; height:inherit; float:right; box-sizing: border-box; border-top:2px solid #000; border-bottom:2px solid #000;}
    .rank-left-1{width:15%; height:inherit;float:left;}
    .lrank{width:100%; background:rgba(100,100,100,0.4); height:114.7px; line-height: 114.7px; text-align: center; font-size:25px; font-weight: bold;}
    .lr-mid{border-top:1px solid #000; border-bottom:1px solid #000;}
    
    .rank-right-1{width:85%; height:inherit; float: right;}
    .rrank{width:100%; background:#fff; height:114.7px; overflow: hidden;}
    .rr-mid{border-top:1px solid #000; border-bottom:1px solid #000;}
    .at-photo{width: 14%; height:96%; margin-left:1%; padding-top:0.7%; border-radius: 30px; overflow: hidden; float:left;}
    .at-photo > img{width:100%; height: inherit;}
    .at-nickName{width:20%; height:80%; float:left; margin-left:1%; display: inline-block; text-align: center; padding-top: 5%; font-weight: bold;}
    .at-nickName >p{margin:0; padding:5px 0;}
    .genre{width:25%; margin-left:1%; height: inherit; float:left; text-align: center; line-height: 114.7px; font-size:16px; font-weight: bold;}
    .at-icon{width:37%; height:80%; float: left; padding-top:5%;}
    .at-icon-wrap{width:70%;; margin:0 auto;}
    .at-icon-wrap > a{width:25%; float:left; margin-left:5%;}
    .at-icon-wrap > a > img{width:100%;}
    
    .rankBtn-bg{width: 100%; height:150px;}
    .rankBtn-bg > a{width:15%; font-size:20px; height: 50px; line-height: 50px; margin:0 auto; text-align: center; background:#000; color:#fff; margin-top: 150px; font-weight: bold;}
    .img-bg{width:100%;}
    .img-bg > img{width:100%;}
    
    .sec-ybg{width:100%; /* height:450px; */ padding:0; margin:0; background: rgb(179, 255, 0); position: relative; top:-150px;}
    .ybg-txt1{font-size:100px; font-weight: bold; position: absolute; bottom:25%; left: 21%; color:rgba(255,255,255,0.5); text-shadow: 1px 1px 400px black;}
    .ybg-txt2{font-size:30px; font-weight: bold; position: absolute; bottom: 23%; left: 32%;}
    
</style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp" %>
	
	<div id="banner">
        <div class="bar-left">
            <div class="slide-bg">
                <div class="bg-slide">
                    <div class="bg-1">
                        <img src="img/phone1.jpg">
                        <div class="bg-h-top">
                            <h2>E-BUSINESS</h2>
                            <h2>COMPANY</h2>
                            <h2>MUSIC LINK</h2>
                        </div>
                        <div class="bg-h-mid">
                            <h1><p>M</p>USIC</h1>
                            <h1><p>L</p>INK</h1>
                        </div>
                        <div class="bg-h-bot">
                            <h2>ARTIST</h2>
                            <div class="peo-num">328</div>
                        </div>
                        <div class="slide-btn">
                            <div class="sbtn-1"></div>
                            <div class="sbtn-2"></div>
                        </div>
                    </div>
                    <div class="bg-2">
                    </div>
                </div>
            </div>
        </div>
        <div class="bar-right">
            <div class="ban-mid-txt">
                <p class="rtxt-top">WE ARE</p>
                <p class="rtxt-bot">CREATIVE</p>
            </div>
            <div class="ban-top-txt">
                <h4 class="top-txt-top">뮤직링크는 E-비지니스 마케팅 엔터테인먼트 입니다.</h4>
                <h4 class="top-txt-bot">온라인 서비스 컨설팅과 홈페이지, 서비스를 제공하고 있습니다.</h4>
            </div>
            <div class="banner-more">
                <a href="#" >MORE</a>
            </div>
        </div>
        <div class="bg-scroll">
            <div class="scroll-line">
                <div class="scr-point"></div>
            </div>
            <div class="scr-txt">scroll</div>
        </div>
    </div>
    <div class="clear-both"></div>
    
    <div class="section-txt">성공적인 매칭을 해드립니다.</div>
    
    <div id="sWrap">
    
    <section style="z-index:1;" id="section">
    	
        <div class="s-header">
            <div class="msec-line"></div>
            <h1>ARTIST<p> - R a n k</p></h1>
        </div>
        <div class="clear-both"></div>
        
        <div class="content-m1">
            <div class="ar-line">
                <div class="line-box">
                    <!-- <select class="select-box">
                        <option>카테고리를 선택하세요.</option>
                        <option>주간</option>
                        <option>팔로우</option>
                        <option>등등</option>
                        <option>기타</option>
                    </select> -->
                </div>
            </div> 
            <div class="ranking-box">
                <iframe class="vedio-left" src="https://www.youtube.com/embed/eP4ga_fNm-E" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                <div class="rank-right">
                    <div class="rank-left-1">
                        <div class="lr-top lrank">1</div>
                        <div class="lr-mid lrank">2</div>
                        <div class="lr-bot lrank">3</div>
                    </div> 
                    <div class="rank-right-1">
                    	<%	if(isReceive == true){ %>
	                    	<% for(Artist a : list){ %>
	                        <div class="rr-bot rrank">
	                            <div class="at-photo">
	                                <img src=" <%= request.getContextPath() %>/artistProfile_uploadFiles/<%= a.getAtPicPath() %>">
	                            </div>
	                            <div class="at-nickName">
	                                <p><%= a.getAtName() %></p>
	                            </div>
	                            <div class="genre"><%= a.getAtGenre() %></div>
	                            <div class="at-icon">
	                                <div class="at-icon-wrap">
	                                    <a href="<%= a.getAtFacebook() %>" target="_blank">
	                                        <img src="<%= request.getContextPath() %>/img/facebook.png">
	                                    </a>
	                                    <a href="<%= a.getAtInsta() %>" target="_blank">
	                                        <img src="<%= request.getContextPath() %>/img/instagram.png">
	                                    </a>
	                                    <a href="<%= a.getAtTwitter() %>" target="_blank">
	                                        <img src="<%= request.getContextPath() %>/img/twitter.png">
	                                    </a>
	                                </div>
	                            </div>
	                        </div>
	                        <% } %>
                    	<% } %>
                    </div>
                </div>
            </div>
            <div class="rankBtn-bg">
                <a href="#">MORE ></a>
            </div>
        </div>
        <div class="img-bg">
            <img src="<%= request.getContextPath() %>/img/bgbgbg.png">
        </div>
        <h1 class="htext" style="z-index:-1">A R T I S T</h1>
    </section>
    </div>
    
    <div class="sec-ybg">
        <div class="ybg-txt1">FESTIVAL COMPLETION</div>
        <div class="ybg-txt2">2020년, 현재까지 134개의 행사가 완료되었습니다.</div>
    </div>
    <div class="clear-both"></div>
    
    
    <%@ include file="views/common/footer.jsp" %>
    
    <script>
    
    
    
    $(window).scroll(function() { 
        if ($(this).scrollTop() == 0) { 
        	$('#sWrap').css('margin-top','969px');
        	$('#sWrap').css('transition','2s');
        	$('#section').css();
        	$('#section').css();
        	/* $('.htext').css({'top':'130%'}); */
        	
        } else {
        	$('#sWrap').css('margin-top','0');
        	$('#sWrap').css('transition','2s');
        	/* $('.htext').css({'top':'10%','transition':'2s'}); */
        }
    });
    	
    </script>
   
</body>
</html>