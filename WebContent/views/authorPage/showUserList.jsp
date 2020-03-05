<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Member> memArr = (ArrayList<Member>)request.getAttribute("memArr");
	ArrayList<Member> normalMem = (ArrayList<Member>)request.getAttribute("normalMem");
	ArrayList<Member> artistMem = (ArrayList<Member>)request.getAttribute("artistMem");
	ArrayList<Member> companyMem = (ArrayList<Member>)request.getAttribute("companyMem");
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
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:30%; color: rgb(224, 224, 224);} 
    /* selection common */
    #sectionBox {position: relative; background-color: white; width: 100%; height: 100%;}
    #sectionBox div{position: absolute;}
    /* common end */

    /* section1 */
    .searchBox{background-color: white;  width: 50%; height: 5%; top: 16%; left: 24%; z-index: 1;}
    .searchBox-inputText{width: 75%; height: 85%;}
    .searchBox-submitButton{width: 20%; height: 100%; right: 0%;}

    .normalUserBox{width: 46%; height: 70%; bottom: 3%; left: 3%;}
    .normalUserBox-title{background-color: #FDF1F1;  width: 100%; height: 8%; top: 0%; text-align: center; line-height: 42px;}
    .normalUserBox-list{width: 100%; height: 90%; top: 10%; overflow: auto;}
    .normalUserBox-list>table{width: 100%; text-align: center;}
    
    .rightSideBox{width: 46%; height: 70%; bottom: 3%; right: 3%;}
    .artistUserBox{width: 100%; height: 50%; top: 0%;}
    .artistUserBox-title{background-color: #FDF1F1;  width: 100%; height: 16%; top: 0%; text-align: center; line-height: 42px;}
    .artistUserBox-list{width: 100%; height: 80%; top: 20%; overflow: auto;}
    .artistUserBox-list>table{width: 100%; text-align: center;}

    .plannerUserBox{width: 100%; height: 50%; top: 50%;}
    .plannerUserBox-title{background-color: #FDF1F1;  width: 100%; height: 16%; top: 0%; text-align: center; line-height: 42px;}
    .plannerUserBox-list{width: 100%; height: 80%; top: 20%; overflow: auto;}
    .plannerUserBox-list>table{width: 100%; text-align: center;}
    
    table tr:nth-of-type(1)~tr:hover{color: red; cursor: pointer; text-decoration: underline; border-bottom: 2px solid black;}
    /* section1 종료 */
</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>    
   
    <section style="z-index: 1;">
        <div id="sectionBox">
            <%@ include file="common/authorPageMenu.jsp" %>
        
            <div class="searchBox">
            	<form action="<%=request.getContextPath()%>/showUserDetail.au">
                    <input type="text" name="userId" placeholder="검색할 사용자 아이디" class="searchBox-inputText">
                    <button type="submit" class="searchBox-submitButton">검색</button>
            	</form>
            </div>
        
            <div class="normalUserBox">
                <div class="normalUserBox-title">일반 회원 리스트</div>
                <div class="normalUserBox-list">
                    <table>
                        <tr>
                            <th>No.</th>
                            <th>Id</th>
                            <th>Name</th>
                        </tr>
                        
                        <% for(int i = 0; i < normalMem.size(); i++){ %>
                        <tr>
                        	<td><%=normalMem.get(i).getUserCode() %></td>
                        	<td><%=normalMem.get(i).getUserId() %></td>
                        	<td><%=normalMem.get(i).getUserName() %></td>
                        </tr>
                        <%} %>
                    </table>
                </div>
            </div>
            <div class="rightSideBox">
                <div class="artistUserBox">
                    <div class="artistUserBox-title">아티스트 회원 리스트</div>
                    <div class="artistUserBox-list">
                        <table>
                            <tr>
                                <th>No.</th>
                                <th>Id</th>
                                <th>Name</th>
                            </tr>
                            <% for(int i = 0; i < artistMem.size(); i++){ %>
	                        <tr>
	                        	<td><%=artistMem.get(i).getUserCode() %></td>
	                        	<td><%=artistMem.get(i).getUserId() %></td>
	                        	<td><%=artistMem.get(i).getUserName() %></td>
	                        </tr>
	                        <%} %>
                        </table>
                    </div>
                </div>
                <div class="plannerUserBox">
                    <div class="plannerUserBox-title">기획자 회원 리스트</div>
                    <div class="plannerUserBox-list">
                        <table>
                            <tr>
                                <th>No.</th>
                                <th>Id</th>
                                <th>Name</th>
                            </tr>
                            <% for(int i = 0; i < companyMem.size(); i++){ %>
	                        <tr>
	                        	<td><%=companyMem.get(i).getUserCode() %></td>
	                        	<td><%=companyMem.get(i).getUserId() %></td>
	                        	<td><%=companyMem.get(i).getUserName() %></td>
	                        </tr>
	                        <%} %>
                        </table>
                    </div>
                </div>
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
    
    $('table tr:gt(0)').click(function () {
        console.log(this);
        var userId = $(this).children().eq(1).text();
        console.log(userId);
        location.href='<%=request.getContextPath()%>/showUserDetail.au?userId='+userId;
    })
    
	//new WOW().init();
	
	
</script>
</body>
</html>