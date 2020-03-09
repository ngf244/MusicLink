<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="community.CommunityDAO" %>
<%@ page import="community.Community" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>소통 게시판 작성</title>
</head>
<body>
    <%
    	String userCode = null;
    	if (session.getAttribute("userCode") != null){
    		userCode = (String) session.getAttribute("userCode");
    	}
    	if (userCode != null){
    		PrintWriter script = response.getWriter();
    		script.println("<script>");
    		script.println("alert('로그인을 하세요.')");
    		script.println("history.back()");
    		script.println("/<script>");
    	}
    	int cmCode = 0;
 	  	if(request.getParameter("cmCode") != null){
 			cmCode = Integer.parseInt(request.getParameter("cmCode"));
 		}
 		if (cmCode == 0){
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('유효하지 않은 글입니다.')");
 			script.println("history.back()");
 			script.println("/<script>");
 		}
 		Community community = new CommunityDAO().getCommunity(cmCode);
 		if(!userCode.equals(community.getUserCode())){
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('권한이 없습니다.')");
 			script.println("history.back()");
 			script.println("/<script>");
 		}else {
    			CommunityDAO communityDAO = new CommunityDAO();
    			int result = communityDAO.cmdelete(cmCode);
    			if (result == -1) {
    	    		PrintWriter script = response.getWriter();
    	    		script.println("<script>");
    	    		script.println("alert('글삭제에 실패하였습니다.')");
    	    		script.println("history.back()");
    	    		script.println("/<script>");
    	    	}
    			else {
    				PrintWriter script = response.getWriter();
    	    		script.println("<script>");
    	    		script.println("location.href = 'ArtistCommunity.jsp'");
    	    		script.println("/<script>");
    		}
    	}
    %>
</body>
</html>