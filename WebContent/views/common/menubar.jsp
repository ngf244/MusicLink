<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, payment.model.vo.*, java.util.ArrayList, notice.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Manager loginManager = (Manager)session.getAttribute("loginManager");
	PayMent payment = (PayMent)session.getAttribute("payment");
	ArrayList<Notice> nolist = (ArrayList<Notice>)session.getAttribute("list");
	
	String userclass = "";
	if(loginUser != null) {
		userclass = loginUser.getUserClass();
	}
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
            <a href="<%= request.getContextPath() %>/index.jsp">
				<img src="<%= request.getContextPath() %>/img/logoml.png" style="width:180px; height:100px;">
			</a> 
            </div>
            <div id="toggle">
                <div class="span" id="one"></div>
                <div class="span" id="two"></div>
                <div class="span" id="three"></div>
            </div>
            <div class="log-inOut">

            	<% if (loginUser == null && loginManager == null){ %>
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
                        <li class="menu-h"><a href="<%= request.getContextPath() %>/views/company/ssj_companyInfo.jsp">About us</a></li>
                        <li class="menu-h"><a href="<%= request.getContextPath() %>/list.faq">F A Q</a></li>
                        <li class="menu-h"><a href="<%= request.getContextPath() %>/list.qna">Q &#38; A</a></li>
                    </ul>
                </li>
                <li class="m-name2 m-name">
                    <a href="#" class="m-mname m-mname2">A r t i s t</a>
                    <ul class="hidden-manu2 drop">
                        <li class="menu-h"><a href="<%= request.getContextPath() %>/ArtistList.go">A - l i s t</a></li>
                        <li class="menu-h"><a href="<%= request.getContextPath() %>/list.atrank">r a n k</a></li>
                    </ul>
                </li>
                <li class="m-name3 m-name">
                    <a href="#" class="m-mname m-mname3">F e s t i v a l</a>
                    <ul class="hidden-manu3 drop">
                        <li class="menu-h"><a href="<%= request.getContextPath() %>/list.fes">F - l i s t</a></li>
                    <% if (loginUser != null) { %>
                    <% if(loginUser.getUserClass().equals("2")) { %>
                       <li class="menu-h"><a href="<%= request.getContextPath() %>/aplist.fes">F - A p p r o a c h</a></li>
                    <% } %>
                    <% } %>
                    </ul>
                </li>
                <li class="m-name5 m-name">
                	<% if(loginManager != null) { %>
                    <a href="<%= request.getContextPath() %>/showUserList.au" class="m-mname m-mname4">A D M I N</a>
                    <% } else if(loginUser != null) { %>
                    <a href="<%= request.getContextPath() %>/myPage.me" class="m-mname m-mname4">M Y P A G E</a>
                    <% } %>
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
        </div>
        
        
        <% if((request.getRequestURI()).indexOf("festival") != -1 && (request.getRequestURL()).indexOf("Update") == -1 && (request.getRequestURL()).indexOf("Enroll") == -1) { %>
		<% if (loginUser != null) { %>
			<% if(loginUser.getUserClass().equals("3")) { %>
				<div class="side-icon-right">
				<div class="image4 icon">
					<img src="<%= request.getContextPath() %>/img/add.png" alt="" />
				</div>
			           </div>
			<% } %>
		<% } %>
		<% } %>
        
        
        
        
        <div class="side-text">
                <p>&#169; 2020 MUSICLINK <sapn class=>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</sapn> <%= userclass %></p>
            </div>
        <% if(loginUser != null){
        	String uName = loginUser.getUserName();
    		String uId = loginUser.getUserId();
       	%>

        <div class="user-wrap">
            <div class="user-nickName"><%= uName %></div>
            <div class="user-id"><%= uId %></div>
            <div class="user-coin">
                <label>coin</label><div style="margin-left:15px; display: inline-block;" class="u-coin" ></div>
            </div>
            <div class="user-mypage" onclick="myPage();">마이페이지</div>
            <div class="user-charging" onclick="purchaset();">충 전</div>
        </div>
        <div class="alram-wrap">
        	<%-- <% if(nolist.isEmpty()){ %>
	            	<div>알림 내역이 없습니다.</div> --%>
			<% 
            		for(Notice n : nolist){
            %>
            <div class="alram-con">
                <div class="alram-img">
                	<img src="<%= request.getContextPath() %>/img/bell.png" class="bell-img" />
                </div>
                <div class="alram-msg">
                	<% 
	                	String noticeClass = "";
	                	switch(n.getNoticeClass()) {
	                	case "1": noticeClass ="팔로잉(following)"; break;
	                	case "2": noticeClass ="러브콜(receive)"; break;
	                	case "3": noticeClass ="러브콜(accept)"; break;
	                	case "4": noticeClass ="행사지원(apply)"; break;
	                	case "5": noticeClass ="행사지원수락(accept)"; break;
	                	}
                	%>
                <%= n.getNoticeContents() %>
                </div>
                <div class="alram-close" id="arClose">x</div>
            </div>
            <%	    }
           	   
           	%> 
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
		$.ajax({
			url: '<%= request.getContextPath() %>/RefreshCoin.me',
			type: 'get',
			success: function(data){
				$('.u-coin').text(data);
				console.log(data);
			}
		});		
    });
        
    $(".image2").click(function(){
        $(".alram-wrap").toggleClass("alon");
    });
    
    $(".image3").click(function(){
        $(".map").css({"display":"block","width":"100%","height":"100%","padding-top":"10%","opacity":"0.98", "z-index":"9"});
    });
    
    $(".image4").click(function(){
    	location.href = "<%=request.getContextPath()%>/views/festival/FestivalEnroll.jsp";
    });
    
   	$(".alram-close").click(function(){
       	$(this).parent().css("display","none");
    });
    
    
    
    function myPage(){
    	location.href="<%= request.getContextPath() %>/myPage.me";
	}
    function purchaset(){
    	location.href="<%= request.getContextPath() %>/views/member/Purchaset.jsp";
	}
    
	</script>
</body>
</html>