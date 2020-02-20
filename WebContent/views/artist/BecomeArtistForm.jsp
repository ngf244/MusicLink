<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>    

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
    .section-txt{font-size:60px; width:45%; margin:0 auto; font-weight: bold; color:#fff; text-shadow: 1px 1px 15px #ccc;
                    position: absolute; bottom:-25%; left:28%;}
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:1600px; padding-top: 30px;} 
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top: 31%; left:34%; color: rgb(224, 224, 224);} 
    
    
    /* 사이드 메뉴 */
    .sec-line{width:4%; height:5px; background: yellow; margin:0; padding:0; margin-left:5%; margin-top:2%;}
    .sec-mtxt{margin-left:5%; margin-top: -15px;}
    .sec-mtxt > p{ display: inline-block; font-size:20px;}
    .sec-nav{width:22%; height:85%; border-right: 1px solid rgba(0,0,0,0.4); box-sizing: border-box; float:left;}
    .smenu{color:#ccc; font-size: 30px; margin:0; margin-top:20px;}
    .s-smenu{font-size:14px;margin-top:20px; color:#000;}
    .s-smenu > li{padding:5px 10px;}    
    
    /* 아티스트 등록 */
    .sec-menu-views{width:78%; height:90%; padding:10px; float:left; border:1px solid rgba(255,255,255,0); box-sizing: border-box;}
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif;}  
    .become-artist{margin-left: 8%; padding-left: 5%; line-height: 30px;}
    .views1 h3{background: #af9ce6;}
	.artistReg_btn{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: #7780b7; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;
	}


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    
    <section style="z-index: 1;">
        <div class="sec-line"></div>
        <h1 class="sec-mtxt">MyPage<p>-become artist</p></h1>
        <ul class="sec-nav">
            <li class="sec-menu-1 smenu">INFORMATION
                <ul class="s-smenu">
                    <li><a href='PwdCheckForm.jsp'>회원정보 열람/수정/탈퇴</a></li>
                    <li><a href='MyPostView.jsp'>내가 작성한 글/댓글</a></li>
                    <li><a href='MypageNoticeView.jsp'>알람창</a></li>
                </ul>
            </li>
            <li class="sec-menu-2 smenu">FOLLOW
                <uL class="s-smenu">
                    <li><a href='MyArtistView.jsp'>나의 아티스트</a></li>
                    <li><a href='MyArtistSchedule.jsp'>팔로잉 아티스트의 행사</a></li>
                </uL>
            </li>
            <li class="sec-menu-3 smenu">BECOME
                <ul class="s-smenu">
                    <li><a href='BecomeArtistForm.jsp'>아티스트 등록</a></li>
                    <li><a href='BecomePlannerForm.jsp'>행사기획자 등록</a></li>
                </ul>
            </li>
            <li class="sec-menu-4 smenu">EVENT-1
                <ul class="s-smenu">
                    <li>공연스케줄</li>
                    <li>지원한 행사</li>
                    <li>러브콜(receive)</li>
                    <li>행사 후기</li>
                </ul>
            </li>
            <li class="sec-menu-5 smenu">EVENT-2
                <ul class="s-smenu">
                    <li>등록한 행사</li>
                    <li>러브콜(send)</li>
                    <li>아티스트 후기</li>
                </ul>
            </li>
        </ul>

        <div class="sec-menu-views views1">
            <h3>아티스트 등록</h3>
            <br>
            <div class="become-artist">
                <form action="<%= request.getContextPath() %>/insert.at" method="post" encType="multipart/form-data">
                    <label for="artistName">활동 명 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="artistName" placeholder="활동명 or 팀명을 입력해주세요." size="30"><br><br>
                    <label for="">인원 수 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" name="number"><br><br>
                    <label for="">데뷔일 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" name="debutDate"><br><br>
                    <label for="">장르 </label><br>
                    <input type="checkbox" name="genre" value="발라드" id="ballad"><label for="ballad">발라드</label>
                    <input type="checkbox" name="genre" value="댄스" id="dance"><label for="dance">댄스</label>
                    <input type="checkbox" name="genre" value="힙합" id="hiphop"><label for="hiphop">랩/힙합</label><br>
                    <input type="checkbox" name="genre" value="팝" id="pop"><label for="pop">POP</label>
                    <input type="checkbox" name="genre" value="락" id="rock"><label for="rock">ROCK</label>
                    <input type="checkbox" name="genre" value="기타" id="etc"><label for="etc">기타</label><br><br>
                    <label for="">유형 </label><br>
                    <input type="radio" name="artistGender" value="남성" id="male"><label for="male">남성</label>
                    <input type="radio" name="artistGender" value="여성" id="female"><label for="female">여성</label>
                    <input type="radio" name="artistGender" value="혼성" id="mixed"><label for="mixed">혼성</label><br>
                    <input type="radio" name="artistCategory" value="솔로" id="solo"><label for="solo">솔로</label>
                    <input type="radio" name="artistCategory" value="그룹" id="group"><label for="group">그룹</label><br><br>                
                    
                    <label for="">활동지역</label><br>
                    <input type="radio" name="activeLocal" value="서울" id="seoul"><label for="seoul">서울</label>
                    <input type="radio" name="activeLocal" value="경기도" id="Gyeonggi"><label for="Gyeonggi">경기도</label>
                    <input type="radio" name="activeLocal" value="경상도" id="Gyeongsang"><label for="Gyeongsang">경상도</label>
                    <input type="radio" name="activeLocal" value="강원도" id="Gangwon"><label for="Gangwon">강원도</label>
                    <input type="radio" name="activeLocal" value="전라도" id="Jeolla"><label for="Jeolla">전라도</label>
                    <input type="radio" name="activeLocal" value="충청도" id="Chungcheong"><label for="Chungcheong">충청도</label>
                    <input type="radio" name="activeLocal" value="제주도" id="Jeju"><label for="Jeju">제주도</label><br><br>
                    
                    
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