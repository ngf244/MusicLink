<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<style>
	.find_selet_area{background: #af9ce6; color:white;}
	.find_id{margin-top: 1%;}
	.find_pwd{margin-top: 1%;}
	table{border: 1px solid black; padding-bottom: 1%;}
	table td{width: 100px; height:30px; text-align: center;}
	.bts{padding-left: 180px;}
</style>
<body>
	<div class="sec-menu-views">
		<div class="find_selet_area">
			<span class="find_id">아이디 찾기</span> / 
			<span class="find_pwd">비밀번호 찾기</span>
		</div>
		<div class="find_id">
			<form>
				<table>
					<tr>
						<td colspan="3">아이디 찾기</td>
					</tr>
						
					<tr>
						<td>이름</td>
						<td><input type="text" name="name"></td>
						<td rowspan="2"><input type="submit" value="아이디 찾기"></td>
					</tr>
					
					<tr>
						<td>e-mail</td>
						<td><input type="email" name="email"></td>
					</tr>
				</table>				
			</form>
		</div>
		
		<div class="find_pwd">
			<form>
				<table>
					<tr>
						<td colspan="3">비밀번호 찾기</td>
					</tr>
						
					<tr>
						<td>ID</td>
						<td><input type="text" name="name"></td>
						<td rowspan="2"><input type="submit" value="비밀번호 찾기"></td>
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
    <div class="bts"><a href="javascript:self.close();"><span style="width:50px">닫기</span></a></div>
     	
</body>
</html>