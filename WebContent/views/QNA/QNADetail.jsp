<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="QNA.model.vo.*, java.util.ArrayList"%>
<%
	QnA qna = (QnA)request.getAttribute("qna");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

	<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    <link href="<%= request.getContextPath() %>/css/mfooter.css" rel="stylesheet" />
<title>Q&A Detail Form</title>
<style>
    section{width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:50%; transform: translateX(-50%); color: rgb(224, 224, 224);} 
	
    #categoryArea {padding-top: 35px; padding-left: 30px; color: #76838f;}
	#contentArea{padding-top: 45px; padding-bottom: 45px;}
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
	#block {background: #8AFF00; width: 55px; height: 8px; top: 5%;}
	
	#contentArea{padding-top: 60px; padding-bottom: 80px; font-family: 'Noto Sans KR', sans-serif;}
	#table_show{width: 90%; margin-left: auto; margin-right: auto;}
	#qna_title{padding: 10px; border-bottom: 2px solid lightgray; font-size: 20px; height: 20px; vertical-align: middle;}
	.input_qna2{padding: 10px; border-bottom: 2px solid lightgray;}
	#qna_date{text-align: right;}
	#qna_content{padding: 10px;}
	.input_qna4{border-bottom: 3px double lightgray;}
	#qna_btn2{text-align: right;}
	
	.detail_btn{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: #7780b7; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: 60px;
	}
	.detail{width: 100%;}
	#qna_comment{margin-top: 10px; border: 1px solid lightgray; border-radius: 0.2rem; padding: 10px; vertical-align: middle;}
	#label_comment{vertical-align: middle;}
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
   
    <section style="z-index: 1;">
    	<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">MUSICLINK</label> 
			<label id="inSmallCategory"> - Q&A</label>
		</div>
		<div id="contentArea">
			<form id="table_show" action="<%= request.getContextPath() %>/views/QNA/Q&AUpdate.jsp" method="post">
				<table class="detail">
					<tr>
						
						<td colspan="2" class="input_qna" id="qna_title"><%= qna.getQnaTitle() %>
						<input type="hidden" value="<%= qna.getQnaCode() %>" name="qnaCode">
						</td>
					</tr>
					<tr>
						<td class="input_qna2" id="qna_writer"><label>작성자 : </label><%= qna.getQnaWriter() %></td>
						<td class="input_qna2" id="qna_date"><label>작성일 : </label><%= qna.getQnaDate() %></td>
					</tr>
					<tr>
						<td colspan="2" class="input_qna" id="qna_content">
							<%= qna.getQnaContent() %>
						</td>
					</tr>
					<tr>
						<% if(qna.getQnaWriter().equals(loginUser.getUserName())) { %>
						<td class="input_qna4" id="qna_btn1">
							<button type="button" onclick="location.href='<%= request.getContextPath() %>/list.qna'" class="detail_btn" id="backBtn">목록</button>
						</td>
						<td class="input_qna4" id="qna_btn2">
							<button type="submit" class="detail_btn" id="updateBtn">수정</button>
							<button type="button" onclick="deleteQnA();" class="detail_btn" id="deleteBtn">삭제</button>
						</td>
						<% } else { %>
						<td colspan="2" class="input_qna4" id="qna_btn1">
							<button type="button" onclick="location.href='<%= request.getContextPath() %>/list.qna'" class="detail_btn" id="backBtn">목록</button>
						</td>
						<% } %>
					</tr>
				</table>
				<div id="qna_comment">
					<label id="label_comment">답변 : </label>
					<textarea rows="1" cols="150" id="replyContent" style="resize:none;"></textarea>
				</div>
			</form>
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
    	function deleteQnA(){
    		var bool = confirm('정말로 삭제하시겠습니까?');
    		if(bool){
    			$('#table_show').attr('action','<%= request.getContextPath()%>/delete.qna');
    			$('#table_show').submit();
    		}
    	}
    </script>

</body>
</html>