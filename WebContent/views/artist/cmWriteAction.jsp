<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="community.CommunityDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="community" class="community.Community" scope="page" />
<jsp:setProperty name="community" property="cmTitle"/> 
<jsp:setProperty name="community" property="cmContent"/>
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
    	} else {
    		if (community.getCmTitle() == null || community.getCmContent() == null){
    			PrintWriter script = response.getWriter();
    			script.println("<script>");
        		script.println("alert('입력된 사항이 없습니다.')");
        		script.println("history.back()");
        		script.println("/<script>");
    		} else {
    			CommunityDAO communityDAO = new CommunityDAO();
    			int result = communityDAO.ArtistBoardWrite(community.getCmTitle(), community.getCmContent(), community.getUserCode());
    			if (result == -1) {
    	    		PrintWriter script = response.getWriter();
    	    		script.println("<script>");
    	    		script.println("alert('글쓰기에 실패하였습니다.')");
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
    	}
    %>
</body>
</html>