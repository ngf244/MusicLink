<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, artist.model.vo.Artist"%>
<%
	Member member = (Member)request.getAttribute("member");
	Artist artist = (Artist)request.getAttribute("artist");
	String atFileName = (String)session.getAttribute("atFileName");

	System.out.println(atFileName);
	
	String userCode = member.getUserCode();
	String userId = member.getUserId();
	String userName = member.getUserName();
	String userBirth = member.getUserBirth();
	String userGender = member.getUserGender();
	String userEmail = member.getUserEmail();
	String userPhone = member.getUserPhone();
	String userClass = member.getUserClass();
		
	String division = "";
	
	switch(userClass) {
	case "1": division = "일반회원"; break;
	case "2": division = "아티스트"; break;
	case "3": division = "기획자"; break;
	}
	
	String imgPath = "";
	
	switch(userGender) {
	case "남자": imgPath = "img/default_profile_male.png"; break;
	case "여자": imgPath = "img/default_profile_female.png"; break;
	}
	
	if(userClass.equals("2")) {
		//imgPath = artist.getAtPicPath().substring(39);
		//System.out.println(imgPath);
		imgPath = "artistProfile_uploadFiles/" + atFileName;  
	}
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<script src="../../js/jquery-3.4.1.min.js"></script>
<title>마이페이지</title>
<style>
    
    
    /* 섹션 */
    .section-txt{font-size:60px; width:45%; margin:0 auto; font-weight: bold; color:#fff; text-shadow: 1px 1px 15px #ccc;
                    position: absolute; bottom:-25%; left:28%;}
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:1100px; padding-top: 30px;} 
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top: 31%; left:34%; color: rgb(224, 224, 224);} 
    
    
    /* 사이드 메뉴 */
    .sec-line{width:4%; height:5px; background: yellow; margin:0; padding:0; margin-left:5%; margin-top:2%;}
    .sec-mtxt{margin-left:5%; margin-top: -15px;}
    .sec-mtxt > p{ display: inline-block; font-size:20px;}
    .sec-nav{width:22%; height:85%; border-right: 1px solid rgba(0,0,0,0.4); box-sizing: border-box; float:left;}
    .smenu{color:#ccc; font-size: 30px; margin:0; margin-top:20px;}
    .s-smenu{font-size:14px;margin-top:20px; color:#000;}
    .s-smenu > li{padding:5px 10px;}    
    
    /* 마이페이지 메인 */
    .sec-menu-views{width:78%; height:90%; padding:10px; float:left; border:1px solid rgba(255,255,255,0); box-sizing: border-box;}
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif; font-size: 14pt;}


    .userInfo{margin-left: 10%; width: 80%; border-bottom: solid 1px rgb(189, 189, 189); padding-bottom: 3%;}
    .profileBox {
        margin-left: 5%;
        width: 200px;
        height: 200px; 
        border-radius: 70%;
        overflow: hidden;
        display: inline-block;
    }
    .profile {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .profileInfo{display: inline-block; margin-left: 10%; line-height: 20px;}
    
    .listArea{line-height: 30px;}
    .postInfo{line-height: 30px; margin-left: 10%; width: 75%; padding-left: 5%; border-bottom: solid 1px rgb(189, 189, 189); padding-bottom: 3%;}
    .write{width: 45%; display: inline-block;}
    .comment{width: 45%; display: inline-block;}
    .write a {display: inline-block;}
    .comment a {display: inline-block;}
    .followView{width: 100%; height: 40%; margin-left: 10%;}
    
    .followingAT{width:100%; padding-left:0; margin:0; margin-top:16px; background:rgba(0,0,0,0.3); font-weight: bold; color:#fff;}
    .follow-nav{width:18%; height: 35px; vertical-align: middle; line-height: 35px; display: inline-block; text-align: center; padding:10px 0; }
    .padding-1{padding:5px 0; color:#000; border-bottom: 0.5px dashed lightgray;}
    .follow-sum{width:18%; height: 30px; vertical-align: middle; line-height: 30px; display: inline-block; margin:0; padding: 0; text-align: center;}
    .btn1{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: #7780b7; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;    
    }
    .selectBtn{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: lightgray; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;    
    }    

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    
   
    <section style="z-index: 1;">
        <div class="sec-line"></div>
        <h1 class="sec-mtxt">MyPage<p>-Main</p></h1>
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
                    <li onclick="becomeAT();">아티스트 등록</li>
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
           
            <div class="userInfo">
                <div class="profileBox" style="background: #e8c8ac;">
                    <img class="profile" src="<%= imgPath%>">
                </div>
                <div class="profileInfo">
                    <h4 style="display: inline-block;"><%= userName %>님</h4>&nbsp;&nbsp;
                    <button onclick="location.href='views/member/PwdCheckForm.jsp'" class="btn1">정보 수정</button>
                    <ul class="listArea">
                        <li>회원구분 - <%= division %> </li>
                        <li>전화번호 -  <%= userPhone %> </li>
                        <li>이메일 -  <%= userEmail %> </li>
                        <li>생년월일 -  <%= userBirth %> </li>
                    </ul>
                    <% if(division.equals("일반회원")){ %>
                    <p>회원님은 일반회원입니다. 행사 등록 및 행사 지원을 하기 위해서는 <br>
                        아티스트 등록, 행사기획자 등록 메뉴를 이용해주세요.
                    </p>
                    <% } else if(division.equals("아티스트")){ %>
                    <p>회원님은 아티스트입니다. 행사 지원을 할 수 있고 기획자로부터 <br>
                    러브콜을 받을 수 있습니다.                     
                    </p>
                    <% } else if(division.equals("기획자")){ %>
                    <p>회원님은 행사 기획자입니다. 행사를 등록하여 아티스트를 모집할 수 있습니다.<br>
                    또한 섭외하길 원하는 아티스트에게 러브콜을 보낼 수 있습니다.
                    </p>
                    <% } %>
                </div>
                                          
            </div>
            
            <div class="postInfo">
                <div class="write">
                    <ul><b>내가 작성한 글</b></ul>
                        <li><a href="">01.17 공연 행사 사진들</a></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>                            
                </div>
                <div class="comment">
                    <ul><b>내가 작성한 댓글</b></ul>
                        <li><a href="">멋져요!!!</a></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                </div>
            </div>

            <div class="followView">
              	<div class="sec-menu-views views2">
		            <h4>팔로잉 아티스트</h4>
		            <ul class="followingAT">
		                <li class="follow-nav">선택</li>
		                <li class="follow-nav">아티스트명</li>
		                <li class="follow-nav">장르</li>
		                <li class="follow-nav">유형</li>
		                <li class="follow-nav">상태</li>
		            </ul>
		            <div class="padding-1">
		                <div class="follow-time follow-sum"><input type="checkbox" name="select"></div>
		                <div class="artistName follow-sum">아티스트명1</div>
		                <div class="Genre follow-sum">DANCE</div>
		                <div class="local follow-sum">남성(솔로)</div>
		                <div class="followYN follow-sum">팔로우</div>
		            </div>
		            <div class="padding-1">
		                <div class="follow-time follow-sum"><input type="checkbox" name="select"></div>
		                <div class="followYN follow-sum">아티스트명2</div>
		                <div class="Genre follow-sum">HIPHOP</div>
		                <div class="local follow-sum">여성(솔로)</div>
		                <div class="followYN follow-sum">팔로우</div>
		            </div>
		            <div class="padding-1">
		                <div class="follow-time follow-sum"><input type="checkbox" name="select"></div>
		                <div class="followYN follow-sum">아티스트명3</div>
		                <div class="Genre follow-sum">TROT</div>
		                <div class="local follow-sum">여성(그룹)</div>
		                <div class="followYN follow-sum">팔로우</div>
                    </div>
                    <br>
                    <div class="selectArea" style="float: right;">
                        <button class="selectBtn" id="all" onclick="selectAll();">전체선택</button>
                        <button class="selectBtn" id="clear" onclick="clearAll();">전체해제</button>
                        <button class="selectBtn" id="delete" onclick="delete();">삭제</button>
                    </div>
                    <div style="clear: both;"></div>
	       		</div>
                
            </div>

        </div>
        <script>
        	function selectAll(){
        		$('[name=select]').prop('checked', true);
        	}
        	
        	function clearAll(){
        		$('[name=select]').prop('checked', false);
        	}
        	
        	function becomeAT(){
        		location.href="views/artist/BecomeArtistForm.jsp";
        	}
        	
        </script>
        

        
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>
    
	<%@ include file="../common/footer.jsp" %>    

</body>
</html>