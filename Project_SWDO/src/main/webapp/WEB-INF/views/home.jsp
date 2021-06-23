<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="./../../resources/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="./../../resources/img/favicon.ico">

    <link rel="stylesheet" href="./../../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="./../../resources/css/templatemo.css">
    <link rel="stylesheet" href="./../../resources/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="./../../resources/css/fontawesome.min.css">
    
<script type="text/javascript">
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

</script>	
</head>
<body>

	<div style="float:right">
		<ul>		
			<c:choose>
				<c:when test="${empty sessionScope.loginVO }">
					<li>
						<a href="/user/joinForm">회원 가입 폼 이동</a>
					</li>			
					<li>
						<a href="/user/loginForm">로그인 폼 이동</a>
					</li>			
				</c:when>
				
				<c:otherwise>
					<li>
						<a href="user/logout">로그아웃</a>
					</li>
				</c:otherwise>		
			</c:choose>	
			
			<c:choose>
				<c:when test="${sessionScope.loginVO.user_id eq 'admin'}">
					<li>
						<a href="/product/listForm">제품 정보 보기</a>				
					</li>
					<li>
						<a href="/product/enrollForm">제품 등록 폼 이동</a>
					</li>
					<li>
						<a href="/user/listForm">회원 정보 보기</a>
					</li>	
				</c:when>
			</c:choose> 		
		</ul>
	</div>
		
	<div style="clear:right;   display: flex; justify-content: center">
			<form action="/product/productListForm" method="get" id="searchForm" style="display:inline">
				<input type="text" name="searchText">
				<input type="hidden" name="currentPage" id="currentPage">
				<input type="button" value="검색" onclick="searchProduct(1)">
			</form>
			
			<form action="/product/userImageUpload" method="post" id="userImageUpload" enctype="multipart/form-data" style="display:inline">
				<input type = "file" name="upload" id="upload" onchange="userImageUpload()"> 
			</form>
	</div>
	
	<div class="bg-white" id="templatemo_search">
        <div class="">
            <form action="" method="get" class="border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
