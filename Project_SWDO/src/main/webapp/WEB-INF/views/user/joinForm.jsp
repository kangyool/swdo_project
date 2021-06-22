<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 회원 가입 폼 ]</title>
<script type="text/javascript">
function formCheck(){
	
	var id = document.getElementById("user_id").value;
	var pw = document.getElementById("user_pw").value;
	var pwCheck = document.getElementById("user_pwCheck").value;
	var name = document.getElementById("user_name").value;
	
	if(id == "" || id.length == 0){
		alert("아이디를 입력해주세요");
		return false;
	}else if(id.length < 3 || id.length > 8){
		alert("아이디는 3~8글자 사이로 입력해주세요");
		return false;
	}

	if(pw == "" || pw.length == 0){
		alert("비밀번호를 입력해주세요");
		return false;
	}

	if(pwCheck != pw){
		alert("동일한 비밀번호를 입력해주세요");
		return false;
	}
	
	if(name == "" || name.length == 0){
		alert("이름을 입력해주세요");
		return false;		
	}
	
	return true;
}
</script>
</head>
<body>
<h1>[ 회원 가입 ]</h1>
	<form action="/user/join" method="post" onsubmit="return formCheck();">
		<table border="1">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td><label for="user_id">아이디</label></td>
					<td>
						<input type="text" id="user_id" name="user_id">		
					</td>
				</tr>
				<tr>
					<td><label for="user_pw">비밀번호</label></td>
					<td><input type="password" id="user_pw" name="user_pw"></td>
				</tr>
				<tr>
					<td><label for="user_pwCheck">비밀번호 확인</label></td>
					<td><input type="password" id="user_pwCheck" name="user_pwCheck"></td>
				</tr>
				
				<tr>
					<td><label for="user_name">이름</label></td>
					<td><input type="text" id="user_name" name="user_name"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="submit" value="가입">
						<input type="reset" value="취소">
					</td>
				</tr>	
			</tfoot>
		</table>
	</form>
</body>
</html>