<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, QNA.model.vo.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    <link href="<%= request.getContextPath() %>/css/mfooter.css" rel="stylesheet" />
<title>Q&A List View</title>
<style>
	section {
		width: 70%;
		margin: 0 auto;
		box-shadow: 5px 5px 10px 8px lightgray;
		margin-top: 250px;
		position: relative;
		background: #fff;
		height: 700px;
		display: block;
	}
	
	.htext {
		text-align: center;
		font-size: 100px;
		height: 0;
		position: absolute;
		top: 140px;
		left: 50%;
		transform: translateX(-50%);
		color: rgb(224, 224, 224);
	}
	
	#categoryArea {
		padding-top: 35px;
		padding-left: 30px;
		color: #76838f;
	}
	
	#contentArea{
		padding-top: 45px; 
		padding-bottom: 45px;
		text-align: center;
	}
	
	#inBigCategory {
		font-family: 'Bungee', cursive;
		font-size: 50px;
	}
	
	#inSmallCategory {
		font-family: 'Comfortaa', cursive;
		font-size: 30px;
	}
	
	#block {
		background: #8AFF00;
		width: 55px;
		height: 8px;
		top: 5%;
	}
	
	.table-responsive {
		text-align: center;
		border-radius: 3px;
		box-shadow: 0px;
	}
	
	th {
		text-align: inherit;
	}
	
	.table {
		width: 90%;
		margin-left: 5%;
		margin-bottom: 1rem;
		text-align: center;
	}
	
	.table th, .table td {
		padding: 0.75rem;
		vertical-align: top;
		border-top: 1px solid #dee2e6;
	}
	
	.table thead th {
		vertical-align: bottom;
		border-bottom: 2px solid #dee2e6;
	}
	
	.table tbody+tbody {
		border-top: 2px solid #dee2e6;
	}
	
	.badge-primary {
		background-color: #f29d56;
		color: white;
	}
	
	.badge-success {
		background-color: #7780b7;
		color: white;
	}
	
	.px-2 {
		padding-left: 0.5rem !important;
		padding-right: 0.5rem !important;
		border-radius: 0.25rem;
		padding: 5px;
		font-size: 13px;
	}
	
	
	.btnArea{
		display: inline-block;
		margin-left: 15%;
	}
	
	#write_box{
		display: inline-block;
		float: right;
		margin-right: 11%;
	}
	
	.btn_style{
		margin-left: 0;
    	border-radius: 0.25rem;
    	position: relative;
    	padding: 0.5rem 0.75rem;
    	line-height: 1.25;
    	color: #7571f9;
    	background-color: #fff;
    	border: 1px solid #dee2e6;
	}
	
	#choosen{background: lightpink;}
	
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <%
    	ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
    	PageInfo pi = (PageInfo)request.getAttribute("pi");
    	
    	int listCount = pi.getListCount();
    	int currentPage = pi.getCurrentPage();
    	int maxPage = pi.getMaxPage();
    	int startPage = pi.getStartPage();
    	int endPage = pi.getEndPage();
    %>

	<section style="z-index: 1;">
		<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">MUSICLINK</label> 
			<label id="inSmallCategory"> - Q&A</label>
		</div>
		
		<div id="contentArea">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>No</th>
							<th>작성자</th>
							<th>제목</th>
							<th>작성일</th>
							<th>답변상태</th>
						</tr>
					</thead>
					<tbody>
					<% if(list.isEmpty()) { %>
						<tr>
							<td colspan="5">조회된 리스트가 없습니다.</td>
						</tr>
					<% } else {
							for(QnA q : list) {	
					%>
						<tr>
							<th><%= q.getQnaCode() %></th>
							<td><%= q.getQnaWriter() %></td>
							<td><%= q.getQnaTitle() %></td>
							<td><%= q.getQnaDate() %></td>
							<td>
							<% if(q.getQnaComYN().equals("N")){ %>
							<span class="badge badge-primary px-2">답변대기</span>
							<% } else { %>
							<span class="badge badge-success px-2">답변완료</span>
							<% } %>
							</td>
						</tr>
					<%
							}
						} 
					%>
					</tbody>
				</table>
			</div>
			<!-- 페이징 -->
			<div class='paginaArea'>
				<div class="btnArea">
					<% if(!list.isEmpty()) { %>
					<!-- 맨 처음으로 -->
					<button class="btn_style" onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=1'">&lt;&lt;</button>
					
					<!-- 이전 페이지로 -->
					<button class="btn_style" id="beforeBtn" onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=<%= currentPage-1 %>'">&lt;</button>
					<script>
						if(<%= currentPage %> <= 1){
							var before = $('#beforeBtn');
							before.attr('diabled', 'true');
						}
					</script>
					
					<!-- 10개의 페이지 목록 -->
					<% for(int p = startPage; p <= endPage; p++){ %>
						<% if(p == currentPage){ %>
							<button class="btn_style" id="choosen" disabled><%= p %></button>
						<% } else{ %>
							<button class="btn_style" id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=<%= p %>'"><%= p %></button>
						<% } %>
					<% } %>
					
					<!-- 다음 페이지로 -->
					<button class="btn_style" onclick="location.href='<%= request.getContextPath() %>/list.qna?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
					<script>
						if(<%= currentPage %> >= <%= maxPage %>){
							var after = $("#afterBtn");
							after.attr('disabled', 'true');
						}
					</script>
					
					
					<!-- 맨 끝으로 -->
					<button class="btn_style" onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= maxPage %>'">&gt;&gt;</button>
				</div>
				<div id="write_box">
					<button class="btn_style" id="write">글쓰기</button>
				</div>
			</div>
		</div>
	</section>
	<h1 class="htext">Q & A</h1>
    
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
    
	<script>
		$(function(){
			$('#listArea td').mouseenter(function(){
				$(this).parent().css({'background':'darkgray', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css('background', 'none');
			})
				
				// 로그인 한 사람만 상세보기 이용할 수 있게하기
				<%-- <% if(loginUser != null){%>
					location.href='<%= request.getContextPath() %>/detail.bo?bid=' + bid;
				<% } else { %>
					alert('회원만 이용할 수 있는 서비스입니다.');
				<% } %> --%>
			});
		});
	</script>

</body>
</html>