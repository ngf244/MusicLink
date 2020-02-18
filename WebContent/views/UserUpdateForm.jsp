<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

	<script src="../js/jquery-3.4.1.min.js"></script>
	
<title>회원 정보 수정</title>
<style>
    
    
    /* 섹션 */
    .section-txt{font-size:60px; width:45%; margin:0 auto; font-weight: bold; color:#fff; text-shadow: 1px 1px 15px #ccc;
                    position: absolute; bottom:-25%; left:28%;}
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:1000px; padding-top: 30px;} 
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top: 31%; left:34%; color: rgb(224, 224, 224);} 
    
    
    /* 사이드 메뉴 */
    .sec-line{width:4%; height:5px; background: yellow; margin:0; padding:0; margin-left:5%; margin-top:2%;}
    .sec-mtxt{margin-left:5%; margin-top: -15px;}
    .sec-mtxt > p{ display: inline-block; font-size:20px;}
    .sec-nav{width:22%; height:85%; border-right: 1px solid rgba(0,0,0,0.4); box-sizing: border-box; float:left;}
    .smenu{color:#ccc; font-size: 30px; margin:0; margin-top:20px;}
    .s-smenu{font-size:14px;margin-top:20px; color:#000;}
    .s-smenu > li{padding:5px 10px;}    
    
    /* 회원정보 */
    .sec-menu-views{width:78%; height:90%; padding:10px; float:left; border:1px solid rgba(255,255,255,0); box-sizing: border-box;}
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif;}
    .userInfoFrm{border: 1px solid gray; margin-left: 15%; padding-left: 10%; padding-top: 3%; width: 55%; line-height: 30px;}
    .userInfoFrm td {width: 200px;}
    .btnArea{margin-left: 23%;}
    .views1 h3{background: #af9ce6;}
    .btn{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: #7780b7; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;    	
    }



</style>
</head>
<body>
	<%@ include file="common/menubar.jsp" %>   
    
    <section style="z-index: 1;">
        <div class="sec-line"></div>
        <h1 class="sec-mtxt">MyPage<p>-user info</p></h1>
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
            <h3>회원 정보</h3>
            <br>
            <div class="userInfoFrm">
                <form action="">
                    <table>
                        <tr>
                            <td>아이디</td>
                            <td><input type="text" readonly></td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td><input type="password"></td>
                        </tr>
                        <tr>
                            <td>비밀번호 재확인</td>
                            <td><input type="password"></td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td><input type="text"></td>
                        </tr>
                        <tr>
                            <td>생년월일</td>
                            <td><input type="date"></td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td>
                                <input type="radio" name="gender" value="male"><label for="">남자</label>
                                <input type="radio" name="gender" value="female"><label for="">여자</label>
                            </td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td><input type="email"></td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td><input type="tel"></td>
                        </tr>

                    </table>
                    
                    <br>

                    <div class="btnArea">
                        <button type="submit" class="btn">수정</button>
                        <button type="button" class="btn">탈퇴</button>
                        <button type="reset" class="btn">취소</button>
                        <br><br>
                    </div>
                </form>
            </div>

            
            
        </div>
        
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>
    
	<%@ include file="common/footer.jsp" %>    

</body>
</html>