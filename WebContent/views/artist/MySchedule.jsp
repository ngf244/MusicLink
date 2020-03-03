<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.LinkedHashMap, festival.model.vo.Festival, member.model.vo.Member, java.util.Date, java.util.GregorianCalendar"%>
<%
	LinkedHashMap<Festival, Member> map = (LinkedHashMap<Festival, Member>)request.getAttribute("map");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    
    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
 	/* 섹션 */
	section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:2100px; padding-top: 30px; padding-bottom:10%;}

    /* 켈린더 */
    .dayNum{padding:0 8px; display: inline-block; line-height: 80px;}
    .dayNum:hover{transform: perspective(100px) translateZ(50px); color: #F7FE2E;}
    #pictureBrowser{width:100%; height:150px; text-align: center; margin-bottom: 30px;}
    .month-D{width: 100%; min-height: 80px; text-align: center; background:rgba(0,0,0, 0.8); border-radius: 10px; margin-bottom: 30px; color:#fff;}
    .now-bg{font-size: 30px;}
    .pn-bt{width: 30px; height: 30px; border:none; border-radius: 50px; font-size:18px; line-height: 30px; }
    .now-D{text-align: center; display: inline-block;}
    
    /**/
    .plan-schedule{width:100%; border-bottom: 1px solid black; height:300px; margin-top: 50px;}
    .ps-img{width: 15%; height:200px; background:#ccc; float: left; margin-left: 50px;}
    .ps-title{width: 50%; height: 300px; float:left; padding-left:20px; margin-left: 30px;}
    .ps-title>p{font-size: 14pt;}
    .d-day{padding-top: 10px; width:10%; float: left; cursor: pointer;}
    .d-day > div{padding:0 15px; height:35px; background:red; text-align: center; color:#fff; font-size:20px; border-radius: 10px; line-height: 33px; font-weight: bold;}
</style>	
<title>공연 스케줄</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    
    <section style="z-index: 1;">
	<%@ include file="../common/MyPage_Menubar.jsp" %>
	
        <div class="sec-menu-views views1">
            <div class="faeText">
                <h3 style="font-size:14pt;">공연 스케줄</h3>
            </div>
            
            <div id="pictureBrowser">
                <div class="month-D" style="" id="monthDays"></div>
                <br>
                <div class="now-bg">
                    <button style="" id="prev" class="pn-bt" onclick="prev();">&lt;</button>
                    <div class="now-D" style="" id="nowDay"></div>
                    <button id="next" class="pn-bt" onclick="next();">&gt;</button>
                </div>
            </div>
            <div style="margin-left: 30px; color: red;">※ D-day 영역을 클릭하면 해당 기획자에 대한 평점을 매길 수 있습니다.</div>
             	<% if(map == null) { %>
             		<p>확정된 공연 스케줄이 없습니다.</p>
             	<% } else{ 
            			for(Festival f : map.keySet()) {
            				Member m = map.get(f);
            				
							String fesTerm = f.getFesTerm();
							String endFes[] = fesTerm.split(" - ");
							String dateSplit[] = (endFes[0]).split("/");
							
							int month = 0;
							int day = 0;
							int year = 0;
							if(endFes.length > 1) {
								month = Integer.parseInt(dateSplit[0]);
								day = Integer.parseInt(dateSplit[1]);
								year = Integer.parseInt(dateSplit[2]);
							}

							Date endFesDate = new Date(new GregorianCalendar(year, month-1, day).getTimeInMillis());
							Date today = new Date(new GregorianCalendar().getTimeInMillis());
							
							long minus = today.getTime() - endFesDate.getTime();
							long calc = 1000*60*60*24;
							int resultDday = Math.abs((int)(Math.ceil(minus/calc)));
             	%>
             	<div class="plan-schedule">
                <div class="ps-img"><img width="160px" src="<%= request.getContextPath() %>/festival_uploadFiles/<%= f.getPosPath() %>"></div>
                <div class="ps-title">
                    <p>행사명 : <%= f.getFesName() %></p>
                <%
					String fullLoc = "";
					String spLoc[] = f.getFesLoc().split("/");
					
					String mapLoc[] = spLoc[0].split("&");
					
					if (mapLoc.length > 1) {
						if(spLoc.length > 1) {
							fullLoc = "(" + mapLoc[0] + ") " + mapLoc[1] + " " + spLoc[1];
						} else {
							fullLoc = "(" + mapLoc[0] + ") " + mapLoc[1];
						}
					} else {
						fullLoc = f.getFesLoc();
					}
				%>                     
                    <p>장소 : <%= fullLoc %></p>
                    <p>기간 : <%= f.getFesTerm() %></p>
                    <p>기획자 이름 : <%= m.getUserName() %></p>
                    <p>기획자 연락처 : <%= m.getUserPhone() %> </p>
                    <p>기획자 이메일 : <%= m.getUserEmail() %></p>
                </div>
                <div class="d-day" onclick="inputGrade();">
                    <div>D - <%= resultDday + 1 %></div>
                </div>
                <input type="hidden" name="cpCode" class="cpCode" value="<%= f.getCpCode() %>">
                <div style="clear: both;"></div>
                <% 		 }
            	   }
            	%>

        	</div>
        </div>	
	</section>
	<h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>

	<%@ include file="../common/footer.jsp" %>
<script>
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    document.getElementById("nowDay").innerHTML = year + "-" + month + "-" + day;
</script>
<script>
    var lastDay = (new Date(date.getFullYear(), date.getMonth()+1, 0)).getDate();
    var days = "";
    for(var i = 1; i <= lastDay; i++){
        days += "<span class='dayNum' onclick='pickDate("+i+");'>"+i+"</span>";
    }
    document.getElementById("monthDays").innerHTML = days;


    function printDays() {
        var lastDay = (new Date(year, month, 0)).getDate();
        var days = "";
        for(var i = 1; i <= lastDay; i++){
        days += "<span class='dayNum' onclick='pickDate("+i+");'>"+i+"</span>";
        }
        document.getElementById("monthDays").innerHTML = days;
    }

    function pickDate(num) {
        day = num;
        console.log(num);
        document.getElementById("nowDay").innerHTML = year + "-" + month + "-" + day;
    }
    function prev() {
        month -= 1;
        if(month<1){
            year -= 1;
            month = 12;
        }
        document.getElementById("nowDay").innerHTML = year + "-" + month + "-" + day;
        printDays();
    }
    function next() {
        month += 1;
        if(month>12){
            year += 1;
            month = 1;
        }
        document.getElementById("nowDay").innerHTML = year + "-" + month + "-" + day;
        printDays();
    }
    
    function inputGrade(){
    	var cpCode = $('.cpCode').val();
    	console.log(cpCode);
    	
    	var win = window.open('<%= request.getContextPath() %>/views/common/InputGrade.jsp?cpCode=' + cpCode, "PopupWin", "width=230,height=200,left=900,top=400");
    }

</script>	    
</body>
</html>