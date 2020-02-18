<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

	<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
	
    <!-- Custom Stylesheet -->
    <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">
	
	<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    
<title>행사 리스트</title>
<style>
    section {width:70%; height:280%; padding-bottom:60px; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 21%; position: relative;
    background: #fff; display: block;}
    
    .htext{text-align: center; font-size: 100px; height:0; position:absolute; top:47%; left: 50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
    
    #scale{transform:scale(1.2);}
    
	#categoryArea{position: absolute; top: 35%; left: 12%; display: inline-block;}
	#contentArea{width:83.5%; padding-top: 12%; text-align:center; position: absolute; left: 50%; transform: translateX(-50%); display:inline-block;}
	
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px; vertical-align: middle;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; margin-top: 50px; margin-left: 2px;}
    
    #banner{width:100%; height:400px; overflow:hidden; display: flex; justify-content:center; align-items:center;}
    .banner_image{height:100%;}
    #banner_paging_area{text-align:center; position:absolute; top:490px; left: 50%; transform: translateX(-50%);}
    #banner_paging{color: white; font-size: 10px;}
    #banner_left, #banner_right{border:0; background: none; color: white;}
    
    .promotionArea{margin-top:8%;}
    .subTitle{font-size:20px; font-weight:bold;}
    .promotionImgArea{margin-top:20px; width:100%;}
    .promotionImgArea input{}
    .promotionImg{width:150px; height:210px; background:lightgray; display:inline-block; vertical-align:middle; text-align:right;}
    .alignspan{font-size:11px; margin-top: 186px; margin-right:4px;}
    
    #hrstyle{border:0.4px solid lightgray; margin-top:9%;}
    
    #listArea{margin-top:9%; margin-left:10%; margin-right:10%; /*background:yellow;*/}
    #listCategory{font-size:20px;}
    #secondCategory{width:100%; margin-top:8%; margin-bottom:80px;}
    #listSort{font-size:14px; width:35%; text-align:left; float: left; margin-left:5%;}
    
    #listSearch{min-width: 30%; text-align:right; float: right; margin-right:5%; margin-top:-11px; display: inline-block; text-align: center;}
    #icon{width: 20px; height: 20px;}
    .dropdown{width: 33%; height: 40px; font-size: 13px; margin-right: 3px; padding-left: 1.4%; text-align:center;}
    .searchtext{height: 40px; font-size: 13px; margin-left: 3px;}
    
    #festivalList{display:block;}
    .promotionDetailImg{width:114px; height:150px; background:lightgray; display:inline-block; vertical-align:top; text-align:right;}
    .alignspanlist, .alignspan{font-weight: bold;}
    .festival{display:inline-block; width:80%; margin-top:25px; text-align:left;}
    .festivalInfo{display:inline-block; width:75%; margin-top: 5px; margin-left: 13px; /*background:orange;*/}
    .festivalInfo span, label{vertical-align:middle;}
    #artistNotice{font-size:13px; color: white; background: green; margin-right: 10px;}
    #festivalName{font-size:17px;}
    .festivalDetail{margin-top:5px; font-size:13px; line-height:2.1; /*border-spacing: 5px; border-collapse: separate;*/}
    
    #pagingarea{text-align:center; display:inline-block; margin-top:5%;}
    
    footer .ft-content{width:70%; !important;}
</style>
</head>
<body>
	<%@ include file="../../views/common/menubar.jsp" %>
    
    <!-- 행사 리스트 코딩 시작 -->
	<section style="z-index: 1;">
		<div id="scale">
		<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">FESTIVAL</label>
			<label id="inSmallCategory"> - List</label>
		</div>
		
		<div id="contentArea">
			<div id="banner">
				<input class="banner_image" type="image" id="banner_img1" src="<%= request.getContextPath() %>/images/poster/banner/poster_banner_3.jpg">
				<div class="banner_image" id="banner_img2" style="background:red; width:100%;"></div>
				<div class="banner_image" id="banner_img3" style="background:orange; width:100%;"></div>
				<div class="banner_image" id="banner_img4" style="background:yellow; width:100%;"></div>
			</div>
			<div id="banner_paging_area">
				<input type="button" value="<" id="banner_left" onclick="paging(this);">
				<label id="banner_paging">● ○ ○ ○</label>
				<input type="button" value=">" id="banner_right" onclick="paging(this);">
			</div>
			
			<div class="promotionArea">
				<label class="subTitle">아티스트 확정 행사</label><br>
				
				<div class="promotionImgArea">
					<input type="button" value="<">
					<div class="promotionImg">
						<span class="badge badge-pill badge-danger alignspan">아티스트 확정</span>
					</div>
					<div class="promotionImg">
						<span class="badge badge-pill badge-danger alignspan">아티스트 확정</span>
					</div>
					<div class="promotionImg">
						<span class="badge badge-pill badge-danger alignspan">아티스트 확정</span>
					</div>
					<div class="promotionImg">
						<span class="badge badge-pill badge-danger alignspan">아티스트 확정</span>
					</div>
					<div class="promotionImg">
						<span class="badge badge-pill badge-danger alignspan">아티스트 확정</span>
					</div>
					<input type="button" value=">">
				</div>
			</div>
			
			<div class="promotionArea">
				<label class="subTitle">아티스트 모집 행사</label><br>
				<div class="promotionImgArea">
					<input type="button" value="<">
					<div class="promotionImg">
						<span class="badge badge-pill badge-success alignspan">아티스트 모집 중</span>
					</div>
					<div class="promotionImg">
						<span class="badge badge-pill badge-success alignspan">아티스트 모집 중</span>
					</div>
					<div class="promotionImg">
						<span class="badge badge-pill badge-success alignspan">아티스트 모집 중</span>
					</div>
					<div class="promotionImg">
						<span class="badge badge-pill badge-success alignspan">아티스트 모집 중</span>
					</div>
					<div class="promotionImg">
						<span class="badge badge-pill badge-success alignspan">아티스트 모집 중</span>
					</div>
					<input type="button" value=">">
				</div>
			</div>
			
			<hr id="hrstyle">
			
			<div id="listArea">
				<div id="listCategory">
					<label class="category">전체 행사</label>
					<label class="category">&nbsp;&nbsp; | &nbsp;&nbsp;</label>
					<label class="category">아티스트 모집 행사</label>
					<label class="category">&nbsp;&nbsp; | &nbsp;&nbsp;</label>
					<label class="category">아티스트 확정 행사</label>
					<label class="category">&nbsp;&nbsp; | &nbsp;&nbsp;</label>
					<label class="category">지난 행사</label>
				</div>
				
				<div id="secondCategory">
					<div id="listSort">
						<label class="category">최근등록순</label>
						<label class="category">&nbsp; | &nbsp;</label>
						<label class="category">날짜순</label>
					</div>
					
					<div id="listSearch">
	                    <div class="input-group">
							<select class="btn btn-outline-dark selectdrop dropdown">
								<option>검색 종류</option>
								<option>행사명</option>
								<option>아티스트명</option>
							</select>
	                        <input type="search" class="form-control searchtext" placeholder="Search Festival" aria-label="Search Dashboard">
	                        <img src="<%= request.getContextPath() %>/icons/search.png" id="icon" />
	                    </div>
					</div>
				</div>
				
				<div id="festivalList">
					<div class="festival">
						<div class="promotionDetailImg"></div>
						<div class="festivalInfo">
							<div>
								<span class="badge badge-pill badge-success alignspanlist">아티스트 모집 중</span> &nbsp;
								<label id="festivalName">행사명</label>
							</div>
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
							<span class="badge badge-pill badge-danger alignspanlist">아티스트 확정</span> &nbsp;
							<label id="festivalName">행사명</label><br>
							<table class="festivalDetail">
								<tr>
									<td>행사 기간</td>
									<td rowspan=2>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>2020.08.30 ~ 2020.09.05</td>
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
						<span class="badge badge-pill badge-light">지난 행사</span> &nbsp;
							<label id="festivalName">행사명</label><br>
							<table class="festivalDetail">
								<tr>
									<td>행사 기간</td>
									<td rowspan=2>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>2020.08.30 ~ 2020.09.05</td>
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
		</div>
    </section>
    
    <script>
    	$(function() {
    		for(var i = 2; i < 5; i++) {
    			$('#banner_img' + i).css('visibility', 'hidden');
    		}
    	})
    
    	function paging(where) {
    		var paging = document.getElementById("banner_paging");
    		var printArr = paging.innerHTML.split(" ");
			var count = printArr.length-1;

    		if(where.value == "<") {
    			for(var i = 0; i < printArr.length; i++) {
        			if(i == 0) {
        				var temp = printArr[0];
            			printArr[0] = printArr[1];
        			} else if(i == count) {
        				printArr[i] = temp;
        			} else {
            			printArr[i] = printArr[i+1];
        			}
    			}
    		} else {
    			for(var i = count; i > 0; i--) {
    				if(i == count) {
        				var temp = printArr[0];
        				printArr[0] = printArr[i];
    				} else if(i == 1) {
    					printArr[i+1] = printArr[i];
    					printArr[i] = temp;
    				} else {
    					printArr[i+1] = printArr[i];
    				}
    			}
    		}

    		for(var i = 0; i < printArr.length; i++) {
    			if(i == 0) paging.innerHTML = printArr[0] + " ";
    			else if(i == printArr.length - 1) paging.innerHTML += printArr[i];
    			else paging.innerHTML += printArr[i] + " ";
    		}
    		
    		var cunt;
    		for(var i = 0; i < printArr.length; i++) {
    			if(printArr[i] == "●") {
    				$('#festival_banner_img'+i).css('visibility', 'hidden');
    				$('#festival_banner_img'+(i+1)).css('visibility', 'visible');
    				$('#festival_banner_img'+(i+2)).css('visibility', 'hidden');
    			}
    		}
    	}
    </script>
    
    <h1 class="htext">F E S T I V A L</h1>
    <!-- 행사 리스트 코딩 끝 -->
    
	<%@ include file="../../views/common/footer.jsp" %>
    
    <!--**********************************
        Scripts
    ***********************************-->
    <script src="<%= request.getContextPath() %>/plugins/common/common.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/custom.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/settings.js"></script>
    <script src="<%= request.getContextPath() %>/js/gleek.js"></script>
    <script src="<%= request.getContextPath() %>/js/styleSwitcher.js"></script>
    
<script src="<%= request.getContextPath() %>/js/respond.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/js/wow.min.js"></script>
<script src="<%= request.getContextPath() %>/js/parallax.min.js"></script>
<script src="<%= request.getContextPath() %>/js/slick.min.js"></script>
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