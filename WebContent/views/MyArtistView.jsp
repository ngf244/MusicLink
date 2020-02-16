<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../css/reset.css" />
    <link href="css/slick.css" rel="stylesheet" />
    <link href="css/slick-theme.css" rel="stylesheet" />
    <link href="../css/common.css" rel="stylesheet" />
    <link href="../css/mfooter.css" rel="stylesheet" />
<title>나의 아티스트</title>
<style>
    
    
    /* 섹션 */
    .section-txt{font-size:60px; width:45%; margin:0 auto; font-weight: bold; color:#fff; text-shadow: 1px 1px 15px #ccc;
                    position: absolute; bottom:-25%; left:28%;}
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:1000px; padding-top: 30px;} 
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top: 31%; left:34%; color: rgb(224, 224, 224);} 
    
    
    /* 사이드 메뉴 */
    .sec-line{width:4%; height:5px; background: yellow; margin:0; padding:0; margin-left:5%; margin-top:2%;}
    .sec-mtxt{margin-left:5%; margin-top: -15px;}
    .sec-mtxt > p{ display: inline-block; font-size:20px;}
    .sec-nav{width:22%; height:85%; border-right: 1px solid rgba(0,0,0,0.4); box-sizing: border-box; float:left;}
    .smenu{color:#ccc; font-size: 30px; margin:0; margin-top:20px;}
    .s-smenu{font-size:14px;margin-top:20px; color:#000;}
    .s-smenu > li{padding:5px 10px;}    
    
    /* 나의 아티스트 */
    .sec-menu-views{width:78%; height:90%; padding:10px; float:left; border:1px solid rgba(255,255,255,0); box-sizing: border-box;}
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif;}

    .artistInfo{border-bottom: 1px solid rgb(209, 209, 209); margin-top: 2%; padding-left: 5%;}

    .profileBox {
        width: 120px;
        height: 120px; 
        border-radius: 70%;
        overflow: hidden;
        display: inline-block;
        background: lightgray;
    }

    .profile {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .artistDesc{display: inline-block; line-height: 30px;}
    .artist h3 {background: #af9ce6;}
    
    /*페이징 css*/
    #pagingarea{text-align:center; display:inline-block; margin-top:5%; margin-left: 40%}	
	
	.pagination {
	  display: flex;
	  padding-left: 0;
	  list-style: none;
	  border-radius: 0.25rem; 
	}

	.page-link {
	  position: relative;
	  display: block;
	  padding: 0.5rem 0.75rem;
	  margin-left: -1px;
	  line-height: 1.25;
	  color: #7571f9;
	  background-color: #fff;
	  border: 1px solid #dee2e6; 
	}
	
	.page-link:hover {
	    z-index: 2;
	    color: #2e28f6;
	    text-decoration: none;
	    background-color: #e9ecef;
	    border-color: #dee2e6; 
	}
	  
	.page-link:focus {
	    z-index: 2;
	    outline: 0;
	    box-shadow: 0 0 0 0.2rem rgba(117, 113, 249, 0.25); 
	}
	
	.page-link:not(:disabled):not(.disabled) {
	    cursor: pointer; 
	}

	.page-item:first-child .page-link {
	  margin-left: 0;
	  border-top-left-radius: 0.25rem;
	  border-bottom-left-radius: 0.25rem; 
	}
	
	.page-item:last-child .page-link {
	  border-top-right-radius: 0.25rem;
	  border-bottom-right-radius: 0.25rem; 
	}
	
	.page-item.active .page-link {
	  z-index: 1;
	  color: #fff;
	  background-color: #7571f9;
	  border-color: #7571f9; 
	}
	
	.page-item.disabled .page-link {
	  color: #f7fafc;
	  pointer-events: none;
	  cursor: auto;
	  background-color: #fff;
	  border-color: #dee2e6; 
	}
	
	.pagination-lg .page-link {
	  padding: 0.75rem 1.5rem;
	  font-size: 1.09375rem;
	  line-height: 1.5; 
	}
	
	.pagination-lg .page-item:first-child .page-link {
	  border-top-left-radius: 0.3rem;
	  border-bottom-left-radius: 0.3rem; 
	}
	
	.pagination-lg .page-item:last-child .page-link {
	  border-top-right-radius: 0.3rem;
	  border-bottom-right-radius: 0.3rem; 
	}
	
	.pagination-sm .page-link {
	  padding: 0.25rem 0.5rem;
	  font-size: 0.76563rem;
	  line-height: 1.5; 
	}
	
	.pagination-sm .page-item:first-child .page-link {
	  border-top-left-radius: 0.2rem;
	  border-bottom-left-radius: 0.2rem; 
	}
	
	.pagination-sm .page-item:last-child .page-link {
	  border-top-right-radius: 0.2rem;
	  border-bottom-right-radius: 0.2rem; 
	}
	
	.page-item.disabled .page-link {
	  color: #bbbbbb; 
	}
	
	.page-item .page-link:focus {
	  box-shadow: none; 
	}
  
	.sr-only {
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  overflow: hidden;
	  clip: rect(0, 0, 0, 0);
	  white-space: nowrap;
	  border: 0; 
	}
	
	.sr-only-focusable:active, .sr-only-focusable:focus {
	  position: static;
	  width: auto;
	  height: auto;
	  overflow: visible;
	  clip: auto;
	  white-space: normal; 
	}  


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
                <a href="#" class="icon-a"><img src="../img/user.png" alt="" /></a>
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
    
    
    <section style="z-index: 1;">
        <div class="sec-line"></div>
        <h1 class="sec-mtxt">MyPage<p>-MyArtist</p></h1>
        <ul class="sec-nav">
            <li class="sec-menu-1 smenu">INFORMATION
                <ul class="s-smenu">
                    <li><a href='PwdCheckForm.jsp'>회원정보 열람/수정/탈퇴</a></li>
                    <li><a href='MyPostView.jsp'>내가 작성한 글/댓글</a></li>
                    <li><a href='MypageNoticeView.jsp'>알람창</a></li>
                </ul>
            </li>
            <li class="sec-menu-2 smenu">FOLLOW
                <uL class="s-smenu">
                    <li><a href='MyArtistView.jsp'>나의 아티스트</a></li>
                    <li><a href='MyArtistSchedule.jsp'>팔로잉 아티스트의 행사</a></li>
                </uL>
            </li>
            <li class="sec-menu-3 smenu">BECOME
                <ul class="s-smenu">
                    <li><a href='BecomeArtistForm.jsp'>아티스트 등록</a></li>
                    <li><a href='BecomePlannerForm.jsp'>행사기획자 등록</a></li>
                </ul>
            </li>
            <li class="sec-menu-4 smenu">EVENT-1
                <ul class="s-smenu">
                    <li>공연스케줄</li>
                    <li>지원한 행사</li>
                    <li>러브콜(receive)</li>
                    <li>행사 후기</li>
                </ul>
            </li>
            <li class="sec-menu-5 smenu">EVENT-2
                <ul class="s-smenu">
                    <li>등록한 행사</li>
                    <li>러브콜(send)</li>
                    <li>아티스트 후기</li>
                </ul>
            </li>
        </ul>
        
        <div class="sec-menu-views views1">
            <div class="artist">
                <h3>나의 아티스트</h3>
                <div class="artistInfo">
                    <div class="profileBox">
                        <img class="profile" src="">
                    </div>
                    <div class="artistDesc">
                        <ul>
                            <li>아티스트 명 : </li>
                            <li>장르 : </li>
                            <li>활동지역 : </li>
                            <li><a href="">more</a></li>
                        </ul>
                    </div>                   
                </div>
                <div class="artistInfo">
                    <div class="profileBox">
                        <img class="profile" src="">
                    </div>
                    <div class="artistDesc">
                        <ul>
                            <li>아티스트 명 : </li>
                            <li>장르 : </li>
                            <li>활동지역 : </li>
                            <li><a href="">more</a></li>
                        </ul>
                    </div>  
                </div>
                <div class="artistInfo">
                    <div class="profileBox">
                        <img class="profile" src="">
                    </div>
                    <div class="artistDesc">
                        <ul>
                            <li>아티스트 명 : </li>
                            <li>장르 : </li>
                            <li>활동지역 : </li>
                            <li><a href="">more</a></li>
                        </ul>
                    </div>  
                </div>
                <div class="artistInfo">
                    <div class="profileBox">
                        <img class="profile" src="">
                    </div>
                    <div class="artistDesc">
                        <ul>
                            <li>아티스트 명 : </li>
                            <li>장르 : </li>
                            <li>활동지역 : </li>
                            <li><a href="">more</a></li>
                        </ul>
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
        
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>
    
    
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