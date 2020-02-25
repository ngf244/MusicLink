<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.LinkedHashMap, java.util.ArrayList, festival.model.vo.Festival, festival.model.vo.PageInfo"%>
<%
	LinkedHashMap<ArrayList<Festival>, ArrayList<String>> map = (LinkedHashMap<ArrayList<Festival>, ArrayList<String>>)request.getAttribute("map");
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

    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<script src="../js/jquery-3.4.1.min.js"></script>
	
<title>나의 아티스트 스케줄</title>
<style>
 	/* 섹션 */
	section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: rgba(255,255,255,1); height:2000px; padding-top: 30px; padding-bottom:10%;}
    
    /* 시작 */
    #menuList div div {display: none;}

    #menuList1:hover div{display: block;}
    #menuList2:hover div{display: block;}

    #menuList div div div:hover{color: brown;}

    .dayNum{padding-left: 10px; padding-right: 10px;}
    .dayNum:hover{transform: perspective(100px) translateZ(50px); color: red; display: inline-block;}
    
    #monthDays{background-color: gray; color: white; width: 100%; height: 15%; text-align: center; line-height: 80px; font-size: small;}
    
    #prev{display: inline-block; border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: black; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;}
    #next{display: inline-block; border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: black; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;}
    #nowDay{display: inline-block;}

    .nowDayArea{margin-left: 38%; font-size: 30px;}
    /* 끝 */
    
    /* 행사리스트 부분 */
    .eventList{font-size: 14pt;}
    .eventArea{margin: 4%; padding: 2%;}
    .eventImage{width: 180px; height: 250px; background: lightgray; float: left;}
    .eventInfo{width: 250px; height: 250px; float: left; line-height: 30px; margin-left: 30px;}
    .faeText h3{background: #af9ce6;}
    .d-dayArea{
    	display: inline-block; float: right; border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: red; color: white; 
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
            <div class="faeText">
                <h3 style="font-size:14pt;">팔로잉 아티스트의 행사</h3>
            </div>
            
            <div id="pictureBrowser">
                <div id="monthDays"></div>
                <br>
                <div class="nowDayArea">
                    <button id="prev" class="moveBtn" onclick="prev();">&lt;prev</button>&nbsp;&nbsp;
                    <div id="nowDay"></div>&nbsp;&nbsp;
                    <button id="next" class="moveBtn" onclick="next();">next&gt;</button>
                </div>

                <script>
                    var date = new Date();
                    var year = date.getFullYear();
                    var month = date.getMonth()+1;
                    var day = date.getDate();
                    document.getElementById("nowDay").innerHTML = year + "-" + month + "-" + day;
                </script>
                <script>
                    var lastDay = (new Date(date.getFullYear(), date.getMonth()+1, 0)).getDate();
                    var days = "";
                    for(var i = 1; i <= lastDay; i++){
                        days += "<span class='dayNum' onclick='pickDate("+i+");'><strong></strong>"+ i +"</span>";
                    }
                    document.getElementById("monthDays").innerHTML = days;
    
    
                    function printDays() {
                        var lastDay = (new Date(year, month, 0)).getDate();
                        var days = "";
                        for(var i = 1; i <= lastDay; i++){
                        days += "<span class='dayNum' onclick='pickDate("+i+");'>"+i+"</span>";
                        }
                        document.getElementById("monthDays").innerHTML = days;
                    }
    
                    function pickDate(num) {
                        day = num;
                        console.log(num);
                        document.getElementById("nowDay").innerHTML = year + "-" + month + "-" + day;
                    }
                    function prev() {
                        month -= 1;
                        if(month<1){
                            year -= 1;
                            month = 12;
                        }
                        document.getElementById("nowDay").innerHTML = year + "-" + month + "-" + day;
                        printDays();
                    }
                    function next() {
                        month += 1;
                        if(month>12){
                            year += 1;
                            month = 1;
                        }
                        document.getElementById("nowDay").innerHTML = year + "-" + month + "-" + day;
                        printDays();
                    }
                    
                </script>
    
            </div>

            <div class="eventList">
                <div class="eventArea">
                    <div class="eventImage">
                        <img src="" alt="">
                    </div>
                    
                    <div class="eventInfo">
                        <ul>행사 명 <div class="d-dayArea">D - 10</div>
                            <li>장소</li>
                            <li>기간</li>
                            <li>출연 아티스트</li>
                        </ul>
                    </div><div style="clear:both;"></div>                    
                </div>
                <hr style="border: 0.5px solid lightgray;">

                <div class="eventArea">
                    <div class="eventImage">
                        <img src="" alt="">
                    </div>
                    
                    <div class="eventInfo">
                        <ul>행사 명 <div class="d-dayArea">D - 25</div>
                            <li>장소</li>
                            <li>기간</li>
                            <li>출연 아티스트</li>
                        </ul>
                    </div><div style="clear:both;"></div>                    
                </div>
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

	<%@ include file="../common/footer.jsp" %>

</body>
</html>