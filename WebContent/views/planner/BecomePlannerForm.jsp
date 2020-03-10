<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<title>행사기획자 등록</title>
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
    

    /* 행사기획자 등록 */
    .sec-menu-views{width:78%; height:90%; padding:10px; float:left; border:1px solid rgba(255,255,255,0); box-sizing: border-box;}
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif; font-size: 14pt;}   
    .become-planner{line-height: 45px; margin-left: 20%; padding-left: 10%; padding-top: 3%; width: 48%; height: 30%; border: 1px solid gray;}
    .views1 h3{background: #af9ce6;}
    .companyReg td{width: 150px;}
	.plannerReg_btn{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: #7780b7; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;
	}    

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <%
	/* Member loginUser = (Member)session.getAttribute("loginUser"); */
	String userCode = loginUser.getUserCode();
	%>
    <section style="z-index: 1;">
	<%@ include file="../common/MyPage_Menubar.jsp" %>
        
        <div class="sec-menu-views views1">
            <h3>행사기획자 등록</h3>
            <div class="become-planner">
                <form action="<%= request.getContextPath() %>/insert.pn">
                    <table class="companyReg">
                        <tr>
                            <td>회사 명<input type="hidden" name="userCode" value="<%= userCode %>"></td>
                            <td><input type="text" name="companyName"></td>
                        </tr>
                        <tr>
                            <td>회사 주소</td>
                            <td><input type="text" name="companyAddress"></td>
                        </tr>
                        <tr>
                            <td>회사 전화번호</td>
                            <td><input type="tel" name="companyPhone"></td>
                        </tr>
                        
                    </table>
                    <br>
                    <input type="submit" class="plannerReg_btn" value="등록하기" style="margin-left: 24%;">
                    <input type="button" class="plannerReg_btn" value="취소하기" onclick="">
                </form>                           
                        
            </div>            
        </div>
        
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>
    
	<%@ include file="../common/footer.jsp" %>  
</body>
</html>