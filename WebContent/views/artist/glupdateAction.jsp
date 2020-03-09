<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="argallery.GalleryDAO2" %>
<%@ page import="argallery.Gallery2" %>
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
    	int glCode = 0;
 	  	if(request.getParameter("glCode") != null){
 			glCode = Integer.parseInt(request.getParameter("glCode"));
 		}
 		if (glCode == 0){
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('유효하지 않은 글입니다.')");
 			script.println("history.back()");
 			script.println("/<script>");
 		}
 		Gallery2 gallery = new GalleryDAO2().getGallery(glCode);
 		if(!userCode.equals(gallery.getUserCode())){
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('권한이 없습니다.')");
 			script.println("history.back()");
 			script.println("/<script>");
 		}
    	else {
    		if (request.getParameter("glTitle") == null || request.getParameter("glContent") == null
    			|| request.getParameter("glTitle").equals("") || request.getParameter("glContent").equals("")) {
    			PrintWriter script = response.getWriter();
    			script.println("<script>");
        		script.println("alert('입력된 사항이 없습니다.')");
        		script.println("history.back()");
        		script.println("/<script>");
    		} else {
    			GalleryDAO2 galleryDAO = new GalleryDAO2();
    			int result = galleryDAO.glupdate(glCode, request.getParameter("glTitle"), request.getParameter("glContent"));
    			if (result == -1) {
    	    		PrintWriter script = response.getWriter();
    	    		script.println("<script>");
    	    		script.println("alert('글수정에 실패하였습니다.')");
    	    		script.println("history.back()");
    	    		script.println("/<script>");
    	    	}
    			else {
    				PrintWriter script = response.getWriter();
    	    		script.println("<script>");
    	    		script.println("location.href = 'ArtistGallery.jsp'");
    	    		script.println("/<script>");
    			}
    		}
    	}
    %>
</body>
</html>