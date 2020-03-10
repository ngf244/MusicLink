<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h3>거절 메세지 입력</h3>
	<textarea rows="15" cols="50" id="message"></textarea>
	<button onclick="return sendmessage();">메세지 보내기</button>
</body>
<script>
	function sendmessage(){
		var check = confirm("이대로 보내시겠습니까?");
		if(check){
			var message = $('#message').val();
			var userCode = opener.document.getElementById("userCode").value;
			// var userCode2 = opener.document.enrollForm-artist.userCode.value;
			// console.log(userCode2);
			$.ajax({
				url : '<%=request.getContextPath()%>/send.message',
				type : 'get',
				data : {message:message, userCode:userCode},
				success : function(data){
					window.alert(data);
					if(typeof(opener.document.enrollForm_co) != 'undefined'){
						opener.location.href="<%=request.getContextPath()%>/requestList.co";
					} else {
						opener.location.href="<%=request.getContextPath()%>/requestList.at";
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