<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    <link href="<%= request.getContextPath() %>/css/mfooter.css" rel="stylesheet" />
<title>loginFrom</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
    section{width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; height:500px;} 
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:300px; left:50%; transform: translateX(-50%); color: rgb(224, 224, 224);} 
    
    .section{width: 400px; padding: 50px 50px; text-align: center; vertical-align: middle; background: #D8BFD8; 
             position: absolute; margin-left: center; margin-top: center; left: 50%; top:50%; transform: translate(-50%, -50%);}
    /* .cnt_area{padding-top: 10px; margin-top: 15px;} */
    .log_submit{height: 75px;
    border-radius: 0.25rem;
    white-space: nowrap;
    	border: 1px solid transparent;
    	    background-color: #7780b7;
    	    font-family: "Roboto", sans-serif;
    	    color: white;
    	    font-size: 0.875rem;
    }
    .input_log{border-radius: 4px; box-shadow: none; padding: 0.375rem 0.5rem; border: 1px solid #ced4da;}
    .inputText{display: inline-block; vertical-align: middle;}
    .loginBtn{display: inline-block; vertical-align: middle;}
    .errorPop{color: red; font-size: 10px; height: 17px; vertical-align: middle;}
    #ml1{color: orange; font-size: 36px; font-weight: 900; margin: 0px;}
    #ml2{font-size: 25px; font-weight: 800;}
    .log_button{
    border-radius: 0.25rem;
    white-space: nowrap;
    	border: 1px solid transparent;
    	    background-color: #7780b7;
    	    font-family: "Roboto", sans-serif;
    	    color: white; line-height: 1.5; font-size: 0.875rem;
    }
    
    
</style>
</head>
<body>
    <header>
        <nav>
            <div class="logo">
            logo
            </div>
            <div id="toggle">
                <div class="span" id="one"></div>
                <div class="span" id="two"></div>
                <div class="span" id="three"></div>
            </div>
        </nav>

        <div id="resize">
            <ul class="menu">
                <li class="m-name1 m-name">
                    <a href="#" class="m-mname m-mname1"> M u s i c L i n k</a>
                    <ul class="hidden-manu1 drop">
                        <li class="menu-h"><a href="#">About us</a></li>
                        <li class="menu-h"><a href="#">F A Q</a></li>
                        <li class="menu-h"><a href="#">Q &#38; A</a></li>
                    </ul>
                </li>
                <li class="m-name2 m-name">
                    <a href="#" class="m-mname m-mname2">A r t i s t</a>
                    <ul class="hidden-manu2 drop">
                        <li class="menu-h"><a href="#">p r o f i l e</a></li>
                        <li class="menu-h"><a href="#">A - l i s t</a></li>
                        <li class="menu-h"><a href="#">r a n k</a></li>
                    </ul>
                </li>
                <li class="m-name3 m-name">
                    <a href="#" class="m-mname m-mname3">F e s t i v a l</a>
                    <ul class="hidden-manu3 drop">
                        <li class="menu-h"><a href="#">F - l i s t</a></li>
                        <li class="menu-h"><a href="#">r a n k</a></li>
                    </ul>
                </li>
                <li class="m-name4 m-name">
                    <a href="#" class="m-mname m-mname4">C a n l d e r</a>
                </li>
            </ul>
        </div>
        <div class="side-icon">
            <div class="image1 icon">
                <a href="#" class="icon-a"><img src="<%= request.getContextPath() %>/img/user.png" alt="" /></a>
            </div>
            <div class="image2 icon">
                <a href="#" ><img src="<%= request.getContextPath() %>/img/bell.png" alt="" /></a>
            </div>
            <div class="image3 icon">
                <img src="<%= request.getContextPath() %>/img/pin.png" alt="" />
            </div>
            <div class="side-text">
                <p>&#169; 2019 MUSICLINK <sapn class=>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</sapn></p>
            </div>
        </div>    
    </header>   
   
    <section style="z-index: 1;">
       <form class="section" action="<%= request.getContextPath()%>/login.me" onsubmit="return validate();" method="post">
       		<p id="ml1">Music Link</p>
       		<p id="ml2">MEMBER LOGIN</p>
       		<div class="cnt_area">
	       		<div class="inputText">
	       			<input type="text" class="input_log" name="user_id" id="user_id" placeholder="아이디를 입력하세요"><br><br>
	       			<input type="password" class="input_log" name="user_password" id="user_password" placeholder="비밀번호를 입력하세요">
	       		</div>
	       		<div class="loginBtn">
	       			<input type="submit" class="log_submit" name="submit" id="submit" value="로그인">
	       		</div>
       		</div>
       		<div class="errorPop"><span id="errorbox"></span></div>
       		<div>
       			<div class="log_btn">
       				<input type="button" onclick="memberSearch();" class="log_button" id="memberSearchBtn" value="아이디/비밀번호 찾기">&nbsp;&nbsp;
       				<input type="button" onclick="memberJoin();" class="log_button" id="memberJoinBtn" value="회원가입"> 
       			</div>
       		</div>
       </form>
    </section>
    <h1 class="htext">L O G I N</h1>
    
    
    <footer>
        <div class="ft-text">
            <h2 class="ft-text1 ft-h1">The most important step is understanding and.</h2><br>
            <h2 class="ft-text1 ft-h2">Empathizing with project.</h2>
        </div>
        <h1 class="ft-txt1">뮤직링크는 e비지니스 엔터테인먼트 입니다.</h1>
        <h1 class="ft-txt2">MUSIC LINK</h1>
        <div class="ft-content">
            <div class="content-left">
                <div class="left-top">
                    <ul class="lt">COMPANY
                        <li>(주)뮤직링크</li>
                    </ul>
                    <ul class="rt">ADDRESS
                        <li>서울특별시 강남구 테헤란로 14길 6 남도빌딩 2F</li>
                    </ul>
                </div>
                <div class="left-bot">
                    <ul class="lbl">BUSINESS LICENSE
                        <li>000-11-22222</li>
                    </ul>
                    <ul class="lbm">TEL
                        <li>02-562-2378</li>
                    </ul>
                    <ul class="lbr">E-MAIL
                        <li>qkrtlsdn@qkr.tlsdn</li>
                    </ul>
                </div>
            </div>
            <div class="content-right">
                <a href="#">&nbsp;&nbsp;&nbsp;
                    R E Q E U S T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#62;</a>
                <a href="#">&nbsp;&nbsp;&nbsp;
                    L O C A T I O N&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#62;</a>
            </div>
        </div>
    </footer>
    <div class="map">
        <div class="map-bg">
            <h1 class="map-h1">&#215;</h1>
            <h1 class="map-txt">오시는길</h1>
            <div class="map-cont">
                <div class="map-cont-left"></div>
                <div class="map-cont-right">
                    <div class="cont-right1">
                        <div class="right-txt1">ADDRESS</div>
                        <div class="right-txt2">서울시 강남구..</div>
                    </div>
                    <div class="cont-right1">
                        <div class="right-txt1">TEL</div>
                        <div class="right-txt2">02-1111-1111</div>
                    </div>
                    <div class="cont-right1">
                        <div class="right-txt1">SUB</div>
                        <div class="right-txt2">2호선 - 강남, 역삼역</div>
                    </div>
                    <div class="cont-right1">
                        <div class="right-txt1">BUS</div>
                        <div class="right-txt2">146번, 360번</div>
                    </div>
                    <div class="cont-right2">
                        <a href="#" class="map-button">NAVER 지도로 바로 보기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<script src="<%= request.getContextPath() %>/js/respond.min.js"></script>
<script src="<%= request.getContextPath() %>/js/wow.min.js"></script>
<script src="<%= request.getContextPath() %>/js/parallax.min.js"></script>
<script src="<%= request.getContextPath() %>/js/slick.min.js"></script>
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

	<script>
		function validate(){
			if($('#user_id').val().trim().length == 0){
				alert('아이디를 입력해주세요.');
				$('#user_id').focus();
				
				return false;
			}
			
			if($('#user_password').val().trim().length == 0){
				alert('비밀번호를 입력해주세요.');
				$('#user_password').focus();
				
				return false;
			}
			
			return true;
		}
	
		function memberJoin(){
			location.href="<%= request.getContextPath() %>/views/member/ssj_joinPickForm.jsp";
		}
		
		var msg = "<%= msg %>";
		$(function(){
			if(msg != "null"){
				$('#errorbox').text(msg);
			}
		});
	</script>

</body>
</html>