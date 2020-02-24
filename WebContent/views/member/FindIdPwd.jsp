<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <link href="https://fonts.googleapis.com/css?family=Bungee&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Comfortaa&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>아이디/비밀번호 찾기</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
</head>
<style>
	.find_form{font-family: 'Noto Sans KR', sans-serif;}
	.find_selet_area{background: #af9ce6; color:white;}
	.find_id{margin: 1%;}
	.find_pwd{margin: 1%;}
	table{border: 1px solid black; padding-bottom: 1%; width: 25%;}
	table td{width: 100px; height:30px; text-align: center;}
	.bts{padding-left: 180px;}
	.findBtn{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: #7780b7; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;
	}
	.closeBtn{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: #7780b7; color: white; 
		line-height: 1.5; padding: 4px 10px; margin-left: 220px; width: auto;
		display: inline-block;
	}
	.resultId{color: blue;}
</style>
<body>
	<div class="find_form">
		<div class="find_selet_area">
			<span class="find_id">아이디 찾기</span> / 
			<span class="find_pwd">비밀번호 찾기</span>
		</div>
		<div class="find_id">
			<table>
				<tr>
					<td colspan="3">아이디 찾기</td>
				</tr>
					
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name"></td>
					<td rowspan="2"><input type="submit" class="findBtn findIdBtn" value="아이디 찾기"></td>
				</tr>
				
				<tr>
					<td>e-mail</td>
					<td><input type="email" name="email" id="email"></td>
				</tr>
				<tr>
					<td colspan="3"><p class="resultId"></p></td>
				</tr>
			</table>				
		</div>
	<script>
		$('.findIdBtn').click(function(){
			var comfirm = "확인"
			console.log(comfirm);
			
			var name = $('#name').val();
			var email = $('#email').val();
						
			$.ajax({
				url: '<%= request.getContextPath() %>/find.id',
				type: 'get',
				data: {name:name, email:email},
				success: function(data){
					console.log(data);					
					var resultStr = "";
					if(data != null){
						resultStr = "찾으시는 아이디는 " + data + "입니다."
					} else{
						resultStr = '해당 회원이 없습니다.';
					}
					$('.resultId').text(resultStr);
				}
			});
		});
	</script>		
		<div class="find_pwd">
			<form action="<%= request.getContextPath() %>/find.pwd" method="post">
				<table>
					<tr>
						<td colspan="3">비밀번호 찾기</td>
					</tr>
						
					<tr>
						<td>ID</td>
						<td><input type="text" name="id"></td>
						<td rowspan="2"><input type="submit" class="findBtn findPwdBtn" onclick="infoMessage();" value="비밀번호 찾기"></td>
					</tr>
					<tr>
						<td>e-mail</td>
						<td><input type="email" name="email"></td>
					</tr>
					<tr>
						<td colspan="3"><p class="infoMent"></p></td>
					</tr>
					
				</table>				
			</form>
		</div>
    </div>
    <br>
    <a href="javascript:self.close();"><div class="closeBtn">닫기</div></a>
    <script>
    	function infoMessage(){
    		alert("로그인폼으로 이동합니다. 메일을 확인해주세요.");
    	}
    </script> 	
</body>
</html>