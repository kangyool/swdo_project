<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 회원 정보 수정폼 ]</title>
</head>
<body>
<form action="/user/update" method="post">
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>가입날짜</td>
			<td>수정</td>
		</tr>
		<tr>
			<td>${detail.user_no }</td>
			<td>${detail.user_id }</td>
			<td>
				<input type="password" name="user_pw">
			</td>
			<td>
				<input type="text" value="${detail.user_name }" name="user_name">
			</td>
			<td>${detail.user_indate }</td>
			<td>
				<input type="submit" value="수정">
			</td>
		</tr>
	</table>
	
	<input type="hidden" value="${detail.user_id }" name="user_id">
</form>
</body>
</html>