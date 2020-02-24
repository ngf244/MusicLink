<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, artist.model.vo.*, festival.model.vo.*" %>
<%
	ArrayList<FollowArtist> list = (ArrayList<FollowArtist>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	System.out.println(startPage);
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

	<script src="../js/jquery-3.4.1.min.js"></script>	

    <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">

<title>나의 아티스트</title>
<style>
    
    /* 섹션 */
 	section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:1000px; padding-top: 30px; padding-bottom:10%;}
    
    /* 나의 아티스트 */
    .sec-menu-views{width:78%; height:90%; padding:10px; float:left; border:1px solid rgba(255,255,255,0); box-sizing: border-box;}
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif; font-size: 14pt; color: black;}

    .artistInfo{border-bottom: 1px solid rgb(209, 209, 209); margin-top: 2%; padding-left: 5%;}

    .profileBox {
        width: 120px;
        height: 120px; 
        border-radius: 70%;
        overflow: hidden;
        display: inline-block;
        background: lightgray;
    }

    .profile {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .artistDesc{display: inline-block; line-height: 30px; margin-left: 30px;}
    .views1 h3 {background: #af9ce6;}
    
     /*페이징 css*/
    #pagingarea{text-align:center; display:inline-block; margin-top:5%; margin-left: 40%}	
	
	.pagination {
	  display: flex;
	  padding-left: 0;
	  list-style: none;
	  border-radius: 0.25rem; 
	}

	.page-link {
	  position: relative;
	  display: block;
	  padding: 0.5rem 0.75rem;
	  margin-left: -1px;
	  line-height: 1.25;
	  color: #7571f9;
	  background-color: #fff;
	  border: 1px solid #dee2e6; 
	}
	
	.page-link:hover {
	    z-index: 2;
	    color: #2e28f6;
	    text-decoration: none;
	    background-color: #e9ecef;
	    border-color: #dee2e6; 
	}
	  
	.page-link:focus {
	    z-index: 2;
	    outline: 0;
	    box-shadow: 0 0 0 0.2rem rgba(117, 113, 249, 0.25); 
	}
	
	.page-link:not(:disabled):not(.disabled) {
	    cursor: pointer; 
	}

	.page-item:first-child .page-link {
	  margin-left: 0;
	  border-top-left-radius: 0.25rem;
	  border-bottom-left-radius: 0.25rem; 
	}
	
	.page-item:last-child .page-link {
	  border-top-right-radius: 0.25rem;
	  border-bottom-right-radius: 0.25rem; 
	}
	
	.page-item.active .page-link {
	  z-index: 1;
	  color: #fff;
	  background-color: #7571f9;
	  border-color: #7571f9; 
	}
	
	.page-item.disabled .page-link {
	  color: #f7fafc;
	  pointer-events: none;
	  cursor: auto;
	  background-color: #fff;
	  border-color: #dee2e6; 
	}
	
	.pagination-lg .page-link {
	  padding: 0.75rem 1.5rem;
	  font-size: 1.09375rem;
	  line-height: 1.5; 
	}
	
	.pagination-lg .page-item:first-child .page-link {
	  border-top-left-radius: 0.3rem;
	  border-bottom-left-radius: 0.3rem; 
	}
	
	.pagination-lg .page-item:last-child .page-link {
	  border-top-right-radius: 0.3rem;
	  border-bottom-right-radius: 0.3rem; 
	}
	
	.pagination-sm .page-link {
	  padding: 0.25rem 0.5rem;
	  font-size: 0.76563rem;
	  line-height: 1.5; 
	}
	
	.pagination-sm .page-item:first-child .page-link {
	  border-top-left-radius: 0.2rem;
	  border-bottom-left-radius: 0.2rem; 
	}
	
	.pagination-sm .page-item:last-child .page-link {
	  border-top-right-radius: 0.2rem;
	  border-bottom-right-radius: 0.2rem; 
	}
	
	.page-item.disabled .page-link {
	  color: #bbbbbb; 
	}
	
	.page-item .page-link:focus {
	  box-shadow: none; 
	}
  
	.sr-only {
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  overflow: hidden;
	  clip: rect(0, 0, 0, 0);
	  white-space: nowrap;
	  border: 0; 
	}
	
	.sr-only-focusable:active, .sr-only-focusable:focus {
	  position: static;
	  width: auto;
	  height: auto;
	  overflow: visible;
	  clip: auto;
	  white-space: normal; 
	}  

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>    
    
    <section style="z-index: 1;">
    <%@ include file="../common/MyPage_Menubar.jsp" %>
        
        <div class="sec-menu-views views1">
        <h3>나의 아티스트</h3>
            <% if(list.isEmpty()){ %>
            	<div>팔로잉한 아티스트가 없습니다.</div>            
            <% } else{
            		for(FollowArtist fa : list){
            %>
            <div class="artist">
                
                <div class="artistInfo">
                    <div class="profileBox">
                        <img class="profile" src="artistProfile_uploadFiles/<%= fa.getPicPath().substring(66) %>">
                    </div>
                    <div class="artistDesc">
                        <ul>
                            <li>아티스트 명 : <%= fa.getAtName() %></li>
                            <li>장르 : <%= fa.getAtGenre() %></li>
                            <li>유형 : <%= fa.getAtClass() %></li>
                            <li>한 줄 소개 : <%=fa.getAtOneLine() %></li>
                        </ul>
                    </div>                   
                </div>
            </div>
            <% 		}
            	}
            %>
            
			<div id="pagingarea">
               	<ul class="pagination">
               		<li class="page-item prev">
               			<a class="page-link" href='<%= request.getContextPath() %>/list.fat?currentPage=<%= currentPage-1 %>' aria-label="Previous">
               				<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
						</a>
                   </li>
                   
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){ %>
                       <li class="page-item">
                       	<a class="page-link" href='#'><%= p %></a>
                       </li>
				<% } else{ %>			
                       <li class="page-item">
                       	<a class="page-link" href='<%= request.getContextPath() %>/list.fat?currentPage=<%= p %>'><%= p %></a>
                       </li>
                <% } %>
            <% } %>            					
                       <li class="page-item next">
                       	<a class="page-link" href='<%= request.getContextPath() %>/list.fat?currentPage=<%= currentPage + 1 %>' aria-label="Next">
                       		<span aria-hidden="true">&raquo;</span>
                       		<span class="sr-only">Next</span>
                       	</a>
                       </li>
               	</ul>
			</div>              
            
        </div>
			<script>
				if(<%= currentPage %> <= 1){
					var before = $('.prev');
					before.attr('class', 'page-item prev disabled');
				}
				
				if(<%= currentPage %> >= <%= maxPage %>){
					var after = $(".next");
					after.attr('class', 'page-item next disabled');
				}				
			</script>        
        
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>
    
	<%@ include file="../common/footer.jsp" %>
</body>
</html>