<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 메뉴 시작 */
    #menuList div div {display: none; opacity: 0.5;}

    #menuList1:hover div{display: block;}
    #menuList2:hover div{display: block;}

    #menuList div div div:hover{color: black; font-weight: bolder; opacity: 1; cursor: pointer;}

    #menuList{width: 100%; height: 7%; top: 5%;}
    #menuList1{background-color: #FDF1F1; width: 50%; height: 100%; text-align: center; line-height: 50px; font-size: larger;}
    #menuList2{background-color: #FDF1F1; width: 50%; height: 100%; right: 0%; text-align: center; line-height: 50px; font-size: larger;}
    .menuSelect1{background-color: thistle; width: 100%; height: 180%; line-height: 35px; z-index: 5;}
    .menuSelect2{background-color: thistle; width: 100%; height: 120%; line-height: 35px; z-index: 5;}
    .menuSelect1-1{width: 100%; height: 33%;}
    .menuSelect1-2{width: 100%; height: 33%; top: 33%;}
    .menuSelect1-3{width: 100%; height: 33%; top: 66%;}
    .menuSelect2-1{width: 100%; height: 50%;}
    .menuSelect2-2{width: 100%; height: 50%; top: 50%;}

    /* 끝 */
</style>
</head>
<body>
	<div id="menuList">
         <div id="menuList1">
             회원 관리
             <div class="menuSelect1">
                 <div class="menuSelect1-1"><a href="<%=request.getContextPath()%>/showUserList.au">회원 열람</a></div>
                 <div class="menuSelect1-2"><a href="<%=request.getContextPath()%>/userBan.do">회원 금지</a></div>
                 <div class="menuSelect1-3"><a href="<%=request.getContextPath() %>/views/authorPage/banUserRecoverPage.jsp">금지 해제</a></div>
             </div>
         </div>
         <div id="menuList2">
             등록 관리
             <div class="menuSelect2">
                     <div class="menuSelect2-1"><a href="<%=request.getContextPath()%>/requestList.at">아티스트 등록 관리</a></div>
                     <div class="menuSelect2-2"><a href="<%=request.getContextPath()%>/requestList.co">기획자 등록 관리</a></div>
             </div>
         </div>
     </div>
</body>
</html>