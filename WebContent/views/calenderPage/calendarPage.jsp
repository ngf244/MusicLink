<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../../css/reset.css" />
    <link href="../../css/mfooter.css" rel="stylesheet" />
<title>Insert title here</title>
<style>
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 300px; position: relative;
    background: #fff; min-height:500px;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:25%; color: rgb(224, 224, 224); clear: both;} 
    
    /* selection common */
    #sectionBox {position: relative;  width: 100%; height: 400px;}
    #sectionBox div{position: absolute;}
    /* common end */

    #pictureBrowser{background-color: yellow; width: 100%; height: 350px; top: 0%;}
    #pictureBrowser button{opacity: 0.03; background-color: black; position: absolute;}
    #pictureBrowser button:hover{opacity: 1; color: white;}
    
    #showDetail{top: 45%; left: 45%; width: 10%; height: 10%;}
    #prev{width: 8%; height: 8%; bottom: 8%; left: 35%;}
    #next{width: 8%; height: 8%; bottom: 8%; right: 35%;}
    #nowDay{background-color: yellow; top: 82.5%; left: 45%; width: 10%; height: 10%; text-align: center; line-height: 40px; font-size: larger;}
    #monthDays{background-color: beige; top: 100%; width: 100%; min-height: 10%; text-align: center; line-height: 40px; font-size: small;}

    .dayNum{padding-left: 10px; padding-right: 10px;}
    .dayNum:hover{transform: perspective(100px) translateZ(50px); color: red; display: inline-block;}
    
    #festivalList{min-height: 100px; width: 100%; top: 5%; background-color: red;}
    
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
   
    <section style="z-index: 1;">
        <div id="sectionBox">
        
            <div id="pictureBrowser">
                <button id="showDetail">상세 보기</button>
                <button id="prev" onclick="prev();">&lt;prev</button>
                <button id="next" onclick="next();">next&gt;</button>
                <div id="nowDay"></div>
                <script>
                    var date = new Date();
                    var year = date.getFullYear();
                    var month = date.getMonth()+1;
                    var day = date.getDate();
                    document.getElementById("nowDay").innerHTML = year + "-" + month + "-" + day;
                </script>
                <div id="monthDays"></div>
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
                    
                </script>

            </div>    
        </div>
        <div id="festivalList">공연 정보 인쇄 위치
            <pre>
                1
                2
                9
                10
                1
                2
                3
                4
                5
                5
                6
                6
                7
                7
                8
                8
                
            </pre>
        </div>


    </section>
    <h1 class="htext">C A L E N D A R</h1>
    
    <%@ include file="../common/footer.jsp" %>
    
    <div class="map">
        <div class="map-bg">
            <h1 class="map-h1">&#215;</h1>
            <h1 class="map-txt">오시는길</h1>
            <div class="map-cont">
                <div class="map-cont-left"></div>
                <div class="map-cont-right">
                    <div class="cont-right1">
                        <div class="right-txt1">ADDRESS</div>
                        <div class="right-txt2">서울시 강남구..</div>
                    </div>
                    <div class="cont-right1">
                        <div class="right-txt1">TEL</div>
                        <div class="right-txt2">02-1111-1111</div>
                    </div>
                    <div class="cont-right1">
                        <div class="right-txt1">SUB</div>
                        <div class="right-txt2">2호선 - 강남, 역삼역</div>
                    </div>
                    <div class="cont-right1">
                        <div class="right-txt1">BUS</div>
                        <div class="right-txt2">146번, 360번</div>
                    </div>
                    <div class="cont-right2">
                        <a href="#" class="map-button">NAVER 지도로 바로 보기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
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
	
	
</script>
</body>
</html>