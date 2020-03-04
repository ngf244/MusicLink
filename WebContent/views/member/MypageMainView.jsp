<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.*, artist.model.vo.*, festival.model.vo.*, QNA.model.vo.QnA, gallery.model.vo.*"%>
<%
	Member member = (Member)request.getAttribute("member");
	Artist artist = (Artist)request.getAttribute("artist");
	String atFileName = (String)session.getAttribute("atFileName");
	System.out.println(member);
	
	ArrayList<FollowArtist> list = (ArrayList<FollowArtist>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();	
		
	System.out.println("아티스트 파일 명 : " + atFileName);
	
	String userCode = member.getUserCode();
	String userId = member.getUserId();
	String userName = member.getUserName();
	String userBirth = member.getUserBirth();
	String userGender = member.getUserGender();
	String userEmail = member.getUserEmail();
	String userPhone = member.getUserPhone();
	String userClass = member.getUserClass();
		
	String division = "";
	
	switch(userClass) {
	case "1": division = "일반회원"; break;
	case "2": division = "아티스트"; break;
	case "3": division = "기획자"; break;
	}
	
	String imgPath = "";
	if(userGender != null) {
		switch(userGender) {
		case "남자": imgPath = "img/default_profile_male.png"; break;
		case "여자": imgPath = "img/default_profile_female.png"; break;
		}
	} else {
		imgPath = "img/default_profile_male.png";
	}

	
	if(userClass.equals("2")) {
		//imgPath = artist.getAtPicPath().substring(39);
		//System.out.println(imgPath);
		imgPath = "artistProfile_uploadFiles/" + atFileName;  
	}
	
	ArrayList<Gallery> gList = (ArrayList<Gallery>)request.getAttribute("gList");
	ArrayList<QnA> qList = (ArrayList<QnA>)request.getAttribute("qList");
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<script src="../../js/jquery-3.4.1.min.js"></script>

<title>마이페이지</title>
<style>
 	/* 섹션 */
	section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:1000px; padding-top: 30px; padding-bottom:10%;}
    
    /* 마이페이지 메인 */
    .sec-menu-views{width:78%; height:90%; padding:10px; float:left; border:1px solid rgba(255,255,255,0); box-sizing: border-box;}
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif; font-size: 14pt;}


    .userInfo{margin-left: 10%; width: 80%; border-bottom: solid 1px rgb(189, 189, 189); padding-bottom: 3%;}
    .profileBox {
        margin-left: 5%;
        width: 200px;
        height: 200px; 
        border-radius: 70%;
        overflow: hidden;
        display: inline-block;
    }
    .profile {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .profileInfo{display: inline-block; margin-left: 10%; line-height: 20px;}
    
    .listArea{line-height: 30px;}
    .postInfo{line-height: 30px; margin-left: 10%; width: 75%; padding-left: 5%; border-bottom: solid 1px rgb(189, 189, 189); padding-bottom: 3%;}
    .write{width: 45%; display: inline-block;}
    .comment{width: 45%; display: inline-block;}
    .write a {display: inline-block;}
    .comment a {display: inline-block;}
    .followView{width: 100%; height: 40%; margin-left: 10%;}
    
    .followingAT{width:100%; padding-left:0; margin:0; margin-top:16px; background:rgba(0,0,0,0.3); font-weight: bold; color:#fff;}
    .follow-nav{width:18%; height: 35px; vertical-align: middle; line-height: 35px; display: inline-block; text-align: center; padding:10px 0; }
    .padding-1{padding:5px 0; color:#000; border-bottom: 0.5px dashed lightgray;}
    .follow-sum{width:18%; height: 30px; vertical-align: middle; line-height: 30px; display: inline-block; margin:0; padding: 0; text-align: center;}
    .btn1{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: #7780b7; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;    
    }
    .selectBtn{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: lightgray; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;    
    }    
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
           
            <div class="userInfo">
                <div class="profileBox" style="background: #e8c8ac;">
                    <img class="profile" src="<%= imgPath%>">
                </div>
                <div class="profileInfo">
                    <h4 style="display: inline-block;"><%= userName %>님</h4>&nbsp;&nbsp;
                    <button onclick="location.href='views/member/PwdCheckForm.jsp'" class="btn1">정보 수정</button>
                    <ul class="listArea">
                        <li>회원구분 - <%= division %> </li>
                        <li>전화번호 -  <%= userPhone %> </li>
                        <li>이메일 -  <%= userEmail %> </li>
                        
                        <% if(userBirth != null) { %>
                        <li>생년월일 -  <%= userBirth %> </li>
                        <% } %>
                    </ul>
                    <% if(division.equals("일반회원")){ %>
                    <p>회원님은 일반회원입니다. 행사 등록 및 행사 지원을 하기 위해서는 <br>
                        아티스트 등록, 행사기획자 등록 메뉴를 이용해주세요.
                    </p>
                    <% } else if(division.equals("아티스트")){ %>
                    <p>회원님은 아티스트입니다. 행사 지원을 할 수 있고 기획자로부터 <br>
                    러브콜을 받을 수 있습니다.                     
                    </p>
                    <% } else if(division.equals("기획자")){ %>
                    <p>회원님은 행사 기획자입니다. 행사를 등록하여 아티스트를 모집할 수 있습니다.<br>
                    또한 섭외하길 원하는 아티스트에게 러브콜을 보낼 수 있습니다.
                    </p>
                    <% } %>
                </div>
                                          
            </div>
            
            <div class="postInfo">
                <div class="write">
                    <h4><b>갤러리 게시판</b></h4>
                        <% if(gList.isEmpty()){ %>
                        <div>작성하신 글이 없습니다.</div>
                        <% } else{
            					for(Gallery g : gList){
            			%>
                        <div onclick="goGalDetail();" style="cursor: pointer;">- <%= g.getGlTitle() %></div>
				        <input type="hidden" name="qnaCode" value="">
				        <%		}
		            	   }
		            	%>                                                    
                </div>
                <div class="comment" style="float: left;">
                    <h4><b>Q&A</b></h4>
                       <% if(qList.isEmpty()){ %>
                        <div>작성하신 글이 없습니다.</div>
                        <% } else{
            					for(QnA q : qList){
            			%>
                        <div onclick="goQnaDetail();" style="cursor: pointer;"><input type="hidden" name="qnaCode" value="">- <%= q.getQnaTitle() %></div>
				        
				        <%		}
		            	   }
		            	%>
                </div>
                <div style="clear:both:"></div>
            </div>

            <div class="followView">
              	<div class="sec-menu-views views2">
		            <h4>팔로잉 아티스트</h4>
		            <input type="hidden" name="userCode" value="<%= userCode %>">
		            <ul class="followingAT">
		                <li class="follow-nav">선택</li>
		                <li class="follow-nav">아티스트명</li>
		                <li class="follow-nav" style="width: 190px;">장르</li>
		                <li class="follow-nav">유형</li>
		                <li class="follow-nav">상태</li>
		            </ul>
	            <% if(list.isEmpty()){ %>
	            	<div style="text-align: center;">팔로잉한 아티스트가 없습니다.</div>
				<% } else{
            			for(FollowArtist fa : list){
            	%>
		            <div class="padding-1">
		                <div class="follow-time follow-sum"><input type="checkbox" name="select" value="<%= fa.getAtCode() %>"><input type="hidden" class="at_code" name="at_code" value="<%= fa.getAtCode() %>"></div>
		                <div class="artistName follow-sum"><%= fa.getAtName() %></div>
		                <div class="Genre follow-sum" style="width: 190px;"><%= fa.getAtGenre() %></div>
		                <div class="local follow-sum"><%= fa.getAtClass() %></div>
		                <div class="followYN follow-sum">팔로우</div>
		            </div>
		         <%		}
            	   }
            	 %>
                    <br>
                    <div class="selectArea" style="float: right;">
                        <button class="selectBtn" id="all" onclick="selectAll();">전체선택</button>
                        <button class="selectBtn" id="clear" onclick="clearAll();">전체해제</button>
                        <button class="selectBtn" id="delete" onclick="unfollow();">삭제</button>
                    </div>
                    <div style="clear: both;"></div>
			<!-- 페이징 부분 -->
			<div id="pagingarea" style="margin-top: auto;">
               	<ul class="pagination">
               		<li class="page-item prev">
               			<a class="page-link" href='<%= request.getContextPath() %>/myPage.me?currentPage=<%= currentPage-1 %>' aria-label="Previous">
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
                       	<a class="page-link" href='<%= request.getContextPath() %>/myPage.me?currentPage=<%= p %>'><%= p %></a>
                       </li>
                <% } %>
            <% } %>            					
                       <li class="page-item next">
                       	<a class="page-link" href='<%= request.getContextPath() %>/myPage.me?currentPage=<%= currentPage + 1 %>' aria-label="Next">
                       		<span aria-hidden="true">&raquo;</span>
                       		<span class="sr-only">Next</span>
                       	</a>
                       </li>
               	</ul>
			</div>                    
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
            </div>

        </div>
        <script>
        	function selectAll(){
        		$('[name=select]').prop('checked', true);
        	}
        	
        	function clearAll(){
        		$('[name=select]').prop('checked', false);
        	}
        </script>
        <script>
        	function unfollow(){
        		if(confirm("언팔 하시겠습니까?")){
            		var userCode = $("input[name='userCode']").val();
            		var at_code_amount = $("input[name='select']:checked").length;
            		console.log(at_code_amount);
            	    
            		var atCode = new Array(at_code_amount);
            	    
            		for(var i = 0; i < at_code_amount; i++){                          
            	    	atCode[i] = $("input[name='select']:checked")[i].value;
            	    	console.log(atCode[i])
            	    }
        			
            		$.ajax({
        				url: '<%= request.getContextPath() %>/unfollow.at',
        				data: {userCode:userCode, atCode:atCode},
        				type: 'get',
        				success: function(data){
        					location.href='<%= request.getContextPath() %>/myPage.me'
        				}
        			});
        		}
        		

        	}
        	
        	function goQnaDetail(){
            	var qnaCode = $(this).children().eq(0).val();
            	console.log(qnaCode);
            	
            	location.href='<%= request.getContextPath() %>/detail.qna?qnaCode=' + qnaCode;       		
        	}
        	
        	function goGalDetail(){
        		var galCode = $(this).children().eq(0).val();
        		console.log(galCode);
        		
        		location.href='<%= request.getContextPath() %>/detail.gal?galCode=' + galCode;  
        	}
        </script>

        
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>
    
	<%@ include file="../common/footer.jsp" %>    

</body>
</html>