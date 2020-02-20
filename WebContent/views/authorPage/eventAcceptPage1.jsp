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

    .eventRequestList{background-color: beige; width: 80%; height: 80%; bottom: 5%; left: 10%;}
    table{background-color: yellow; width: 100%; min-height: 0%; left: 0%; text-align: center;}
    table tr{margin-top: 10px; height: 30px; line-height: 30px;}
    table tr:first-child{border: 1px groove black;}




</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>   
   
    <section style="z-index: 1;">
        <div id="sectionBox">
            <%@ include file="common/authorPageMenu.jsp" %> 
        
            <div class="eventRequestList">
                <table>
                    <tr>
                        <th>글번호</th>
                        <th>행사명</th>
                        <th>행사내용</th>
                        <th>행사기간</th>
                        <th>기획자아이디</th>
                        <th>요청일시</th>
                    </tr>
                    <tr>
                        <td>시부레</td>
                        <td>인</td>
                        <td>생</td>
                        <td>ㅈ</td>
                        <td>ㄴ</td>
                        <td>빡치넹 ㅎ</td>
                    </tr>
                    <tr>
                        <td>시부레2</td>
                        <td>인</td>
                        <td>생</td>
                        <td>ㅈ</td>
                        <td>ㄴ</td>
                        <td>빡치넹 ㅎ</td>
                    </tr>
                    <tr>
                        <td>시부레3</td>
                        <td>인</td>
                        <td>생</td>
                        <td>ㅈ</td>
                        <td>ㄴ</td>
                        <td>빡치넹 ㅎ</td>
                    </tr>
                    <tr>
                        <td>시부레4</td>
                        <td>인</td>
                        <td>생</td>
                        <td>ㅈ</td>
                        <td>ㄴ</td>
                        <td>빡치넹 ㅎ</td>
                    </tr>
                </table>
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