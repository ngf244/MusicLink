<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, festival.model.vo.AppFestival"%>
<%
	ArrayList<AppFestival> afList = (ArrayList<AppFestival>)request.getAttribute("afList");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
<title>지원한 행사</title>
<style>
 	/* 섹션 */
	section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:800px; padding-top: 30px; padding-bottom:10%;}

    /* 지원한 행사 일정 */
    
    .art-event{width:100%; padding-left:0; margin:0; margin-top:16px; background:rgba(0,0,0,0.3); font-weight: bold; color:#fff;}
    .ae-nav{display: inline-block; text-align: center; padding:10px 0; }
    .padding-1{padding:5px 0; color:#000; border-bottom:1px dashed black; line-height: 35px;}
    .ae-sum{display: inline-block; margin:0; padding: 0; text-align: center; }
    .aef-name{width:24%;}
    .aef-place{width:35%;}
    .aef-period{width:20%;}
    .aef-fname{width:10%;}
    .aef-ynw{width:8%;}
    .views0{font-family: 'Noto Sans KR', sans-serif;}
</style>	
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    
    <section style="z-index: 1;">
	<%@ include file="../common/MyPage_Menubar.jsp" %>
	
        <div class="sec-menu-views views0">
            <h3>지원한 행사 리스트</h3>
            <ul class="art-event">
                <li class="ae-nav aef-name">행사 명칭</li>
                <li class="ae-nav aef-place">행사 장소</li>
                <li class="ae-nav aef-period">행사 기간</li>
                <li class="ae-nav aef-fname">행사 기획자</li>
                <li class="ae-nav aef-ynw">매칭 유무</li>
            </ul>
            <% if(afList.isEmpty()){ %>
            <div>지원한 행사가 없습니다.</div>
            <% } else{ 		
					for(AppFestival af : afList){            
            %>
            <div class="padding-1">
                <div class="aef-name ae-sum"><%= af.getFesName() %></div>
            <%
				String fullLoc = "";
				String spLoc[] = af.getFesLocation().split("/");
				
				String mapLoc[] = spLoc[0].split("&");
				
				if (mapLoc.length > 1) {
					if(spLoc.length > 1) {
						fullLoc = "(" + mapLoc[0] + ") " + mapLoc[1] + " " + spLoc[1];
					} else {
						fullLoc = "(" + mapLoc[0] + ") " + mapLoc[1];
					}
				} else {
					fullLoc = af.getFesLocation();
				}
			%>                
                <div class="aef-place ae-sum"><%= fullLoc %></div>
                <div class="aef-period ae-sum"><%= af.getFesTerm() %></div>
                <div class="aef-fname ae-sum"><%= af.getPlName() %></div>
            <%
            	String yn = "";
            	if(af.getApFesYn().equals("Y")) {
            		yn = "Yes";
            	} else {
            		yn = "No";
            	}
            %>    
                <div class="aef-ynw ae-sum"><%= yn %></div>
            </div>
            <% 		} 
            	}
            %>            
        </div>	
	</section>
	<h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>