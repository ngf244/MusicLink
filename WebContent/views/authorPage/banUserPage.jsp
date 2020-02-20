<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <tr onclick="showUserInfo(this);">
                        <td>1</td>
                        <td>hyunho-im</td>
                        <td>daeho-kim</td>
                        <td>잦은 부상</td>
                        <td>2020-02-03</td>
                    </tr>
                    <tr onclick="showUserInfo(this);">
                        <td>2</td>
                        <td>hyunho-im</td>
                        <td>daeho-kim</td>
                        <td>못생김</td>
                        <td>2020-02-03</td>
                    </tr>
                </table>


            </div>
        
            <div class="userDetailBox" id="userDetailBox">
                <div class="userDetailBox-imgBox">
                    img 사진 들어갈 곳
                </div>
                <div class="userDetailBox-nameBox">
                    <fieldset>
                        <legend>이름</legend>
                        <input type="text" readonly>
                    </fieldset>
                </div>
                <div class="userDetailBox-addressBox">
                    <fieldset>
                        <legend>주소</legend>
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
            <form>
                <div class="districtReason" id="reason">
                    <h2>제재 사유</h2><br>
                    <select name="restrictReason">
                        <option>비속어 사용</option>
                        <option>회원간 불화 유발</option>
                        <option>스토킹</option>
                        <option>뭐라도 더 있겠지뭐</option>
                        <option>기타</option>
                    </select>
                </div>
                <div class="detailReason" id="reasonDetail">
                    <div class="detailReason-textareaBox">
                        <h2>제재 사유 상세 입력</h2><br>
                        <textarea name="rectrictReasonDetail" cols="71" rows="10"></textarea>
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
    
	//new WOW().init();
	
	
</script>
</body>
</html>