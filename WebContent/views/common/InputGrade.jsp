<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
	String cpCode = (String)request.getParameter("cpCode");
	System.out.println(cpCode);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>평점 입력</title>
    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	h3{font-family: 'Noto Sans KR', sans-serif;}
	/*제이쿼리 활용 별점 매기기*/
	.starR{
	  background: url('<%= request.getContextPath() %>/icons/ico_review.png') no-repeat right 0;
	  background-size: auto 100%;
	  width: 30px;
	  height: 30px;
	  display: inline-block;
	  text-indent: -9999px;
	  cursor: pointer;
	}
	.starR.on{background-position:0 0;}
	.starRev{margin-left: 10px;}
	/*버튼 css*/
    .btn{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: #7780b7; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;    
    }
    .btnArea{
    	margin-left: 30px;
    }
    .bodyArea{
    	margin-left: 10px;
    }	
</style>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h3 style="margin-left: 20px;">별점 매기기</h3>
	<div class="bodyArea">
		<form action="<%= request.getContextPath() %>/update.pgrd" method="post">
			<div class="starRev">
			    <a class="starR on" value="1">별1</a>
			    <a class="starR" value="2">별2</a>
			    <a class="starR" value="3">별3</a>
			    <a class="starR" value="4">별4</a>
			    <a class="starR" value="5">별5</a>
			</div>
			<div style="clear: both;"></div>
			<br>
			<input type="hidden" name="cpCode" value="<%= cpCode %>">
			<input type="hidden" name="grade" id="grade" class="grade" value="">
			<div class="btnArea">
				<button type="submit" name="send" class="btn">완료</button>
				<button type="button" name="cancel" class="btn" onclick="self.close();">취소</button>  		
			</div>
		</form>	
	</div>
	<script>
		$('.starRev a').click(function(){
			$(this).parent().children('a').removeClass('on');
		    $(this).addClass('on').prevAll('a').addClass('on');
		    console.log($(this).attr("value"));
		  	$('.grade').attr("value",$(this).attr("value"));
		    console.log($('.grade').attr("value"));
		    return false;
		});
	</script>	
</body>
</html>