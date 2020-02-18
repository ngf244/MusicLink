<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
<title>Insert title here</title>
<style>
	html, body{height:100%; background: rgb(253, 241, 241);} /**/
    h1, h2, h3, h4, h5, h6, p, span, a{-webkit-transition:0.5s ease-out; transition:0.5s ease-out;}
    a:focus, a:hover{text-decoration:none;}
    ul{padding:0;}
    p{font-size:14px;}
    
    .clear-both{clear: both;}
    
    header{height:150px;}
    #resize{width:100%; height:100%; background-color:rgba(0,0,0,0.8); position:fixed; top:0; left:0;z-index:9; -webkit-transition:0.5s ease-out; transition:0.5s ease-out; visibility: hidden; opacity:0; filter:alpha(opacity=0);}
    #resize.active{opacity:0.98; filter:alpha(opacity=98); visibility:visible;}
    .menu{width:50%; margin: 0 auto; margin-top:300px;} 
    .m-name{width:50%; margin:15px auto; text-align: center;}
    nav{width:100%; position:fixed; z-index:99999; }
    .logo{position: absolute; top:50px; left:100px; width: 180px; height: 100px; background:#000; color:#999; text-align: center; line-height: 100px;}
   

    #toggle{position:absolute; top:50px; right:100px; width:30px; height:40px; cursor:pointer;}
    #toggle .span{height:4px; background-color:#000; -webkit-transition:0.5s ease-out; transition:0.5s ease-out; backface-visibility:hidden; margin:5px auto;}
    #toggle.on #one{-webkit-transform:rotate(45deg) translateX(3px) translateY(4px); transform:rotate(45deg) translateX(3px) translateY(4px);}
    #toggle.on #two{opacity:0; filter:alpha(opacity=0);}
    #toggle.on #three{-webkit-transform:rotate(-45deg) translateX(8px) translateY(-10px); transform:rotate(-45deg) translateX(8px) translateY(-10px);}
    
    .side-icon{width:15%; position: fixed; top:40%; left: 5%; z-index:99;}
    .icon{width: 50px; height: 50px; margin-bottom:20px; position: relative}
    .icon img{width:30px; height:30px; margin:10px;}
    .icon:hover{background: #F7FE2E; border-radius: 50px; box-sizing: border-box; cursor: pointer;}
    
    
    .side-text{margin-top:130px;}
    .side-text p{font-size:12px; background:#fff; width:65%; border-radius:5px;}
    .side-text p sapn{border-bottom:1px solid black; display: inline-block; height:12px;}

    /*히든 정보*/
    .user-wrap{position: fixed; top:33%; left:10%; background:#fff; width:15%; z-index:3; text-align: center; border-radius: 30px; display: none;}
    .user-nickName{width:30%; margin:15px auto;}
    .user-id{width:30%; margin:15px auto;}
    .user-mypage{width:30%; margin:15px auto;}
    .user-coin{width:50%; margin:15px auto;}
    .user-charging{width:30%; margin:15px auto;}

    /*알람*/
    .alram-wrap{position: fixed; width:20%; height:150px; background:#fff; z-index:3; top:43%; left: 10%; border-radius: 20px; overflow: hidden; display: none;}
    .alram-wrap.alon{display: block;}
    .alram-con{width:100%; height:50px; box-sizing: border-box; border-bottom:1px dashed #ccc;}
    .alram-img{width:15%; height: 50px; float: left;}
    .alram-time{width:20%;height: 50px; float: left;}
    .alram-msg{width:50%; height: 50px; float: left;}
    .alram-close{width:15%; height: 50px; float: left;}
    
    
    /*로그인 아웃*/
    .log-inOut{float: right; margin-top:15px; margin-right: 50px;}
    .log-inOut > a{display: inline-block;}
    
    /*메뉴*/
    .m-mname{width:60%; margin:0 auto; height:50px; line-height: 50px; font-size: 30px; color: #fff; position: relative;}
    .m-mname1{width:58%;}
    .m-mname2{width:36%;}
    .m-mname3{width:48%;}
    .m-mname4{width:46%;}
    
    .menu-h > a{color:#fff;}
    .m-name > .drop{text-align: center; overflow: hidden; height:0;
        -webkit-transition: height 0.5s ease-out;
        transition: height 0.5s ease-out;
        opacity: 0;
        filter: alpha(opacity=0);
        margin:0; padding:0;
        width:inherit;
        text-align: center;
        display: inline-block;
    }
    .drop{width:50%;}
    .menu-h{height:30px; line-height: 30px;}
    
    .m-name1:hover{height:140px; }
    .m-name2:hover{height:100px; }
    .m-name3:hover{height:100px; }
    .m-name4:hover{height:120px; }
    
    .m-name1:hover .m-mname{border-bottom: 3px solid #F7FE2E;}
    .m-name2:hover .m-mname{border-bottom: 3px solid #F7FE2E;}
    .m-name3:hover .m-mname{border-bottom: 3px solid #F7FE2E;}
    .m-name4:hover .m-mname{border-bottom: 3px solid #F7FE2E;}
    
    .menu-h:hover a{color:#F7FE2E; }
    
    .m-name:hover .drop{opacity: 1; filter: alpha(opacity=100);}
    .m-name:hover .hidden-manu1{height:120px;}
    .m-name:hover .hidden-manu2{height:60px;}
    .m-name:hover .hidden-manu3{height:60px;}
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
            <div class="log-inOut">
                <a href="">login</a>
                <a href="">logOut</a>
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
                <img src="img/user.png" alt="" />
            </div>
            <div class="image2 icon">
                <img src="img/bell.png" alt="" />
            </div>
            <div class="image3 icon">
                <img src="img/pin.png" alt="" />
            </div>
            <div class="side-text">
                <p>&#169; 2019 MUSICLINK <sapn class=>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</sapn></p>
            </div>
        </div>
        <div class="user-wrap">
            <div class="user-nickName">닉네임</div>
            <div class="user-id">아이디</div>
            <div class="user-mypage">내 정보</div>
            <div class="user-coin">
                <lable>coin</lable><lable style="margin-left:15px;">20</lable>
            </div>
            <div class="user-charging">충전</div>
        </div>
        <div class="alram-wrap">
            <div class="alram-con">
                <div class="alram-img"></div>
                <div class="alram-time"></div>
                <div class="alram-msg"></div>
                <div class="alram-close"></div>
            </div>
            <div class="alram-con">
                <div class="alram-img"></div>
                <div class="alram-time"></div>
                <div class="alram-msg"></div>
                <div class="alram-close"></div>
            </div>
            <div class="alram-con">
                <div class="alram-img"></div>
                <div class="alram-time"></div>
                <div class="alram-msg"></div>
                <div class="alram-close"></div>
            </div>
        </div>
    </header>
    
    <script>

	$("#toggle").click(function(){
		$(this).toggleClass("on");
		$("#resize").toggleClass("active");	
	});
    
    $(".image3").click(function(){
        $(".map").css({"display":"block","width":"100%","height":"100%","padding-top":"10%","opacity":"0.98", "z-index":"9"});
    });
    $(".map-h1").click(function(){
        $(".map").css("display","none");
    });
    
    $(".image2").click(function(){
        $(".alram-wrap").toggleClass("alon");
    });
    $(".image2").click(function(){
        
    });
    
	</script>
</body>
</html>