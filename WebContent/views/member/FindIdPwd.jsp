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
</style>
<body>
	<div class="find_form">
		<div class="find_selet_area">
			<span class="find_id">아이디 찾기</span> / 
			<span class="find_pwd">비밀번호 찾기</span>
		</div>
		<div class="find_id">
			<form action="<%= request.getContextPath() %>/find.id" method="post">
				<table>
					<tr>
						<td colspan="3">아이디 찾기</td>
					</tr>
						
					<tr>
						<td>이름</td>
						<td><input type="text" name="name"></td>
						<td rowspan="2"><input type="submit" class="findBtn" value="아이디 찾기"></td>
					</tr>
					
					<tr>
						<td>e-mail</td>
						<td><input type="email" name="email"></td>
					</tr>
				</table>				
			</form>
		</div>
		
		<div class="find_pwd">
			<form action="<%= request.getContextPath() %>/find.pwd" method="post">
				<table>
					<tr>
						<td colspan="3">비밀번호 찾기</td>
					</tr>
						
					<tr>
						<td>ID</td>
						<td><input type="text" name="id"></td>
						<td rowspan="2"><input type="submit" class="findBtn" value="비밀번호 찾기"></td>
					</tr>
					
					<tr>
						<td>e-mail</td>
						<td><input type="email" name="email"></td>
					</tr>
				</table>				
			</form>
		</div>		
    </div>
    <br>
    <a href="javascript:self.close();"><div class="closeBtn">닫기</div></a>
     	
</body>
</html>