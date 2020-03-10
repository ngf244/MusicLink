<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, artist.model.vo.ArtistRank, festival.model.vo.PageInfo"%>
<%
	ArrayList<ArtistRank> rList = (ArrayList<ArtistRank>)request.getAttribute("rList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage(); 
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
<title>아티스트 랭킹</title>
<style>
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height: 900px;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:135px; left:35%; color: rgb(224, 224, 224);} 
    
    #categoryArea{position: absolute; top: 3%; left: 3%; display: inline;}
    #contentArea{padding-top: 12%; text-align:center;}

    #inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
    #inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; top: 5%; margin-left:1%;}
    
    .promotionArea{margin-top:1%;}
    .subTitle{font-size:20px; font-weight:bold;}
    #hrstyle{border:0.4px solid lightgray; margin-top:1%;}

    .ar-line{width:100%; height:40px; background:rgba(0,0,0,0.8);}
    .line-box{width:80%; margin: 0 auto; height:40px; background:rgba(0,0,0,0.7); }
    .select-box{width:25%; height:30px; border-radius: 7px; margin-top:5px; font-size:12px; text-align: center; float:left;}

    .ranking-box{margin: 2%; height:453px;}
    .vedio-left{width:34%; margin-right:2%; height:inherit; background:#000; float:left;}
    .rank-right{width:64%; height:inherit; float:right; box-sizing: border-box; border-top:2px solid #000; border-bottom:2px solid #000;}
    .rank-left-1{width:15%; height:inherit; float:left;}
    .lrank{width:100%; background:rgba(100,100,100,0.4); height:89px; line-height: 89px; text-align: center; font-size:25px; font-weight: bold; border-bottom:1px solid #000;}
    .lr-mid1{border-top:1px solid #000; border-bottom:1px solid #000;}
    .lr-mid3{border-top:1px solid #000; border-bottom:1px solid #000;}
    
    .rank-right-1{width:85%; height:inherit; float: right;}
    .rrank{width:100%; background:#fff; height:89px; overflow: hidden;}
    .rr-top{border-bottom:1px solid #000;}
    .rr-mid1{border-bottom:1px solid #000;}
    .rr-mid2{border-bottom:1px solid #000;}
    .rr-mid3{border-bottom:1px solid #000;}
    
    .at-photo{width: 14%; height: 100%; margin-left:1%; border-radius: 30px; overflow: hidden; float:left;}
    .at-photo > img{width:100%; height: inherit;}
    .at-nickName{width:20%; height:80%; float:left; margin-left:1%; display: inline-block; text-align: center; padding-top: 3%; font-weight: bold; line-height: 45px;}
    .at-nickName >p{margin:0; padding:5px 0;}
    .genre{width:25%; margin-left:1%; height: inherit; float:left; text-align: center; line-height: 89px; font-size:16px; font-weight: bold;}
    .at-icon{width:37%; height:80%; float: left; padding-top:3%;}
    .at-icon-wrap{width:70%;; margin:0 auto;}
    .at-icon-wrap > a{width:25%; float:left; margin-left:5%;}
    .at-icon-wrap > a > img{width:100%;}
    #pagingarea{text-align:center; display:inline-block;}

    .paging .hide {display:block;height:0;width:0;font-size:0;line-height:0;margin:0;padding:0;overflow:hidden;}
    .paging{padding:19px;text-align:center;}
    .paging a{display:inline-block;width:23px;height:23px;padding-top:2px;vertical-align:middle;}
    .paging a:hover{text-decoration:underline;}
    .paging .btn_arr{text-decoration:none;}
    .paging .btn_arr, .paging .on{margin:0 3px;padding-top:0;border:1px solid #ddd; border-radius:30px;}
    .paging .on{padding-top:1px;height:22px;color:#fff;font-weight:bold;background:#000;}
    .paging .on:hover{text-decoration:none;}
    
    .btn_style{margin-left: 0; border-radius: 0.25rem; position: relative; padding: 0.5rem 0.75rem;
        line-height: 1.25; color: #7571f9; background-color: #fff; border: 1px solid #dee2e6;}   
	
	/* 페이징 css */
    #pagingarea{text-align:center; display:inline-block;}	
	
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
       <div id="categoryArea">
            <div id="block"></div><br>
            <label id="inBigCategory">ARTIST</label>
            <label id="inSmallCategory"> - Rank</label>
        </div>

        <div id="contentArea">
            <div class="promotionArea">
                <label class="subTitle">아티스트 랭킹</label><br>
                <hr id="hrstyle">
                
                    <div class="ar-line">
                    <div class="line-box">
                    <select class="select-box">
                        <option value="전체 순위">전체 순위</option>
                        <option value="발라드 순위">발라드 순위</option>
                        <option value="댄스 순위">댄스 순위</option>
                        <option value="랩/힙합 순위">랩/힙합 순위</option>
                        <option value="ROCK 순위">ROCK 순위</option>
                        <option value="트로트 순위">트로트 순위</option>
                        <option value="기타 순위">기타 순위</option>
                    </select>
                    </div>
                    </div>
           </div>

           <div class="ranking-box">
                <div class="vedio-left"><iframe width="400px" height="450px" src="https://www.youtube.com/embed/SdDqpb6r0vM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
                <div class="rank-right">
                    <div class="rank-left-1">
                    <% if(rList.isEmpty()){ %>
            		<div>등록된 아티스트가 없습니다.</div>            
            		<% } else{
            				for(ArtistRank ar : rList){
            		%>  
                        <div class="lr-top lrank"><%= ar.getRank() %></div>
                    	<% 	}
            		   }
            		%>                        
                    </div>
                    <div class="rank-right-1">
                    <% if(rList.isEmpty()){ %>
            		<div>등록된 아티스트가 없습니다.</div>            
            		<% } else{
            				for(ArtistRank ar : rList){
            		%>
                    
                        <div class="rr-top rrank">
                            <div class="at-photo" onclick="">
                            	<input type="hidden" name="atCode" value="">
                                <img src="artistProfile_uploadFiles/<%= ar.getAtPicPath() %>">
                            </div>
                            <div class="at-nickName">
                                <%= ar.getAtName() %>
                            </div>
                            <div class="genre">
                                <%= ar.getAtGenre() %>
                            </div>
                            <div class="at-icon">
                                <div class="at-icon-wrap">
                                    <a href="<%= ar.getAtFacebook() %>" target="_blank">
                                        <img src="<%= request.getContextPath() %>/img/facebook.png">
                                    </a>
                                    <a href="<%= ar.getAtInsta() %>" target="_blank">
                                        <img src="<%= request.getContextPath() %>/img/instagram.png">
                                    </a>
                                    <a href="<%= ar.getAtTwitter() %>" target="_blank">
                                        <img src="<%= request.getContextPath() %>/img//twitter.png">
                                    </a>
                                </div>
                            </div>
                        </div>
                
                    	<% }
            		}
            	%>
            	</div>
            </div>
        </div>
			<div id="pagingarea">
               	<ul class="pagination">
               		<li class="page-item prev">
               			<a class="page-link" href='<%= request.getContextPath() %>/list.atrank?currentPage=<%= currentPage-1 %>' aria-label="Previous">
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
                       	<a class="page-link" href='<%= request.getContextPath() %>/list.atrank?currentPage=<%= p %>'><%= p %></a>
                       </li>
                <% } %>
            <% } %>            					
                       <li class="page-item next">
                       	<a class="page-link" href='<%= request.getContextPath() %>/list.atrank?currentPage=<%= currentPage + 1 %>' aria-label="Next">
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
	
	$('.select-box').change(function() {
        var genre = $(this).val();
        
        location.href="<%= request.getContextPath() %>/list.atrank?genre=" + genre;
    })
</script>
</body>
</html>