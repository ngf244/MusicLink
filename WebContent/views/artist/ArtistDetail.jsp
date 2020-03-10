<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="artist.model.vo.Artist"%>
<%
	Artist a = (Artist)request.getAttribute("artist");
	int count = (int)request.getAttribute("count");
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/reset.css" />
    <link href="css/slick.css" rel="stylesheet" />
    <link href="css/slick-theme.css" rel="stylesheet" />
    <link href="css/common.css" rel="stylesheet" />
    <link href="css/mfooter.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
    <link href="css/calender.css" rel="stylesheet">
<title>아티스트 프로필</title>
<style>
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height:800px;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:135px; left:35%; color: rgb(224, 224, 224);}

    #categoryArea{position: absolute; top: 2%; left: 3%; display: inline;}
    #contentArea{padding-top: 5%; text-align:center;}

    #inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
    #inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; top: 5%; margin-left:1%;}

    .promotionArea{margin-top:1%;}
    .subTitle{font-size:20px; font-weight:bold;}

    .follow{font-size:11px; height:30px; width:50%; margin-top:10px;}
    .request{font-size:11px; margin-top:260px; height:30px; width:50%; float:right;}
    #hrstyle{border:0.4px solid lightgray; margin-top:1%;}

    .artistBtn {width: 100%; height: 40px;}
    .newpage {float: left; width: 25%; height: 100%; border: 1px; outline: none; font-size: 16px; font-weight: bold; color: #fff; background-color: #a6a6a6;}

    .main{width:100%; height:300px; border-bottom:1px solid; border-color:lightgray;}
    .com1{float:left; width:15%; height:300px; margin-left: 4%;}
    .com2{float:left; width:34%; height:300px; border-right:1px solid; border-color:lightgray;}
    .com3{float:left; width:40%; height:300px; padding-top: 10px; padding-left: 35px;}

    /*.artistMedia{width:50%; height:300px; background-color:green; float:right;}*/
    .arimg{width:150px; height:auto;}
    .content{margin-left:9%; margin-top:2%;}
    .td1{width:200px; height:35px; vertical-align:middle}
    .td2{width:200px; height:35px; vertical-align:middle}

    .main2{width:100%; height:300px;}
    .com4{float:left; width:58%; height:300px; border-right:1px solid; border-color:lightgray;}
    .com5{float:left; width:29.5%; height:300px;}


	#artistStar {
		color: #FFCD12;
	}
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
   
    <section style="z-index: 1;">
        <div id="categoryArea">
            <div id="block"></div><br>
            <label id="inBigCategory">ARTIST</label>
            <label id="inSmallCategory"> - Profile</label>
        </div>

        <div id="contentArea">
           <div class="promotionArea">
                <label class="subTitle">아티스트 프로필</label><br>
                <hr id="hrstyle">
                <div class="main">
                    <div class="com1">
                        <img class="arimg" src="artistProfile_uploadFiles/<%= a.getAtPicPath() %>">
                        <p>팔로워 수 : <%= count %></p>
                        <button class="follow" id="fol">팔로우</button>
                        <input type="hidden" name="atCode" value="<%= a.getAtCode() %>">
                    </div>
                    <div class="com2">
                        <table class="content">
                            <tr align="left">
                                <td class="td1"><b>팀명(활동명)</b></td>
                                <td class="td2"><%= a.getAtName() %></td>
                            </tr>
                            <tr align="left">
                                <td class="td1"><b>유형</b></td>
                                <td class="td2"><%= a.getAtClass() %></td>
                            </tr>
                            <tr align="left">
                                <td class="td1"><b>데뷔일</b></td>
                                <td class="td2"><%= a.getAtDebutDate() %></td>
                            </tr>
                            <tr align="left">
                                <td class="td1"><b>장르</b></td>
                                <td class="td2"><%= a.getAtGenre() %></td>
                            </tr>
                            <tr align="left">
                                <td class="td1" colspan="2"><b>아티스트 한 줄소개</b></td>
                            </tr>
                            <tr align="left">
                                <td colspan="2"><%= a.getAtOneLine() %></td>
                            </tr>
                        <%
							int grade = a.getAtGrade();
                        	String printStar = "";
							for(int i = 0; i < 5; i++) {
								if(grade > 0) {
									printStar += "★";
									grade--;
								} else {
									printStar += "☆";
								}
							}
						%>
							
                            <tr align="left" style="margin-top: 5px;">
                                <td class="td1"><b>평점</b></td>
                                <td class="td2" id="artistStar"><%= printStar %></td>
                            </tr>                            
                        </table>
                    </div>
                    <div class="com3">
						<h4>상세 소개</h4>
						<%= a.getAtIntro() %>
						<h4>대표 SNS주소</h4>
						<a href="<%= a.getAtInsta() %>" target="_blank"><%= a.getAtInsta() %></a>
                    </div>
                </div>
                <div class="main2">
                    <div class="com4">
                    	<h4>활동 이력</h4>
                        <%= a.getAtRecode() %>
                    </div>
                    <div class="com5" style="padding: 15px;">
                        <iframe width="520" height="300" src="https://www.youtube.com/embed/Utyzs3sqGLo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <h1 class="htext" align="cneter">A - D e t a i l</h1>
    
<%@ include file="../common/footer.jsp" %>
    
<script src="js/respond.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/parallax.min.js"></script>
<script src="js/slick.min.js"></script>
<script>

	$("#toggle").click(function(){
		$(this).toggleClass("on");
		$("#resize").toggleClass("active");	
	});
    
    $(".image3").click(function(){
        $(".map").css({"display":"block","width":"100%","height":"80%","padding-top":"10%","opacity":"0.98", "z-index":"9"});
    });
    $(".map-h1").click(function(){
        $(".map").css("display","none");
    });    
	//new WOW().init();
	
	$('.follow').click(function() {
		var atCode = $(this).next().eq(0).val();
		console.log(atCode);
		
	});
</script>
<script src="js/cal.js"></script>
</body>
</html>