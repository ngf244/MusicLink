<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, gallery.model.vo.*, festival.model.vo.*, QNA.model.vo.QnA, community.model.vo.*" %>
<%
	ArrayList<Gallery> gList = (ArrayList<Gallery>)request.getAttribute("gList");
	PageInfo pigal = (PageInfo)request.getAttribute("pigal");
	
	int listCount = pigal.getListCount();
	int currentPage = pigal.getCurrentPage();
	int maxPage = pigal.getMaxPage();
	int startPage = pigal.getStartPage();
	int endPage = pigal.getEndPage();
	
	ArrayList<QnA> qList = (ArrayList<QnA>)request.getAttribute("qList");
	PageInfo piqna = (PageInfo)request.getAttribute("piqna");
	
	int listCountqna = piqna.getListCount();
	int currentPageqna = piqna.getCurrentPage();
	int maxPageqna = piqna.getMaxPage();
	int startPageqna = piqna.getStartPage();
	int endPageqna = piqna.getEndPage();
	
	ArrayList<Community> commList = (ArrayList<Community>)request.getAttribute("commList");
	PageInfo picomm = (PageInfo)request.getAttribute("picomm");
	
	int listCountcomm = picomm.getListCount();
	int currentPagecomm = picomm.getCurrentPage();
	int maxPagecomm = picomm.getMaxPage();
	int startPagecomm = picomm.getStartPage();
	int endPagecomm = picomm.getEndPage();
	
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

	<script src="../js/jquery-3.4.1.min.js"></script>
<title>나의 게시물</title>
<style>
 	/* 섹션 */
	section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:1200px; padding-top: 30px; padding-bottom:10%;}
    
    /* 내가 작성한 글/댓글 */
    .sec-menu-views{width:78%; height:90%; padding:10px; float:left; border:1px solid rgba(255,255,255,0); box-sizing: border-box;}
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif; font-size: 14pt;}
    .myPost{width:100%; padding-left:0; margin:0; margin-top:16px; background:rgba(0,0,0,0.3); font-weight: bold; color:#fff;}
    .post-nav{width:24.5%; display: inline-block; text-align: center; padding:10px 0; }
    .padding-1{padding:5px 0; color:#000; border-bottom: 0.5px dashed lightgray;}
    .post-sum{width:24.5%; display: inline-block; margin:0; padding: 0; text-align: center; vertical-align: middle; line-height: 25px;}
    .myComment{width:100%; padding-left:0; margin:0; margin-top:16px; background:rgba(0,0,0,0.3); font-weight: bold; color:#fff;}
    .comm-nav{width:24.5%; display: inline-block; text-align: center; padding:10px 0; }
    .comm-sum{width:24.5%; display: inline-block; margin:0; padding: 0; text-align: center; vertical-align: middle; line-height: 25px;}
    .views1 h3{background: #af9ce6;}
    
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
            <h3>내가 작성한 글</h3>
            <h4>갤러리 게시판</h4>
            <ul class="myPost">
                <li class="post-nav" style="width: 10%;">글 번호</li>
                <li class="post-nav" style="width: 20%;">게시판 유형</li>
                <li class="post-nav" style="width: 40%;">제목</li>
                <li class="post-nav" style="width: 20%;">작성일</li>
            </ul>
            <% if(gList.isEmpty()){ %>
					<div style="text-align: center;"><br>작성한 글이 없습니다.</div>
			<% } else{ 		
					for(Gallery g : gList){            
            %>
            <div class="padding-1">
                <div class="post-num post-sum" style="width: 10%;"><%= g.getGlCode() %></div>
                <div class="post-class post-sum" style="width: 20%;">갤러리 게시판</div>
                <div class="post-title post-sum" style="width: 40%;"><%= g.getGlTitle() %></div>
                <div class="post-time post-sum" style="width: 20%;"><%= g.getGlDate() %></div>
            </div>
            <% 		} 
            	}
            %>
			<!-- 페이징 부분 -->
			<div id="pagingarea" style="margin-top: auto;">
               	<ul class="pagination">
               		<li class="page-item prev">
               			<a class="page-link" href='<%= request.getContextPath() %>/list.mPost?currentPage=<%= currentPage-1 %>' aria-label="Previous">
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
                       	<a class="page-link" href='<%= request.getContextPath() %>/list.mPost?currentPage=<%= p %>'><%= p %></a>
                       </li>
                <% } %>
            <% } %>            					
                       <li class="page-item next">
                       	<a class="page-link" href='<%= request.getContextPath() %>/list.mPost?currentPage=<%= currentPage + 1 %>' aria-label="Next">
                       		<span aria-hidden="true">&raquo;</span>
                       		<span class="sr-only">Next</span>
                       	</a>
                       </li>
               	</ul>
			</div>              

            <h4>소통 게시판</h4>
            <ul class="myPost">
                <li class="post-nav" style="width: 10%;">글 번호</li>
                <li class="post-nav" style="width: 20%;">게시판 유형</li>
                <li class="post-nav" style="width: 40%;">제목</li>
                <li class="post-nav" style="width: 20%;">작성일</li>
            </ul>
            <% if(commList.isEmpty()){ %>
					<div style="text-align: center;"><br>작성한 글이 없습니다.</div>
			<% } else{ 		
					for(Community c : commList){            
            %>
            <div class="padding-1">
                <div class="post-num post-sum" style="width: 10%;"><%= c.getCmCode() %></div>
                <div class="post-class post-sum" style="width: 20%;">소통 게시판</div>
                <div class="post-title post-sum" style="width: 40%;"><%= c.getCmTitle() %></div>
                <div class="post-time post-sum" style="width: 20%;"><%= c.getCmDate() %></div>
            </div>
            <% 		} 
            	}
            %>
			<!-- 페이징 부분 -->
			<div id="pagingarea" style="margin-top: auto;">
               	<ul class="pagination">
               		<li class="page-item prevcomm">
               			<a class="page-link" href='<%= request.getContextPath() %>/list.mPost?currentPagecomm=<%= currentPagecomm-1 %>' aria-label="Previous">
               				<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
						</a>
                   </li>
                   
			<% for(int p = startPagecomm; p <= endPagecomm; p++){ %>
				<% if(p == currentPagecomm){ %>
                       <li class="page-item">
                       	<a class="page-link" href='#'><%= p %></a>
                       </li>
				<% } else{ %>			
                       <li class="page-item">
                       	<a class="page-link" href='<%= request.getContextPath() %>/list.mPost?currentPagecomm=<%= p %>'><%= p %></a>
                       </li>
                <% } %>
            <% } %>            					
                       <li class="page-item nextcomm">
                       	<a class="page-link" href='<%= request.getContextPath() %>/list.mPost?currentPagecomm=<%= currentPagecomm + 1 %>' aria-label="Next">
                       		<span aria-hidden="true">&raquo;</span>
                       		<span class="sr-only">Next</span>
                       	</a>
                       </li>
               	</ul>
			</div>
			
            <h4>Q&A 게시판</h4>
            <ul class="myPost">
                <li class="post-nav" style="width: 10%;">글 번호</li>
                <li class="post-nav" style="width: 20%;">게시판 유형</li>
                <li class="post-nav" style="width: 40%;">제목</li>
                <li class="post-nav" style="width: 20%;">작성일</li>
            </ul>
            <% if(qList.isEmpty()){ %>
					<div style="text-align: center;"><br>작성한 글이 없습니다.</div>
			<% } else{ 		
					for(QnA q : qList){            
            %>
            <div class="padding-1">
                <div class="post-num post-sum" style="width: 10%;"><%= q.getQnaCode() %></div>
                <div class="post-class post-sum" style="width: 20%;">Q&A 게시판</div>
                <div class="post-title post-sum" style="width: 40%;"><%= q.getQnaTitle() %></div>
                <div class="post-time post-sum" style="width: 20%;"><%= q.getQnaDate() %></div>
            </div>
            <% 		} 
            	}
            %>
			<!-- 페이징 부분 -->
			<div id="pagingarea" style="margin-top: auto;">
               	<ul class="pagination">
               		<li class="page-item prevqna">
               			<a class="page-link" href='<%= request.getContextPath() %>/list.mPost?currentPageqna=<%= currentPageqna-1 %>' aria-label="Previous">
               				<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
						</a>
                   </li>
                   
			<% for(int p = startPageqna; p <= endPageqna; p++){ %>
				<% if(p == currentPageqna){ %>
                       <li class="page-item">
                       	<a class="page-link" href='#'><%= p %></a>
                       </li>
				<% } else{ %>			
                       <li class="page-item">
                       	<a class="page-link" href='<%= request.getContextPath() %>/list.mPost?currentPageqna=<%= p %>'><%= p %></a>
                       </li>
                <% } %>
            <% } %>            					
                       <li class="page-item nextqna">
                       	<a class="page-link" href='<%= request.getContextPath() %>/list.mPost?currentPageqna=<%= currentPageqna + 1 %>' aria-label="Next">
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
				
				if(<%= currentPagecomm %> <= 1){
					var before = $('.prevcomm');
					before.attr('class', 'page-item prevcomm disabled');
				}
				
				if(<%= currentPagecomm %> >= <%= maxPagecomm %>){
					var after = $(".nextcomm");
					after.attr('class', 'page-item nextcomm disabled');
				}
				
				if(<%= currentPageqna %> <= 1){
					var before = $('.prevqna');
					before.attr('class', 'page-item prevqna disabled');
				}
				
				if(<%= currentPageqna %> >= <%= maxPageqna %>){
					var after = $(".nextqna");
					after.attr('class', 'page-item nextqna disabled');
				}
			</script>        
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>