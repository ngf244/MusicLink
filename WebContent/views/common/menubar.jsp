<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser"); 
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/menu.css" />
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>

</head>
<body>
	<header style='position:fixed; top:0; z-index:2;'> 
        <nav> 
            <div class="logo">
            logo
            </div>
            <div id="toggle">
                <div class="span" id="one"></div>
                <div class="span" id="two"></div>
                <div class="span" id="three"></div>
            </div>
            <div class="log-inOut">

            	<% if (loginUser == null){ %>
                <a href="<%= request.getContextPath() %>/views/member/ssj_loginForm.jsp">login</a>
                <% } else { %>
                <a href="<%= request.getContextPath() %>/logout.me">logOut</a>
                <% } %>
            </div>
        </nav>

        <div id="resize">
            <ul class="menu">
                <li class="m-name1 m-name">
                    <a href="#" class="m-mname m-mname1"> M u s i c L i n k</a>
                    <ul class="hidden-manu1 drop">
                        <li class="menu-h"><a href="#">About us</a></li>
                        <li class="menu-h"><a href="#">F A Q</a></li>
                        <li class="menu-h"><a href="#">Q &#38; A</a></li>
                    </ul>
                </li>
                <li class="m-name2 m-name">
                    <a href="#" class="m-mname m-mname2">A r t i s t</a>
                    <ul class="hidden-manu2 drop">
                        <li class="menu-h"><a href="#">p r o f i l e</a></li>
                        <li class="menu-h"><a href="#">A - l i s t</a></li>
                        <li class="menu-h"><a href="#">r a n k</a></li>
                    </ul>
                </li>
                <li class="m-name3 m-name">
                    <a href="#" class="m-mname m-mname3">F e s t i v a l</a>
                    <ul class="hidden-manu3 drop">
                        <li class="menu-h"><a href="#">F - l i s t</a></li>
                        <li class="menu-h"><a href="#">r a n k</a></li>
                    </ul>
                </li>
                <li class="m-name4 m-name">
                    <a href="#" class="m-mname m-mname4">C a n l d e r</a>
                </li>
                <li class="m-name5 m-name">
                    <a href="<%= request.getContextPath() %>/showUserList.au" class="m-mname m-mname4">A D M I N</a>
                </li>
            </ul>
        </div>
        <div class="side-icon">
        <% if (loginUser != null){ %>
            <div class="image1 icon">
                <img src="<%= request.getContextPath() %>/img/user.png" alt=""/>
            </div>
            <div class="image2 icon">
                <img src="<%= request.getContextPath() %>/img/bell.png" alt="" />
            </div>
            <div class="image3 icon">
                <img src="<%= request.getContextPath() %>/img/pin.png" alt="" />
            </div>
        <% } else{ %>
            <div class="image3 icon">
                <img src="<%= request.getContextPath() %>/img/pin.png" alt="" />
            </div>
        <% } %>
            <div class="side-text">
                <p>&#169; 2019 MUSICLINK <sapn class=>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</sapn></p>
            </div>
        </div>
        <% if(loginUser != null){
        	String uName = loginUser.getUserName();
    		String uId = loginUser.getUserId();	
       	%>

        <div class="user-wrap">
            <div class="user-nickName"><%= uName %></div>
            <div class="user-id"><%= uId %></div>
            <div class="user-mypage" onclick="myPage();">마이페이지</div>
            <div class="user-coin">
                <lable>coin</lable><lable style="margin-left:15px;">20</lable>
            </div>
            <div class="user-charging">충전</div>
        </div>
        <div class="alram-wrap">
            <div class="alram-con">
                <div class="alram-img"></div>
                <div class="alram-time"></div>
                <div class="alram-msg"></div>
                <div class="alram-close"></div>
            </div>
            <div class="alram-con">
                <div class="alram-img"></div>
                <div class="alram-time"></div>
                <div class="alram-msg"></div>
                <div class="alram-close"></div>
            </div>
            <div class="alram-con">
                <div class="alram-img"></div>
                <div class="alram-time"></div>
                <div class="alram-msg"></div>
                <div class="alram-close"></div>
            </div>
        </div>
        <% } %>
    </header>
    
    <script>

	$("#toggle").click(function(){
		$(this).toggleClass("on");
		$("#resize").toggleClass("active");	
	});
    
	$(".image1").click(function(){
		$(".user-wrap").toggleClass("userOn");
    });
        
    $(".image2").click(function(){
        $(".alram-wrap").toggleClass("alon");
    });
    
    $(".image3").click(function(){
        $(".map").css({"display":"block","width":"100%","height":"100%","padding-top":"10%","opacity":"0.98", "z-index":"9"});
    });
    
    
    function myPage(){
    	location.href="<%= request.getContextPath() %>/myPage.me";
	}
    
	</script>
</body>
</html>