<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
    
	<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
	
    <!-- Favicon icon -->
    <link rel="icon" type="<%= request.getContextPath() %>/image/png" sizes="16x16" href="<%= request.getContextPath() %>/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="<%= request.getContextPath() %>/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
    <!-- Page plugins css -->
    <link href="<%= request.getContextPath() %>/plugins/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
    <!-- Color picker plugins css -->
    <link href="<%= request.getContextPath() %>/plugins/jquery-asColorPicker-master/css/asColorPicker.css" rel="stylesheet">
    <!-- Date picker plugins css -->
    <link href="<%= request.getContextPath() %>/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
    <!-- Daterange picker plugins css -->
    <link href="<%= request.getContextPath() %>/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
	
    <!-- Custom Stylesheet -->
    <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">
    
	<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    
<title>행사 상세 페이지</title>
<style>
    section {width:70%; height:120%; padding-bottom:60px; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 21%; position: relative;
    background: #fff; display: block;}
    
    .htext{text-align: center; font-size: 100px; height:0; position:absolute; top:47%; left: 50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
    
    #scale{/*transform:scale(1.2);*/}
    
	#categoryArea{position: absolute; top: 35%; left: 12%; display: inline-block;}
	#contentArea{width:83.5%; padding-top: 12%; text-align:center; position: absolute; left: 50%; transform: translateX(-50%); display:inline-block;}
	
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px; vertical-align: middle;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; margin-top: 50px; margin-left: 2px;}
    
    #bigArea{width:90%; height:100%; text-align:center; display:inline-block;}
    
    #promotionImg{width:240px; height:360px; background:lightgray; text-align:right;}
    .alignspan{font-size:11px; font-weight: bold; margin-top: 330px; margin-right:12px;}
    
    #festivalPosterArea{width:30%; display:inline-block; vertical-align:top; margin-top: 2%; margin-right:2%;}
    #festivalInfoArea{width:65%; display:inline-block; font-size:15px; margin-bottom:5%;}
    #infoTable{border-spacing: 20px; border-collapse: separate; text-align: left; line-height:1.8em}
    #infoTable td{vertical-align:middle;}
    #label{width:30%;}
    #ticketLink{font-size: 12px; cursor:pointer;}
    #companyStar{color: #FFCD12;}
    
    #map{width:100%; height:350px; border: 1px solid #ced4da; border-radius: 4px; margin-bottom:5%;}
    
    footer .ft-content{width:70%; !important;}
</style>
</head>
<body onload="mapSetting();">
	<%@ include file="../../views/common/menubar.jsp" %>
    
    <!-- 행사 상세 페이지 코딩 시작 -->
	<section style="z-index: 1;">
		<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">FESTIVAL</label>
			<label id="inSmallCategory"> - Detail</label>
		</div>
		
		<div id="contentArea">
			<div id="bigArea">
				
				<div id="festivalPosterArea">
					<div id="promotionImg">
						<span class="badge badge-pill badge-success alignspan">아티스트 모집 중</span>
					</div>
				</div>
				
				<div id="festivalInfoArea">
					<table id="infoTable">
						<tr>
							<td id="label">행사명</td>
							<td>제 3회 KH 토크콘서트</td>
						</tr>
						<tr>
							<td>행사 기간</td>
							<td>2020.01.16 ~ 2020.01.20</td>
						</tr>
						<tr>
							<td>행사 장소</td>
							<td>서울 서초구 반포대로 150 흰물결아트센터</td>
						</tr>
						<tr>
							<td>모집 아티스트 수<br>(팀 수)</td>
							<td>3팀</td>
						</tr>
						<tr>
							<td>확정 아티스트</td>
							<td>하은</td>
						</tr>
						<tr>
							<td>공연비</td>
							<td>
								1,000,000 &#8361; ~ 2,000,000 &#8361; (추후합의) &nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td>아티스트 모집 기간</td>
							<td>2019.12.30 ~ 2020.01.10</td>
						</tr>
						<tr>
							<td>주최사</td>
							<td>
								KH 정보교육원 &nbsp;&nbsp;
								<span id="companyStar">★ ★ ★ ★ ☆</span>	
							</td>
						</tr>
						<tr>
							<td>행사 설명</td>
							<td>
								수강생과 수료생을 이어줄 제 3회 KH 토크콘서트! 
								'Future is Now, 미래를 it는 KH'를 주제로 
								여러분을 미래로 안내할 강연자들과 함께 찾아갑니다.
							</td>
						</tr>
					</table>
				</div>
				
				<br>
				<div id="map"></div>
				
				<input type="button" class="btn mb-1 btn-warning" value="행사 지원">
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
				window.open("http://ticket.interpark.com/Ticket/Goods/GoodsInfo.asp?GoodsCode=19018834", "_blank");
			}})
		})
		
		
		var address = "서울 서초구 반포대로 150";
		//var addressDetail = "흰물결아트센터";
		
		function mapSetting() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address, function(result, status) {
			
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
			        	content: '<div style="text-align:center;padding:7px 0;white-space:nowrap;">&nbsp;&nbsp;' + address + '&nbsp;&nbsp;</div>'
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
    
<script src="<%= request.getContextPath() %>/js/respond.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/js/wow.min.js"></script>
<script src="<%= request.getContextPath() %>/js/parallax.min.js"></script>
<script src="<%= request.getContextPath() %>/js/slick.min.js"></script>

</body>
</html>>