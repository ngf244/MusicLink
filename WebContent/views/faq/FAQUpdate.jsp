<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

    <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">
    
	<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
    
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    <link href="<%= request.getContextPath() %>/css/mfooter.css" rel="stylesheet" />
<title>FAQ 수정</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
    section{width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 20%; position: relative;
    background: #fff;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:-97px; left:50%; transform: translateX(-50%); color: rgb(224, 224, 224);} 
	
    #categoryArea {padding-top: 35px; padding-left: 30px; color: #76838f;}
	#contentArea{padding-top: 45px; padding-bottom: 45px;}
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
	#block {background: #8AFF00; width: 55px; height: 8px; top: 5%;}
	
	#contentArea{width: 100%; text-align:center; padding-top: 5%; padding-bottom: 5%; font-family: 'Noto Sans KR', sans-serif;}
	#table_show{width: 85%; margin-left: auto; margin-right: auto; text-align:center;}
	.qna_title{padding: 10px; /*border-bottom: 2px solid lightgray;*/ height: 20px; vertical-align: middle;}
	.qna_content{padding: 10px;}
	#qna_btn2{text-align: right;}
	
	#inputTable{width:100%;}
	.labeltd{width:12%; font-size: 17px;}
	.inputqna{height:40px;}
	.inputtextarea{border-radius: 4px; resize:none;}
	
	#updateBtn{margin-right: 2%;}
	#qna_btn2 button{margin-top: 1%;}
	
	.ft-content{width: 70%;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
   
    <section style="z-index: 1;">
    	<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">MUSICLINK</label> 
			<label id="inSmallCategory"> - FAQ WRITE</label>
		</div>
		<div id="contentArea">
			<div id="table_show">
				<form action="<%= request.getContextPath() %>/update.faq" method="post">
				<input type="hidden" name="code" id="faqCode" value="<%= request.getParameter("faqCode") %>">
					<table id="inputTable">
						<tr>
							<td class="qna_title labeltd">제목</td>
							<td class="qna_title">
								<input type="text" name="title" class="form-control input-default inputqna" value="<%= request.getParameter("faqTitle") %>" placeholder="제목을 입력해주세요">
							</td>
						</tr>
						<tr>
							<td class="qna_content labeltd">내용</td>
							<td class="qna_content">
								<textarea name="content" class="form-control h-150px inputtextarea" rows="10" placeholder="내용을 입력해주세요"><%= request.getParameter("faqContent") %></textarea>
							</td>
						</tr>
						<tr>
							<td></td>
							<td id="qna_btn2">
								<button type="submit" class="btn mb-1 btn-secondary" id="updateBtn">등록</button>
								<button type="button" onclick="location.href='<%= request.getContextPath() %>/list.faq'" class="btn mb-1 btn-secondary" id="deleteBtn">취소</button>
							</td>
						</tr>
					</table>					
				</form>
			</div>
		</div>
    </section>
	<h1 class="htext">F A Q</h1>
    
	<%@ include file="../common/footer.jsp" %> 
    
    <!--**********************************
        Scripts
    ***********************************-->
    <script src="../../plugins/common/common.min.js"></script>
    <script src="../../js/custom.min.js"></script>
    <script src="../../js/settings.js"></script>
    <script src="../../js/gleek.js"></script>
    <script src="../../js/styleSwitcher.js"></script>

</body>
</html>