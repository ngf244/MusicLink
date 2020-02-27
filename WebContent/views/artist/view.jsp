<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="community.Community" %>
<%@ page import="community.CommunityDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

    <link href="../css/style.css" rel="stylesheet">
    
	<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
    <link rel="stylesheet" type="text/css" href="../css/reset.css" />
    <link href="../css/slick.css" rel="stylesheet" />
    <link href="../css/slick-theme.css" rel="stylesheet" />
    <link href="../css/common.css" rel="stylesheet" />
    <link href="../css/mfooter.css" rel="stylesheet" />
<title>소통 게시판 작성</title>
<style>
    section{width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 20%; position: relative;
    background: #fff;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:50%; transform: translateX(-50%); color: rgb(224, 224, 224);} 
	
    #categoryArea {padding-top: 35px; padding-left: 30px; color: #76838f;}
	#contentArea{padding-top: 45px; padding-bottom: 45px;}
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
	#block {background: #8AFF00; width: 55px; height: 8px; top: 5%;}
	
	#contentArea{width: 100%; text-align:center; padding-top: 5%; padding-bottom: 5%; font-family: 'Noto Sans KR', sans-serif;}
	#table_show{width: 85%; margin-left: auto; margin-right: auto; text-align:center;}
	.board_title{padding: 10px; /*border-bottom: 2px solid lightgray;*/ height: 20px; vertical-align: middle;}
	.board_content{padding: 10px;}
	#btntd{text-align: right;}
	.labeltd{width:12%; font-size: 15px;}
	
	#inputTable{width:100%;}
	.inputboard{height:40px;}
	.inputtextarea{border-radius: 4px; resize:none;}
	
	#updateBtn{margin-right: 2%;}
	#btntd button{margin-top: 1%;}
	
	.ft-content{width: 70%;}
</style>
</head>
<body>
	<%
		String USER_CODE = null;
		if (session.getAttribute("USER_CODE") != null){
			USER_CODE = (String) session.getAttribute("USER_CODE");
		}
		int CM_CODE = 0;
		if (request.getParameter("CM_CODE") != null){
			CM_CODE = Integer.parseInt(request.getParameter("CM_CODE"));
		}
		if (CM_CODE == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
		Community community = new CommunityDAO().getCommunity(CM_CODE);
	%>
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
    	<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">MUSICLINK</label> 
			<label id="inSmallCategory"> - Artist 맘대로 (소통게시글 작성)</label>
		</div>
		<div id="contentArea">
			<div id="table_show">
				<table id="inputTable">
					<tr>
						<td class="board_title labeltd">제목</td>
						<td class="board_title"><%= community.getCM_TITLE() %></td>
					</tr>
					<tr>
						<td class="board_content labeltd">내용</td>
						<td class="board_content"><%= community.getCM_CONTENT() %></td>
					</tr>
					<%
						if(USER_CODE != null && USER_CODE.equals(community.getUSER_CODE())) {
					%>
					<tr>
						<td></td>
						<td id="btntd">
							<a href="update.jsp?CM_CODE=<%= CM_CODE %>" class="btn mb-1 btn-secondary" id="updateBtn">수정</a>
							<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?CM_CODE=<%= CM_CODE %>" class="btn mb-1 btn-secondary" id="deleteBtn">삭제</a>
						</td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
    </section>
    <h1 class="htext">수정해주세요</h1>
    
    
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
<script src="../js/bootstrap.min.js"></script>
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