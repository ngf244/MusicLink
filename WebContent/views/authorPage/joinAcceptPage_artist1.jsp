<%@page import="authorPage.model.vo.ArtistJoinInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ArtistJoinInfo> arr = (ArrayList<ArtistJoinInfo>)request.getAttribute("arr");
%>
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
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:185px; left:30%; color: rgb(224, 224, 224);} 
    
    /* selection common */
    #sectionBox {position: relative;  width: 100%; height: 100%;}
    #sectionBox div{position: absolute;}
    /* common end */
    
    .requestBox{width: 80%; height: 80%; bottom: 5%; left: 10%; overflow: auto;}
    .requestBox ul{position: relative; width: 98%; height: 23%; left: 0%; margin-top: 10px; border: outset;}
    .requestBox ul:hover{box-shadow: 5px 5px 3px 2px gray;}
    .requestBox-li1{position: absolute; width: 30%; height: 100%; left: 0%; background-color: blanchedalmond;}
    .requestBox-li2{position: absolute; width: 10%; height: 15%; left: 35%; top: 5%; border: ridge; text-align: center;}
    .requestBox-li3{position: absolute; width: 20%; height: 15%; right: 5%; top: 5%; border: ridge; text-align: center;}
    .requestBox-li4{position: absolute; width: 60%; height: 50%; left: 35%; top: 25%; border: groove;}
    /* .requestBox-reject{background-color: blue; position: absolute; width: 20%; height: 15%; left: 40%; bottom: 5%; border-radius: 25px; text-align: center; border-style: outset;} */
    .requestBox-showDetail{background-color: red; position: absolute; width: 60%; height: 15%; left: 35%; bottom: 5%; border-radius: 25px; text-align: center; border-style: outset;}
    .requestBox-showDetail:hover{cursor: pointer; background-color: blue;}
    img{width: 100%; height: 100%}
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>    
   
    <section style="z-index: 1;">
        <div id="sectionBox">
            <%@ include file="common/authorPageMenu.jsp" %> 
        
            <!-- ul의 포지션을 relative를 놓아서 이후 absolute들이 ul의 범위 안에서 놀 수 있도록 유도 -->
            <div class="requestBox" >
            <%for(int i = 0; i < arr.size(); i++){ %>
                <ul>
                    <li class="requestBox-li1"><img src="<%=request.getContextPath() %>/artistProfile_uploadFiles/<%=arr.get(i).getPic1()%>"></li>
                    <li class="requestBox-li2"><%=arr.get(i).getActiveName() %></li class="requestBox-li1">
                    <li class="requestBox-li3"><%=arr.get(i).getRequestDate() %></li class="requestBox-li1">
                    <li class="requestBox-li4"><%=arr.get(i).getOne_introduce() %></li class="requestBox-li1">
                    <li style="display: none;"><%=arr.get(i).getAt_code()%></li>
                    <li><button class="requestBox-showDetail">상세보기</button class="requestBox-li1"></li>
                </ul>
             <% } %>
            </div>
        </div>


    </section>
    <h1 class="htext">A U T H O R</h1>
    
    <%@ include file="../common/footer.jsp" %>
    
    
<script src="js/respond.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/parallax.min.js"></script>
<script src="js/slick.min.js"></script>
<script>

	/* $("#toggle").click(function(){
		$(this).toggleClass("on");
		$("#resize").toggleClass("active");	
	});
    
    $(".image3").click(function(){
        $(".map").css({"display":"block","width":"100%","height":"80%","padding-top":"10%","opacity":"0.98", "z-index":"9"});
    });
    $(".map-h1").click(function(){
        $(".map").css("display","none");
    }); */

    $('.requestBox-showDetail').click(function () {
        var userCode = $(this).parent().parent().children().eq(4).text();
        console.log(userCode);

        location.href = "<%=request.getContextPath()%>/requestDetail.at?userCode="+userCode;


    })

    
	//new WOW().init();
	
	
</script>
</body>
</html>