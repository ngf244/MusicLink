<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../js/jquery-3.4.1.min.js"></script>
</head>
<body onload="doitfirst();">
	<h3>어떠한 행사에 러브콜을 보내시겠습니까?</h3>
	<form action="<%=request.getContextPath()%>/sendLoveCall.send" method="POST">
		<input type="hidden" id="artistCode" name="artistCode" value="왜안돼ㅅㅂ">
		<select id="fesCode" name="fesCode">
		</select>
		<br>
		<h4>보내실 메세지를 적어주세요</h4>
		<textarea rows="8" cols="40" name="message" id="message"></textarea> ->
		<button type="button" onclick="return sendLoveCall();">러브콜 보내기</button>
	</form>
</body>
<script>
	function doitfirst() {
		console.log("잘되네");
		$.ajax({
			url : '<%=request.getContextPath()%>/loadlist.load',
			type : 'get',
			success : function (data) {
				if(Object.keys(data).length){
					console.log(data);
					var $list = $('#fesCode');
					for(var i in data){
						console.log(i);
						console.log(data[i]);
						var $option = $('<option>');
						
						$option.val(i);
						$option.text(data[i]);
						$list.append($option);
					}
				}else{
					alert("등록한 행사가 없어 러브콜을 보낼 수 없습니다.");
					self.close();
				}
			}
		})
	}

/* 	function sendLoveCall() {
		if(confirm("러브콜을 보내시겠습니까?")){
			window.setInterval(function () {
				self.close();
			}, 1000);
			alert('러브콜 전송하였습니다');
			return true;
		} else {
			return false;
		}
	} */

	function sendLoveCall() {
		if(confirm("러브콜을 보내시겠습니까?")){
			var artistCode = $('#artistCode').val();
			var fesCode = $('#fesCode').val();
			var message = $('#message').val();

			console.log(artistCode);
			console.log(fesCode);
			console.log(message);
			$.ajax({
				url : "<%=request.getContextPath()%>/sendLoveCall.send",
				data : {artistCode : artistCode, fesCode : fesCode, message : message},
				type : 'get',
				success : function(data){
					if(data == 1){
						alert("러브콜 전송 성공!")
					} else {
						alert("와 실패했어 대박.")
					}
					self.close();
				}
			})
		} else {
			return false;
		}
	}

</script>


</html>