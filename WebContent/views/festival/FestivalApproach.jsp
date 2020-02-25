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
    #icon{width: 30px; height: 30px; vertical-align: middle;}
    .dropdown{width: 20%; height: 40px; padding-left: 1.5%; margin-right: 4px; font-size:14px;}
    .selectdrop option{border-radius: 0.25rem;}
    .searchtext{width: 60%; height: 30px; margin-left: 1.5%; border-radius: 4px;}
    
    #listSort{font-size:14px; width:100%; text-align:right; float: right; margin-top:6%; margin-right:10%;}
    
    #listArea{margin-top:5%; margin-right:10%; /*background:yellow;*/ display: block; margin-left:10%;}
    #festivalList{display:block;}
    .promotionDetailImg{width:114px; height:150px; background:lightgray; display:inline-block; vertical-align:top; text-align:right;}
    .alignspanlist{font-weight: bold;}
    .festival{display:inline-block; width:80%; margin-top: 5%; text-align:left;}
    .festivalInfo{display:inline-block; width:75%; margin-top: 5px; margin-left: 13px; /*background:orange;*/}
    .festivalInfo span, label, button{vertical-align:middle;}
    #artistNotice{font-size:13px; color: white; background: green; margin-right: 10px;}
    #festivalName{font-size:17px;}
    .festivalDetail{margin-top: 5px; font-size:13px; line-height:1.8; /*border-spacing: 5px; border-collapse: separate;*/}
    .listlabel{width: 45%;}
    
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
			
				<div id="searchArea">
					<div class="input-group">
						<select class="btn btn-outline-dark selectdrop dropdown">
							<option>검색 종류</option>
							<option>행사명</option>
							<option>주최사명</option>
						</select>
                        <input type="text" class="form-control input-default searchtext">
                        <div id="alignImg"><img src="<%= request.getContextPath() %>/icons/search.png" id="icon" /></div>
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
									<td class="listlabel">행사 기간</td>
									<td rowspan=5>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>2020.08.30 ~ 2020.09.05</td>
								</tr>
								<tr>
									<td class="listlabel">아티스트 모집 기간</td>
									<td>2020.07.01 ~ 2020.07.21</td>
								</tr>
								<tr>
									<td class="listlabel">모집 아티스트 팀 수</td>
									<td>6팀</td>
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
							<span class="badge badge-pill badge-success alignspanlist">아티스트 모집 중</span> &nbsp;
							<label id="festivalName">행사명</label>
							<button type="button" class="btn mb-1 btn-warning approachBtn">행사 지원</button>
							
							<table class="festivalDetail">
								<tr>
									<td class="listlabel">행사 기간</td>
									<td rowspan=5>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>2020.08.30 ~ 2020.09.05</td>
								</tr>
								<tr>
									<td class="listlabel">아티스트 모집 기간</td>
									<td>2020.07.01 ~ 2020.07.21</td>
								</tr>
								<tr>
									<td class="listlabel">모집 아티스트 팀 수</td>
									<td>6팀</td>
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
							<span class="badge badge-pill badge-success alignspanlist">아티스트 모집 중</span> &nbsp;
							<label id="festivalName">행사명</label>
                            <button type="button" class="btn mb-1 btn-secondary approachBtn">지원 완료</button>
							
							<table class="festivalDetail">
								<tr>
									<td class="listlabel">행사 기간</td>
									<td rowspan=5>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>2020.08.30 ~ 2020.09.05</td>
								</tr>
								<tr>
									<td class="listlabel">아티스트 모집 기간</td>
									<td>2020.07.01 ~ 2020.07.21</td>
								</tr>
								<tr>
									<td class="listlabel">모집 아티스트 팀 수</td>
									<td>6팀</td>
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