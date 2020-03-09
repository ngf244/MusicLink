<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gallery.GalleryDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="gallery" class="gallery.Gallery" scope="page" />
<jsp:setProperty name="gallery" property="glTitle"/>
<jsp:setProperty name="gallery" property="glContent"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>갤러리 게시판 작성</title>
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
    		if (gallery.getGlTitle() == null || gallery.getGlContent() == null){
    			PrintWriter script = response.getWriter();
    			script.println("<script>");
        		script.println("alert('입력된 사항이 없습니다.')");
        		script.println("history.back()");
        		script.println("/<script>");
    		} else {
    			GalleryDAO galleryDAO = new GalleryDAO();
    			int result = galleryDAO.ArtistGalleryWrite(gallery.getGlTitle(), gallery.getGlContent(), gallery.getUserCode());
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
    	    		script.println("location.href = 'ArtistGallery.jsp'");
    	    		script.println("/<script>");
    			}
    		}
    	}
    %>
</body>
</html>