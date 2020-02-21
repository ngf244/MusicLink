<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
    
    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
     
<title>아티스트 등록</title>
<style>
    /* 섹션 */
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:1400px; padding-top: 30px; padding-bottom:10%;}
    
    /* 아티스트 등록 */
    .sec-menu-views{width:78%; height:90%; padding:10px; float:left; border:1px solid rgba(255,255,255,0); box-sizing: border-box;}
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif;}  
    .views1 h3{background: #af9ce6; font-size: 20pt;}
    .become-artist{margin-left: 8%; padding-left: 5%; line-height: 30px; font-size: 15pt;}
	.artistReg_btn{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: #7780b7; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;
	}


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<%
	String userCode = loginUser.getUserCode();  	
%>
    <section style="z-index: 1;">
	<%@ include file="../common/MyPage_Menubar.jsp" %>

        <div class="sec-menu-views views1">
            <h3>아티스트 등록</h3>
            <br>
            <div class="become-artist">
                <form action="<%= request.getContextPath() %>/upgrade.at" method="post" encType="multipart/form-data">
                    <input type="hidden" name="userCode" value="<%= userCode %>">
                    <label for="artistName">활동 명 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="artistName" placeholder="활동명 or 팀명을 입력해주세요." size="30"><br><br>
                    <label for="">인원 수 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="number"><br><br>
                    <label for="">데뷔일 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="debutDate"><br><br>
                    <label for="">장르 </label><br>
                    <input type="checkbox" name="genre" value="발라드" id="ballad"><label for="ballad">발라드</label>
                    <input type="checkbox" name="genre" value="댄스" id="dance"><label for="dance">댄스</label>
                    <input type="checkbox" name="genre" value="힙합" id="hiphop"><label for="hiphop">랩/힙합</label><br>
                    <input type="checkbox" name="genre" value="팝" id="pop"><label for="pop">POP</label>
                    <input type="checkbox" name="genre" value="락" id="rock"><label for="rock">ROCK</label>
                    <input type="checkbox" name="genre" value="트로트" id="trot"><label for="trot">트로트</label>
                    <input type="checkbox" name="genre" value="기타" id="etc"><label for="etc">기타</label><br><br>
                    <label for="">유형 </label><br>
                    <input type="radio" name="artistGender" value="남성" id="male"><label for="male">남성</label>
                    <input type="radio" name="artistGender" value="여성" id="female"><label for="female">여성</label>
                    <input type="radio" name="artistGender" value="혼성" id="mixed"><label for="mixed">혼성</label><br>
                    <input type="radio" name="artistCategory" value="솔로" id="solo"><label for="solo">솔로</label>
                    <input type="radio" name="artistCategory" value="그룹" id="group"><label for="group">그룹</label><br><br>                
                    
                    <!-- <label for="">활동지역</label><br>
                    <input type="radio" name="activeLocal" value="서울" id="seoul"><label for="seoul">서울</label>
                    <input type="radio" name="activeLocal" value="경기도" id="Gyeonggi"><label for="Gyeonggi">경기도</label>
                    <input type="radio" name="activeLocal" value="경상도" id="Gyeongsang"><label for="Gyeongsang">경상도</label>
                    <input type="radio" name="activeLocal" value="강원도" id="Gangwon"><label for="Gangwon">강원도</label>
                    <input type="radio" name="activeLocal" value="전라도" id="Jeolla"><label for="Jeolla">전라도</label>
                    <input type="radio" name="activeLocal" value="충청도" id="Chungcheong"><label for="Chungcheong">충청도</label>
                    <input type="radio" name="activeLocal" value="제주도" id="Jeju"><label for="Jeju">제주도</label><br><br> -->
                    
                    
                    <label for="">한 줄 소개</label><br>
                    <textarea name="introduce" id="" cols="100" rows="3" placeholder="아티스트 리스트에 들어갈 한 줄 소개를 적어주세요." style="resize: none;"></textarea><br><br>

                    <label for="">아티스트 소개</label><br>
                    <textarea name="artistInfo" id="" cols="100" rows="10" placeholder="내용을 입력해주세요." style="resize: none;"></textarea><br><br>
                            
                    <label for="">활동 이력</label><br>
                    <textarea name="activity" id="" cols="100" rows="5" placeholder="활동이력을 간단히 적어주세요." style="resize: none;"></textarea><br><br>

                    <label for="">아티스트 이미지 첨부 </label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="imageFile" accept="image/jpeg, image/png, image/jpg"/><br><br>
                    <label for="">아티스트 동영상 링크 주소 </label>&nbsp;&nbsp;<input type="text" name="videoLink" placeholder="동영상 링크 주소를 입력해주세요." size="70"><br><br>
                    <label for="">인스타그램 주소 </label>&nbsp;&nbsp;&nbsp;<input type="url" name="instaURL" placeholder="인스타 주소를 입력해주세요." size="70"><br><br>
                    <label for="">트위터 주소 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="url" name="twitterURL" placeholder="트위터 주소를 입력해주세요." size="70"><br><br>
                    <label for="">페이스북 주소 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="url" name="facebookURL" placeholder="페이스북 주소를 입력해주세요." size="70"><br><br>
                    <br>
                    <input type="submit" value="등록하기" class="artistReg_btn" style="margin-left: 300px;">
                    <input type="button" value="취소하기" class="artistReg_btn" onclick="location.href='<%= request.getContextPath() %>/views/member/MypageMainView.jsp'">
                </form>      
            </div>
        </div> 
        
        
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>
    
	<%@ include file="../common/footer.jsp" %>
</body>
</html>