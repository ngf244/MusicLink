<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	#contentArea{padding-top: 45px; padding-bottom: 45px; background: red;  font-family: "Roboto", sans-serif;}
	#block {background: #8AFF00; width: 55px; height: 8px; top: 5%;}
    
    #enrollForm{background: orange;}
    #insertInfo{background: yellow; font-size: 20px; width: 750px; margin-left: auto; margin-right: auto;}
	#insertInfo td{border: 1px solid black;}
	#titleImg{width: 300px; height: 300px;}
	
	.introduce{resize: none; border: 1px solid #ced4da; border-radius: 4px;}
	
	.label{font-weight: 600; color: #76838f; width: 150px;}
	#labelA{text-align: center;}
	#labelTd{height: 50px;}
	.btnClass{text-align: center;}
	
	.btn{padding: 10px 18px; color: #fff; background-color: #7780b7; border-color: #333333; text-align: center;
    	margin: 3px; font-weight: 400; font-size: 0.99rem; line-height: 1.5; border-radius: 0.25rem;
    	font-family: "Roboto", sans-serif; vertical-align: middle; white-space: nowrap; border: 1px solid transparent;}
    	
	.form-control{width: 200px; border-radius: 4px; box-shadow: none; padding: 0.8rem 0.75rem; font-size: 0.99rem;
   		line-height: 1.5; vertical-align: middle; border: 1px solid #ced4da; transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;}
	#art_num{width: 58px;}
	#enrollBtn{margin-top:30px;}
	#debut_year{width: 58px;}
    #debut_month, #debut_day{width: 40px;}
    
    #poto_link{padding: 10px 18px;}
    
	.historyDiv{background: blue; text-align: center;}
	.historydata{border: 0px; text-align: center; font-size: 18px;}
	
	.fileBox #potoFile #videoFile .fileName {display:inline-block;width:190px;height:30px;padding-left:10px;margin-right:5px;line-height:30px;border:1px solid #aaa;background-color:#fff;vertical-align:middle}
	.fileBox .btn_file {display:inline-block;border:1px solid #000;width:100px;height:30px;font-size:0.8em;line-height:30px;text-align:center;vertical-align:middle}
	.fileBox input[type="file"] {position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}
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
			<form id="enrollForm">
				<table id="insertInfo">
					<tr>
						<td colspan="2" rowspan="5" class="table1_td">
						<img id="titleImg" src="<%= request.getContextPath() %>/img_s/titleimg_ex.jpg">
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
							<label><input type="checkbox" class="genre" name="genre" value="댄스">댄스</label>
							<label><input type="checkbox" class="genre" name="genre" value="랩/힙합">랩/힙합</label>
							<br>
							<label><input type="checkbox" class="genre" name="genre" value="POP">POP</label>
							<label><input type="checkbox" class="genre" name="genre" value="ROCK">ROCK</label>
							<label><input type="checkbox" class="genre" name="genre" value="기타">기타</label>
						</td>
					</tr>
					<tr>
						<td class="label" id="labelA">유형</td>
						<td>
							<label><input type="radio" class="type_gender" name="gender" value="남성">남성</label>
							<label><input type="radio" class="type_gender" name="gender" value="여성">여성</label>
							<label><input type="radio" class="type_gender" name="gender" value="혼성">혼성</label>
							<hr>
							<label><input type="radio" class="type_num" name="memNum" value="솔로">솔로</label>
							<label><input type="radio" class="type_num" name="memNum" value="그룹">그룹</label>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="label" id="labelTd">한 줄 소개</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea class="introduce" name="" id="line_intro" rows="5" cols="95"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="label" id="labelTd">아티스트 소개</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea class="introduce" name="" id="art_intro" rows="10" cols="95"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4"  class="label" id="labelTd">활동이력</td>
					</tr>
					<tr>
						<td colspan="4" class="historyTd">
							<div class="historyDiv">
								<table class="historyTable">
									<tr>
										<td class="art_history1">발행일</td>
										<td class="art_history1">앨범명</td>
										<td class="art_history1">장르</td>
										<td class="art_history1">작사</td>
										<td class="art_history1">작곡</td>
									</tr>
									<tr>
										<td class="art_history"><input type="text" class="historydata" name="albumDate" id="albumDate" value="2020.02.20"></td>
										<td class="art_history"><input type="text" class="historydata" name="albumTitle" id="albumTitle" value="kh세미프로젝트"></td>
										<td class="art_history"><input type="text" class="historydata" name="albumGenre" id="albumGenre" value="ROCK"></td>
										<td class="art_history"><input type="text" class="historydata" name="albumWriter" id="albumWriter" value="싸우는거 아니조"></td>
										<td class="art_history"><input type="text" class="historydata" name="albumSong" id="albumSong" value="싸우는거 맞조"></td>
									</tr>
									<tr>
										<td class="art_history"><input type="text" class="historydata" name="albumDate" id="albumDate" value="2020.02.20"></td>
										<td class="art_history"><input type="text" class="historydata" name="albumTitle" id="albumTitle" value="kh세미프로젝트2"></td>
										<td class="art_history"><input type="text" class="historydata" name="albumGenre" id="albumGenre" value="댄스"></td>
										<td class="art_history"><input type="text" class="historydata" name="albumWriter" id="albumWriter" value="싸우는거 아니조"></td>
										<td class="art_history"><input type="text" class="historydata" name="albumSong" id="albumSong" value="싸우는거 맞조"></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">사진 첨부</td>
						<td colspan="3" class="fileBox">
							<input type="text" name="potoFile" id="potoFile" class="form-control input-default enroll" readonly>
							<label for="uploadBtn1" class="btn_file">첨부파일</label>
							<input type="file" id="uploadBtn1" class="uploadBtn">
						</td>
					</tr>
					<tr>
						<td class="label">동영상 첨부</td>
						<td colspan="3" class="fileBox">
							<input type="text" name="videoFile" id="videoFile" class="form-control input-default enroll" readonly>
							<label for="uploadBtn2" class="btn_file">첨부파일</label>
							<input type="file" id="uploadBtn2" class="uploadBtn">
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
	    var uploadFile1 = $('.fileBox .uploadBtn1');
	    uploadFile1.on('change', function(){
	    	if(window.FileReader){
	    		var filename = $(this)[0].files[0].name;
	    	} else {
	    		var filename = $(this).val().split('/').pop().split('\\').pop();
	    	}
	    	$(this).siblings('#potoFile').val(filename);
	    });
    	
	    var uploadFile2 = $('.fileBox .uploadBtn2');
	    uploadFile2.on('change', function(){
	    	if(window.FileReader){
	    		var filename = $(this)[0].files[0].name;
	    	} else {
	    		var filename = $(this).val().split('/').pop().split('\\').pop();
	    	}
	    	$(this).siblings('#videoFile').val(filename);
	    });
    </script>
    
</body>
</html>