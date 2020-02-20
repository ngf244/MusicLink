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
    background: #fff; height:750px;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:30%; color: rgb(224, 224, 224);} 
    
    /* selection common */
    #sectionBox {position: relative;  width: 100%; height: 100%;}
    #sectionBox div{position: absolute;}
    /* common end */
    
    .requestBox{background-color: beige; width: 80%; height: 80%; bottom: 5%; left: 10%;}
    .requestBox ul{background-color: yellow; position: relative; width: 100%; height: 23%; left: 0%; margin-top: 10px;}
    .requestBox-li1{background-color: violet; position: absolute; width: 30%; height: 100%; left: 0%;}
    .requestBox-li2{background-color: green; position: absolute; width: 10%; height: 15%; left: 35%; top: 5%;}
    .requestBox-li3{background-color: green; position: absolute; width: 20%; height: 15%; right: 5%; top: 5%;}
    .requestBox-li4{background-color: beige; position: absolute; width: 60%; height: 50%; left: 35%; top: 25%;}
    .requestBox-reject{background-color: blue; position: absolute; width: 20%; height: 15%; left: 40%; bottom: 5%; border-radius: 25px; text-align: center; border-style: outset;}
    .requestBox-showDetail{background-color: red; position: absolute; width: 20%; height: 15%; left: 70%; bottom: 5%; border-radius: 25px; text-align: center; border-style: outset;}

</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>    
   
    <section style="z-index: 1;">
        <div id="sectionBox">
            <%@ include file="common/authorPageMenu.jsp" %> 
        
            <!-- ul의 포지션을 relative를 놓아서 이후 absolute들이 ul의 범위 안에서 놀 수 있도록 유도 -->
            <div class="requestBox" >
                <ul>
                    <li class="requestBox-li1">사진 넣는 공간</li>
                    <li class="requestBox-li2">이름</li class="requestBox-li1">
                    <li class="requestBox-li3">요청 일시</li class="requestBox-li1">
                    <li class="requestBox-li4">자기소개</li class="requestBox-li1">
                    <li><button class="requestBox-reject">거절 및 사유 보내기</button></li>
                    <li><button class="requestBox-showDetail">상세보기</button class="requestBox-li1"></li>
                </ul>
                <ul>
                    <li class="requestBox-li1">사진 넣는 공간</li>
                    <li class="requestBox-li2">이름</li class="requestBox-li1">
                    <li class="requestBox-li3">요청 일시</li class="requestBox-li1">
                    <li class="requestBox-li4">자기소개</li class="requestBox-li1">
                    <li><button class="requestBox-reject">거절 및 사유 보내기</button></li>
                    <li><button class="requestBox-showDetail">상세보기</button class="requestBox-li1"></li>
                </ul>
                <ul>
                    <li class="requestBox-li1">사진 넣는 공간</li>
                    <li class="requestBox-li2">이름</li class="requestBox-li1">
                    <li class="requestBox-li3">요청 일시</li class="requestBox-li1">
                    <li class="requestBox-li4">자기소개</li class="requestBox-li1">
                    <li><button class="requestBox-reject">거절 및 사유 보내기</button></li>
                    <li><button class="requestBox-showDetail">상세보기</button class="requestBox-li1"></li>
                </ul>
            </div>
        
        </div>


    </section>
    <h1 class="htext">A U T H O R</h1>
    
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