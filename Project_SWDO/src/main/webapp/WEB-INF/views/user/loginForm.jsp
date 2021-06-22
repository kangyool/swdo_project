<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 로그인 폼 ]</title>
</head>
<body>
<form action="/user/login" method="post">
	<table border="1">
		<tr>
			<td>ID</td>
			<td>
				<input type="text" name="user_id">
			</td>
		</tr>
		<tr>
			<td>PW</td>
			<td>
				<input type="text" name="user_pw">			
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인">			
			</td>
		</tr>
	</table>
</form>
</body>
</html>