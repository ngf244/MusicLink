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
<title>아티스트 리스트</title>
<style>
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height:800px;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:30%; color: rgb(224, 224, 224);}

    #categoryArea{position: absolute; top: 2%; left: 3%; display: inline;}
    #contentArea{padding-top: 12%; text-align:center;}

    #inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
    #inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; top: 5%; margin-left:1%;}

    .promotionArea{margin-top:1%;}
    .subTitle{font-size:20px; font-weight:bold;}

    .promotionImgArea{margin-top:120px; width:100%; }
    .promotionImgArea input{}
    .promotionImg{width:200px; height:px; background:lightgray; display:inline-block; vertical-align:middle;}
    .follow{font-size:11px; margin-top:260px; height:30px; width:50%; float:left;}
    .request{font-size:11px; margin-top:260px; height:30px; width:50%; float:right;}
    #hrstyle{border:0.4px solid lightgray; margin-top:1%;}
   
    .ar-line{width:100%; height:40px; background:rgba(0,0,0,0.8);}
    .line-box{width:80%; margin: 0 auto; height:40px; background:rgba(0,0,0,0.7); }
    .select-box{width:25%; height:30px; border-radius: 7px; margin-top:5px; font-size:12px; text-align: center; float:left;}

</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    
    <section style="z-index: 1;">
        <div id="categoryArea">
            <div id="block"></div><br>
            <label id="inBigCategory">ARTIST</label>
            <label id="inSmallCategory"> - List</label>
        </div>

        <div id="contentArea">
           <div class="promotionArea">
                <label class="subTitle">아티스트 리스트</label><br>
                <hr id="hrstyle">

                <div class="ar-line">
                    <div class="line-box">
                    <select class="select-box">
                        <option>장르를 선택하세요.</option>
                        <option>댄스</option>
                        <option>발라드</option>
                        <option>랩/힙합</option>
                        <option>락</option>
                        <option>트로트</option>
                    </select>
                    </div>
                </div>

                <div class="promotionImgArea">
                    <input type="button" value="<">
                    <div class="promotionImg">
                        <button class="follow" id="fol" onclick="fol_clcik();">팔로우</button>
                        <button class="request" id="fes" onclick="fes_clcik();">행사요청</button>
                    </div>
                    <div class="promotionImg">
                        <button class="follow" id="fol" onclick="fol_clcik();">팔로우</button>
                        <button class="request" id="fes" onclick="fes_clcik();">행사요청</button>
                    </div>
                    <div class="promotionImg">
                        <button class="follow" id="fol" onclick="fol_clcik();">팔로우</button>
                        <button class="request" id="fes" onclick="fes_clcik();">행사요청</button>
                     </div>
                     <div class="promotionImg">
                        <button class="follow" id="fol" onclick="fol_clcik();">팔로우</button>
                        <button class="request" id="fes" onclick="fes_clcik();">행사요청</button>
                    </div>
                    <div class="promotionImg">
                        <button class="follow" id="fol" onclick="fol_clcik();">팔로우</button>
                        <button class="request" id="fes" onclick="fes_clcik();">행사요청</button>
                    </div>
                    <div class="promotionImg">
                        <button class="follow" id="fol" onclick="fol_clcik();">팔로우</button>
                        <button class="request" id="fes" onclick="fes_clcik();">행사요청</button>
                    </div>
                    <input type="button" value=">">
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

    function fes_clcik(){
        if (confirm("행사요청을 보내시겠습니까?") == true){    //확인
            document.form.submit();
        }else{   //취소
            return;
        }
    }
</script>
</body>
</html>