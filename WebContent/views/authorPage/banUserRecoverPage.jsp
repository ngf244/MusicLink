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


    /* section2 */
    .searchBox{  width: 50%; height: 5%; top: 16%; left: 24%; z-index: 1;}
    .searchBox-inputText{width: 75%; height: 85%;}
    .searchBox-submitButton{width: 20%; height: 100%; right: 0%;}
    
    .userDetailBox{width: 80%; height: 30%; top: 25%; left: 10%;}
    .userDetailBox-imgBox{background-color: seashell; width: 35%; height: 100%; top: 0%; left: 5%;}
    .userDetailBox-nameBox{width: 50%; height: 24%; top: 0%; right: 5%;}
    .userDetailBox-addressBox{width: 50%; height: 24%; top: 33%; right: 5%;}
    .userDetailBox-usertypeBox{width: 50%; height: 24%; top: 66%; right: 5%;}
    
    fieldset{border: 1px solid black; height: 100%;}
    legend{font-size: larger;}
    input[readonly]{width: 99%; height: 55%; margin-top: 10px;}

    .preDistrictReason{width: 80%; height: 10%; bottom: 33%; left: 10%;}
    .preDetailReason{width: 80%; height: 18%; bottom: 12%; right: 10%;}

    .preDistrictReason fieldset, .preDetailReason fieldset{border: 1px solid black; height: 100%;}
    .preDistrictReason legend, .preDetailReason legend{font-size: larger;}
    .preDistrictReason input{width: 99%; height: 55%; margin-top: 10px;}
    .preDetailReason input{width: 99%; height: 70%; margin-top: 10px;}

    .preDetailReason+div{width: 5%; height: 5%; bottom: 5%; right: 10%;}
    .preDetailReason+div button{background-color: red;}
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %> 
   
    <section style="z-index: 1;">
        <div id="sectionBox">
            <%@ include file="common/authorPageMenu.jsp" %> 
        
            <div class="searchBox">
                <input type="text" placeholder="검색할 사용자 아이디" class="searchBox-inputText">
                <button type="button" class="searchBox-submitButton">검색</button>
            </div>
        
            <div class="userDetailBox">
                <div class="userDetailBox-imgBox">
                    img 사진 들어갈 곳
                </div>
                <div class="userDetailBox-nameBox">
                    <fieldset>
                        <legend>이름</legend>
                        <input type="text" readonly>
                    </fieldset>
                </div>
                <div class="userDetailBox-addressBox">
                    <fieldset>
                        <legend>주소</legend>
                        <input type="text" readonly>
                    </fieldset>
                </div>
                <div class="userDetailBox-usertypeBox">
                    <fieldset>
                        <legend>회원 유형</legend>
                        <input type="text" readonly>
                    </fieldset>
                </div>
            </div>
                <div class="preDistrictReason">
                    <fieldset>
                        <legend>이전 제재 사유</legend>
                        <input type="text" readonly>
                    </fieldset>
                </div>
                <div class="preDetailReason">
                    <fieldset>
                        <legend>이전 제재 사유 상세</legend>
                        <input type="text" readonly>
                    </fieldset>
                </div>
                <div>
                    <button type="button" onclick="return restrictCanelSubmit();">해제</button>
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
    
    function restrictCanelSubmit() {
        var check = confirm("정말 해제 하시겠습니까?");

        if(check == true){
            return true;
        }
        else{
            return false;
        }
    }
    
	//new WOW().init();
	
	
</script>
</body>
</html>