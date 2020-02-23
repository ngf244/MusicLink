<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, faq.model.vo.FAQ"%>
<% 
	ArrayList<FAQ> list = (ArrayList<FAQ>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<!-- 부트스트랩 -->
	<link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    <link href="<%= request.getContextPath() %>/css/mfooter.css" rel="stylesheet" />
<title>FAQ 리스트</title>
<style>
section {
	width: 70%;
	margin: 0 auto;
	box-shadow: 5px 5px 10px 8px lightgray;
	margin-top: 20%;
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
	top: 355px;
	left: 50%;
	transform: translateX(-50%);
	color: rgb(224, 224, 224);
}

#categoryArea {
	padding-top: 35px;
	padding-left: 30px;
	color: #76838f;
}

#contentArea {
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

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid rgba(0, 0, 0, 0.125);
	border-radius: 0.25rem;
}

.card-body {
	flex: 1 1 auto;
	padding: 1.25rem;
}

.card-header {
	padding: 0.75rem 1.25rem;
	margin-bottom: 0;
	background-color: rgba(0, 0, 0, 0.03);
	border-bottom: 1px solid rgba(0, 0, 0, 0.125);
}

.card-header:first-child {
	border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0;
}

.mb-0 {
	margin-bottom: 0 !important;
}

.accordion .card {
	margin-bottom: 7px;
}

.accordion .card-header {
	cursor: pointer;
	background: #fff;
	border: 1px solid #EEEEEE;
}

.accordion .card-body {
	box-shadow: 0px;
}

#accordion-two .fa {
	float: right;
}

#accordion-two [data-toggle="collapse"] .fa:before {
	content: "\f106";
}

#accordion-two [data-toggle="collapse"].collapsed .fa:before {
	content: "\f107";
}

.fa {
	display: inline-block;
	font: normal normal normal 14px/1 FontAwesome;
	font-size: inherit;
	text-rendering: auto;
	-webkit-font-smoothing: antialiased;
}

zzzrod
  .card {
	margin-bottom: 30px;
	border: 0px;
	border-radius: 0.625rem;
	box-shadow: 6px 11px 41px -28px #a99de7;
}

.card-title {
	font-size: 18px;
	font-weight: 500;
	line-height: 18px;
}

.card-header {
	border-bottom: 0px;
	background: transparent;
}

.card-header:first-child {
	border-radius: 0;
}

.card .card-body {
	padding: 1.88rem 1.81rem;
}

.writerBtn {
	border-radius: 0.25rem;
	white-space: nowrap;
	border: 1px solid transparent;
	background-color: #7780b7;
	font-family: "Roboto", sans-serif;
	color: white;
	line-height: 1.5;
	font-size: 0.875rem;
	padding: 7px 18px;
}
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
	
	
	<section style="z-index: 1;">
		<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">MUSICLINK</label> 
			<label id="inSmallCategory"> - FAQ</label>
		</div>
		
		<div id="contentArea">
			<div class="card-body">
				<div id="accordion-two" class="accordion">
					
					<% if(list.isEmpty()){ %>
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0 collapsed" data-toggle="collapse"
								data-target="#collapse0" aria-expanded="false"
								aria-controls="collapse0">
								<i class="fa" aria-hidden="true"></i> FAQ 리스트가 없습니다.
							</h5>
						</div>
						<div id="collapse0" class="collapse"
							data-parent="#accordion-two">
							<div class="card-body">내용이 없습니다.</div>
						</div>
					</div>
					<%} else{ 
							for(int i = 0; i < list.size(); i++){
					%>
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0 collapsed" data-toggle="collapse"
								data-target="#collapse<%= i %>" aria-expanded="false"
								aria-controls="collapse<%= i %>">
								<i class="fa" aria-hidden="true"></i> <%= list.get(i).getFaqTitle() %>
							</h5>
						</div>
						<div id="collapse<%= i %>" class="collapse"
							data-parent="#accordion-two">
							<div class="card-body"><%= list.get(i).getFaqContent() %></div>
						</div>
					</div>
					<%		}
					   }	
					%>
				</div>
			</div>
			<input type="button" class="writerBtn" value="글쓰기">
		</div>
	</section>
	<h1 class="htext">F A Q</h1>
    
    <!-- 부트스트랩 -->
    <script src="<%= request.getContextPath() %>/plugins/common/common.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/custom.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/settings.js"></script>
    <script src="<%= request.getContextPath() %>/js/gleek.js"></script>
    <script src="<%= request.getContextPath() %>/js/styleSwitcher.js"></script>
    
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
    
</body>
</html>