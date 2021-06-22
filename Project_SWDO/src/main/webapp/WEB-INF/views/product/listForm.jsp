<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 제품 목록 ]</title>
<script type="text/javascript">
function productDelete(productId){
	location.href = "/product/delete?productId=" + productId;
}

function moveToHome(){
	location.href = "/";
}

</script>
</head>
<body>
<h1>[ 제품 정보 ]</h1>

	<table border="1"> 
		<thead>
			<tr>
				<th>제품 아이디</th>
				<th>제품명</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="productList" items="${productList }">
				<c:set var="splitProductName" value="${fn:split(productList.name, '/')}" />
				<c:set var="returnProductId" value="${splitProductName[fn:length(splitProductName)-1]}" />
				<tr>
					<td>${returnProductId }</td>
					<td>${productList.displayName }</td>
					<td><input type="button" value="삭제" onclick="productDelete('${returnProductId }')"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<input type="button" value="홈" onclick="moveToHome()">
</body>
</html>