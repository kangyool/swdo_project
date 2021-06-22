<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 제품 등록 폼 ]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
function moveToHome(){
	location.href = "/";
}

$(function(){
	
	$("#enrollBtn").on("click", function(){ 
		
		var projectId = $(".projectId").val();
		var computeRegion = $(".computeRegion").val();
		var productSetId = $(".productSetId").val();
		var productSetDisplayName = $(".productSetDisplayName").val();
		var productCategory = $(".productCategory").val();
		
		var productId = $("#productId").val();
		var productDisplayName = $("#productDisplayName").val();
		var referenceImageId = $("#referenceImageId").val();
		var gcsUri = $("#gcsUri").val();		

		$.ajax({
				url : "/product/enroll",
				type : "post",
				data : {
					projectId : projectId,
					computeRegion : computeRegion,
					productSetId : productSetId,
					productSetDisplayName : productSetDisplayName,
					productId : productId,
					productDisplayName : productDisplayName,
					productCategory : productCategory,
					referenceImageId : referenceImageId,
					gcsUri : gcsUri
				},
				dataType : "json",
				success : function(data){
					alert("제품 등록 완료")
				},
				error : function(e){
					console.log(e);
					alert("제품 등록 실패")
				}
		});

		$.ajax({
			url : "/product/productInsert",
			type : "post",
			data : {
				projectId : projectId,
				computeRegion : computeRegion,
				productSetId : productSetId,
				productSetDisplayName : productSetDisplayName,
				productId : productId,
				productDisplayName : productDisplayName,
				productCategory : productCategory,
				referenceImageId : referenceImageId,
				gcsUri : gcsUri
			},
			dataType : "json",
			success : function(data){
			},
			error : function(e){
				console.log(e);
			}
	});
	});	
});	

</script>
</head>
<body>
<h1>[ 제품 등록 ]</h1>

		<table border="1">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td><label for="productId">제품 아이디</label></td>
					<td><input type="text" id="productId" name="productId" value="productId-001"></td>
				</tr>
				<tr>
					<td><label for="productDisplayName">제품명</label></td>
					<td><input type="text" id="productDisplayName" name="productDisplayName" value="빨간색 스웨터 (여성)"></td>
				</tr>
				<tr>
					<td><label for="referenceImageId">참조이미지 아이디</label></td>
					<td><input type="text" id="referenceImageId" name="referenceImageId" value="referenceImageId-001"></td>
				</tr>
				<tr>
					<td><label for="gcsUri">참조이미지 경로</label></td>
					<td><input type="text" id="gcsUri" name="gcsUri" value="gs://project_swdo/파일명.jpg"></td>
				</tr>
				
				<input type = "hidden" class="projectId" value="snappy-guard-316800">
				<input type = "hidden" class="computeRegion" value="us-west1">
				<input type = "hidden" class="productSetId" value="productSetId-001">
				<input type = "hidden" class="productSetDisplayName" value="productSetDisplayName-001">
				<input type = "hidden" class="productCategory" value="apparel-v2">
				
				
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" id="enrollBtn">
						<input type="button" value="홈" onclick="moveToHome()">
						
					</td>
				</tr>	
			</tfoot>
		</table>

</body>
</html>