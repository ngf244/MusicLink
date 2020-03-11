<%@page import="authorPage.model.vo.ArtistJoinInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArtistJoinInfo ai = (ArtistJoinInfo)request.getAttribute("ai");
	String[] activies = ai.getRecord().split("/");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    <link href="<%= request.getContextPath() %>/css/mfooter.css" rel="stylesheet" />
<title>joinArtistForm</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
    section{width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; font-family: "Roboto", sans-serif;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:140px; left:50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
    
    #categoryArea {padding-top: 35px; padding-left: 30px; color: #76838f;}
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
	
	#contentArea{padding-top: 30px; padding-bottom: 45px; font-family: "Roboto", sans-serif;}
	#block {background: #8AFF00; width: 55px; height: 8px; top: 5%;}
    
    #insertInfo{font-size: 20px; width: 750px; margin-left: auto; margin-right: auto;}
	
	#titleImg{width: 300px; height: 300px;}
	#titleImgArea{position: relative; z-index: 1;}
	#titleImgArea .textImg{position: absolute; top: 130px; left: 120px; z-index: 2;}
	#clickImg{width: 20px; height: 20px;}
	
	.introduce{resize: none; border: 1px solid #ced4da; border-radius: 4px;}
	
	.label{font-weight: 600; color: #76838f; width: 150px;}
	#labelA{text-align: center;}
	#labelTd{height: 50px;}
	.btnClass{text-align: center; padding: 20px;}
	
	.btn{padding: 10px 18px; color: #fff; background-color: #7780b7; border-color: #333333; text-align: center;
    	margin: 3px; font-weight: 400; font-size: 0.99rem; line-height: 1.5; border-radius: 0.25rem;
    	font-family: "Roboto", sans-serif; vertical-align: middle; white-space: nowrap; border: 1px solid transparent;}
    	
	.form-control{width: 200px; border-radius: 4px; box-shadow: none; padding: 0.8rem 0.75rem; font-size: 0.99rem;
   		line-height: 1.5; vertical-align: middle; border: 1px solid #ced4da; transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;}
   	.text-file{width: 200px; border-radius: 4px; box-shadow: none; padding: 0.5rem 0.6rem; font-size: 0.99rem; margin: 7px;
   	line-height: 1.5; vertical-align: middle; border: 1px solid #ced4da; transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;}
	#art_num{width: 58px;}
	#enrollBtn{margin-top:30px;}
	#debut_year{width: 58px;}
    #debut_month, #debut_day{width: 40px;}
    
	.historyDiv{text-align: center; margin-bottom: 20px;}
	.historydata{border: 0px; text-align: center; font-size: 18px;}
	.historyTable{border-bottom: 1px;}
	.art_history1{height: 30px;border-bottom: 2px solid lightgray;}
	.art_history{height: 25px; border-bottom: 1px solid lightgray;}
	
	#potoFile #videoFile {display:inline-block;width:190px;height:30px;padding-left:10px;margin-right:5px;line-height:30px;
						  border:1px solid #aaa;background-color:#fff;vertical-align:middle;}
	#videoFile{width: 300px;}
	.fileBox .btn_file {display:inline-block;width:100px;height:30px;font-size:0.8em;line-height:30px;text-align:center;vertical-align:middle;}
	.fileBox input[type="file"] {position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0;}
	.btn_file{padding: 5px 10px; color: black; background-color: lightgray; text-align: center;
    	font-weight: 500; font-size: 0.99rem; line-height: 1.5; border-radius: 0.25rem;
    	font-family: "Roboto", sans-serif; vertical-align: middle; white-space: nowrap; border: 1px solid transparent;}
    	
   	.sns-form{width: 240px; border-radius: 4px; box-shadow: none; padding: 0.5rem 0.6rem; font-size: 0.99rem;
   	line-height: 1.5; vertical-align: middle; border: 1px solid #ced4da; transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;}
    .sns_class{
    align-items: center;padding: 0.5rem 0.6rem;font-size: 0.875rem;font-weight: 400;line-height: 1.5;
    color: #495057;text-align: center;white-space: nowrap;background-color: #e9ecef;border: 1px solid #ced4da;
    border-radius: 0.25rem;}
    #label_sns{height: 150px;}
    
    .rowplus{text-align: right;}
    
	.alert-danger {color: #853131;background-color: #ffdfdf;border-color: #ffd2d2;
			position: relative;padding: 0.75rem 1.25rem;margin-bottom: 20px;border: 1px solid transparent;border-radius: 0.3rem;
			font-size: 13px;text-align:center;}

	.gobackbtn{color: blue; background-color: red; position: fixed; top: 50%; right: 17%; width: 80px; height: 60px;}
			
	input{readonly}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %> 
	
	<section style="z-index: 1;">
	<div id = "enrollform">
		<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">MUSICLINK</label> 
			<label id="inSmallCategory"> - artist enroll</label>
		</div>
		
		<div id="contentArea">
			<form id="enrollForm-artist" name="enrollForm-artist" action="<%= request.getContextPath() %>/accept.at" method="post" onsubmit="return check();">
				<table id="insertInfo">
					<tr>
						<td colspan="4" class="alert-danger">※ 모든 정보를 입력해주세요.(단, sns는 선택)</td>
					</tr>
					<tr>
						<td colspan="2" rowspan="5" class="table1_td">
						<input type="hidden" name="userCode" id="userCode" value="<%=ai.getAt_code()%>">
						<input type="hidden" name="where" value="art">
							<div id="titleImgArea">
								<img id="titleImg" src="<%=request.getContextPath()%>/artistProfile_uploadFiles/<%=ai.getPic1()%>">
							</div>
						</td>
						<td class="label" id="labelA">활동명</td>
						<td><input type="text" name="art_name" id="art_name" class="form-control input-default enroll" value="<%=ai.getActiveName()%>"></td>
					</tr>
					<tr>
						<td class="label" id="labelA">인원 수</td>
						<td><input type="number" min="1" name="art_num" id="art_num" class="form-control input-default enroll" value="<%=ai.getPeopleNum()%>"></td>
					</tr>
					<tr>
						<td class="label" id="labelA">데뷔일</td>
						<td>
							<input type="text" name="debut_year" id="debut_year" class="form-control input-default enroll" value = "<%=ai.getDebutDate()%>">
						</td>
					</tr>
					<tr>
						<td class="label" id="labelA">장르</td>
						<td>
							<input type="text" value="<%=ai.getGenre()%>">
						</td>
					</tr>
					<tr>
						<td class="label" id="labelA">유형</td>
						<td>
							<input type="text" value="<%=ai.getAt_class() %>">
						</td>
					</tr>
					<tr>
						<td colspan="4" class="label" id="labelTd">한 줄 소개</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea class="introduce" name="introduce" id="line_intro" rows="5" cols="110"><%=ai.getOne_introduce() %></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="label" id="labelTd">아티스트 소개</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea class="introduce" name="artistInfo" id="art_intro" rows="10" cols="110"><%=ai.getMul_introduce() %></textarea>
						</td>
					</tr>
					<tr>
						<td class="label" id="labelTd">활동이력</td>
						<td colspan="3" class="rowplus">
						</td>
					</tr>
					<tr>
						<td colspan="4" class="historyTd">
							<div class="historyDiv">
								<table class="historyTable">
									<tr>
										<th class="art_history1">발행일</th>
										<th class="art_history1">앨범명</th>
										<th class="art_history1">장르</th>
										<th class="art_history1">작사</th>
										<th class="art_history1">작곡</th>
									</tr>
									<tbody>
									<%for(int i = 0; i< activies.length; i++){ %>
										<tr>
											<td colspan="5"><%=activies[i] %></td>
										</tr>
									<%} %>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">사진 첨부</td>
						<td colspan="3" class="fileBox">
							<img src="<%=request.getContextPath()%>/artistProfile_uploadFiles/<%=ai.pic2%>">
						</td>
					</tr>
					<tr>
						<td class="label">동영상 첨부</td>
						<td colspan="3" class="fileBox">
						<iframe width="560" height="315" src="<%=ai.getAvisrc()%>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						</td>
					</tr>
					<tr>
						<td rowspan="3" class="label" id="label_sns">SNS</td>
						<td colspan="3">
							<span class="sns_class">Instargram</span>
							<input type="text" readonly="readonly" name="instaURL" id="instaURL" class="sns-form" placeholder="인스타링크 주소를 넣어주세요." value=
							<%if(ai.getInsta()!=null) {%>
							"<%=ai.getInsta()%>"
							<%}else{ %>
							""
							<%} %>
							>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<span class="sns_class">Twitter</span>
							<input type="text" readonly="readonly" name="twitterURL" id="twitterURL" class="sns-form" placeholder="트위터링크 주소를 넣어주세요." value=
							<%if(ai.getTwitter()!=null) {%>
							"<%=ai.getTwitter()%>"
							<%}else{ %>
							""
							<%} %>
							>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<span class="sns_class">FaceBook</span>
							<input type="text" readonly="readonly" name="facebookURL" id="facebookURL" class="sns-form" placeholder="페이스북링크 주소를 넣어주세요." value=
							<%if(ai.getFacebook()!=null) {%>
							"<%=ai.getFacebook()%>"
							<%}else{ %>
							""
							<%} %>
							>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="btnClass">
							<input type="submit"  class="btn mb-1 btn-dark" id="enrollBtnSubmit" value="수락">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" onclick="refuse();" class="btn mb-1 btn-dark" id="enrollBtnCancel" value="거절 및 사유보내기">
						</td>
					</tr>
				</table>
				<button class="gobackbtn" onclick="history.go(-1)">돌아가기</button>
			</form>
		</div>
		</div>
	</section>
	<h1 class="htext">A R T I S T</h1>
    
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
		function check() {
			var check = false;
			check = confirm("정말 수락하시겠습니까?");

			if(check){
				return true;
			} else {
				return false;
			}
		}
		
		function refuse() {
			window.open("views/authorPage/sendmessageForm.jsp", "message", "width=500, height=300");
		}
    </script>
    
</body>
</html>