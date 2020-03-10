<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="java.util.ArrayList, festival.model.vo.*" %>
<%
	ArrayList<Festival> flist = (ArrayList<Festival>)request.getAttribute("fList");
	boolean isReceive = true;
	if(flist == null) {
		isReceive = false;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:1000px; padding-top: 30px; padding-bottom:10%;}
	/* 등록한행사일정 */
    .festival-event{width:100%; padding-left:0; margin:0; margin-top:16px; background:rgba(0,0,0,0.3); font-weight: bold; color:#fff;}
    .fe-nav{width:19.5%; display: inline-block; text-align: center; padding:10px 0; }
    .padding-1{padding:5px 0; color:#000;}
    .fe-sum{width:19.5%; display: inline-block; margin:0; padding: 0; text-align: center;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<section style="z-index: 1;">
       	<%@ include file="../common/MyPage_Menubar.jsp" %>
        <div class="sec-menu-views views0">
            <h3>등록한 행사일정</h3>
            <ul class="festival-event">
                <li class="fe-nav">날짜</li>
                <li class="fe-nav">행사명</li>
                <li class="fe-nav">행사등록페이지</li>
                <li class="fe-nav">모집기간</li>
                <li class="fe-nav">상태</li>
            </ul>
            
            <div class="padding-1">
            <%	if(isReceive == true){ %>
	            <% for(Festival f : flist){ %>
	            	 <% if(f.getCpCode().equals(loginUser.getUserCode())){ %>
	                <div class="fe-day fe-sum"><%= f.getFesDate() %></div>
	                <div class="fe-name fe-sum"><%= f.getFesName() %></div>
	                <div class="fe-page fe-sum">URL</div>
	                <div class="fe-period fe-sum"><%= f.getRecTerm() %></div>
	                <div class="fe-yn fe-sum">
						<% if( f.getFesRecruit().equals("Y") ){ %>
						<div class="feBtni"><a href="<%= request.getContextPath() %>/festivalapply.me">모집중</a></div>
						<% } else { %>
						<div class="feBtnf">모집완료</div>
						<% } %>
					</div>
	                <% } %>
	            <% } %>
            <% } %>
            </div>
            
        </div>
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>