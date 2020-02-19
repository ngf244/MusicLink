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
    <link rel="icon" type="image/png" sizes="16x16" href="<%= request.getContextPath() %>/images/favicon.png">
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

    <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">
    
	<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/reset.css" />
    
<title>행사 수정</title>
<style>
		.toggle-switch, .toggle-switch .toggle-knob {
		    -moz-transition: all 0.2s ease-in;
		    -webkit-transition: all 0.2s ease-in;
		    -o-transition: all 0.2s ease-in;
		    transition: all 0.2s ease-in;
		}
		
		.toggle-switch {
		    height: 30px;
		    width: 55px;
		    display: inline-block;
		    background-color: #ffffff;
		    margin: 2px;
		    margin-bottom: 15px;
		    border-radius: 30px;
		    cursor: pointer;
		    border: solid 1px #d2d6de;
		    box-shadow: inset 1px 1px 9px -3px rgba(4, 4, 4, 0.08), 1px 2px 6px -2px rgba(0, 0, 0, 0.01);
		}
		
		.toggle-switch .toggle-knob {
		    width: 28px;
		    height: 26px;
		    display: inline-block;
		    background-color: #ffffff;
		    border: solid 1px rgba(126, 126, 126, 0.07);
		    box-shadow: 0 1px 3px rgba(107, 106, 106, 0.26), 0 5px 1px rgba(107, 106, 106, 0.13);
		    border-radius: 26px;
		    margin: 1px 1px;
		}
		
		.toggle-switch.active {
		    background-color: #77e189;
		    border: solid 1px transparent;
		}
		
		.toggle-switch.active .toggle-knob {
		    margin-left: 24px;
		}
		
    section {width:70%; min-height:245%; padding-bottom:60px; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 19.5%; position: relative;
    background: #fff; display: block;}
    
    .htext{text-align: center; font-size: 100px; height:0; position:absolute; top:47%; left: 50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
	
	#categoryArea{position: absolute; top: 1.8%; left: 3%; display: inline;}
	#contentArea{padding-top: 12%; text-align: center; display: inline-block;}
	
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; top: 5%; margin-left:1%;}
    
    .alert{font-size: 13px;}
    
    #enrollForm{width: 82%; position:absolute; left: 50%; transform: translateX(-50%);}
    #insertInfo{width: 100%; text-align: left; display:inline-block; border-spacing: 40px; border-collapse: separate; text-align: left;}
    #insertInfo textarea{border-radius: 4px; border: 1px solid #ced4da;}
    td{vertical-align:middle;}
    
    .label{width:300px; font-size:12pt; font-weight: regular; text-align:center; line-height:20px;}
    .#dcenter{text-align:center;}
    .enroll{width: 100px; height: calc(2.0625rem + 2px);}
    
    #fesName{width:300px;}
    
    #datePickerStyle{background: #000; color: white; line-height: 35px;}
    .dategroup{width: 250px;}
    
    #map{border: 1px solid #ced4da; border-radius: 4px; width:500px; height:300px;}
    #zonecodeInput{width: 180px; display:inline-block; margin-bottom: 7px;}
    #addressInput{width: 54%; display:inline-block;}
    #detailAddressInput{width: 30%; display:inline-block;}
    
    #moneyRange{width: 400px;}
    .inputMoney{width: 250px;}
    
    #festivalInfo{resize: none; border: 1px solid #ced4da; border-radius: 4px;}
    
    .postergroup{width:420px;}
    
    #enrollSubmit{margin-top:18px;}
    
    #tdcenter{text-align:center; color: #DB0000;}
    
    footer .ft-content{width:70%; !important;}
    
</style>
</head>
<body onload="mapSetting();">

	<%@ include file="../../views/common/menubar.jsp" %>
    
    <!-- 행사 지원 코딩 시작 -->
	<section style="z-index: 1;">
		<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">FESTIVAL</label>
			<label id="inSmallCategory"> - Update</label>
		</div>
		
		<div id="contentArea">
			<form id="enrollForm">
				<div class="alert alert-danger">※ 공연이 확정된 아티스트가 존재하여 특정 정보를 수정할 수 없습니다. Q&A에 문의해주세요.</div>
				<table id="insertInfo">
					<tr>
						<td class="label"><label>행사 명</label></td>
						<td>
							<input type="text" id="fesName" class="form-control input-default enroll" readonly>
						</td>
					</tr>
					<tr>
						<td class="label">행사 기간</td>
						<td>
							<div class="input-group dategroup">
								<input class="form-control input-daterange-datepicker" type="text" name="daterange" value="01/01/2015 - 01/31/2015" disabled>
								<span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">아티스트 모집 기간</td>
						<td>
			                <div class="input-group dategroup">
								<input class="form-control input-daterange-datepicker" type="text" name="daterange" value="01/01/2015 - 01/31/2015">
								<span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label" rowspan=2>행사 장소</td>
						<td>
							<input type="text" class="form-control input-default enroll" id="zonecodeInput" readonly/>&nbsp;
							<input type="button" class="btn mb-1 btn-dark" onClick="openDaumZipAddress();" value = "우편번호" disabled/><br>							
							<input type="text" class="form-control input-default enroll" id="addressInput" readonly/>
							<input type="text" class="form-control input-default enroll" id="detailAddressInput" placeholder="상세주소" readonly/>
							<div id="wrap" style="display:none;border:1px solid #DDDDDD;width:500px;margin-top:5px"></div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="map"></div>
						</td>
					</tr>
					<tr>
						<td class="label">공연비</td>
						<td>
							<div class="input-group" id="moneyRange">
								<input type="text" name="start" class="form-control input-default enroll" readonly> 
								<span id="datePickerStyle">&nbsp;&nbsp;~&nbsp;&nbsp;</span> 
								<input type="text" name="end" class="form-control input-default enroll" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">모집 인원 수<br>(팀 수)</td>
						<td>
							<input type="number" class="form-control input-default enroll" min=1 max=20>
						</td>
					</tr>
					<tr>
						<td class="label">행사 포스터</td>
						<td>
							<div class="input-group mb-3 postergroup">
								<div class="custom-file">
									<input type="file" class="custom-file-input">
									<label class="custom-file-label">Choose file</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">행사 설명</td>
						<td>
							<textarea id="festivalInfo" rows="10" cols="80"></textarea>
						</td>
					</tr>
					<tr>
						<td class="label">관람비</td>
						<td>
							<div class="input-group mb-3 inputMoney" data-toggle="tooltip" data-placement="right" title="모든 아티스트 확정 시 설정 가능합니다.">
								<input type="text" class="form-control input-default" disabled>
								<div class="input-group-append">
									<span class="input-group-text">&#8361;</span>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">티켓 구매처</td>
						<td>
							<div class="input-group mb-3" data-toggle="tooltip" data-placement="right" title="모든 아티스트 확정 시 설정 가능합니다.">
								<input type="text" class="form-control input-default" disabled>
								<div class="input-group-append">
									<span class="input-group-text">https://example.com</span>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">비공개 옵션</td>
						<td>
							<span class="toggle-switch" data-toggle="tooltip" data-placement="right" title="행사수정을 통해 변경 가능합니다.">
							  <span class="toggle-knob"></span>
							</span>
						</td>
					</tr>
					<tr>
						<td id="tdcenter" colspan=2>
							<span>※ 비공개로 등록시 해당 행사는 행사리스트에 표시되지 않고 러브콜 받은 아디스트에게만 표시됩니다.</span>
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" class="btn mb-1 btn-dark" id="enrollSubmit" value="저장">
			</form>
		</div>
    </section>
    
    <script type="../text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="../text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f12f8983e3395277ce748044a97f80ae&libraries=services"></script>
	<script>
		var address = '서울 강남구 테헤란로14길 6';
		var zonecode = "";
		
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
			            //content: '<div style="width:auto;display:inline-block;white-space:nowrap;text-align:center;padding:7px 0;">&nbsp;&nbsp;' + address + '&nbsp;&nbsp;</div>'
			        	content: '<div style="text-align:center;padding:7px 0;white-space:nowrap;">&nbsp;&nbsp;' + address + '&nbsp;&nbsp;</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		}
		
		function openDaumZipAddress() {
	        // 우편번호 찾기 화면을 넣을 element를 지정
	        var element_wrap = document.getElementById("wrap");
	
	        // wrap 레이어가 off된 상태라면 다음 우편번호 레이어를 open 한다.
	        if(jQuery("#wrap").css("display") == "none") {
	            new daum.Postcode({
	                oncomplete:function(data) {
	                    jQuery("#zonecode").val(data.zonecode);
	                    jQuery("#address").val(data.address);
	                    jQuery("#address_detail").focus();
	                    address = data.address;
	                    zonecode = data.zonecode;
	                   	console.log(data.zonecode);
	                    $('#addressInput').val(address);
	                    $('#zonecodeInput').val(zonecode);
	                    mapSetting();
	                }
	
	                // 사용자가 값을 주소를 선택해서 레이어를 닫을 경우
	                // 다음 주소록 레이어를 완전히 종료 시킨다.
	                , onclose:function(state) {
	                    if(state === "COMPLETE_CLOSE") {
	
	                        // 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
	                        offDaumZipAddress(function() {
	                            element_wrap.style.display = "none";
	                        });
	                    }
	                }
	            }).embed(element_wrap);
	
	            // 슬라이드 다운 기능을 이용해 레이어 창을 오픈한다.
	            jQuery("#wrap").slideDown();
	        }
	        
	        // warp 레이어가 open된 상태라면 다음 우편번호 레이어를 off 상태로 변경한다.
	        else {
	
	            // 콜백함수를 실행하여 슬라이드 업 기능이 실행 완료후 작업을 진행한다.
	            offDaumZipAddress(function() {
	                element_wrap.style.display = "none";
	                return false;
	            });
	        }
	    }
	
	    function offDaumZipAddress() {
	        // 슬라이드 업 기능을 이용해 레이어 창을 닫는다.
	        jQuery("#wrap").slideUp();
	    }
	    
	    var toggler = document.querySelector('.toggle-switch');
	
	    toggler.onclick = function(){
	      toggler.classList.toggle('active');
	    }
	</script>
    
    <h1 class="htext">F E S T I V A L</h1>
    <!-- 행사 지원 코딩 끝 -->
    
	<%@ include file="../../views/common/footer.jsp" %>
    
<script src="<%= request.getContextPath() %>/js/respond.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
</html>