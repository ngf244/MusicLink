<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
                <div class="fe-day fe-sum">YYYY-MM-DD</div>
                <div class="fe-name fe-sum">FESTIVAL</div>
                <div class="fe-page fe-sum">URL</div>
                <div class="fe-period fe-sum">YYYY-MM-DD <br>~ YYYY-MM-DD</div>
                <div class="fe-yn fe-sum">모집중</div>
            </div>
            <div class="padding-1">
                <div class="fe-day fe-sum">YYYY-MM-DD</div>
                <div class="fe-name fe-sum">FESTIVAL</div>
                <div class="fe-page fe-sum">URL</div>
                <div class="fe-period fe-sum">YYYY-MM-DD <br>~ YYYY-MM-DD</div>
                <div class="fe-yn fe-sum">모집완료</div>
            </div>
        </div>
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>