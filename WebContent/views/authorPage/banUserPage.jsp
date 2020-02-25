<%@page import="authorPage.model.vo.ReportPage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ReportPage> rArr = (ArrayList<ReportPage>)request.getAttribute("rArr");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../../css/reset.css" />
    <link href="../../css/mfooter.css" rel="stylesheet" />
<title>Insert title here</title>
<style>
    section {width:70%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 300px; position: relative;
    background: #fff; height:750px;}
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top:355px; left:30%; color: rgb(224, 224, 224);} 
    
    /* selection common */
    #sectionBox {position: relative; background-color: white; width: 100%; height: 100%;}
    #sectionBox div{position: absolute;}
    /* common end */

    /* section 3 */
    .searchBox{width: 50%; height: 5%; top: 16%; left: 24%; z-index: 1;}
    .searchBox-inputText{width: 75%; height: 85%;}
    .searchBox-submitButton{width: 20%; height: 100%; right: 0%;}
    
    #reason, #reasonDetail{display: none;}

    .userDetailBox{width: 80%; height: 30%; bottom: 15%; left: 10%;}
    .userDetailBox-imgBox{background-color: seashell; width: 35%; height: 100%; top: 0%; left: 5%;}
    .userDetailBox-nameBox{width: 50%; height: 24%; top: 0%; right: 5%;}
    .userDetailBox-addressBox{width: 50%; height: 24%; top: 33%; right: 5%;}
    .userDetailBox-usertypeBox{width: 50%; height: 24%; top: 66%; right: 5%;}
    
    fieldset{border: 1px solid black; height: 100%;}
    legend{font-size: large;}
    input[readonly]{width: 99%; height: 55%; margin-top: 10px;}

    button[type="button"]{background-color: red; float: right;}

    .districtReason{width: 20%; height: 30%; bottom: 15%; left: 14%;}


    .detailReason{width: 50%; height: 30%; bottom: 15%; right: 14%;}
    .detailReason-textareaBox{width: 100%; height: 78%; bottom: 22%; right: 0%;}
    .submitButton{width: 10%; height: 20%; bottom: 0%; right: 0%;}

    /* section 3 끝 */
    
    img{width: 100%; height: 100%}


</style>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>   
   
    <section style="z-index: 1;">
        <div id="sectionBox">
            <%@ include file="common/authorPageMenu.jsp" %> 
        
            <div class="searchBox">
                <input type="text" placeholder="검색할 사용자 아이디" class="searchBox-inputText">
                <button class="searchBox-submitButton">검색</button>
            </div>

            <div style="background-color: yellow; position: absolute; width: 80%; height: 27%; top: 25%; left: 10%;">
                <table style="background-color: yellow; position: absolute; width: 100%; left: 0%; text-align: center;">
                    <tr style="border: 1px groove black; height: 40px; line-height: 40px;">
                        <th>신고번호</th>
                        <th>대상 아이디</th>
                        <th>신고자 아이디</th>
                        <th>사유</th>
                        <th>신고일자</th>
                    </tr>
                    <%for(int i = 0; i < rArr.size(); i++){ %>
                    <tr onclick="showUserInfo(this);">
                        <td><%=rArr.get(i).getReportNum() %></td>
                        <td><%=rArr.get(i).getReportedId() %></td>
                        <td><%=rArr.get(i).getReporterId() %></td>
                        <td><%=rArr.get(i).getReportReason() %></td>
                        <td><%=rArr.get(i).getReportDate() %></td>
                    </tr>
                    <%} %>
                </table>


            </div>
        
            <div class="userDetailBox" id="userDetailBox">
                <div class="userDetailBox-imgBox">
               		 <img>
                </div>
                <div class="userDetailBox-nameBox">
                    <fieldset>
                        <legend>이름</legend>
                        <input type="text" readonly>
                    </fieldset>
                </div>
                <div class="userDetailBox-addressBox">
                    <fieldset>
                        <legend>연락처</legend>
                        <input type="text" readonly>
                    </fieldset>
                </div>
                <div class="userDetailBox-usertypeBox">
                    <fieldset>
                        <legend>회원 유형</legend>
                        <input type="text" readonly>
                    </fieldset>
                    <button type="button" onclick="showWritePage();">보기</button>
                </div>
            </div>
            <form action="<%=request.getContextPath()%>/addBanUser.ban">
                <div class="districtReason" id="reason">
                    <input type="hidden" id="hiddenId" name="userId" value="">
                    <h2>제재 사유</h2><br>
                    <select name="restrictReason">
                        <option value="비속어 사용">비속어 사용</option>
                        <option value="회원간 불화 유발">회원간 불화 유발</option>
                        <option value="스토킹">스토킹</option>
                        <option value="뭐라도">뭐라도 더 있겠지뭐</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
                <div class="detailReason" id="reasonDetail">
                    <div class="detailReason-textareaBox">
                        <h2>제재 사유 상세 입력</h2><br>
                        <textarea name="restrictReasonDetail" cols="71" rows="10"></textarea>
                    </div>
                    <div class="submitButton">
                    <button type="submit" style="background-color: red;" onclick="return restrictSubmit();">등록</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <h1 class="htext">A U T H O R</h1>
    
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
    
    function restrictSubmit() {
        var check = confirm("정말 재제 하시겠습니까?");

        if(check == true){
            return true;
        }
        else{
            return false;
        }
    }

    function showWritePage(){
        $('#reason').css('display','block');
        $('#reasonDetail').css('display','block');
        $('#userDetailBox').css('display','none');
    }

    function showUserInfo() {
        $('#reason').css('display','none');
        $('#reasonDetail').css('display','none');
        $('#userDetailBox').css('display','block');

    }
    // function search(t) {
    //     var serchId = "";
    //     if(t == event){
    //         if(t.keyCode === 13){
    //             console.log(t);
    //             console.log(t.path[0].value);
    //             serchId = t.path[0].value;
    //         }
    //     } else {
    //         console.log(t);
    //     }
    // }
    
    $('.searchBox button').click(function () {
        var searchId = $('.searchBox input').val()
        console.log(searchId);
        $('#hiddenId').val(searchId);
        $.ajax({
            url : "showUserDetail.ban",
            type : 'get',
            data : {searchId:searchId},
            success : function(data){
                console.log(data);

                var type = "";
                switch(data.userClass){
                    case '1' : type = "일반회원"; break;
                    case '2' : type = "아티스트회원"; break;
                    case '3' : type = "기획자회원"; break;
                }

                var userName = data.userName;
                var userPhone = data.userPhone;
                var userImg = "";

                if (data.userEmail == null){
                    if(data.userClass == 1){
                        userImg = "<%=request.getContextPath()%>/views/authorPage/image/nomalUser.png";
                    } else if(data.userClass == 3){
                        userImg = "<%=request.getContextPath()%>/views/authorPage/image/companyUser.png";
                    }
                } else {
                    userImg = "<%=request.getContextPath()%>/artistProfile_uploadFiles/" + data.userEmail;
                }
                console.log(userImg);

                $('.userDetailBox-imgBox img').attr("src",userImg);
                $('.userDetailBox-nameBox input').val(userName);
                $('.userDetailBox-addressBox input').val(userPhone);
                $('.userDetailBox-usertypeBox input').val(type);

            },
            error : function () {
                console.log("헐 아작스 에러 대박;")
            }
        })
    })
    
    $('.searchBox input').keyup(function (event) {
        if(event.keyCode === 13){
            $('.searchBox button').trigger('click');
        }
    })

    $('table tr:gt(0)').click(function(){
        var searchId = $(this).children().eq(1).text();
        console.log(searchId);
        $('#hiddenId').val(searchId);

        $.ajax({
            url : "showUserDetail.ban",
            type : 'get',
            data : {searchId:searchId},
            success : function(data){
                console.log(data);

                var type = "";
                switch(data.userClass){
                    case '1' : type = "일반회원"; break;
                    case '2' : type = "아티스트회원"; break;
                    case '3' : type = "기획자회원"; break;
                }

                var userName = data.userName;
                var userPhone = data.userPhone;
                var userImg = "";

                if (data.userEmail == null){
                    if(data.userClass == 1){
                        userImg = "<%=request.getContextPath()%>/views/authorPage/image/nomalUser.png";
                    } else if(data.userClass == 3){
                        userImg = "<%=request.getContextPath()%>/views/authorPage/image/companyUser.png";
                    }
                } else {
                    userImg = "<%=request.getContextPath()%>/artistProfile_uploadFiles/" + data.userEmail;
                }
                console.log(userImg);

                $('.userDetailBox-imgBox img').attr("src",userImg);
                $('.userDetailBox-nameBox input').val(userName);
                $('.userDetailBox-addressBox input').val(userPhone);
                $('.userDetailBox-usertypeBox input').val(type);

            },
            error : function () {
                console.log("헐 아작스 에러 대박;")
            }
        })

    })
    

	//new WOW().init();
	
	
</script>
</body>
</html>