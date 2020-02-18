<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.util.Calendar, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
    
	<script src="../js/jquery-3.4.1.min.js"></script>
	
    <!-- Favicon icon -->
    <link rel="icon" type="../image/png" sizes="16x16" href="../images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="../plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
    <!-- Date picker plugins css -->
    <link href="../plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
    <!-- Daterange picker plugins css -->
    <link href="../plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="../plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <link href="../css/style.css" rel="stylesheet">
    
	<link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/reset.css" />
    
<title>행사 등록</title>

<style>
		label.switch {  
		  text-align: left;
		  width: 70px;
		  height: calc(70px / 2);
		  border-radius:30px;    
		  background-color:#4ed164;
		  display: inline-block;
		  position: relative;
		  cursor: pointer;
		}
		
		label.switch > span {
		  display: block;
		  width: 100%;
		  height: 100%;
		}
		
		label.switch > input[type="checkbox"] {
		  opacity: 0;
		  position: absolute;
		} 
		
		label.switch > span:before, label.switch > span:after {
		  content: "";
		  cursor: pointer;
		  position: absolute;
		}
		
		/*label.switch > input[type="checkbox"]:focus ~ span {
		  box-shadow: 0 0 0 4px #43b556;
		}*/
		
		label.switch > input[type="checkbox"]:checked:focus ~ span {
		  box-shadow: 0 0 0 4px #fff;
		}
		
		label.switch > span {
		  border-radius: 60px;
		}
		
		label.switch > span:before {
		  width: 100%;
		  height: 100%;
		  box-sizing: border-box;
		  background-color: #f1f1f1;
		  border-radius: 60px;
		  transition: opacity .2s ease-out .1s, transform .2s ease-out .1s;
		  transform: scale(1);
		  opacity: 1;
		}
		
		label.switch > span:after{
		  top: 50%;
		  z-index: 3;
		  transition: transform .4s cubic-bezier(0.44,-0.12, 0.07, 1.15);
		  width: calc(70px / 2);
		  height: calc(70px / 2);
		  transform: translate3d(0, -50%, 0);
		  background-color: #fff;
		  border-radius: 100%;
		  box-shadow: 0 2px 5px rgba(0, 0, 0, .3);  
		}
		
		label.switch > input[type="checkbox"]:checked ~ span:before {
		  transform: scale(0);
		  opacity: .7;
		}
		
		label.switch > input[type="checkbox"]:checked ~ span:after {
		  transform: translate3d(100%, -50%, 0);
		}
		
    section {width:70%; height:230%; padding-bottom:60px; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 21%; position: relative;
    background: #fff; display: block;}
    
    .htext{text-align: center; font-size: 100px; height:0; position:absolute; top:47%; left: 50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
    
    #scale{transform:scale(1.2);}
    
	#categoryArea{position: absolute; top: 35%; left: 12%; display: inline-block;}
	#contentArea{width:100%; padding-top: 12%; text-align:center; position: absolute; left: 8%; display:inline-block;}
	
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px; margin-top: -9%;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px; margin-top: -9%;}
    #block{background: #8AFF00; width: 55px; height: 8px; margin-top: 13%; margin-left: 2px;}
    
    #enrollForm{width: 90%; position:absolute; left: 50%; transform: translateX(-50%);}
    #insertInfo{width: 100%; text-align: left; display:inline-block; border-spacing: 40px; border-collapse: separate; text-align: left;}
    #insertInfo textarea{border-radius: 4px; border: 1px solid #ced4da;}
    td{vertical-align:middle;}
    
    .label{width:30%; font-size:12pt; font-weight: regular; text-align:center; line-height:20px;}
    .tdcenter{text-align:center; font-size:13px; color: #FF9090;}
    .enroll{width: 100px; height: calc(2.0625rem + 2px);}
    
    #fesName{width:70%;}
    
    #datePickerStyle{background: #000; color: white; line-height: 35px;}
    .dategroup{width: 250px;}
    .datestyle{border-radius: 4px;}
    
    #wrap{display:none; border:1px solid #DDDDDD; width:500px; margin-top:5px;}
    #fesmap{border: 1px solid #ced4da; border-radius: 4px; width:80%; height:300px;}
    #zonecodeInput{width: 180px; display:inline-block; margin-bottom: 7px;}
    #addressInput{width: 54%; display:inline-block;}
    #detailAddressInput{width: 30%; display:inline-block;}
    
    #moneyRange{width: 400px;}
    
    #festivalInfo{width:85%; resize: none; padding: 10px; border: 1px solid #ced4da; border-radius: 4px;}
    
    .postergroup{width:60%; top:25%; transform: translateY(25%);}
    #posterPath, #bannerPath{font-size:13px; overflow:hidden;}
    
    .space{margin:0; padding:0;}
    
    #enrollSubmit{margin-top:30px;}
    
	.ft-content{width: 70%;}
</style>
</head>
<body onload="fesMapSetting();">
    
	<%@ include file="../views/common/menubar.jsp" %>
    
    <!-- 행사 지원 코딩 시작 -->
	<section style="z-index: 1;">
		<div id="scale">
		<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">FESTIVAL</label>
			<label id="inSmallCategory"> - Enroll</label>
		</div>
		
		<div id="contentArea">
			<form action="<%= request.getContextPath() %>/insert.fes" method="post" id="enrollForm" name="enrollForm" encType="multipart/form-data" onsubmit="return submitForm();">
				<table id="insertInfo">
					<tr>
						<td class="label">행사명 &nbsp;<span class="text-danger">*</span></td>
						<td>
							<input type="text" name="fesName" id="fesName" class="form-control input-default enroll inputValCk">
						</td>
					</tr>

					<%
						Date date = new Date();
						
						Calendar cal = Calendar.getInstance();
						cal.setTime(date);
						cal.add(Calendar.DATE, 7);
					
						SimpleDateFormat formatDate = new SimpleDateFormat("MM/dd/yyyy");
						String strDate = formatDate.format(date);
						String endDate = formatDate.format(cal.getTime());
					%>
					<tr>
						<td class="label">행사 기간 &nbsp;<span class="text-danger">*</span></td>
						<td>
							<div class="input-group dategroup">
								<input class="form-control input-daterange-datepicker datestyle" type="text" id="feativalDate" name="feativalDate" value="<%=strDate%> - <%=endDate%>">
								<span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">아티스트 모집 기간 &nbsp;<span class="text-danger">*</span></td>
						<td>
			                <div class="input-group dategroup">
								<input class="form-control input-daterange-datepicker datestyle" type="text" id="artistDate" name="artistDate" value="<%=strDate%> - <%=endDate%>">
								<span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label" rowspan=2>행사 장소 &nbsp;<span class="text-danger">*</span></td>
						<td>
							<input type="text" class="form-control input-default enroll inputValCk" id="zonecodeInput" name="zonecodeInput" readonly/>&nbsp;
							<input type="button" class="btn mb-1 btn-dark" onClick="openDaumZipAddress();" value = "우편번호"/><br>
							
							<input type="text" class="form-control input-default enroll inputValCk" id="addressInput" name="addressInput" readonly/>
							<input type="text" class="form-control input-default enroll" id="detailAddressInput" name="detailAddressInput" placeholder="상세주소"/>
							<div id="wrap"></div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="fesmap"></div>
						</td>
					</tr>
					<tr>
						<td class="label">공연비 &nbsp;<span class="text-danger">*</span></td>
						<td>
							<div class="input-group" id="moneyRange">
								<input type="text" id="moneyMin" name="moneyMin" class="form-control input-default enroll inputValCk" placeholder="최소금액">
								<span id="datePickerStyle">&nbsp;&nbsp;~&nbsp;&nbsp;</span> 
								<input type="text" id="moneyMax" name="moneyMax" class="form-control input-default enroll inputValCk" placeholder="최대금액">
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">모집 인원 수 &nbsp;<span class="text-danger">*</span><br>(팀 수)</td>
						<td>
							<input type="number" id="needCount" name="needCount" class="form-control input-default enroll inputValCk" min=1 max=20>
						</td>
					</tr>
					<tr>
						<td class="label">행사 포스터 &nbsp;<span class="text-danger">*</span></td>
						<td>
							<div class="input-group mb-3 postergroup">
								<div class="custom-file test">
									<input type="file" multiple="multiple" name="posterPath" class="custom-file-input" onchange="reviewUploadImg(this,'0');">
									<label class="custom-file-label inputTextCk" id="posterPath">파일을 선택해주세요</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">행사 배너</td>
						<td>
							<div class="input-group mb-3 postergroup">
								<div class="custom-file">
									<input type="file" multiple="multiple" name="bannerPath" class="custom-file-input" onchange="reviewUploadImg(this,'1');">
									<label class="custom-file-label" id="bannerPath">파일을 선택해주세요</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="tdcenter" colspan=2>
							<span>※ 배너 이미지 생략 시 리스트에 정상적으로 출력되지만 홍보영역에 나타나지 않습니다. (홍보리스트, 캘린더 등)</span>
						</td>
					</tr>
					<tr>
						<td class="label">행사 설명 &nbsp;<span class="text-danger">*</span></td>
						<td>
							<textarea id="festivalInfo" name="festivalInfo" class="inputValCk" rows="10" cols="80"></textarea>
						</td>
					</tr>
					<tr>
						<td class="label">비공개 옵션</td>
						<td>
							<label class="switch space">
								<input type="checkbox" id="secretOp" name="secretOp">
								<span class="toggle-switch" data-toggle="tooltip" data-placement="right" title="행사수정을 통해 변경 가능합니다."></span>
							</label>
						</td>
					</tr>
					<tr>
						<td class="tdcenter" colspan=2>
							<span>※ 비공개 등록 시 해당 행사는 행사리스트에 표시되지 않고 러브콜 받은 아디스트에게만 표시됩니다.</span>
						</td>
					</tr>
					<tr>
						<td class="tdcenter" colspan=2>
							<input type="submit" class="btn mb-1 btn-dark" id="enrollSubmit" value="등록">
						</td>
					</tr>
				</table>
				<br>
			</form>
		</div>
		</div>
    </section>
    
    <script>
    	
    	$(function() {
    		$('#moneyMin, #moneyMax').on({'keyup':function() {
    			var regExp = /[^0-9]/gi;
    			var val = $(this).val().trim();
				
    			if(regExp.test(val) == true) {
    				$(this).val(null);
    			}
    		}})
    	})
    	
	    function submitForm() {
	    	
	    	var idStr = "";
	    	var emptyCk = false;
	    	
	    	$(".inputValCk").filter(function() {
	    		if(!$(this).val()) {
	    			idStr+=$(this).attr('id')+" / ";
	    			emptyCk = true;
	    			return true;
	    		}
	    	}).css('border', '1px solid red');
	    	
	    	$(".inputTextCk").filter(function() {
	    		if(($(this).text().trim() == "파일을 선택해주세요") || (!$(this).text())) {
	    			idStr+=$(this).attr('id')+" / ";
	    			emptyCk = true;
	    			return true;
	    		}
	    	}).css('border', '1px solid red');
	    	
	    	console.log(idStr);

	    	if(emptyCk == true) {
	    		alert('필수항목을 기재해주세요');
	    	}
    		
	    	return !emptyCk;
	    }
	    
	    function reviewUploadImg(fileObj, where) {
	    	var filePath = fileObj.value;
	    	var fileName = filePath.substring(filePath.lastIndexOf("\\")+1);
	    	var fileKind = fileName.split(".")[1];
	    	
	    	if(where == '0') {
	    		$("#posterPath").text(fileName);
	    	} else {
	    		$("#bannerPath").text(fileName);
	    	}
	    }
    </script>
    
    <script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f12f8983e3395277ce748044a97f80ae&libraries=services"></script>
	<script>
		var address = '서울 강남구 테헤란로14길 6';
		var zonecode = "";
		
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
	                    fesMapSetting();
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
	</script>
    
    <h1 class="htext">F E S T I V A L</h1>
    <!-- 행사 지원 코딩 끝 -->
    
	<%@ include file="../views/common/footer.jsp" %>
	
<script src="../js/respond.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../js/wow.min.js"></script>
<script src="../js/parallax.min.js"></script>
<script src="../js/slick.min.js"></script>
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
    <script src="../plugins/common/common.min.js"></script>
    <script src="../js/custom.min.js"></script>
    <script src="../js/settings.js"></script>
    <script src="../js/gleek.js"></script>
    <script src="../js/styleSwitcher.js"></script>

    <script src="../plugins/moment/moment.js"></script>
    <script src="../plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
    <!-- Date Picker Plugin JavaScript -->
    <script src="../plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <!-- Clock Plugin JavaScript -->
    <script src="../plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
    <!-- Color Picker Plugin JavaScript -->
    <script src="../plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
    <script src="../plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
    <script src="../plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
    <!-- Date range Plugin JavaScript -->
    <script src="../plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="../plugins/bootstrap-daterangepicker/daterangepicker.js"></script>

    <script src="../js/plugins-init/form-pickers-init.js"></script>
</body>
</html>