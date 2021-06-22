<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 회원 상세 정보 ]</title>
<script type="text/javascript">
function moveToUpdateForm(user_id){
	location.href = "/user/updateForm?user_id=" + user_id; 
}
</script>

</head>
<body>
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>수정</td>
		</tr>
		<tr>			
			<td>${detail.user_no }</td>
			<td>${detail.user_id }</td>
			<td>${detail.user_pw }</td>
			<td>
				<input type="button" value="정보 수정창 이동" onclick="moveToUpdateForm('${detail.user_id }')">
			</td>
		</tr>
	</table>
</body>
</html>