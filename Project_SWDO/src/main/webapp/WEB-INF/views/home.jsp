<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="./../../resources/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="./../../resources/img/favicon.ico">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="./../../resources/css/templatemo.css">
    <link rel="stylesheet" href="./../../resources/css/custom.css?after">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="./../../resources/css/fontawesome.min.css">

<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>   
<script type="text/javascript">

$(function(){
	$('#btn-upload').click(function (e) {
		e.preventDefault();
		$('#file').click();
	});
});
    
function changeValue(obj){
	alert(obj.value);
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

</script>	
</head>
<body>

<%-- 	<div style="float:right">
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
	</div>  --%>
	
		
	<!-- <div style="clear:right;   display: flex; justify-content: center">
			<form action="/product/productListForm" method="get" id="searchForm" style="display:inline">
				<input type="text" name="searchText">
				<input type="hidden" name="currentPage" id="currentPage">
				<input type="button" value="검색" onclick="searchProduct(1)">
			</form>
			
			<form action="/product/userImageUpload" method="post" id="userImageUpload" enctype="multipart/form-data" style="display:inline">
				<input type = "file" name="upload" id="upload" onchange="userImageUpload()"> 
			</form>
	</div>  -->
	
	<nav class="navbar justify-content-flex-end"> 
	
		<div class="display-flex" style=""> </div>
       	<div class="display-flex justify-content-space-between" id="" style="margin: 15px 50px">                

                    <a class="" href="#" style="font-size: 30px; margin:0 5px" >
                        <i class="fa fa-fw fa-search text-dark"></i>
                    </a>
                    <a class="" href="#" style="font-size: 30px; margin:0 5px">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark"></i>
                    </a>
                    <a class="" href="#" style="font-size: 30px; margin:0 5px">
                        <i class="fa fa-fw fa-user text-dark"></i>
                    </a>     
         </div>
    </nav>
	
	<div class="display-flex disposition-center flex-direction-column" >
		<div class="display-flex">
			<img alt="" src="./../../resources/img/apple-icon.png" height="100px" width="135px">
		</div>
	    <div class="display-flex flex-wrap-nowrap">
            <form action="" method="" class="display-flex" style="width: 450px">

                    <input type="text" class="form-control" id="" name="" placeholder="Search ...">
                    <button type="submit" class="bg-success">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
            </form>  
            <form action="" method="" style="" class="display-flex">    
                    <!-- 이미지 검색 버튼. 숨겨서 저장  -->
					<input type="file" class="display-none" id="file" name="file" onchange="changeValue(this)" style=""/>
					<button type="button" class="bg-warning" id="btn-upload">
                        <i class="fa fa-fw fa-camera-retro text-white"></i>					
					</button>
            </form> 
        </div>
    </div>
    
    <!-- Start Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="./../../resources/js/templatemo.js"></script>
    <script src="./../../resources/js/custom.js"></script>
    <!-- End Script -->
</body>
</html>
