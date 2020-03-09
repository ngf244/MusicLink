<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, festival.model.vo.*" %>
<%
	ArrayList<Festival> flist = (ArrayList<Festival>)request.getAttribute("fList");
	ArrayList<FestivalApply> apList = (ArrayList<FestivalApply>)request.getAttribute("apList");
	boolean isReceive = true;
	if(apList == null) {
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
    
    .btn-y{display:inline-block; background:#ccc; color:#fff; padding: 5px 5px;}
    .btn-n{display:inline-block; background:#000; color:#fff; padding: 5px 5px;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<section style="z-index: 1;">
       	<%@ include file="../common/MyPage_Menubar.jsp" %>
        <div class="sec-menu-views views0">
            <h3>나의 행사에 지원한 아티스트</h3>
            <ul class="festival-event">
                <li class="fe-nav">지원 날짜</li>
                <li class="fe-nav">아티스트 명</li>
                <li class="fe-nav">아티스트 프로필</li>
                <li class="fe-nav">모집기간</li>
                <li class="fe-nav">금액</li>
            </ul>
            <%	if(isReceive == true){ %>
           		<% for(FestivalApply fa : apList){ %>
           			<% if(fa.getPlCode().equals(loginUser.getUserCode())){ %>
		            <div class="padding-1">
		                <div class="fe-day fe-sum"><%= fa.getApFesTime() %></div>
		                <div class="fe-name fe-sum" onclick="btn-yn();"><%= fa.getAtCode() %></div>
		                <div class="fe-page fe-sum">
		                	<div class="btn-y">수락</div>
		                	<div class="btn-n">거절</div>
		                </div>
		                <div class="fe-period fe-sum"><%= fa.getFesTerm() %></div>
		                <div class="fe-yn fe-sum"><%= fa.getPayRange() %></div>
		            </div>
           			 <%  } %>
            	<% } %>
            <% } %>
            
        </div>
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>