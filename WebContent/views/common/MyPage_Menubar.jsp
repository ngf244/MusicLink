<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<%
	Member loginUserConfirm = (Member)session.getAttribute("loginUser");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/mypage_menu.css" />
<title>Insert title here</title>
<style>
	.sec-nav>li>ul{font-size: 12pt; font-family: 'Noto Sans KR', sans-serif;}
	.sec-mtxt:hover{cursor: pointer;}
</style>
</head>
<body>
        <div class="sec-line"></div>
        <h1 class="sec-mtxt" onclick="myPage();">MyPage<p>-Main</p></h1>
        <ul class="sec-nav">
            <li class="sec-menu-1 smenu">INFORMATION
                <ul class="s-smenu">
                    <li onclick="pwdCheck();"><a href="#">회원정보 열람/수정/탈퇴</a></li>
                    <li onclick="MyPost()"><a href="#">내가 작성한 글</a></li>
                    <li onclick="noticeHistory();"><a href="#">알림내역</a></li>
                </ul>
            </li>
            <li class="sec-menu-2 smenu">FOLLOW
                <uL class="s-smenu">
                    <li onclick="MyArtist();"><a href="#">나의 아티스트</a></li>
                    <li onclick="MyAtSchedule()"><a href="#">팔로잉 아티스트의 행사</a></li>
                </uL>
            </li>
            <% if(loginUserConfirm.getUserClass().equals("1")){ %>
            <li class="sec-menu-3 smenu">BECOME
                <ul class="s-smenu">
                    <li onclick="becomeAT();"><a href="#">아티스트 등록</a></li>
                    <li onclick="becomePL();"><a href="#">행사기획자 등록</a></li>
                </ul>
            </li>
            <% } else if(loginUserConfirm.getUserClass().equals("2")){ %>
            <li class="sec-menu-4 smenu">FESTIVAL
                <ul class="s-smenu">
                    <li><a href="#">공연스케줄</a></li>
                    <li><a href="#">지원한 행사</a></li>
                    <li><a href="#">러브콜(receive)</a></li>
                    <li><a href="#">행사 후기</a></li>
                </ul>
            </li>
            <% } else if(loginUserConfirm.getUserClass().equals("3")){ %>
            <li class="sec-menu-5 smenu">FESTIVAL
                <ul class="s-smenu">
                    <li><a href="<%= request.getContextPath() %>/register.me">등록한 행사</a></li>
                    <li><a href="" target="_self">러브콜(send)</a></li>
                    <li><a href="" target="_self">아티스트 후기</a></li>
                </ul>
            </li>
            <% } %>
        </ul>   
        	
<script>
	function myPage(){
		location.href="<%= request.getContextPath() %>/myPage.me";
	}

	function becomeAT(){
		location.href="<%= request.getContextPath() %>/views/artist/BecomeArtistForm.jsp";
	}
	
	function becomePL(){
		location.href="<%= request.getContextPath() %>/views/planner/BecomePlannerForm.jsp";
	}
	
	function MyArtist(){
		location.href="<%= request.getContextPath() %>/list.fat";
	}
	
	function pwdCheck(){
		location.href="<%= request.getContextPath() %>/views/member/PwdCheckForm.jsp";
	}
	
	function noticeHistory(){
		location.href="<%= request.getContextPath() %>/list.no";
	}
	
	function MyAtSchedule(){
		location.href="<%= request.getContextPath() %>/list.fatf";
	}
	
	function MyPost(){
		location.href="<%= request.getContextPath() %>/list.mPost";
	}
</script>    
    
</body>
</html>