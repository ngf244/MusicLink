<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "festival.model.vo.Festival, java.util.Date, java.util.GregorianCalendar" %>
<%
	Festival f = (Festival)request.getAttribute("festival");
	int artcount = (int)request.getAttribute("artcount");
	
	String fulLoc = f.getFesLoc();
	String splitzone[] = fulLoc.split("&");
	String splitaddress[] = splitzone[1].split("/");
%>
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
	/*	
    section {width:70%; height:255%; padding-bottom:60px; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 21%; position: relative;
    background: #fff; display: block;}
    
    .htext{text-align: center; font-size: 100px; height:0; position:absolute; top:47%; left: 50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
    */
    /*
	section {width:70%; height:255%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: 250px; position: relative;
    background: #fff; padding-top: 0px; padding-bottom:10%;}
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top: -9%; left: 50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
	*/
    section {width:70%; height:255%; margin:0 auto; box-shadow: 5px 5px 10px 8px lightgray; margin-top: -128px; position: relative;
    background: #fff; padding-top: 0px; padding-bottom:10%;}
    
    .htext{text-align: center; font-size: 100px; height:0; position: absolute; top: 16.8%; left: 50%; transform: translateX(-50%); color: rgb(224, 224, 224);}
	
    #scale{transform:scale(1.2);}
    
	#categoryArea{position: absolute; top: 35%; left: 12%; display: inline-block;}
	#contentArea{width:100%; padding-top: 12%; text-align:center; position: absolute; left: 8%; display:inline-block;}
	
	#inBigCategory {font-family: 'Bungee', cursive; font-size: 50px; vertical-align: middle;}
	#inSmallCategory {font-family: 'Comfortaa', cursive; font-size: 30px;}
    #block{background: #8AFF00; width: 55px; height: 8px; margin-top: 50px; margin-left: 2px;}
    
    .alert{font-size: 16px; line-height: 2; width:82.5%; }
    
    #updateForm{width: 90%; position:absolute; left: 50%; transform: translateX(-50%);}
    #insertInfo{width: 100%; text-align: left; display:inline-block; border-spacing: 40px; border-collapse: separate; text-align: left;}
    #insertInfo textarea{border-radius: 4px; border: 1px solid #ced4da;}
    td{vertical-align:middle;}
    
    .label{width:30%; font-size:12pt; font-weight: regular; text-align:center; line-height:20px;}
    .tdcenter{text-align:center; font-size:13px; color: #FF9090;}
    .enroll{width: 100px; height: calc(2.0625rem + 2px);}
    
    #fesName{width:70%;}
    
    #payPickerStyle{background: #000; color: white; line-height: 35px;}
    #datePickerStyle{background: #000; color: white; width:25px; line-height: 3; text-align:center;}
    .dategroup{width: 300px;}
    .artdategroup{width: 300px;}
    .datestyle{border-radius: 4px;}
    
    .deleteImg{width:auto; height:25px; margin-top:8px; margin-left:10px;}
    
    #wrap{display:none; border:1px solid #DDDDDD; width:500px; margin-top:5px;}
    #fesmap{border: 1px solid #ced4da; border-radius: 4px; width:80%; height:300px;}
    #zonecodeInput{width: 180px; display:inline-block; margin-bottom: 7px;}
    #addressInput{width: 54%; display:inline-block;}
    #detailAddressInput{width: 30%; display:inline-block;}
    
    #moneyRange{width: 400px;}
    
    #festivalInfo{width:85%; resize: none; padding: 10px; border: 1px solid #ced4da; border-radius: 4px;}
    
    .postergroup{width:60%; top:25%; transform: translateY(25%);}
    #posterPath, #bannerPath{font-size:13px; overflow:hidden;}
    
    .colauto{width:100%;}
    .feesize{width:50%;}
    .feeop{width:20%; line-height:23px; margin-top:-5px; margin-left:5%;}
    .urlsize{width: 90%;}
    
    .tdcenter{text-align:center; color: #DB0000;}
    .tdcenter input{margin-top: 2%;}
    
    footer .ft-content{width:70%; !important;}
    
</style>

</head>
<body onload="fesMapSetting('<%= splitaddress[0] %>');">
	<%@ include file="../../views/common/menubar.jsp" %>
    
	<br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br>
	
    
    <!-- 행사 지원 코딩 시작 -->
	<section style="z-index: 1;">
		<div id="scale">
		<div id="categoryArea">
			<div id="block"></div><br>
			<label id="inBigCategory">FESTIVAL</label>
			<label id="inSmallCategory"> - Update</label>
		</div>
		
		<script>
			$(function() {
				var posflag = false;
				var banflag = false;
				
				<% if(artcount == f.getRecCount()) { %> //아티스트 확정
					$('#alert').css('visibility', 'visible');

					$('#inputfee').val('<%= f.getTicFee() %>');
					$('#inputurl').val('<%= f.getTicUrl() %>');
					$('#feativalDate').attr('disabled', true);
					$('#feativalDate').attr('disabled', true);
					
					$('#fesName').attr('readonly', true);
					$('#moneyMin').attr('readonly', true);
					$('#moneyMax').attr('readonly', true);
					
					$('#status').val('true');
				<% } else if(artcount > 0 && artcount < f.getRecCount()) { %> //아티스트 모집 중 & 확정 아티스트 1명 이상
					$('#alert').css('visibility', 'visible');
				
					$('#inputfee').attr('disabled', true);
					$('#inputurl').attr('disabled', true);
					
					$('#fesName').attr('readonly', true);
					$('#moneyMin').attr('readonly', true);
					
					$('#feativalDate').attr('disabled', true);
					$('#freeChk').attr('disabled', true);
					
					$('#status').val('false');
				<% } else {%> //아티스트 모집 중 & 확정 아티스트 0명
					$('#alert').css('visibility', 'hidden');
					/*
					var addalter = {
						'data-toggle':'tooltip',
						'data-placement':'right',
						'title':'모든 아티스트 확정 시 설정 가능합니다.'
					};
					$('.altertog').attr(addalter);
					*/

					$('#inputfee').attr('disabled', true);
					$('#inputurl').attr('disabled', true);
					
					$('#freeChk').attr('disabled', true);
					$('#contentArea').css('padding-top', '5%');
					$('section').css('height', '245%');
					
					$('#status').val('false');
				<% } %>
				
				<% if(f.getBanPath() == null || f.getBanPath().equals("null")) { %>
					$('#bannerPath').text('파일을 선택해주세요');
					$('#oriban').val(null);
				<% } else { %>
					$('#oriban').val('<%= f.getBanPath() %>');
				<%	} %>
				
				<% if(f.getSecOp() != null) { %>
					<% if(f.getSecOp().equals("Y")) { %>
						$('#secretOp').attr('selected', 'true');
					<% } else { %>
						$('#secretOp').attr('selected', 'false');
					<% } %>
				<% } %>
				
				<% if(splitaddress.length > 1) { %>
					$('#detailAddressInput').val('<%= splitaddress[1] %>');
				<% } %>

				<% if(f.getTicFreeOp() != null) { %>
					<% if((f.getTicFreeOp()).equals("Y")) { %>
		           		$('#inputfee').attr('disabled', true);
		           		$('#freeChk').prop('checked', true);
					<% } else { %>
		           		$('#inputfee').attr('disabled', false);
		           		$('#freeChk').prop('checked', false);
					<% } %>
				<% } %>
				
				$("#freeChk").change(function(){
			        if($("#freeChk").is(":checked")){
			            $('#inputfee').attr('disabled', true);
			        }else{
			            $('#inputfee').attr('disabled', false);
			        }
			    });
				
				var payrange = '<%= f.getPayRange() %>';
				var paysplit = payrange.split("~");
				$('#moneyMin').val(paysplit[0]);
				$('#moneyMax').val(paysplit[1]);
			});
    		
    		<%
    			String recstr[] = f.getRecTerm().split(" - ");
				String recstrSplit[] = recstr[0].split("/");
	    		Date recStrDate = new Date(new GregorianCalendar(Integer.parseInt(recstrSplit[2]), Integer.parseInt(recstrSplit[0])-1, Integer.parseInt(recstrSplit[1])).getTimeInMillis());
    			
    		%>
		</script>
		
		<div id="contentArea">
			<form action="<%= request.getContextPath() %>/update.fes.do" method="post" id="updateForm" name="updateForm" encType="multipart/form-data" onsubmit="return submitForm();">
				<div class="alert alert-danger" id="alert">※ 공연이 확정된 아티스트가 존재하여 특정 정보를 수정할 수 없습니다. Q&A에 문의해주세요.</div>
				<input type="hidden" name="fesCode" value="<%= f.getFesCode() %>">
				<table id="insertInfo">
					<tr>
						<td class="label">행사명 &nbsp;<span class="text-danger">*</span></td>
						<td>
							<input type="text" name="fesName" id="fesName" class="form-control input-default enroll" value="<%= f.getFesName() %>">
						</td>
					</tr>
					<tr>
						<td class="label">행사 기간 &nbsp;<span class="text-danger">*</span></td>
						<td>
							<input type="hidden" name="hide_feativalDate" value="<%= f.getFesTerm() %>">
							<div class="input-group dategroup">
								<input class="form-control input-daterange-datepicker datestyle" type="text" id="feativalDate" name="feativalDate" value="<%= f.getFesTerm() %>">
								<span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">아티스트 모집 기간 &nbsp;<span class="text-danger">*</span></td>
						<td>
							<input type="hidden" name="artistStrDate" value="<%=recstr[0]%>">
			                <div class="input-group artdategroup">
                            	<input type="text" class="form-control datestyle" id="artistStrDate" value="<%= recstr[0] %>" disabled>
								<span id="datePickerStyle">&nbsp;&nbsp;-&nbsp;&nbsp;</span> 
                            	<input type="text" class="form-control mydatepicker datestyle" id="artistEndDate" name="artistEndDate" value="<%= recstr[1] %>">
                            	<span class="input-group-append"><span class="input-group-text"><i class="mdi mdi-calendar-check"></i></span></span>
                            </div>
						</td>
					</tr>
					<tr>
						<td class="label" rowspan=2>행사 장소 &nbsp;<span class="text-danger">*</span></td>
						<td>
							<input type="text" class="form-control input-default enroll inputValCk" id="zonecodeInput" name="zonecodeInput" value="<%= splitzone[0] %>" readonly/>&nbsp;
							<input type="button" class="btn mb-1 btn-dark" onClick="openDaumZipAddress();" value = "우편번호"/><br>
							
							<input type="text" class="form-control input-default enroll inputValCk" id="addressInput" name="addressInput" value="<%= splitaddress[0] %>" readonly/>
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
								<span id="payPickerStyle">&nbsp;&nbsp;~&nbsp;&nbsp;</span> 
								<input type="text" id="moneyMax" name="moneyMax" class="form-control input-default enroll inputValCk" placeholder="최대금액">
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">모집 인원 수 &nbsp;<span class="text-danger">*</span><br>(팀 수)</td>
						<td>
							<input type="number" id="needCount" name="needCount" class="form-control input-default enroll inputValCk" min=<%= artcount %> max=20 value="<%= f.getRecCount() %>">
						</td>
					</tr>
					<tr>
						<td class="label">행사 포스터 &nbsp;<span class="text-danger">*</span></td>
						<td>
                            <div class="form-row align-items-center colauto">
                            <div class="col-auto postergroup">
								<div class="input-group mb-3">
									<div class="custom-file clickpos">
										<input type="file" accept="image/*" name="posterPath" class="custom-file-input posterPath" onchange="reviewUploadImg(this,'0');">
										<label class="custom-file-label inputTextCk" id="posterPath"><%= f.getPosPath() %></label>
									</div>
								</div>
								<input type="hidden" name="oripos" value="<%= f.getPosPath() %>">
								<input type="hidden" id="postri" name="postri">
							</div>
							
	                        <div class="col-auto">
								<img src="<%= request.getContextPath() %>/img/trash.png" class="deleteImg" id="deletePos">
							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">행사 배너</td>
						<td>
                            <div class="form-row align-items-center colauto">
                            <div class="col-auto postergroup">
								<div class="input-group mb-3">
									<div class="custom-file clickban">
										<input type="file" accept="image/*" name="bannerPath" class="custom-file-input bannerPath" onchange="reviewUploadImg(this,'1');">
										<label class="custom-file-label" id="bannerPath"><%= f.getBanPath() %></label>
									</div>
								</div>
								<input type="hidden" id="oriban" name="oriban">
								<input type="hidden" id="bantri" name="bantri">
							</div>
							
	                        <div class="col-auto">
								<img src="<%= request.getContextPath() %>/img/trash.png" class="deleteImg" id="deleteBan">
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
							<textarea id="festivalInfo" name="festivalInfo" class="inputValCk" rows="10" cols="80"><%= f.getFesInfo() %></textarea>
						</td>
					</tr>
					<tr>
						<td class="label">관람비</td>
						<td>
                            <div class="form-row align-items-center colauto">
                            <div class="col-auto feesize">
								<div class="input-group mb-3" data-toggle="tooltip" data-placement="right" title="모든 아티스트 확정 시 설정 가능합니다.">
									<input type="text" id="inputfee" name="inputfee" class="form-control input-default">
									<div class="input-group-append">
										<span class="input-group-text">&#8361;</span>
									</div>
								</div>
							</div>
							
                            <div class="col-auto feeop">
                                <div class="form-check mb-2">
								<label class="form-check-label">
									<input type="checkbox" class="form-check-input" id="freeChk" name="freeChk"> 무료
								</label>
								</div>
							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="label">티켓 구매처</td>
						<td>
							<div class="input-group mb-3 urlsize" data-toggle="tooltip" data-placement="right" title="모든 아티스트 확정 시 설정 가능합니다.">
								<input type="text" id="inputurl" name="inputurl" class="form-control input-default">
								<div class="input-group-append">
									<span class="input-group-text">https://example.com</span>
								</div>
							</div>
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
							<input type="submit" class="btn mb-1 btn-dark" id="updateSubmit" value="저장">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" class="btn mb-1 btn-dark" onclick="window.history.back();" value="취소">
						</td>
					</tr>
				</table>
				<input type="hidden" id="status" name="status">
			</form>
		</div>
		</div>
    </section>
    <script>
		
		$('.clickpos').change(function() { posflag = true; $('#postri').val('true'); console.log("posflag : " + posflag); });
		$('.clickban').change(function() { banflag = true; $('#bantri').val('true'); console.log("banflag : " + banflag); });
		
		$('#deletePos').click(function() {
			if($('#posterPath').text() != "파일을 선택해주세요") {
    			$('.posterPath').val('');
    			$('#postri').val('delete');
    			$('#posterPath').text('파일을 선택해주세요');
    			posflag = true;
			}
		});
		$('#deleteBan').click(function() {
			if($('#bannerPath').text() != "파일을 선택해주세요") {
    			$('.bannerPath').val('');
    			$('#bantri').val('delete');
    			$('#bannerPath').text('파일을 선택해주세요');
    			banflag = true;
			}
		});
		
    	$(function() {
    		$('#moneyMin, #moneyMax').on({'keyup':function() {
    			var regExp = /[^0-9]/gi;
    			var val = $(this).val().trim();
				
    			if(regExp.test(val) == true) {
    				$(this).val(null);
    			}
    		}})
	    	
	    	$(".inputValCk, .inputTextCk").change(function() {
	    		if($(this).val())
	    			$(this).css('border', '1px solid #ced4da');
	    	});
    		
    		$('#needCount').change(function() {
    			if(parseInt($('#needCount').val()) > <%= artcount %>) {
    				$('#moneyMax').attr('readonly', false);
					$('#inputfee').attr('disabled', true);
					$('#inputurl').attr('disabled', true);
					$('#freeChk').attr('disabled', true);
    			}
    		});
    	});
		
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
	    		if(($(this).text() == "파일을 선택해주세요") || (!$(this).text())) {
	    			idStr+=$(this).attr('id')+" / ";
	    			emptyCk = true;
	    			return true;
	    		}
	    	}).css('border', '1px solid red');
	    	
	    	console.log(idStr);

	    	if(emptyCk == true) {
	    		alert('필수항목을 기재해주세요');
	    	} else {
	    		var fesday = $('#feativalDate').val();
	    		var artend = $('#artistEndDate').val();
	    		
	    		var fesSplit = fesday.split(" - ");
	    		var artSplit = artday.split(" - ");
				
	    		var fesStrSplit = fesSplit[0].split("/");
	    		var fesstrday = new Date(fesStrSplit[2], parseInt(fesStrSplit[0])-1, fesStrSplit[1]);
				
	    		var artEndSplit = artend.split("/");
	    		var artendday = new Date(artEndSplit[2], parseInt(artEndSplit[0])-1, artEndSplit[1]);
	    		
	    		today.setHours(0,0,0,0);
	    		
	    		if($('#feativalDate').attr('disabled') == true) {
		    		if(artendday.getTime() > fesstrday.getTime()) {
		    			alert("아티스트 모집 기간은 행사 기간 이전에 마감되어야 합니다");
		        		return false;
		    		} else if (artendday.getTime() < <%= recstr[0] %>) {
		    			alert("아티스트 모집 마감 날짜가 시작 날짜보다 빠릅니다");
		        		return false;
		    		}
	    		} else {
		    		if($('#feativalDate').val() != <%= f.getFesTerm() %>) {
			    		if (fesstrday.getTime() < today.getTime()) {
			    			alert("오늘 이전의 날짜는 등록할 수 없습니다");
			        		return false;
			    		}
		    		}
		    		
		    		if(artendday.getTime() > fesstrday.getTime()) {
		    			alert("아티스트 모집 기간은 행사 기간 이전에 마감되어야 합니다");
		        		return false;
		    		} else if (artendday.getTime() < <%= recstr[0] %>) {
		    			alert("아티스트 모집 마감 날짜가 시작 날짜보다 빠릅니다");
		        		return false;
		    		}
	    		}

				if($('#moneyMin').val() > $('#moneyMax').val()) {
					alert('공연비의 최소금액이 최대 금액보다 높습니다.');
				}
	    	
	    	return false;
	    }
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
		function fesMapSetting(address) {
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
			            content: '<div style="text-align:center;padding:7px 0;white-space:nowrap;">&nbsp;&nbsp;' + address + '&nbsp;&nbsp;</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});
		}
		
		var sechi = ($('section').css('height')).split("px");
		function openDaumZipAddress() {
			var splitSection = ($('section').css('height')).split("px");
			if(parseInt(sechi[0]) == parseInt(splitSection[0])) {
				$('section').css('height', (parseInt(sechi[0]) + 620) + 'px');
			} else {
				$('section').css('height', sechi[0] + 'px');
			}
			
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
</html>