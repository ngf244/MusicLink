<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, festival.model.vo.PageInfo, festival.model.vo.Festival" %>
<%
	ArrayList<Festival> list = (ArrayList<Festival>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

	<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
	
    <!-- Custom Stylesheet -->
    <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/slick.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/slick-theme.css">
	
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
	#contentArea{width:83.38%; padding-top: 12%; text-align:center; position: absolute; left: 50%; transform: translateX(-50%); display:inline-block;}
	
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px; vertical-align: middle;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; margin-top: 50px; margin-left: 2px;}
    
    #banner{width:100%; height:400px; overflow:hidden; display: flex; justify-content:center; align-items:center; position: fixed;}
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
    .dropdown{width: 40%; height: 40px; font-size: 13px; margin-right: 3px; padding-left: 1.4%; text-align:center;}
    .searchtext{height: 40px; font-size: 13px; margin-left: 3px;}
    
    #festivalList{display:block;}
    .promotionDetailImg{width:114px; height:150px; background:lightgray; display:inline-block; vertical-align:top; text-align:right;}
    .alignspanlist, .alignspan{font-weight: bold;}
    .festival{display:inline-block; width:65%; margin-top: 5%; text-align:left;}
    .festivalInfo{display:inline-block; width:75%; margin-top: 5px; margin-left: 13px; /*background:orange;*/}
    .festivalInfo span, label{vertical-align:middle;}
    #artistNotice{font-size:13px; color: white; background: green; margin-right: 10px;}
    #festivalName{font-size:17px;}
    .festivalDetail{margin-top: 5px; font-size:13px; line-height:1.8; /*border-spacing: 5px; border-collapse: separate;*/}
    .listlabel{width: 45%;}
    
    #pagingarea{text-align:center; display:inline-block; margin-top:5%;}
    
    footer .ft-content{width:70%; !important;}
    
    ul,li{list-style:none;}
    .slide{height:400px;overflow:hidden;}
    .slide ul{width:calc(100% * 3);display:flex;animation:slide 8s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .slide li{width:calc(100% / 3);height:400px;}
    .slide li:nth-child(1){background:#ffa;}
    .slide li:nth-child(2){background:#faa;}
    .slide li:nth-child(3){background:#afa;}
    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      75% {margin-left:-300%;}
      85% {margin-left:-300%;}
      100% {margin-left:0;}
    }
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
	
			<!-- 
			<div class="banner animation">
				<img style="width:100%;" src="../../images/poster/banner/poster_banner_1.jpg" alt="">
				<img style="width:100%;" src="../../images/poster/banner/poster_banner_2.jpg" alt="">
				<img style="width:100%;" src="../../images/poster/banner/poster_banner_3.jpg" alt="">
			</div>
			 -->
			 
			 <div class="banner slide">
			 <ul>
			 	<li><img style="width:100%;" src="../../images/poster/banner/poster_banner_1.jpg" alt=""></li>
			 	<li><img style="width:100%;" src="../../images/poster/banner/poster_banner_2.jpg" alt=""></li>
			 	<li><img style="width:100%;" src="../../images/poster/banner/poster_banner_3.jpg" alt=""></li>
			 </ul>
			 </div>
			
			<%-- 
			<script type="text/javascript" src="<%= request.getContextPath() %>/js/slick.min.js"></script>
			<script>
				$('.animation').slick({
					infinite: true,
					autoplay:true,
					autoplaySpeed:3000,
					fade:true,
					dots:true,
					arrows:true,
					cssEase:'ease',
					easing:'ease',
		    	});
			</script>
			 --%>
			<!-- 
			<div id="banner_paging_area">
				<input type="button" value="<" id="banner_left" onclick="paging(this);">
				<label id="banner_paging">● ○ ○ ○</label>
				<input type="button" value=">" id="banner_right" onclick="paging(this);">
			</div>
			 -->
			
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
					<% if(list.isEmpty()) { %>
						<label>등록된 행사가 없습니다.</label>
					<% } else {
							for(Festival f : list) {%>
					<div class="festival">
						<div class="promotionDetailImg"></div>
						<div class="festivalInfo">
							<div>
								<span class="badge badge-pill badge-success alignspanlist">아티스트 모집 중</span> &nbsp;
								<label id="festivalName"><%= f.getFesName() %></label>
							</div>
							<table class="festivalDetail">
								<tr>
									<td class="listlabel">행사 기간</td>
									<td rowspan=5>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td><%= f.getFesTerm() %></td>
								</tr>
								<tr>
									<td class="listlabel">아티스트 모집 기간</td>
									<td><%= f.getRecTerm() %></td>
								</tr>
								<tr>
									<td class="listlabel">모집 아티스트 팀 수</td>
									<td><%= f.getRecCount() %>팀</td>
								</tr>
								<tr>
									<td class="listlabel">확정 아티스트</td>
									<td>윤하</td>
								</tr>
								<tr>
									<td class="listlabel">주최사명</td>
									<td>KH</td>
								</tr>
							</table>
						</div>
					</div>
						 <% }
					   } %>
					<div class="festival">
						<div class="promotionDetailImg"></div>
						<div class="festivalInfo">
							<span class="badge badge-pill badge-danger alignspanlist">아티스트 확정</span> &nbsp;
							<label id="festivalName">행사명</label><br>
							<table class="festivalDetail">
								<tr>
									<td class="listlabel">행사 기간</td>
									<td rowspan=3>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>2020.08.30 ~ 2020.09.05</td>
								</tr>
								<tr>
									<td class="listlabel">확정 아티스트</td>
									<td>윤하</td>
								</tr>
								<tr>
									<td class="listlabel">주최사명</td>
									<td>KH</td>
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
									<td class="listlabel">행사 기간</td>
									<td rowspan=3>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>2020.08.30 ~ 2020.09.05</td>
								</tr>
								<tr>
									<td class="listlabel">확정 아티스트</td>
									<td>윤하</td>
								</tr>
								<tr>
									<td class="listlabel">주최사명</td>
									<td>KH</td>
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
			
			$('.dropdown').on({'mouseout':function() {
				$(this).css({'background':'white', 'color':'#333333', 'border':'1px solid #333333'});
			}, 'mouseenter':function() {
				$(this).css({'background':'#333333', 'color':'white', 'border':'null'});
			}, 'click':function() {
				$(this).css({'background':'#333333', 'color':'white', 'border':'null'});
			}});
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
    
</body>
</html>