<%@page import="authorPage.model.vo.Follow"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int type = (int)request.getAttribute("type");
	String userClass = null;
	switch(type){
	case 1 : userClass = "일반회원"; break;
	case 2 : userClass = "아티스트회원"; break;
	case 3 : userClass = "기업회원"; break;
	}
	Member mem = (Member)request.getAttribute("mem");
	String img = (String)request.getAttribute("img");
	if(img!=null){
		System.out.println(img);
	}
	ArrayList<Follow> fArr = (ArrayList<Follow>)request.getAttribute("fArr");
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
    #sectionBox {position: relative; background-color: white; width: 100%; height: 100%;}
    #sectionBox div{position: absolute;}
    /* common end */


    /* section2 */
    .searchBox{background-color: white;  width: 50%; height: 5%; top: 16%; left: 24%; z-index: 1;}
    .searchBox-inputText{width: 75%; height: 85%;}
    .searchBox-submitButton{width: 20%; height: 100%; right: 0%;}
    
    .userDetailBox{width: 80%; height: 30%; top: 25%; left: 10%;}
    .userDetailBox-imgBox{border: 1px inset black; width: 35%; height: 100%; top: 0%; left: 5%;}
    .userDetailBox-nameBox{width: 50%; height: 24%; top: 0%; right: 5%;}
    .userDetailBox-addressBox{width: 50%; height: 24%; top: 33%; right: 5%;}
    .userDetailBox-usertypeBox{width: 50%; height: 24%; top: 66%; right: 5%;}
    
    fieldset{border: 1px solid black; height: 100%; text-align: center;}
    legend{font-size: larger;}
    input[readonly]{width: 99%; height: 55%; margin-top: 10px; text-align: center}

    .recentActiveBox{width: 46%; height: 40%; bottom: 3%; left: 3%;}
    .followListBox{width: 46%; height: 40%; bottom: 3%; right: 3%;}
    .title{background-color: #FDF1F1; width: 100%; height: 12%; top: 0%; text-align: center; line-height: 42px; right:0%; left: 0%;}
    .title+div{width: 100%; height: 80%; top: 15%; overflow: auto;}
    .title+div table{width: 100%; border: 1px solid black; text-align: center;}
    
    img{width: 100%; height: 100%}
    /* section2 끝 */



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
                    <%if(type == 1){ %>
                    <img src="<%=request.getContextPath()%>/views/authorPage/image/nomalUser.png">
                    <%}else if(type == 3){ %>
                    <img src="<%=request.getContextPath()%>/views/authorPage/image/companyUser.png">
                    <%}else{ %>
                    <img src="<%=request.getContextPath()%>/artistProfile_uploadFiles/<%=img%>">
                    <%} %>
                </div>
                <div class="userDetailBox-nameBox">
                    <fieldset>
                        <legend>이름</legend>
                        <input type="text" readonly value="<%=mem.getUserName()%>">
                    </fieldset>
                </div>
                <div class="userDetailBox-addressBox">
                    <fieldset>
                        <legend>연락처</legend>
                        <input type="text" readonly value="<%=mem.getUserPhone()%>">
                    </fieldset>
                </div>
                <div class="userDetailBox-usertypeBox">
                    <fieldset>
                        <legend>회원 유형</legend>
                        <input type="text" readonly value="<%=userClass%>">
                    </fieldset>
                </div>
            </div>
            <div class="recentActiveBox">
                <div class="recentActiveBox title">최근 활동 내역</div>
                <div>
                    <table>
                        <tr>
                            <th>최근기록</th>
                            <th>활동</th>
                            <th>Date</th>
                        </tr>
                       
                    </table>
                </div>
            </div>
            <div class="followListBox">
                <div class="followListBox title">팔로우 현황</div>
                <div>
                    <table>
                        <tr>
                            <th>following Id</th>
                            <th>이름</th>
                            <th>Date</th>
                        </tr>
                        <% for(int i = 0; i < fArr.size(); i++){ %>
                        	<tr>
                        		<td><%=fArr.get(i).getAtCode() %></td>
                        		<td><%=fArr.get(i).getAtName() %></td>
                        		<td><%=fArr.get(i).getFollowingDate() %></td>
                        	</tr>
                        <% } %>
                    </table>
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
    
    
    
	//new WOW().init();
	
	
</script>
</body>
</html>