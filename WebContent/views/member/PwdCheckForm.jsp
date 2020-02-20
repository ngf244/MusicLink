<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
 

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<script src="../../js/jquery-3.4.1.min.js"></script>	

<title>비밀번호 재확인</title>
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
    
    /* 비밀번호 재확인 */
    .sec-menu-views{width:78%; height:90%; padding:10px; float:left; border:1px solid rgba(255,255,255,0); box-sizing: border-box;}
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif; font-size: 14pt;}
    .frm{margin-left: 20%; padding-left: 5%; width: 55%; height: 30%; border: 1px solid gray; padding-bottom: 2%;}
    .submit{margin-left: 35%;}
    .idPwdFind{margin-left: 33%; margin-top: 5%;}
    .frm p {width: 85%; height: 10%; line-height: 20px; padding-left:3%; margin:0; margin-top:16px; background:#af9ce6; font-weight: bold; color:#fff;}
    .idPwdFind a{font-size: small;}
    .ConfirmFrm{margin-left: 15%;}
    .btn{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: #7780b7; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;   
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>    
    <%
	/* Member loginUser = (Member)session.getAttribute("loginUser"); */
	String userId = loginUser.getUserId();
	String userPwd = loginUser.getUserPwd();
	%>   
    <section style="z-index: 1;">
    <%@ include file="../common/MyPage_Menubar.jsp" %>        
        
        <div class="sec-menu-views views1">
            <h3 class="confirmtext">비밀번호 재확인</h3>
            <br><br>
            <div class="frm">
                <br>
                <p style="text-decoration: underline;">안전한 MusicLink 사용을 위하여 비밀번호를 다시 한번 확인해주세요.</p>
                <br>
                <br>
                <form action='memberUpdateForm.jsp' method="post" > 
                    <table class="ConfirmFrm">
                        <tr>
                            <td><label>아이디</label></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userId" id="userId" value="<%= userId %>" readonly></td>
                        </tr>

                        <tr>
                            <td><label>비밀번호</label></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="userPwd" id="userPwd" required></td>
                        </tr>
                    </table>
                    <br>
                    <br>
                    <div class="submit">
                        <input type="submit" class="btn" value="확인" onclick="pwdCheck();">
                        <input type="reset" class="btn" value="취소">
                    </div>
                    <div class="idPwdFind"> 
                        <a href="FindIdPwd.jsp" target="_blank" style="display: inline-block;">아이디 찾기</a>&nbsp;&nbsp;<a href="FindIdPwd.jsp" target="_blank" style="display: inline-block;">비밀번호 찾기</a>
                    </div> 

                </form>
            </div>
            <script>
            	function pwdCheck(){
            		if($('#userPwd').val() == <%= userPwd %>){
                		console.log("일치함");
                	}	
            	}
            
            	
            </script>
        </div>
        
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>
    
	<%@ include file="../common/footer.jsp" %>    

</body>
</html>