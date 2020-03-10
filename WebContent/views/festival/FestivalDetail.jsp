<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "festival.model.vo.Festival, java.util.ArrayList, java.text.DecimalFormat" %>
<%
	Festival f = (Festival)request.getAttribute("festival");
	ArrayList<String> artistArr = (ArrayList<String>)request.getAttribute("artistArr");
	ArrayList<String> userApList = (ArrayList<String>)request.getAttribute("userApList");
	
	int status = (int)request.getAttribute("status");
	int grade = (int)request.getAttribute("grade");
	
	String fullLoc = "";
	String spLoc[] = f.getFesLoc().split("/");
	
	String mapLoc[] = spLoc[0].split("&");

	if (spLoc.length > 1) {
		fullLoc = "(" + mapLoc[0] + ") " + mapLoc[1] + " " + spLoc[1];
	} else {
		fullLoc = "(" + mapLoc[0] + ") " + mapLoc[1];
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">

<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

<!-- Favicon icon -->
<link rel="icon" type="<%= request.getContextPath() %>/image/png"
	sizes="16x16" href="<%= request.getContextPath() %>/images/favicon.png">
<!-- Custom Stylesheet -->
<link
	href="<%= request.getContextPath() %>/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"
	rel="stylesheet">
<!-- Page plugins css -->
<link
	href="<%= request.getContextPath() %>/plugins/clockpicker/dist/jquery-clockpicker.min.css"
	rel="stylesheet">
<!-- Color picker plugins css -->
<link
	href="<%= request.getContextPath() %>/plugins/jquery-asColorPicker-master/css/asColorPicker.css"
	rel="stylesheet">
<!-- Date picker plugins css -->
<link
	href="<%= request.getContextPath() %>/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css"
	rel="stylesheet">
<!-- Daterange picker plugins css -->
<link
	href="<%= request.getContextPath() %>/plugins/timepicker/bootstrap-timepicker.min.css"
	rel="stylesheet">
<link
	href="<%= request.getContextPath() %>/plugins/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Stylesheet -->
<link href="<%= request.getContextPath() %>/css/style.css"
	rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/css/reset.css" />

<title>행사 상세 페이지</title>
<style>
	/*
	section {
		width: 70%;
		height: 130%;
		padding-bottom: 60px;
		margin: 0 auto;
		box-shadow: 5px 5px 10px 8px lightgray;
		margin-top: 21%;
		position: relative;
		background: #fff;
		display: block;
	}
	.htext {
		text-align: center;
		font-size: 100px;
		height: 0;
		position: absolute;
		top: 47%;
		left: 50%;
		transform: translateX(-50%);
		color: rgb(224, 224, 224);
	}
	*/
	
	section {width:70%; height:130%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; padding-top: 0px; padding-bottom:10%;}
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top: -9%; left: 50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
	
	#scale {
		transform: scale(1.2);
	}
	
	#categoryArea {
		position: absolute;
		top: 35%;
		left: 12%;
		display: inline-block;
	}
	
	#contentArea {
		width: 83.5%;
		padding-top: 12%;
		text-align: center;
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
		display: inline-block;
	}
	
	#inBigCategory {
		font-family: 'Bungee', cursive;
		font-size: 50px;
		vertical-align: middle;
	}
	
	#inSmallCategory {
		font-family: 'Comfortaa', cursive;
		font-size: 30px;
	}
	
	#block {
		background: #8AFF00;
		width: 55px;
		height: 8px;
		margin-top: 50px;
		margin-left: 2px;
	}
	
	#bigArea {
		width: 88%;
		height: 100%;
		text-align: center;
		display: inline-block;
	}
	
	#promotionImg {
		width: 250px;
		height: 360px;
		background: lightgray;
		text-align: right;
		background-image:url('<%= request.getContextPath() %>/festival_uploadFiles/<%= f.getPosPath() %>');
		background-size: auto 100%;
		background-repeat: no-repeat;
	    background-position: center center;
	}
	
	.alignspan {
		font-size: 11px;
		font-weight: bold;
		margin-top: 330px;
		margin-right: 12px;
	}
	
	#festivalPosterArea {
		width: 30%;
		display: inline-block;
		vertical-align: top;
		margin-top: 2%;
		margin-bottom: 10%;
	}
	
	#festivalInfoArea {
		width: 60%;
		display: inline-block;
		font-size: 15px;
		margin-left: 2%;
	}
	
	#infoTable {
		border-spacing: 20px;
		border-collapse: separate;
		text-align: left;
		line-height: 1.8em
	}
	
	#infoTable td {
		vertical-align: middle;
	}
	
	#label {
		width: 37%;
	}
	
	#companyStar {
		color: #FFCD12;
	}
	
	#ticketLink {cursor:pointer;}


    pre{
    line-height: 1.8em;
	font-size: 15px;
	color: #76838f;
	font-weight: 400;
	font-family: "Roboto", sans-serif;}

	#fesmap {
		width: 100%;
		height: 350px;
		border: 1px solid #ced4da;
		border-radius: 4px;
	}
	
	#apBtn, #upBtn{width: 25%; margin-top: 5%;}
	
	footer .ft-content {
		width: 70%;
		!
		important;
	}
</style>
</head>
<body onload="fesMapSetting();">
<script> var size = "";</script>
	<%@ include file="../common/menubar.jsp" %>
	
    <!-- 행사 상세 페이지 코딩 시작 -->
	<section style="z-index: 1;">
		<div id="scale">
		<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">FESTIVAL</label>
			<label id="inSmallCategory"> - Detail</label>
		</div>
		
		<div id="contentArea">
			<div id="bigArea">
				
				<div id="festivalPosterArea">
					<div id="promotionImg">
						<% if(status == 1) { %>
						<span class="badge badge-pill badge-success alignspan">아티스트 모집 중</span>
						<% } else if(status == 2) { %>
						<span class="badge badge-pill badge-danger alignspan">아티스트 확정</span>
						<% } else if(status == 3) { %>
						<span class="badge badge-pill badge-light alignspan">지난 행사</span>
						<% } else if(status == 4) { %>
						<span class="badge badge-pill badge-info alignspan">아티스트 모집 마감</span>
						<% } %>
					</div>
				</div>
				
				<script>
				function approach() {
					<% if(loginUser != null) { %>
						$.ajax({
							url: 'approachFes.do',
							type: 'post',
							data: {usercode: '<%= loginUser.getUserCode() %>', fescode: '<%= f.getFesCode() %>'},
							success: function(data) {
								if(data > 0) {
									where.className = 'btn mb-1 btn-secondary approachBtn';
									where.innerHTML = '지원 완료';
									where.disabled = true;
								} else {
									alert('행사 지원에 실패했습니다. 포인트 잔액을 확인 해주세요.');
								}
							},
							error: function(data) {
								alert('행사 지원에 실패했습니다. 포인트 잔액을 확인 해주세요.');
							}
						});
					<% } %>
				}
				</script>
				
				<div id="festivalInfoArea">
					<table id="infoTable">
						<tr>
							<td id="label">행사명</td>
							<td><%= f.getFesName() %></td>
						</tr>
						<tr>
							<td>행사 기간</td>
							<td><%= f.getFesTerm() %></td>
						</tr>
						<tr>
							<td>행사 장소</td>
							<td><%= fullLoc %></td>
						</tr>
						<% 
						
						DecimalFormat formatter = new DecimalFormat("###,###");
						if(loginUser != null) {
							 if(loginUser.getUserClass().equals("2") || loginUser.getUserClass().equals("3")) { 
							 	if(status == 1) { %>
						<tr>
							<td>모집 아티스트 수<br>(팀 수)</td>
							<td><%= f.getRecCount() %>팀</td>
						</tr>
						<%  	}
							
							String artistStr = "";
							
							for(int i = 0; i < artistArr.size(); i++) {
								if(i != artistArr.size() - 1)
									artistStr += artistArr.get(i) + ", ";
								else
									artistStr += artistArr.get(i);
							}
							
							if(!artistStr.equals("")) {
						%>
						<tr>
							<td>확정 아티스트</td>
							<td><%= artistStr %></td>
						</tr>
						<%
							}
							
							if(status == 1) { 
							int strPay = Integer.parseInt((f.getPayRange().split("~"))[0]);
							int endPay = Integer.parseInt((f.getPayRange().split("~"))[1]);
							
							String printPay = formatter.format(strPay) + "&#8361; ~ " + formatter.format(endPay) + "&#8361;";
						%>
						<tr>
							<td>공연비</td>
							<td>
								<%= printPay %>
								<!-- 1,000,000 &#8361; ~ 2,000,000 &#8361; (추후합의) &nbsp;&nbsp; -->
							</td>
						</tr>
						<tr>
							<td>아티스트 모집 기간</td>
							<td><%= f.getRecTerm() %></td>
						</tr>
						<%  } 
							}
						   } %>
						   
						<% 
							if(status == 3 || status == 2) {
								String printFee = "";
							if(f.getTicFreeOp() != null) {
								if(f.getTicFreeOp().equals("Y")) {
									printFee = "무료";
								} else {
									printFee = formatter.format(f.getTicFee()) + "&#8361;";
								}
							} else {
								printFee = formatter.format(f.getTicFee()) + "&#8361;";
							}
						%>
						<tr>
							<td>관람비</td>
							<td>
								<%= printFee %> &nbsp;&nbsp;
								<% if(f.getTicUrl() != "") { %>
									<span id="ticketLink">(티켓 구매처)</span>
								<% } %>
							</td>
						</tr>
						<% 	} %>
						<%
							String printStar = "";
							for(int i = 0; i < 5; i++) {
								if(grade > 0) {
									printStar += "★";
									grade--;
								} else {
									printStar += "☆";
								}
							}
						%>
						<tr>
							<td>주최사</td>
							<td>
								<%= f.getCpName() %> &nbsp;&nbsp;
								<span id="companyStar"><%= printStar %></span>	
							</td>
						</tr>
						<tr>
							<td>행사 설명</td>
							<td>
								<pre style="white-space: pre-wrap;"><%= f.getFesInfo() %></pre>
							</td>
						</tr>
					</table>
				</div>
				
				<br>
				<div id="fesmap"></div>
				
				<input type="button" class="btn mb-1 btn-warning changeBtn" id="apBtn" value="행사 지원">
				
				<script>
					$(function() {
						var split_tab = $('#infoTable').css('height').split('px');
						var split_pos = $('#promotionImg').css('height').split('px');
						var size = 0;
						if((parseInt(split_tab[0])-20) < parseInt(split_pos[0])) size = parseInt(split_pos[0]);
						else size = parseInt(split_tab[0])-20;
						
						<% if(loginUser != null) { %>
							<% if(loginUser.getUserClass().equals("2") && status == 1) {%> //아티스트 & 행사지원 & 모집중인행사만
							
							<% for(int i = 0; i < userApList.size(); i++) {
								  if((userApList.get(i)).equals(f.getFesCode())) { %>
								    $('#apBtn').attr('id', 'apBtn');
								    $('#apBtn').attr('class', 'btn mb-1 btn-secondary changeBtn');
								    $('#apBtn').attr('disabled', true);
									$('#apBtn').val('지원 완료');
							<%      break;
								  }
								  if(i == userApList.size() - 1) { %>
								    $('#apBtn').attr('id', 'apBtn');
								    $('#apBtn').attr('class', 'btn mb-1 btn-warning changeBtn');
								    $('#apBtn').attr('onclick', 'approach();');
									$('#apBtn').val('행사 지원');
							<%    }
							   } %>
								
								//$('.changeBtn').attr('id', 'apBtn');
								//$('.changeBtn').val('행사 지원');
								$('section').css('height', size + 920 + 'px');
							<% } else if(loginUser.getUserClass().equals("3") && loginUser.getUserCode().equals(f.getCpCode()) && status != 3) { %> //기획자 & 행사수정 & 지난행사 제외
								$('.changeBtn').attr('id', 'upBtn');
								$('.changeBtn').val('행사 수정');
								$('.changeBtn').click(function() {
									location.href='<%= request.getContextPath() %>/update.fes?fcode=<%= f.getFesCode() %>'
								});
								$('section').css('height', size + 920 + 'px');
							<% } else { %> //일반 유저 & 모집 마감된 행사 - 아티스트 & 해당 행사를 등록하지 않은 기획자
								$('.changeBtn').css('visibility', 'hidden');
								$('#festivalPosterArea').css('margin-bottom', '6%');
								$('section').css('height', size + 850 + 'px');
							<% } %>
						<% } else { %> //로그인 안한 사람
							$('.changeBtn').css('visibility', 'hidden');
							$('#festivalPosterArea').css('margin-bottom', '6%');
							$('section').css('height', size + 850 + 'px');
						<% } %>
					});
				</script>
			</div>
		</div>
		</div>
    </section>
    
    <script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f12f8983e3395277ce748044a97f80ae&libraries=services"></script>
	<script>
		$(function() {
			$('#ticketLink').on({'mouseenter':function() {
				$(this).css('color', 'orange');
			}, 'mouseout':function() {
				$(this).css('color', '#76838f');
			}, 'click':function() {
				window.open("<%= f.getTicUrl() %>", "_blank");
			}});
		});
		
		//var address = "";
		//var addressDetail = "흰물결아트센터";
		function fesMapSetting() {
			
			var mapContainer = document.getElementById('fesmap'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('<%= mapLoc[1] %>', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			 
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            //content: '<div style="width:100%;text-align:center;line-height:2;">&nbsp;&nbsp;' + addressDetail + '&nbsp;&nbsp;</div>'
			        	content: '<div style="text-align:center;padding:7px 0;white-space:nowrap;">&nbsp;&nbsp;' + '<%= mapLoc[1] %>' + '&nbsp;&nbsp;</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		}
	</script>
    
    <h1 class="htext">F E S T I V A L</h1>
    <!-- 행사 지원 코딩 끝 -->
    
	<%@ include file="../../views/common/footer.jsp" %>
    

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="<%= request.getContextPath() %>/plugins/common/common.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/custom.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/settings.js"></script>
    <script src="<%= request.getContextPath() %>/js/gleek.js"></script>
    <script src="<%= request.getContextPath() %>/js/styleSwitcher.js"></script>

    <script src="<%= request.getContextPath() %>/plugins/moment/moment.js"></script>
    <script src="<%= request.getContextPath() %>/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
    <!-- Clock Plugin JavaScript -->
    <script src="<%= request.getContextPath() %>/plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
    <!-- Color Picker Plugin JavaScript -->
    <script src="<%= request.getContextPath() %>/plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
    <script src="<%= request.getContextPath() %>/plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
    <script src="<%= request.getContextPath() %>/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
    <!-- Date Picker Plugin JavaScript -->
    <script src="<%= request.getContextPath() %>/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <!-- Date range Plugin JavaScript -->
    <script src="<%= request.getContextPath() %>/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="<%= request.getContextPath() %>/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>

    <script src="<%= request.getContextPath() %>/js/plugins-init/form-pickers-init.js"></script>
    
</body>
</html>>