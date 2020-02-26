<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String userId = (String)request.getAttribute("userId");
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
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %> 
	
	<section style="z-index: 1;">
		<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">MUSICLINK</label> 
			<label id="inSmallCategory"> - artist enroll</label>
		</div>
		
		<div id="contentArea">
			<form id="enrollForm" action="<%= request.getContextPath() %>/insert.at" method="post" encType="multipart/form-data" onsubmit="return validate();">
				<table id="insertInfo">
					<tr>
						<td colspan="4" class="alert-danger">※ 모든 정보를 입력해주세요.(단, sns는 선택)</td>
					</tr>
					<tr>
						<td colspan="2" rowspan="5" class="table1_td">
						<input type="hidden" name="userId" value="<%= userId %>">
							<div id="titleImgArea">
								<img id="titleImg">
								<div class="textImg">
									<img id="clickImg" src="<%= request.getContextPath()%>/img_s/one-finger-click.png"> click
								</div>
							</div>
						</td>
						<td class="label" id="labelA">활동명</td>
						<td><input type="text" name="art_name" id="art_name" class="form-control input-default enroll" placeholder="활동명 or 팀명을 입력하세요"></td>
					</tr>
					<tr>
						<td class="label" id="labelA">인원 수</td>
						<td><input type="number" min="1" name="art_num" id="art_num" class="form-control input-default enroll"></td>
					</tr>
					<tr>
						<td class="label" id="labelA">데뷔일</td>
						<td>
							<input type="text" name="debut_year" id="debut_year" class="form-control input-default enroll" placeholder="년">
							<input type="text" name="debut_month" id="debut_month" class="form-control input-default enroll" placeholder="월">
							<input type="text" name="debut_day" id="debut_day" class="form-control input-default enroll" placeholder="일">
						</td>
					</tr>
					<tr>
						<td class="label" id="labelA">장르</td>
						<td>
							<label><input type="checkbox" class="genre" name="genre" value="발라드">발라드</label>
							<label><input type="checkbox" class="genre" name="genre" value="댄스">댄스</label>&nbsp;&nbsp;
							<label><input type="checkbox" class="genre" name="genre" value="랩/힙합">랩/힙합</label>
							<br>
							<label><input type="checkbox" class="genre" name="genre" value="POP">POP</label>&nbsp;&nbsp;&nbsp;
							<label><input type="checkbox" class="genre" name="genre" value="ROCK">ROCK</label>
							<label><input type="checkbox" class="genre" name="genre" value="기타">기타</label>
						</td>
					</tr>
					<tr>
						<td class="label" id="labelA">유형</td>
						<td>
							<label class="radio_label"><input type="radio" class="type_gender" name="artistGender" value="남성">남성</label>
							<label class="radio_label"><input type="radio" class="type_gender" name="artistGender" value="여성">여성</label>
							<label class="radio_label"><input type="radio" class="type_gender" name="artistGender" value="혼성">혼성</label>
							<br>
							<label class="radio_label"><input type="radio" class="type_num" name="artistCategory" value="솔로">솔로</label>
							<label class="radio_label"><input type="radio" class="type_num" name="artistCategory" value="그룹">그룹</label>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="label" id="labelTd">한 줄 소개</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea class="introduce" name="introduce" id="line_intro" rows="5" cols="110" placeholder="아티스트 리스트에 들어갈 한 줄 소개를 적어주세요."></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="label" id="labelTd">아티스트 소개</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea class="introduce" name="artistInfo" id="art_intro" rows="10" cols="110" placeholder="프로필에 들어갈 아티스트 소개를 적어주세요."></textarea>
						</td>
					</tr>
					<tr>
						<td class="label" id="labelTd">활동이력</td>
						<td colspan="3" class="rowplus">
						<img id="rowplus" width="20" height="20" src="<%= request.getContextPath() %>/img_s/plus-sign-in-circle.png">
						<img id="rowminus" width="20" height="20" src="<%= request.getContextPath() %>/img_s/minus.png">
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
										<tr>
											<td class="art_history"><input type="text" style="width: 100px;" class="historydata" name="albumDate" id="albumDate" placeholder="2020.01.01"></td>
											<td class="art_history"><input type="text" style="width: 200px;" class="historydata" name="albumTitle" id="albumTitle" placeholder="앨범명"></td>
											<td class="art_history"><input type="text" style="width: 100px;" class="historydata" name="albumGenre" id="albumGenre" placeholder="장르"></td>
											<td class="art_history"><input type="text" style="width: 200px;" class="historydata" name="albumWriter" id="albumWriter" placeholder="작사가"></td>
											<td class="art_history"><input type="text" style="width: 200px;" class="historydata" name="albumSong" id="albumSong" placeholder="작곡가"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">사진 첨부</td>
						<td colspan="3" class="fileBox">
							<input type="text" name="potoFile" id="potoFile" class="text-file" readonly>
							<label for="uploadBtn1" class="btn_file">첨부파일</label>
							<input type="file" name="uploadBtn1" id="uploadBtn1" class="uploadBtn1" accept="image/jpeg, image/png, image/jpg">
						</td>
					</tr>
					<tr>
						<td class="label">동영상 첨부</td>
						<td colspan="3" class="fileBox">
							<input type="url" name="videoFile" id="videoFile" class="text-file" placeholder="동영상링크 주소를 넣어주세요.">
						</td>
					</tr>
					<tr>
						<td rowspan="3" class="label" id="label_sns">SNS</td>
						<td colspan="3">
							<span class="sns_class">Instargram</span>
							<input type="url" name="instaURL" id="instaURL" class="sns-form" placeholder="인스타링크 주소를 넣어주세요.">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<span class="sns_class">Twitter</span>
							<input type="url" name="twitterURL" id="twitterURL" class="sns-form" placeholder="트위터링크 주소를 넣어주세요.">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<span class="sns_class">FaceBook</span>
							<input type="url" name="facebookURL" id="facebookURL" class="sns-form" placeholder="페이스북링크 주소를 넣어주세요.">
						</td>
					</tr>
					<tr>
						<td colspan="4" class="btnClass">
							<input type="submit"  class="btn mb-1 btn-dark" id="enrollBtnSubmit" value="등록">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" onclick=""  class="btn mb-1 btn-dark" id="enrollBtnCancel" value="취소">
						</td>
					</tr>
				</table>
				<div id="fileArea">
					<input type="file" name="profile" id="profile" multiple="multiple" name="profile" onchange="LoadImg(this)">
				</div>
				<input type="hidden" id="hiddenHistory" name="hiddenHistory">
			</form>
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
    	$(function(){
    		$('#fileArea').hide();
    		
    		$('#titleImgArea').click(function(){
    			$('#profile').click();
    		});
    	});
    	
    	var titleImgChecked = false;
    	function LoadImg(value){
    		if(value.files && value.files[0]){
    			var reader = new FileReader();
    				
    			reader.onload = function(e){
    				$('#titleImg').attr("src", e.target.result);
    				$('.textImg').css("display", "none");
    			}
    			titleImgChecked = true;
    			reader.readAsDataURL(value.files[0]);
    		}
    	}
    	
	    var uploadFile1 = $('.fileBox .uploadBtn1');
	    uploadFile1.on('change', function(){
	    	if(window.FileReader){
	    		var filename = $(this)[0].files[0].name;
	    	} else {
	    		var filename = $(this).val().split('/').pop().split('\\').pop();
	    	}
	    	$(this).siblings('#potoFile').val(filename);
	    });
	    
	    $('#rowplus').click(function(){
	    	var trtdText = '<tr>' + '<td class="art_history">' 
	    	+ '<input type="text" style="width: 100px;" class="historydata" name="albumDate" id="albumDate" placeholder="2020.01.01">' 
	    	+ '</td>' + '<td class="art_history">'
	    	+ '<input type="text" style="width: 200px;" class="historydata" name="albumTitle" id="albumTitle" placeholder="앨범명">'
	    	+ '</td>' + '<td class="art_history">'
	    	+ '<input type="text" style="width: 100px;" class="historydata" name="albumGenre" id="albumGenre" placeholder="장르">'
	    	+ '</td>' + '<td class="art_history">'
	    	+ '<input type="text" style="width: 200px;" class="historydata" name="albumWriter" id="albumWriter" placeholder="작사가">'
	    	+ '</td>' + '<td class="art_history">'
	    	+ '<input type="text" style="width: 200px;" class="historydata" name="albumSong" id="albumSong" placeholder="작곡가">'
	    	+ '</td>' + '</tr>'
	    	
	    	$('.historyTable > tbody:last').append(trtdText);
	    });
	    
	    $('#rowminus').click(function(){
	    	$('.historyTable > tbody:last > tr:last').remove();
	    });
	    
	    function validate(){
			if(titleImgChecked == false){
				alert("프로필 사진을 첨부해주세요.");
				return false;
			} else if($('#art_name').val() == ""){
				alert("활동명 or 팀명을 입력해주세요.");
				return false;
			} else if($('#art_num').val() == ""){
				alert("인원수를 입력해주세요.");
				return false;
			} else if($('#debut_year').val() == "" || $('#debut_month').val() == "" || $('#debut_day').val() == ""){
				alert("데뷔일을 입력해주세요.")
				return false;
			} else if($('input:checkbox[name="genre"]:checked').length == 0){
				alert("장르를 체크해주세요.")
				return false;
			} else if($('input:radio[name="artistGender"]:checked').val() == ""){
				alert("성별을 선택해주세요.")
				return false;
			} else if($('input:radio[name="artistCategory"]:checked').val() == ""){
				alert("(솔로/그룹)을 선택해주세요.")
				return false;
			} else if($('#line_intro').val() == ""){
				alert("한 줄 소개를 적어주세요.");
				return false;
			} else if($('#art_intro').val() == ""){
				alert("아티스트 소개를 적어주세요.");
				return false;
			} else if($('#potoFile').val() == ""){
				alert("사진첨부를 해주세요.");
				return false;
			} else if($('#videoFile').val() == ""){
				alert("동영상을 첨부해주세요.");
				return false;
			} else {
				return true;
			}
		}
	    
    </script>
    
</body>
</html>