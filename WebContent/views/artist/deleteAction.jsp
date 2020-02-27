<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="community.CommunityDAO" %>
<%@ page import="community.Community" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
		} 
		int CM_CODE = 0;
		if (request.getParameter("CM_CODE") != null){
			CM_CODE = Integer.parseInt(request.getParameter("CM_CODE"));
		}
		if (CM_CODE == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
		Community community = new CommunityDAO().geCommunity(CM_CODE);
		if (!USER_CODE.equals(community.getCM_CODE())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
				CommunityDAO communityDAO = new CommunityDAO();
				int result = communityDAO.delete(CM_CODE);
				if (result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제에 실패했습니다.')");
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
		
	%>
</body>
</html>