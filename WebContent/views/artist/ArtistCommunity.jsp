<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="community.CommunityDAO" %>
<%@ page import="community.Community" %>
<%@ page import="java.util.ArrayList" %>
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
<title>소통 게시판</title>
<style>
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height:800px;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:30%; color: rgb(224, 224, 224);} 
    
    #categoryArea{position: absolute; top: 2%; left: 3%; display: inline;}
    #contentArea{padding-top: 10%; text-align:center;}

    #inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
    #inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; top: 5%; margin-left:1%;}
    
    .promotionArea{margin-top:1%;}
    .subTitle{font-size:20px; font-weight:bold;}
    #hrstyle{border:0.4px solid lightgray; margin-top:1%;}

    .artistBtn {width: 100%; height: 40px;}
    .newpage {float: left; width: 33.3%; height: 100%; border: 1px; outline: none; font-size: 16px; font-weight: bold; color: #fff; background-color: #a6a6a6;}

    .table-responsive {text-align: center; border-radius: 3px; box-shadow: 0px;}
    
    th {text-align: inherit;}
    
    .table {width: 90%; margin-left: 5%; margin-bottom: 1rem; text-align: center;}
    
    .table th, .table td {padding:0.75rem; vertical-align: top; border-top: 1px solid #dee2e6;}
    
    .table thead th {vertical-align: bottom; border-bottom: 2px solid #dee2e6;}
    
    .table tbody+tbody {border-top: 2px solid #dee2e6;}
    
    .badge-primary {background-color: #7571f9;}
    
    .badge-success {background-color: #6fd96f;}
    
    #write_box{display: inline-block; margin-left: 60%;}
    
    .btn_style{margin-left: 0; border-radius: 0.25rem; position: relative; padding: 0.5rem 0.75rem;
        line-height: 1.25; color: #7571f9; background-color: #fff; border: 1px solid #dee2e6;}   
	a, a:hover {
		color:#000000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%
		String userCode = null;
		if (session.getAttribute("userCode") != null){
			userCode = (String) session.getAttribute("userCode");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
    <%@ include file="../common/menubar.jsp" %>
   
    <section style="z-index: 1;">
       <div id="categoryArea">
            <div id="block"></div><br>
            <label id="inBigCategory">ARTIST</label>
            <label id="inSmallCategory"> - Community</label>
        </div>

        <div id="contentArea">
            <div class="promotionArea">
                <label class="subTitle">소통 게시판</label><br>
                <hr id="hrstyle">
                <div class="artistBtn">
                    <button type="button" class="newpage" onClick="location.href='ArtistProfile.jsp'">프로필</button>
                    <button type="button" class="newpage" onClick="location.href='ArtistCommuntiy.jsp'">소통 게시판</button>
                    <button type="button" class="newpage" onClick="location.href='ArtistGallery.jsp'">갤러리 게시판</button>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>제목</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
	                    <%
	                    	CommunityDAO communityDAO = new CommunityDAO();
	                    	ArrayList<Community> list = communityDAO.getList(pageNumber);
	                    	for(int i = 0; i < list.size(); i++) {
	                    %>
	                    <tr>
                            <td><%= list.get(i).getCmCode() %></td>
                            <td><a href="cmView.jsp?cmCode=<%= list.get(i).getCmCode() %>"><%= list.get(i).getCmTitle() %></a></td>
                            <td><%= list.get(i).getCmDate() %></td>
                        </tr>
	                    <% 
	                    	}
	                    %>
                       
                    </tbody>
                </table>
            </div>
            <div class='paginaArea' align='center'>
           		<%
           			if(pageNumber != 1) {
           		%>
                	<a href="views.artist.ArtistCommunity.jsp?pageNumber=<%=pageNumber - 1%>" class="btn_style">이전</a>
                <%
           			} if(communityDAO.nextPage(pageNumber + 1)) {
                %>
                	<a href="views.artist.ArtistCommunity.jsp?pageNumber=<%=pageNumber + 1%>" class="btn_style">다음</a>
                <%
           			}
                %>
                <div id="write_box">
                    <button type="submit" class="btn_style" id="write" onClick="location.href='ArtistBoardWrite.jsp'">글쓰기</button>
                </div>
            </div>
           </div>
    </section>
    <h1 class="htext">A - r a n k</h1>
    
    
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
	
	
</script>
</body>
</html>