<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:30%; color: rgb(224, 224, 224);}

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
    .newpage {float: left; width: 33.3%; height: 100%; border: 1px; outline: none; font-size: 16px; font-weight: bold; color: #fff; background-color: #a6a6a6;}

    .main{width:100%; height:300px; border-bottom:1px solid; border-color:lightgray;}
    .com1{float:left; width:15%; height:300px; margin-left: 4%;}
    .com2{float:left; width:34%; height:300px; border-right:1px solid; border-color:lightgray;}
    .com3{float:left; width:46%; height:300px;}

    /*.artistMedia{width:50%; height:300px; background-color:green; float:right;}*/
    .arimg{width:150px; height:auto;}
    .content{margin-left:9%; margin-top:2%;}
    .td1{width:200px; height:35px; vertical-align:middle}
    .td2{width:200px; height:35px; vertical-align:middle}

    .main2{width:100%; height:300px;}
    .com4{float:left; width:70%; height:300px; border-right:1px solid; border-color:lightgray;}
    .com5{float:left; width:29.5%; height:300px;}

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
                <div class="artistBtn">
                    <button type="button" class="newpage" onClick="location.href='ArtistProfile.jsp'">프로필</button>
                    <button type="button" class="newpage" onClick="location.href='ArtistCommuntiy.jsp'">소통 게시판</button>
                    <button type="button" class="newpage" onClick="location.href='ArtistGallery.jsp'">갤러리 게시판</button>
                </div>
                <div class="main">
                    <div class="com1">
                        <img class="arimg" src="img/chang.jpg">
                        <p>팔로워</p>
                        <button class="follow" id="fol" onclick="fol_clcik();">팔로우</button>
                    </div>
                    <div class="com2">
                        <table class="content">
                            <tr align="left">
                                <td class="td1">팀명(활동명)</td>
                                <td class="td2">창모</td>
                            </tr>
                            <tr align="left">
                                <td class="td1">유형</td>
                                <td class="td2">솔로(남성)</td>
                            </tr>
                            <tr align="left">
                                <td class="td1">데뷔</td>
                                <td class="td2">2014</td>
                            </tr>
                            <tr align="left">
                                <td class="td1">국적</td>
                                <td class="td2">대한민국</td>
                            </tr>
                            <tr align="left">
                                <td class="td1">장르</td>
                                <td class="td2">랩/힙합</td>
                            </tr>
                            <tr align="left">
                                <td class="td1" colspan="2">아티스트 한줄소개 및 개인 SNS</td>
                            </tr>
                            <tr align="left">
                                <td colspan="2">내용</td>
                            </tr>
                        </table>
                    </div>
                    <div class="com3">

                    </div>
                </div>
                <div class="main2">
                    <div class="com4">
                        <div class="my-calendar clearfix">
                                        <div class="clicked-date">
                                          <div class="cal-day"></div>
                                          <div class="cal-date"></div>
                                        </div>
                                        <div class="calendar-box">
                                          <div class="ctr-box clearfix">
                                            <button type="button" title="prev" class="btn-cal prev">
                                            </button>
                                            <span class="cal-month"></span>
                                            <span class="cal-year"></span>
                                            <button type="button" title="next" class="btn-cal next">
                                            </button>
                                          </div>
                                          <table class="cal-table">
                                            <thead>
                                              <tr>
                                                <th>S</th>
                                                <th>M</th>
                                                <th>T</th>
                                                <th>W</th>
                                                <th>T</th>
                                                <th>F</th>
                                                <th>S</th>
                                              </tr>
                                            </thead>
                                            <tbody class="cal-body"></tbody>
                                          </table>
                                        </div>
                                      </div>
                    </div>
                    <div class="com5">
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <h1 class="htext" align="cneter">A - l i s t</h1>
    
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
	
	function fol_clcik(){
        if (confirm("팔로우 하시겠습니까?") == true){    //확인
            document.form.submit();
        }else{   //취소
            return;
        }
    }
</script>
<script src="js/cal.js"></script>
</body>
</html>