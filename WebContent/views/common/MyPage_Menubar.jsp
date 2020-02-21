<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/mypage_menu.css" />
<title>Insert title here</title>
</head>
<body>
        <div class="sec-line"></div>
        <h1 class="sec-mtxt">MyPage<p>-Main</p></h1>
        <ul class="sec-nav">
            <li class="sec-menu-1 smenu">INFORMATION
                <ul class="s-smenu">
                    <li><a href="#">회원정보 열람/수정/탈퇴</a></li>
                    <li><a href="#">내가 작성한 글/댓글</a></li>
                    <li><a href="#">알람창</a></li>
                </ul>
            </li>
            <li class="sec-menu-2 smenu">FLOOW
                <uL class="s-smenu">
                    <li onclick="MyArtist();"><a href="#">나의 아티스트</a></li>
                    <li><a href="#">팔로잉 아티스트의 행사</a></li>
                </uL>
            </li>
            <li class="sec-menu-3 smenu">BECOME
                <ul class="s-smenu">
                    <li onclick="becomeAT();"><a href="#">아티스트 등록</a></li>
                    <li><a href="#">행사기획자 등록</a></li>
                </ul>
            </li>
            <li class="sec-menu-4 smenu">EVENT-1
                <ul class="s-smenu">
                    <li><a href="#">공연스케줄</a></li>
                    <li><a href="#">지원한 행사</a></li>
                    <li><a href="#">러브콜(receive)</a></li>
                    <li><a href="#">행사 후기</a></li>
                </ul>
            </li>
            <li class="sec-menu-5 smenu">EVENT-2
                <ul class="s-smenu">
                    <li><a href="#">등록한 행사</a></li>
                    <li><a href="" target="_self">러브콜(send)</a></li>
                    <li><a href="" target="_self">아티스트 후기</a></li>
                </ul>
            </li>
        </ul>   
        	
<script>
	function becomeAT(){
		location.href="views/artist/BecomeArtistForm.jsp";
	}
	
	function MyArtist(){
		location.href="<%= request.getContextPath() %>/list.fat";
	}
</script>    
    
</body>
</html>