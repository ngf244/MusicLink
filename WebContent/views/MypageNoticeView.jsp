<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<script src="../js/jquery-3.4.1.min.js"></script>    

<title>알림창 HISTROY</title>
<style>
 	/* 섹션 */
	section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:1200px; padding-top: 30px; padding-bottom:10%;}
        
    /* 알림창 */
    .sec-menu-views{width:78%; height:90%; padding:10px; float:left; border:1px solid rgba(255,255,255,0); box-sizing: border-box;}
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif; font-size: 14pt;}
    .notice{width:100%; padding-left:0; margin:0; margin-top:16px; background:rgba(0,0,0,0.3); font-weight: bold; color:#fff;}
    .notice-nav{width:24.5%; display: inline-block; text-align: center; padding:10px 0;}
    .padding-1{padding:5px 0; color:#000; border-bottom: 0.5px dashed lightgray;}
    .notice-sum{width:24.5%; display: inline-block; margin:0; padding: 0; text-align: center; vertical-align: middle; line-height: 25px;}
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
	<%@ include file="common/menubar.jsp" %>
    
    <section style="z-index: 1;">
	<%@ include file="common/MyPage_Menubar.jsp" %>
        
        <div class="sec-menu-views views1">
            <h3>알림창 </h3>
            <ul class="notice">
                <li class="notice-nav">알림시간</li>
                <li class="notice-nav">유형</li>
                <li class="notice-nav">보낸사람</li>
                <li class="notice-nav">메시지 내용</li>
            </ul>
            <div class="padding-1">
                <div class="notice-time notice-sum">2020-02-03-21-32-42</div>
                <div class="notice-class notice-sum">러브콜</div>
                <div class="sender notice-sum">행사기획자 아이디</div>
                <div class="msg notice-sum">00님이 러브콜을 보냈습니다.</div>
            </div>
            <div class="padding-1">
                <div class="notice-time notice-sum">2020-01-03-06-52-37</div>
                <div class="notice-class notice-sum">팔로잉</div>
                <div class="sender notice-sum">회원 아이디</div>
                <div class="msg notice-sum">00님이 팔로우 하셨습니다.</div>
            </div>
            <div class="padding-1">
                <div class="notice-time notice-sum">2020-01-01-02-52-12</div>
                <div class="notice-class notice-sum">행사지원신청</div>
                <div class="sender notice-sum">아티스트 아이디</div>
                <div class="msg notice-sum">00님이 행사지원신청을 하셨습니다.</div>
            </div>
            <div class="padding-1">
                <div class="notice-time notice-sum">2020-01-01-01-01-01</div>
                <div class="notice-class notice-sum">관리자메시지</div>
                <div class="sender notice-sum">관리자 아이디</div>
                <div class="msg notice-sum">Welcome to MusicLink</div>
            </div>

			<div id="pagingarea">
               	<ul class="pagination">
               		<li class="page-item">
               			<a class="page-link" href="#" aria-label="Previous">
               				<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
						</a>
                       </li>
                       <li class="page-item">
                       	<a class="page-link" href="#">1</a>
                       </li>
                       <li class="page-item">
                       	<a class="page-link" href="#">2</a>
                       </li>
                       <li class="page-item">
                       	<a class="page-link" href="#">3</a>
                       </li>
                       <li class="page-item">
                       	<a class="page-link" href="#" aria-label="Next">
                       		<span aria-hidden="true">&raquo;</span>
                       		<span class="sr-only">Next</span>
                       	</a>
                       </li>
               	</ul>
			</div>   
			              
        </div>
        
    </section>
    <h1 class="htext">M Y P A G E</h1>
    <div class="clear-both"></div>
    
	<%@ include file="common/footer.jsp" %>
</body>
</html>