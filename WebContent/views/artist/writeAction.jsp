<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="community.CommunityDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="community" class="community.Community" scope="page" />
<jsp:setProperty property="CM_TITLE" name="community"/>
<jsp:setProperty property="CM_CONTENT" name="community"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소통게시판 작성</title>
</head>
<body>
	<%
		String USER_CODE = null;
		if (session.getAttribute("USER_CODE") != null){
			USER_CODE = (String) session.getAttribute("USER_CODE");
		}
		if (USER_CODE == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			if (community.getCM_TITLE() == null || community.getCM_CONTENT() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else{
				CommunityDAO communityDAO = new CommunityDAO();
				int result = communityDAO.ArtistBoardWrite(USER_CODE, community.getCM_TITLE(), community.getCM_CONTENT());
				if (result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("loaction.href = 'views.artist.ArtistCommunity.jsp'");
					script.println("</script>");
				}
			}
		}
		
	%>
</body>
</html>