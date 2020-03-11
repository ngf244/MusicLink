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
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif; font-size: 14pt;}
    .userInfoFrm{border: 1px solid gray; margin-left: 15%; padding-left: 10%; padding-top: 3%; width: 60%; line-height: 30px;}
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
	<%@ include file="../common/menubar.jsp" %>   
    <%
	/* Member loginUser = (Member)session.getAttribute("loginUser"); */
	String userId = loginUser.getUserId();
	String userPwd = loginUser.getUserPwd();
	String userName = loginUser.getUserName();
	String userBirth = loginUser.getUserBirth();
	String gender = loginUser.getUserGender();
	String userEmail = loginUser.getUserEmail();
	String userPhone = loginUser.getUserPhone();
	
	String[] checked = new String[2];
	if(gender.equals("남자")){
		checked[0] = "checked";
		checked[1] = "";
	} else{
		checked[0] = "";
		checked[1] = "checked";
	}
%>
    <section style="z-index: 1;">
    <%@ include file="../common/MyPage_Menubar.jsp" %>        
        
        <div class="sec-menu-views views1">
            <h3>회원 정보</h3>
            <br>
            <div class="userInfoFrm">
                <form action="<%= request.getContextPath() %>/update.me" method="post" id="updateForm" name="updateForm">
                    <table>
                        <tr>
                            <td>아이디</td>
                            <td><input type="text" name="userId" value="<%= userId %>" readonly></td>
                        </tr>
                        <tr>
                            <td>새 비밀번호<input type="hidden" name="userPwd" value="<%= userPwd %>"></td>
                            <td><input type="password" name="newPwd" id="newPwd" class="pwd"></td>
                        </tr>
                        <tr>
                            <td>새 비밀번호 확인</td>
                            <td><input type="password" name="newPwd2" id="newPwd2" class="pwd"></td>
                        </tr>
                        <tr>
                        	<td height="10" colspan="2"><font id="chkNotice" size="4" style="padding-left: 200px;"></font></td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td><input type="text" name="userName" value="<%= userName %>"></td>
                        </tr>
                        <tr>
                            <td>생년월일</td>
                            <td><input type="text" name="userBirth" value="<%= userBirth %>"></td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td>
                                <input type="radio" id="male" name="gender" value="남자" <%= checked[0] %>><label for="male">남자</label>
                                <input type="radio" id="female" name="gender" value="여자" <%= checked[1] %>><label for="female">여자</label>
                            </td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td><input type="email" name="userEmail" value="<%= userEmail %>"></td>
                        </tr>
                        <tr>
                            <td>전화번호</td>
                            <td><input type="text" name="userPhone" value="<%= userPhone %>"></td>
                        </tr>
						

                    </table>

                    <br>

                    <div class="btnArea">
                        <button type="submit" class="btn">수정</button>
                        <button type="button" class="btn" onclick="deleteMember();">탈퇴</button>
                        <button type="button" class="btn" onclick="history.back(-1)">취소</button>
                        <br><br>
                    </div>
                </form>
            </div>
	<script>
		function deleteMember(){
			var bool = confirm("정말로 삭제하시겠습니까?");
			if(bool){
				$('#myInfoForm').attr('action', '<%= request.getContextPath() %>/delete.me');
				$('#myInfoForm').submit();
			}
		}
		
		$(function(){
		    $('#newPwd').keyup(function(){
		      $('#chkNotice').html('');
		    });

		    $('#newPwd2').keyup(function(){

		        if($('#newPwd').val() != $('#newPwd2').val()){
		          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
		          $('#chkNotice').attr('color', '#f82a2aa3');
		        } else{
		          $('#chkNotice').html('비밀번호 일치함<br><br>');
		          $('#chkNotice').attr('color', '#199894b3');
		        }

		    });
		});
	</script>
            
            
        </div>
        
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>
    
	<%@ include file="../common/footer.jsp" %>    

</body>
</html>