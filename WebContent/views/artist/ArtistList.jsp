<%@page import="festival.model.vo.PageInfo"%>
<%@page import="artist.model.vo.Artist"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Artist> arr = (ArrayList<Artist>)request.getAttribute("arr");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	System.out.println(pi);
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String G = (String)request.getAttribute("Genre");
	String o1 = "";
	String o2 = "";
	String o3 = "";
	String o4 = "";
	String o5 = "";
	String o6 = "";
	String o7 = "";
	switch(G){
	case "전체" : o1 = "selected"; break;
	case "댄스" : o2 = "selected"; break;
	case "발라드" : o3 = "selected"; break;
	case "힙합" : o4 = "selected"; break;
	case "락" : o5 = "selected"; break;
	case "트로트" : o6 = "selected"; break;
	case "기타" : o7 = "selected"; break;
	}
%>
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
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:135px; left:35%; color: rgb(224, 224, 224);}

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
    .follow{font-size:11px; margin-top:1.5px; height:30px; width:50%; float:left;}
    .request{font-size:11px; margin-top:1.5px; height:30px; width:50%; float:right;}
    #hrstyle{border:0.4px solid lightgray; margin-top:1%;}
   
    .ar-line{width:100%; height:40px; background:rgba(0,0,0,0.8);}
    .line-box{width:80%; margin: 0 auto; height:40px; background:rgba(0,0,0,0.7); }
    .selectbox{width:25%; height:30px; border-radius: 7px; margin-top:5px; font-size:12px; text-align: center; float:left;}

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
                    <select class="selectbox">
                        <option value="전체" <%=o1 %>>전체</option>
                        <option value="댄스" <%=o2 %>>댄스</option>
                        <option value="발라드" <%=o3 %>>발라드</option>
                        <option value="힙합" <%=o4 %>>랩/힙합</option>
                        <option value="락" <%=o5 %>>락</option>
                        <option value="트로트" <%=o6 %>>트로트</option>
                        <option value="기타" <%=o7 %>>기타</option>
                    </select>
                    </div>
                </div>
            </div>

            <script>
                $('.selectbox').change(function () {
                    var Genre = $(this).val();
                    location.href="<%=request.getContextPath()%>/ArtistList.go?Genre="+Genre;
                })

                function fol_click(it){
                    if (confirm("팔로우 하시겠습니까?") == true){    //확인
                        var artistCode = $(it).prev().val();
                        console.log(artistCode);
                        $.ajax({
                            url : '<%=request.getContextPath()%>/artistFollow.do',
                            data : {artistCode : artistCode},
                            type : 'get',
                            success : function(data){
                                console.log(data);
                                alert(data);
                            }
                        })
                    }else{   //취소
                        return;
                    }
                }

                function fes_click(it){
                <% System.out.println(loginUser);%>
                <% if(loginUser != null && loginUser.getUserClass().equals("3")){%>
	                if (confirm("행사요청을 보내시겠습니까?") == true){    //확인
                        console.log(it);
                        var artistCode = $(it).prev().prev().val();
                        console.log(artistCode);
                        windowObj = window.open("views/artist/lovecallform.jsp", "message", "width=500, height=300");
                        window.setTimeout(function(){
                            windowObj.document.getElementById('artistCode').value = artistCode;
                        }, 500);
	                }else{   //취소
	                    return;
	                }
	            <%}else{%>
	            	alert("기획자만 이용 가능합니다.");
	            <%}%>
              
              
              <%--   <% if(loginUser != null){%>
                if(<%=loginUser.getUserClass()%>!=3){
                 	$('request').attr('disabled','true');
                }
                <%}else{%>
                    $('request').attr('disabled','true');
                <%}%> --%>
            }
            </script>

                <div class="promotionImgArea">
                <%for(int i=0; i<arr.size(); i++){ %>
                    <div class="promotionImg">
                   		<img src="<%=request.getContextPath() %>/artistProfile_uploadFiles/<%=arr.get(i).getAtPicPath()%>" style="width: 100%; height: 250px">
                    	<input type="hidden" value="<%=arr.get(i).getAtCode()%>">
                        <button class="follow" type="button" id="fol<%=i %>" onclick="fol_click(this);">팔로우</button>
                        <button class="request" type="button" id="fes<%=i %>" onclick="fes_click(this);">행사요청</button>
                    </div>
                <%} %>
                <br>
                    <input type="button" value=&lt id="beforeBtn" onclick="location.href='<%= request.getContextPath() %>/ArtistList.go?currentPage=<%=currentPage-1 %>&Genre=<%=G%>'">
	                <script>
					if(<%= currentPage %> <= 1){
						var before = $('#beforeBtn');
						before.attr('disabled', 'true');
					}
					</script>
            <% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
					<button id="choosen" disabled><%= p %></button>
				<% } else{ %>
					<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/ArtistList.go?currentPage=<%= p %>&Genre=<%=G%>'"><%= p %></button>
				<% } %>
			<% } %>
                    <input type="button" value=&gt id="afterBtn" onclick="location.href='<%= request.getContextPath() %>/ArtistList.go?currentPage=<%=currentPage+1 %>&Genre=<%=G%>'">
                    <script>
					if(<%= currentPage %> == <%= maxPage%>){
						var before = $('#afterBtn');
						before.attr('disabled', 'true');
					}
					</script>
            </div>
        </div>
    </section>
    <h1 class="htext" align="center">A - l i s t</h1>
    
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