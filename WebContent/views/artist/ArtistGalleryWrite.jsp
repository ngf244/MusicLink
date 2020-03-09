<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="gallery.GalleryDAO2" %>
<%@ page import="gallery.Gallery2" %>
<%@ page import="java.util.ArrayList" %>
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
<title>갤러리 게시판 작성</title>
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
	
	.imagegroup{width:50%; text-align:left; top:25%; transform: translateY(25%);}
	.custom-file-label{color:gray;}
	
	#updateBtn{margin-right: 2%;}
	#btntd button{margin-top: 1%;}
	
	.ft-content{width: 70%;}
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
   
    <section style="z-index: 1;">
    	<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">MUSICLINK</label> 
			<label id="inSmallCategory"> - Artist 맘대로 (갤러리게시글 작성)</label>
		</div>
		<div id="contentArea">
			<div id="table_show">
				<table id="inputTable">
					<tr>
						<td class="board_title labeltd">제목</td>
						<td class="board_title">
							<input type="text" class="form-control input-default inputboard" placeholder="제목을 입력해주세요">
						</td>
					</tr>
					<tr>
						<td class="board_content labeltd">사진 첨부</td>
						<td class="board_content">
							<div class="input-group mb-3 imagegroup">
								<div class="custom-file">
									<input type="file" class="custom-file-input">
									<label class="custom-file-label">이미지를 첨부해주세요</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="board_content labeltd">내용</td>
						<td class="board_content">
							<textarea class="form-control h-150px inputtextarea" rows="10" placeholder="내용을 입력해주세요 / 스토리보드에 내용있길래 내용넣었어요"></textarea>
						</td>
					</tr>
					<tr>
						<td></td>
						<td id="btntd">
							<button type="submit" class="btn mb-1 btn-secondary" id="updateBtn">등록</button>
							<button type="button" class="btn mb-1 btn-secondary" id="deleteBtn">취소</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
    </section>
    <h1 class="htext">수정해주세요</h1>
    
    <%@ include file="../common/footer.jsp" %>
    
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