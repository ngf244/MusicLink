<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, festival.model.vo.PageInfo, festival.model.vo.Festival, java.text.DecimalFormat" %>
<%
	ArrayList<Festival> fArr = (ArrayList<Festival>)request.getAttribute("fArr");
	ArrayList<String> userApList = (ArrayList<String>)request.getAttribute("userApList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	int category = (int)request.getAttribute("category");
	String searchType = "";
	String searchText = "";
	if(request.getAttribute("searchType") != null) {
		searchType = (String)request.getAttribute("searchType");
		searchText = (String)request.getAttribute("searchText");
	}
%>
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
    
<title>행사 지원</title>
<style>
	/*
    section {width:70%; height:130%; padding-bottom:60px; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 21%; position: relative;
    background: #fff; display: block;}
    
    .htext{text-align: center; font-size: 100px; height:0; position:absolute; top:47%; left: 50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
    */
	section {width:70%; height:130%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; padding-top: 0px; padding-bottom:10%;}
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top: -9%; left: 50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
	
    #scale{transform:scale(1.2);}
    
	#categoryArea{position: absolute; top: 35%; left: 12%; display: inline-block;}
	#contentArea{width:83.5%; padding-top: 12%; text-align:center; position: absolute; left: 50%; transform: translateX(-50%); display:inline-block;}
	
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px; vertical-align: middle;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; margin-top: 50px; margin-left: 2px;}
    
    #searchArea{width: 80%; height:40px; display: inline-block; text-align: center;}
    #searchArea select, input, #alignImg{vertical-align: middle; display: inline-block; text-align: center;}
    #alignImg{width:40px; height:40px; margin-left: 1.5%;}
    #searchBtn{width: 30px; height: 30px; vertical-align: middle;}
    .dropdown{width: 20%; height: 40px; padding-left: 1.5%; margin-right: 4px; font-size:14px;}
    .selectdrop option{border-radius: 0.25rem;}
    .searchtext{width: 60%; height: 30px; margin-left: 1.5%; border-radius: 4px;}
    #searchText{text-align:left;}
    
    #listSort{font-size:14px; width:100%; text-align:right; float: right; margin-top:6%; margin-right:10%;}
    .pointer{cursor:pointer;}
    
    #listArea{margin-top:5%; margin-right:10%; /*background:yellow;*/ display: block; margin-left:10%;}
    #festivalList{display:block; margin-top:8%;}
    .promotionDetailImg{
    	width:138px;
    	height:193px;
    	background:lightgray;
    	display:inline-block;
    	vertical-align:top;
    	text-align:right;
    }
    .alignspanlist{font-weight: bold;}
    .festival{display:inline-block; width:80%; margin-top: 50px; text-align:left;}
    .festivalInfo{display:inline-block; width:67%; margin-top: 5px; margin-left: 13px; /*background:orange;*/}
    #appArea{display:inline-block; width:10%;}
    
    .festivalInfo span, label, button{vertical-align:middle;}
    #artistNotice{font-size:13px; color: white; background: green; margin-right: 10px;}
    #festivalName{font-size:17px;}
    .festivalDetail{width: 100%; margin-top: 5px; font-size:13px; line-height:1.8; /*border-spacing: 5px; border-collapse: separate;*/}
    .listlabel{width: 130px;}
    .tdspace{width: 20px;}
    
    .approachBtn{float: right; font-size: 13px; width: 90px; height: 25px; margin-top:-4px; line-height: 0.9; color:white;}
    
    #pagingarea{text-align:center; display:inline-block; margin-top:5%;}
    
    footer .ft-content{width:70%; !important;}
    
</style>
</head>
<body>

    <%@ include file="../../views/common/menubar.jsp" %>
    
    <!-- 행사 지원 코딩 시작 -->
	<section style="z-index: 1;">
		<div id="scale">
		<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">FESTIVAL</label>
			<label id="inSmallCategory"> - Approach</label>
		</div>
		
		<div id="contentArea">
			<div id="listArea">
				
				<script>
					$(function() {
						var searchType = '<%= searchType %>';
						var searchText = '<%= searchText %>';
						
						if(searchType != "") {
							if(searchType == "title") $('#searchType option:eq(1)').attr('selected', 'selected');
							else $('#searchType option:eq(2)').attr('selected', 'selected');
							
							$('#searchText').val(searchText);
						}
					})
				</script>
				<div id="searchArea">
					<form action="<%= request.getContextPath() %>/apsearch.fes" method="post" id="searchForm" class="input-group" onsubmit="return typeCk();">
						<input type="hidden" value=<%= category %> name="category">
						<select class="btn btn-outline-dark selectdrop dropdown" id="searchType" name="searchType">
							<option value="nothing">검색 종류</option>
							<option value="title">행사명</option>
							<option value="cpname">주최사명</option>
						</select>
                        <input type="text" class="form-control input-default searchtext" name="searchText" id="searchText">
                        <div id="alignImg">
                        	<img src="<%= request.getContextPath() %>/icons/search.png" id="searchBtn" />
                        </div>
					</form>
				</div>
				<script>
					function typeCk() {
						if($('#searchType').val() == 'nothing') {
							alert('검색 종류를 선택해주세요');
							return false;
						}
						return true;
					};
					
					$('#searchBtn').click(function() {
						$('#searchForm').submit();
					});
				</script>
				
				<script>
					$(function() {
						<%
						switch(category) {
						case 0: break;
						case 1: %>
							$('#timeSort').css({'color':'black', 'font-weight':'bold'});
						<%  break;
						case 2: %>
							$('#recTimeSort').css({'color':'black', 'font-weight':'bold'});
						<%  break;
						case 3: %>
							$('#highPaySort').css({'color':'black', 'font-weight':'bold'});
						<%  break;
						case 4: %>
							$('#lowPaySort').css({'color':'black', 'font-weight':'bold'});
						<%  break;
						}%>
						
						var category = <%= category %>;
						var searchType = $('#searchType').val();
						var searchText = $('#searchText').val();
						$('#timeSort').click(function() {
							category = 1;
							if(searchText != "")
								location.href = '<%= request.getContextPath() %>/aplist.fes?category='+category+'&searchType='+searchType+'&searchText='+searchText;
							else
								location.href = '<%= request.getContextPath() %>/aplist.fes?category='+category;
						});
						$('#recTimeSort').click(function() {
							category = 2;
							if(searchText != "")
								location.href = '<%= request.getContextPath() %>/aplist.fes?category='+category+'&searchType='+searchType+'&searchText='+searchText;
							else
								location.href = '<%= request.getContextPath() %>/aplist.fes?category='+category;
						});
						$('#highPaySort').click(function() {
							category = 3;
							if(searchText != "")
								location.href = '<%= request.getContextPath() %>/aplist.fes?category='+category+'&searchType='+searchType+'&searchText='+searchText;
							else
								location.href = '<%= request.getContextPath() %>/aplist.fes?category='+category;
						});
						$('#lowPaySort').click(function() {
							category = 4;
							if(searchText != "")
								location.href = '<%= request.getContextPath() %>/aplist.fes?category='+category+'&searchType='+searchType+'&searchText='+searchText;
							else
								location.href = '<%= request.getContextPath() %>/aplist.fes?category='+category;
						});
						
						$('.promotionDetailImg, .festivalInfo').click(function() {
							var fcode = $(this).parent().children().eq(0).val();
							location.href = "<%= request.getContextPath() %>/detail.fes?fcode="+fcode+"&status=1";
						});
					});
					
					
					function approach(where) {
						$.ajax({
							url: 'approachFes.do',
							type: 'post',
							data: {usercode: '<%= loginUser.getUserCode() %>', fescode: where.parentElement.parentElement.children[0].value},
							success: function(data) {
								where.className = 'btn mb-1 btn-secondary approachBtn';
								where.innerHTML = '지원 완료';
								where.disabled = true;
							},
							error: function(data) {
								console.log('실패');
							}
						});
					}
				</script>
				
				<div id="listSort">
					<label class="category pointer" id="timeSort">최근등록순</label>
					<label class="category">&nbsp; | &nbsp;</label>
					<label class="category pointer" id="recTimeSort">모집마감순</label>
					<label class="category">&nbsp; | &nbsp;</label>
					<label class="category pointer" id="highPaySort">공연비높은순</label>
					<label class="category">&nbsp; | &nbsp;</label>
					<label class="category pointer" id="lowPaySort">공연비낮은순</label>
				</div>
				
				<div id="festivalList">
					<% if(fArr == null) { %>
						<label>등록된 행사가 없습니다.</label>
					<% } else {
							for(Festival f : fArr) { %>
					<div class="festival">
						<input type="hidden" id="hidfescode" value="<%= f.getFesCode() %>">
						<div style="background-image:url('<%= request.getContextPath() %>/festival_uploadFiles/<%= f.getPosPath() %>'); background-size: auto 100%; background-repeat: no-repeat; background-position: center center;" class="promotionDetailImg"></div>
						
						<div class="festivalInfo">
							<span class="badge badge-pill badge-success alignspanlist">아티스트 모집 중</span> &nbsp;
							<label id="festivalName"><%= f.getFesName() %></label>
							
							<table class="festivalDetail">
								<tr>
									<td class="listlabel">행사 기간</td>
									<td class="tdspace" rowspan=6></td>
									<td><%= f.getFesTerm() %></td>
								</tr>
								<tr>
									<td class="listlabel">아티스트 모집 기간</td>
									<td><%= f.getRecTerm() %></td>
								</tr>
								<%  
									DecimalFormat formatter = new DecimalFormat("###,###");
									String printPay = formatter.format(Integer.parseInt((f.getPayRange().split("~"))[0])) + "&#8361; ~ " + formatter.format(Integer.parseInt((f.getPayRange().split("~"))[1])) + "&#8361;";
								%>
								<tr>
									<td class="listlabel">공연비</td>
									<td><%= printPay %></td>
								</tr>
								<%
								String fullLoc = "";
								String spLoc[] = f.getFesLoc().split("/");
								
								String mapLoc[] = spLoc[0].split("&");
								
								if (mapLoc.length > 1) {
									if(spLoc.length > 1) {
										fullLoc = "(" + mapLoc[0] + ") " + mapLoc[1] + " " + spLoc[1];
									} else {
										fullLoc = "(" + mapLoc[0] + ") " + mapLoc[1];
									}
								} else {
									fullLoc = f.getFesLoc();
								}
								%>
								<tr>
									<td class="listlabel">행사 장소</td>
									<td><%= fullLoc %></td>
								</tr>
								<tr>
									<td class="listlabel">주최사명</td>
									<td><%= f.getCpName() %></td>
								</tr>
							</table>
						</div>
						
						<div id="appArea">
							<% for(int i = 0; i < userApList.size(); i++) {
								  if((userApList.get(i)).equals(f.getFesCode())) { %>
									<button type="button" class="btn mb-1 btn-secondary approachBtn" disabled>지원 완료</button>
							<%      break;
								  }
								  if(i == userApList.size() - 1) { %>
                                    <button class="btn mb-1 btn-warning approachBtn" onclick="approach(this);">행사 지원</button>
							<%    }
							   } %>
						</div>
					</div>
					<% }
					} %>
				</div>
				
				<div id="pagingarea">
               	<ul class="pagination">
               		<li class="page-item prev">
               			<a class="page-link" href='<%= request.getContextPath() %>/aplist.fes?currentPage=<%= currentPage-1 %>' aria-label="Previous">
               				<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
						</a>
                    </li>
                   
					<% for(int p = startPage; p <= endPage; p++){
						if(p == currentPage){ %>
		                       <li class="page-item">
		                       	<a class="page-link" href='#'><b><%= p %></b></a>
		                       </li>
						<% } else { %>			
		                       <li class="page-item">
		                       	<a class="page-link" href='<%= request.getContextPath() %>/aplist.fes?currentPage=<%= p %>'><%= p %></a>
		                       </li>
		                <% }
					   } %>
		            <li class="page-item next">
                    	<a class="page-link" href='<%= request.getContextPath() %>/aplist.fes?currentPage=<%= currentPage + 1 %>' aria-label="Next">
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
			<% int sectionHeiht = 87 + ((fArr.size()-1) * 32); %>
    		$('section').css('height', '<%= sectionHeiht %>%');
			var scrollPosition = $("#hrstyle").offset().top;

			$('.dropdown').on({'mouseout':function() {
				$(this).css({'background':'white', 'color':'#333333', 'border':'1px solid #333333'});
			}, 'mouseenter':function() {
				$(this).css({'background':'#333333', 'color':'white', 'border':'null'});
			}, 'click':function() {
				$(this).css({'background':'#333333', 'color':'white', 'border':'null'});
			}});
		})
    </script>
    
    <h1 class="htext">F E S T I V A L</h1>
    <!-- 행사 지원 코딩 끝 -->
    
    
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