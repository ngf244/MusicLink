<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
	<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	

    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    <link href="<%= request.getContextPath() %>/css/mfooter.css" rel="stylesheet" />
<title>joinArtistForm</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
    section{width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; font-family: "Roboto", sans-serif;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
    
    #categoryArea {padding-top: 35px; padding-left: 30px; color: #76838f;}
	#contentArea{padding-top: 45px; padding-bottom: 45px; background: red;}
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
	#block {background: #8AFF00; width: 55px; height: 8px; top: 5%;}
    
    #enrollForm{text-align: center; background: orange;}
    #insertInfo{background: yellow;}
	#insertInfo td{border: 1px solid black;}
	.table1_td{width: 200px; height: 300px;}
	#titleImg{width: 200px; height: 300px;}
	
	.introduce{resize: none; border: 1px solid #ced4da; border-radius: 4px;}
	
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
						<td rowspan="5" class="table1_td">
						<img id="titleImg" src="<%= request.getContextPath() %>/img_s/titleimg_ex.jpg">
						</td>
						<td class="label">활동명</td>
						<td><input type="text" name="art_name" id="art_name" class="form-control input-default enroll" placeholder="활동명 or 팀명을 입력하세요"></td>
					</tr>
					<tr>
						<td class="label">인원 수</td>
						<td><input type="number" min="1" name="art_num" id="art_num" class="form-control input-default enroll"></td>
					</tr>
					<tr>
						<td class="label">데뷔일</td>
						<td>
							<input type="text" name="debut_year" id="debut_year" class="form-control input-default enroll" placeholder="년">
							<input type="text" name="debut_month" id="debut_month" class="form-control input-default enroll" placeholder="월">
							<input type="text" name="debut_day" id="debut_day" class="form-control input-default enroll" placeholder="일">
						</td>
					</tr>
					<tr>
						<td class="label">장르</td>
						<td>
							<label><input type="checkbox" class="genre" name="" value="발라드">발라드</label>
							<label><input type="checkbox" class="genre" name="" value="댄스">댄스</label>
							<label><input type="checkbox" class="genre" name="" value="랩/힙합">랩/힙합</label>
							<br>
							<label><input type="checkbox" class="genre" name="" value="POP">POP</label>
							<label><input type="checkbox" class="genre" name="" value="ROCK">ROCK</label>
							<label><input type="checkbox" class="genre" name="" value="기타">기타</label>
						</td>
					</tr>
					<tr>
						<td class="label">유형</td>
						<td>
							<label><input type="radio" class="type_gender" name="" value="남성">남성</label>
							<label><input type="radio" class="type_gender" name="" value="여성">여성</label>
							<label><input type="radio" class="type_gender" name="" value="혼성">혼성</label>
							<hr>
							<label><input type="radio" class="type_num" name="" value="솔로">솔로</label>
							<label><input type="radio" class="type_num" name="" value="그룹">그룹</label>
						</td>
					</tr>
					<tr>
						<td colspan="3" class="label">한 줄 소개</td>
					</tr>
					<tr>
						<td colspan="3">
							<textarea class="introduce" name="" id="line_intro" rows="5" cols="80"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="3" class="label">아티스트 소개</td>
					</tr>
					<tr>
						<td colspan="3">
							<textarea class="introduce" name="" id="art_intro" rows="10" cols="80"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="3"  class="label">활동이력</td>
					</tr>
					<tr>
						<td colspan="3">
							<div>
								<table id="historyTable">
									<tr>
										<td class="art_history">발행일</td>
										<td class="art_history">앨범명</td>
										<td class="art_history">장르</td>
										<td class="art_history">작사</td>
										<td class="art_history">작곡</td>
									</tr>
									<tr>
										<td class="art_history"></td>
										<td class="art_history"></td>
										<td class="art_history"></td>
										<td class="art_history"></td>
										<td class="art_history"></td>
									</tr>
									<tr>
										<td class="art_history"></td>
										<td class="art_history"></td>
										<td class="art_history"></td>
										<td class="art_history"></td>
										<td class="art_history"></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td>사진 첨부</td>
						<td colspan="2">
							<input type="button" value="첨부파일">
						</td>
					</tr>
					<tr>
						<td>동영상 첨부</td>
						<td colspan="2">
							<input type="button" value="첨부파일">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="submit"  class="btn mb-1 btn-dark" id="enrollSubmit" value="등록">
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
    
</body>
</html>