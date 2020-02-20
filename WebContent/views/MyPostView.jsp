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
<title>나의 게시물</title>
<style>
    
    
    /* 섹션 */
    .section-txt{font-size:60px; width:45%; margin:0 auto; font-weight: bold; color:#fff; text-shadow: 1px 1px 15px #ccc;
                    position: absolute; bottom:-25%; left:28%;}
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:1000px; padding-top: 30px;} 
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top: 31%; left:34%; color: rgb(224, 224, 224);} 
    
    
    /* 사이드 메뉴 */
    .sec-line{width:4%; height:5px; background: yellow; margin:0; padding:0; margin-left:5%; margin-top:2%;}
    .sec-mtxt{margin-left:5%; margin-top: -15px;}
    .sec-mtxt > p{ display: inline-block; font-size:20px;}
    .sec-nav{width:22%; height:85%; border-right: 1px solid rgba(0,0,0,0.4); box-sizing: border-box; float:left;}
    .smenu{color:#ccc; font-size: 30px; margin:0; margin-top:20px;}
    .s-smenu{font-size:14px;margin-top:20px; color:#000;}
    .s-smenu > li{padding:5px 10px;}    
    
    /* 내가 작성한 글/댓글 */
    .sec-menu-views{width:78%; height:90%; padding:10px; float:left; border:1px solid rgba(255,255,255,0); box-sizing: border-box;}
    .views1{display: block; font-family: 'Noto Sans KR', sans-serif;}
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
	<%@ include file="common/menubar.jsp" %>    
    
    <section style="z-index: 1;">
    <%@ include file="common/MyPage_Menubar.jsp" %>	
        <!-- <div class="sec-line"></div>
        <h1 class="sec-mtxt">MyPage<p>-post&comment</p></h1>
        <ul class="sec-nav">
            <li class="sec-menu-1 smenu">INFORMATION
                <ul class="s-smenu">
                    <li><a href='PwdCheckForm.jsp'>회원정보 열람/수정/탈퇴</a></li>
                    <li><a href='MyPostView.jsp'>내가 작성한 글/댓글</a></li>
                    <li><a href='MypageNoticeView.jsp'>알람창</a></li>
                </ul>
            </li>
            <li class="sec-menu-2 smenu">FOLLOW
                <uL class="s-smenu">
                    <li><a href='MyArtistView.jsp'>나의 아티스트</a></li>
                    <li><a href='MyArtistSchedule.jsp'>팔로잉 아티스트의 행사</a></li>
                </uL>
            </li>
            <li class="sec-menu-3 smenu">BECOME
                <ul class="s-smenu">
                    <li><a href='BecomeArtistForm.jsp'>아티스트 등록</a></li>
                    <li><a href='BecomePlannerForm.jsp'>행사기획자 등록</a></li>
                </ul>
            </li>
            <li class="sec-menu-4 smenu">EVENT-1
                <ul class="s-smenu">
                    <li>공연스케줄</li>
                    <li>지원한 행사</li>
                    <li>러브콜(receive)</li>
                    <li>행사 후기</li>
                </ul>
            </li>
            <li class="sec-menu-5 smenu">EVENT-2
                <ul class="s-smenu">
                    <li>등록한 행사</li>
                    <li>러브콜(send)</li>
                    <li>아티스트 후기</li>
                </ul>
            </li>
        </ul> -->
        
        <div class="sec-menu-views views1">
            <h3>내가 작성한 글</h3>
            <ul class="myPost">
                <li class="post-nav">글 번호</li>
                <li class="post-nav">게시판 유형</li>
                <li class="post-nav">제목</li>
                <li class="post-nav">작성일</li>
            </ul>
            <div class="padding-1">
                <div class="post-num post-sum">3</div>
                <div class="post-class post-sum">Q&A게시판</div>
                <div class="post-title post-sum">아티스트 등록은 어떻게 하나요?</div>
                <div class="post-time post-sum">2020-02-03-22-11-21</div>
            </div>
            <div class="padding-1">
                <div class="post-num post-sum">2</div>
                <div class="post-class post-sum">소통게시판</div>
                <div class="post-title post-sum">처음으로 글 올립니다!</div>
                <div class="post-time post-sum">2020-02-03-21-32-42</div>
            </div>
            <div class="padding-1">
                <div class="post-num post-sum">1</div>
                <div class="post-class post-sum">갤러리게시판</div>
                <div class="post-title post-sum">1월 공연 사진</div>
                <div class="post-time post-sum">2020-02-03-20-38-12</div>
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
            <br><br><br><br>
            <h3>내가 작성한 댓글</h3>
            <ul class="myComment">
                <li class="comm-nav">게시판 유형</li>
                <li class="comm-nav">게시글 제목</li>
                <li class="comm-nav">댓글 내용</li>
                <li class="comm-nav">작성일</li>
            </ul>
            <div class="padding-1">
                <div class="comm-class comm-sum">갤러리 게시판</div>
                <div class="comm-post comm-sum">2월 공연 사진</div>
                <div class="comm-content comm-sum">사진 너무 잘 나왔네요~</div>
                <div class="comm-time comm-sum">2020-02-03-22-11-21</div>
            </div>
            <div class="padding-1">
                <div class="comm-class comm-sum">갤러리 게시판</div>
                <div class="comm-post comm-sum">1월 공연 사진</div>
                <div class="comm-content comm-sum">다음 공연 사진은 여러 장 올려주세요!</div>
                <div class="comm-time comm-sum">2020-01-23-20-31-31</div>
            </div>
            <div class="padding-1">
                <div class="comm-class comm-sum">소통 게시판</div>
                <div class="comm-post comm-sum">처음으로 글 올립니다!</div>
                <div class="comm-content comm-sum">우연히 보게됬는데 정말 좋은 공연이였어요!</div>
                <div class="comm-time comm-sum">2020-01-03-12-41-31</div>
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