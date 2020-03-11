<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, lovecall.model.vo.*" %>
<%
	ArrayList<LoveCall> lvlist = (ArrayList<LoveCall>)request.getAttribute("lvcList");
	System.out.println(lvlist);
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
    .fe-nav{width:24.5%; display: inline-block; text-align: center; padding:10px 0; }
    .padding-1{padding:5px 0; color:#000; border-bottom:1px solid #ccc; padding-bottom:5px;}
    .fe-sum{width:24.5%; display: inline-block; margin:0; padding: 0; text-align: center;}
    
    .btn-y{display:inline-block; background:#ccc; color:#fff; padding: 5px 5px;}
    .btn-n{display:inline-block; background:#000; color:#fff; padding: 5px 5px;}
    .fe-yn{margin:0 auto;}
     form{width:20%; float:left; display:inline-block;}
     form:nth-child(1){margin-left:30%;}
     button{display:inline-block;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<section style="z-index: 1;">
       	<%@ include file="../common/MyPage_Menubar.jsp" %>
        <div class="sec-menu-views views0">
            <h3>LoveCall Receive</h3>
            <ul class="festival-event">
                <li class="fe-nav">러브콜 시간</li>
                <li class="fe-nav">러브콜 보낸 기획자</li>
                <li class="fe-nav">행사 정보</li>
                <li class="fe-nav">러브콜 선택</li>
            </ul>
            <% for(LoveCall lc : lvlist){ %>
            <div class="padding-1">
                <div class="fe-day fe-sum"><%= lc.getLcDate() %></div>
                <div class="fe-name fe-sum"><%= lc.getPlCode() %></div>
                <div class="fe-page fe-sum"><a href="<%= request.getContextPath() %>/detail.fes?fcode=<%= lc.getFesCode() %>&status=1"><%= lc.getFesName() %></a></div>
                <% if(lc.getLcYn().equals("I")) { %> 
                <div class="fe-yn fe-sum">
                	<form action="" mothod="post">
                	<input type="hidden" value="Y" name="yName">
                	<input type="hidden" value="<%= lc.getLcCode() %>" name="lcCodey">
                	<button type="submit">수락</button>
                	</form>
					<form action="" mothod="post">
                	<input type="hidden" value="N" name="nName">
                	<input type="hidden" value="<%= lc.getLcCode() %>" name="lcCoden">
                	<button type="submit">거절</button>
                	</form>                
                </div>
                <% } else { %>
                <div class="fe-yn fe-sum">완료
                </div>
                <% } %>
            </div>
            <% } %>
        </div>
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>