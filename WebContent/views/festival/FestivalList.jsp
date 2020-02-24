<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, java.util.Date, java.util.GregorianCalendar, java.util.LinkedHashMap, festival.model.vo.PageInfo, festival.model.vo.Festival" %>
<%
	LinkedHashMap<Festival, ArrayList<String>> map = (LinkedHashMap<Festival, ArrayList<String>>)request.getAttribute("map");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	int category = (int)request.getAttribute("category");
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
    
    <!--**********************************
        Scripts
    ***********************************-->
    <script src="<%= request.getContextPath() %>/plugins/common/common.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/custom.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/settings.js"></script>
    <script src="<%= request.getContextPath() %>/js/gleek.js"></script>
    <script src="<%= request.getContextPath() %>/js/styleSwitcher.js"></script>
    
<title>행사 리스트</title>
<style>
    section {width:70%; height:180%; padding-bottom:60px; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 21%; position: relative;
    background: #fff; display: block;}
    
    .htext{text-align: center; font-size: 100px; height:0; position:absolute; top:47%; left: 50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
    
    #scale{transform:scale(1.2);}
    
	#categoryArea{position: absolute; top: 35%; left: 12%; display: inline-block;}
	#contentArea{width:83.5%; padding-top: 12%; text-align:center; position: absolute; left: 50%; transform: translateX(-50%); display:inline-block;}
	
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
    #secondCategory{width:100%; margin-top:5%; margin-bottom:80px;}
    /*#listSort{font-size:14px; width:35%; text-align:left; float: left; margin-left:5%;}*/
    
    #listSearch{width: 35%; text-align:right; float: right; margin-right:1%; margin-top:-11px; display: inline-block; text-align: center;}
    /*#icon{width: 20px; height: 20px;}*/
    #searchBtn{width:60px; height: 40px; padding:0; text-align:center; margin-left: 5px;}
    .dropdown{width: 35%; height: 40px; font-size: 12.5px; margin-right: 3px; padding-left: 1.4%; text-align:center;}
    .searchtext{height: 40px; font-size: 13px; margin-left: 3px;}
    .pointer{cursor:pointer;}
    
    #festivalList{display:block; margin-top:8%;}
    .promotionDetailImg{width:114px; height:150px; background:lightgray; display:inline-block; vertical-align:top; text-align:right;}
    .alignspanlist, .alignspan{font-weight: bold;}
    .festival{display:inline-block; width:70%; margin-top: 50px; text-align:left;}
    .festivalInfo{display:inline-block; width:75%; margin-top: 5px; margin-left: 13px; /*background:orange;*/}
    .festivalInfo span, label{vertical-align:middle;}
    #artistNotice{font-size:13px; color: white; background: green; margin-right: 10px;}
    .festivalName{font-size:17px;}
    
    .festivalDetail{width: 100%; margin-top: 5px; font-size:13px; line-height:1.8; /*border-spacing: 5px; border-collapse: separate;*/}
    .tdspace{width: 20px;}
    .listlabel{width: 130px;}
    
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
		
			<div class="banner animation">
				<div><img style="width:100%;" src="<%= request.getContextPath() %>/images/poster/banner/poster_banner_1.jpg" alt="" /></div>
				<div><img style="width:100%;" src="<%= request.getContextPath() %>/images/poster/banner/poster_banner_2.jpg" alt="" /></div>
				<div><img style="width:100%;" src="<%= request.getContextPath() %>/images/poster/banner/poster_banner_3.jpg" alt="" /></div>
			</div>
			
			 <!-- 
			 <div class="banner slide">
			 <ul>
			 	<li><img style="width:100%;" src="../../images/poster/banner/poster_banner_1.jpg" alt=""></li>
			 	<li><img style="width:100%;" src="../../images/poster/banner/poster_banner_2.jpg" alt=""></li>
			 	<li><img style="width:100%;" src="../../images/poster/banner/poster_banner_3.jpg" alt=""></li>
			 </ul>
			 </div>
			  -->
			  
			<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
			<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
			<script type="text/javascript" src="<%= request.getContextPath() %>/js/slick.min.js"></script>
			<script>
				$(document).ready(function(){
					$('.banner div').css({'width':'100%', 'height':'400px', 'overflow':'hidden', 'display':'flex', 'justify-content':'center', 'align-items':'center'});
					
					$('.animation').slick({
						autoplay:true,
						autoplaySpeed:2000,
						fade:true,
						arrows:true,
						cssEase:'ease',
						easing:'ease'
			    	});
			    });
			</script>
			
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
			
			<script>
				$(function() {
					var scrollPosition = $("#hrstyle").offset().top;
					<%
					switch(category) {
					case 0: break;
					case 1: %>
						$('#allCategory').css({'color':'black', 'font-weight':'bold'});
						$("html, body").animate({
							scrollTop: scrollPosition
						}, 500);
					<%  break;
					case 2: %>
						$('#ingCategory').css({'color':'black', 'font-weight':'bold'});
						$("html, body").animate({
							scrollTop: scrollPosition
						}, 500);
					<%  break;
					case 3: %>
						$('#fullCategory').css({'color':'black', 'font-weight':'bold'});
						$("html, body").animate({
							scrollTop: scrollPosition
						}, 500);
					<%  break;
					case 4: %>
						$('#endCategory').css({'color':'black', 'font-weight':'bold'});
						$("html, body").animate({
							scrollTop: scrollPosition
						}, 500);
					<%  break;
					}%>
				})
			</script>
			
			<div id="listArea">
				<div id="listCategory">
					<label class="category pointer" id="allCategory">전체 행사</label>
					<label class="category">&nbsp;&nbsp; | &nbsp;&nbsp;</label>
					<label class="category pointer" id="ingCategory">아티스트 모집 행사</label>
					<label class="category">&nbsp;&nbsp; | &nbsp;&nbsp;</label>
					<label class="category pointer" id="fullCategory">아티스트 확정 행사</label>
					<label class="category">&nbsp;&nbsp; | &nbsp;&nbsp;</label>
					<label class="category pointer" id="endCategory">지난 행사</label>
				</div>
				
				<div id="secondCategory">
					<!-- 
					<div id="listSort">
						<label class="category pointer" id="timeSort">최근등록순</label>
						<label class="category">&nbsp; | &nbsp;</label>
						<label class="category pointer" id="fesDateSort">날짜순</label>
					</div>
					 -->
					<div id="listSearch">
						<form action="<%= request.getContextPath() %>/search.fes" method="post" class="input-group" onsubmit="return typeCk();">
							<select class="btn btn-outline-dark selectdrop dropdown" id="searchType" name="searchType">
								<option value="nothing">검색 종류</option>
								<option value="title">행사명</option>
								<option value="artist">아티스트명</option>
							</select>
	                        <input type="search" class="form-control searchtext" name="searchText" aria-label="Search Dashboard">
	                        <input type="submit" class="btn mb-1 btn-dark" id="searchBtn" value="검색">
						</form>
					</div>
					<script>
						function typeCk() {
							if($('#searchType').val() == 'nothing') {
								alert('검색 종류를 선택해주세요');
								return false;
							}
							return true;
						}
					</script>
				</div>
				
				<div id="festivalList">
					<% if(map == null) { %>
						<label>등록된 행사가 없습니다.</label>
					<% } else {
							for(Festival f : map.keySet()) {
								String attendArtist = "";
								ArrayList<String> list = map.get(f);
								
								for(int i = 0; i < list.size(); i++) {
									if(i != list.size() - 1)
										attendArtist += list.get(i) + ", ";
									else
										attendArtist += list.get(i);
								}
								
								String fesTerm = f.getFesTerm();
								String endFes[] = fesTerm.split(" - ");
								String dateSplit[] = (endFes[endFes.length-1]).split("/");
								
								int month = 0;
								int day = 0;
								int year = 0;
								if(endFes.length > 1) {
									month = Integer.parseInt(dateSplit[0]);
									day = Integer.parseInt(dateSplit[1]);
									year = Integer.parseInt(dateSplit[2]);
								}

								Date endFesDate = new Date(new GregorianCalendar(year, month-1, day).getTimeInMillis());
								Date today = new Date(new GregorianCalendar().getTimeInMillis());
								
								long minus = today.getTime() - endFesDate.getTime();
								
								String addcls = "";
								String addtext = "";
								if (today.getTime() > endFesDate.getTime()) {
									addcls = "badge badge-pill badge-light";
									addtext = "지난 행사";
								} else if (list.size() < f.getRecCount()) { 
									addcls = "badge badge-pill badge-success";
									addtext = "아티스트 모집 중";
								} else if (list.size() == f.getRecCount()) { 
									addcls = "badge badge-pill badge-danger";
									addtext = "아티스트 확정";
								} %>
					<div class="festival">
						<input type="hidden" value="<%= f.getFesCode() %>">
						<input type="hidden" value="<%= addtext %>">
						<img src="<%= request.getContextPath() %>/festival_uploadFiles/<%= f.getPosPath() %>" class="promotionDetailImg" />
						<div class="festivalInfo">
							<div>
								<span class="<%= addcls %> alignspanlist"><%= addtext %></span> &nbsp;
								<label class="festivalName"><%= f.getFesName() %></label>
							</div>
							<table class="festivalDetail">
								<tr>
									<td class="listlabel">행사 기간</td>
									<td class="tdspace" rowspan=5></td>
									<td><%= f.getFesTerm() %></td>
								</tr>
								<% if(addtext.equals("아티스트 모집 중") && loginUser != null) {
									if(loginUser.getUserClass().equals("2") || loginUser.getUserClass().equals("3")) { %>
								<tr>
									<td class="listlabel">아티스트 모집 기간</td>
									<td><%= f.getRecTerm() %></td>
								</tr>
								<tr>
									<td class="listlabel">모집 아티스트 팀 수</td>
									<td><%= f.getRecCount() %>팀</td>
								</tr>
								<%  }
								   }
								if(!attendArtist.equals("")) { %>
								<tr>
									<td class="listlabel">확정 아티스트</td>
									<td><%= attendArtist %></td>
								</tr>
								<% }
								if(!addtext.equals("아티스트 모집 중") && (f.getTicFee() != 0)) {%>
								<tr>
									<td class="listlabel">공연비</td>
									<td><%= f.getTicFee() %></td>
								</tr>
								<% }
								if(loginUser != null) {
									if(loginUser.getUserClass().equals("2") || loginUser.getUserClass().equals("3")) {%>
								<tr>
									<td class="listlabel">주최사명</td>
									<td><%= f.getCpName() %></td>
								</tr>
								<%  }
								   } %>
							</table>
						</div>
					</div>
						 <% }
					   } %>
				</div>
				<div id="pagingarea">
               	<ul class="pagination">
               		<li class="page-item prev">
               			<a class="page-link" href='<%= request.getContextPath() %>/list.fes?currentPage=<%= currentPage-1 %>' aria-label="Previous">
               				<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
						</a>
                    </li>
                   
					<% for(int p = startPage; p <= endPage; p++){
						if(p == currentPage){ %>
		                       <li class="page-item">
		                       	<a class="page-link" href='#'><%= p %></a>
		                       </li>
						<% } else { %>			
		                       <li class="page-item">
		                       	<a class="page-link" href='<%= request.getContextPath() %>/list.fes?currentPage=<%= p %>'><%= p %></a>
		                       </li>
		                <% }
					   } %>
		            <li class="page-item next">
                    	<a class="page-link" href='<%= request.getContextPath() %>/list.fes?currentPage=<%= currentPage + 1 %>' aria-label="Next">
                    		<span aria-hidden="true">&raquo;</span>
                    		<span class="sr-only">Next</span>
                       	</a>
                    </li>
               	</ul>
				</div>
				<script>
					if(<%= currentPage %> <= 1){
						var before = $('.prev');
						before.attr('class', 'page-item prev disabled');
					}
					
					if(<%= currentPage %> >= <%= maxPage %>){
						var after = $(".next");
						after.attr('class', 'page-item next disabled');
					}
				</script>
			</div>
		</div>
		</div>
    </section>
    
    <script>
    	$(function() {
    		<% int sectionHeiht = 231 + ((map.size()-1) * 25); %>
    		$('section').css('height', '<%= sectionHeiht %>%');
    		
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
			
			var category = <%= category %>;
			$('#allCategory').click(function() {
				category = 1;
				location.href = '<%= request.getContextPath() %>/list.fes?category=' + category;
			});
			$('#ingCategory').click(function() {
				category = 2;
				location.href = '<%= request.getContextPath() %>/list.fes?category=' + category;
			});
			$('#fullCategory').click(function() {
				category = 3;
				location.href = '<%= request.getContextPath() %>/list.fes?category=' + category;
			});
			$('#endCategory').click(function() {
				category = 4;
				location.href = '<%= request.getContextPath() %>/list.fes?category=' + category;
			});
			
			$('.festival').click(function() {
				var fcode = $(this).children().eq(0).val();
				var status = $(this).children().eq(1).val();
				location.href = "<%= request.getContextPath() %>/detail.fes?fcode="+fcode+"&status="+status;
			});
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
    
</body>
</html>