<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 제품 목록 ]</title>
<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
var flag=true;

function moveToHome(){
	location.href = "/";
}

function searchProduct(page){
	document.getElementById("currentPage").value = page;
	var searchForm = document.getElementById("searchForm");

	searchForm.submit();
}

function userImageUpload(){

	var userImageUpload = document.getElementById("userImageUpload");

	userImageUpload.submit();

	document.getElementById("upload").value = "";
} 

$(function(){

	function productSelectAll(data){

		console.log(data);
		var content = '<div style="display: block">';

		$.each(data.productList, function(index, item){
			content += '<img name="' + item.productDisplayName + '"alt="" src="' + item.uri + '"width = 300 height = 500>';
			content += '<a style="display:block">' + item.productDisplayName + '</a>';
			content += '</div>';
		});

		$("#productDiv").append(content);
		$("#cp").val(data.navi.currentPage);

	}
	
	$(window).scroll(function(){
		
		var scrollHeight = $(window).scrollTop() + $(window).height();
		var documentHeight = $(document).height();

		var currentPage = $("#cp").val(); 
		var searchText = $("#st").val(); 
		var totalPageCount = $("#tpc").val(); 

		console.log("--------------------------------------------")
		console.log("scrollHeight : " + scrollHeight);
		console.log("documentHeight : " + documentHeight);
		console.log("currentPage! :" + currentPage);
		
		if((scrollHeight) >= (documentHeight - 300)){ 
			console.log("currentPage : " + currentPage);

			if (flag) {
				flag = false;

				$.ajax({

					url : "/product/productListForm_rest",
					type : "get",
					data : {
						currentPage : currentPage,
						searchText : searchText
					},
					dataType : "json",
					success : function(data){
						console.log(data);
						productSelectAll(data);
						flag = true;
					},
					error : function(e){
						console.log(e);
					}
				})
			}
			
			
		}
	});
});

</script>
</head>
<body>
	
	<input type="hidden" value="${searchText }" id="st">
	<input type="hidden" value="${navi.currentPage }" id="cp">	
	<input type="hidden" value="${navi.totalPageCount }" id="tpc">
	
	<div style="float:right">
			<form action="/product/productListForm" method="get" id="searchForm" style="display:inline">
				<input type="text" name="searchText">
				<input type="hidden" name="currentPage" id="currentPage">
				<input type="button" value="검색" onclick="searchProduct(1)">
			</form>
			
			<form action="/product/userImageUpload" method="post" id="userImageUpload" enctype="multipart/form-data" style="display:inline">
				<input type = "file" name="upload" id="upload" onchange="userImageUpload()"> 
			</form>
			
			<input type="button" value="홈" onclick="moveToHome()"style="display:inline">
	</div>
	

	<div id = "productDiv">
	
		<c:forEach var="productList" items="${productList }">
			
			<div style="display:block">
				<img name="${productList.productDisplayName }" alt="" src="${productList.uri }" width = 300 height = 500 style="block">
				<a style="display:block">${productList.productDisplayName }</a> 
			</div>
		
		</c:forEach>
		
	</div>

	
</body>
</html>