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

    <link rel="stylesheet" href="./../../resources/css/bootstrap.min.css?abc">
    <link rel="stylesheet" href="./../../resources/css/templatemo.css">
    <link rel="stylesheet" href="./../../resources/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="./../../resources/css/fontawesome.min.css">
    
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
	
		
<!-- 	<div style="clear:right;   display: flex; justify-content: center">
			<form action="/product/productListForm" method="get" id="searchForm" style="display:inline">
				<input type="text" name="searchText">
				<input type="hidden" name="currentPage" id="currentPage">
				<input type="button" value="검색" onclick="searchProduct(1)">
			</form>
			
			<form action="/product/userImageUpload" method="post" id="userImageUpload" enctype="multipart/form-data" style="display:inline">
				<input type = "file" name="upload" id="upload" onchange="userImageUpload()"> 
			</form>
	</div> -->
	
	   <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-end align-items-center">
			
			<!--토글 기능?(창 줄어들면 햄버거 되는 기능)  -->
            <!-- <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button> --> 

            <div class="align-self-center navbar-collapse d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                
                <!-- <div class="navbar align-self-center d-flex">를 오른쪽 정렬 시키기 위한 item(flex에서의)  -->
            	<div class=""></div>
                
                <div class="navbar align-self-center d-flex">
                
                	<!-- 아마 그냥 검색창인데 숨겨져 있는 것 같다. 꼭 필요한지는 조금더 조사해보아야 함 -->
					<!-- <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3"> 
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>   -->
                    <div>
                    <a class="nav-icon d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark"></i>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-user text-dark"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span>
                    </a>
                    </div>
                </div>
            </div>

        </div>
    </nav>
	
	<div class="" style="display: flex; flex-direction: column; height: 70vh; align-items: center; justify-content: center">
		<div>
			<img alt="" src="./../../resources/img/apple-icon.png" height="100px" width="150px">
		</div>
	    <div class="input-group mb-2">
            <form action="" method="" style="display: flex; width: 450px">

                    <input type="text" class="form-control" id="" name="" placeholder="Search ...">
                    <button type="submit" class="bg-success">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
            </form>  
            <form action="" method="" style="display: flex">    
                    <!-- 이미지 검색 버튼. 숨겨서 저장  -->
					<input type="file" id="file" name="file" onchange="changeValue(this)" style="display: none"/>
					<button type="button" class="bg-warning" id="btn-upload">
                        <i class="fa fa-fw fa-camera-retro text-white"></i>					
					</button>
            </form> 
        </div>
    </div>
    
    <!-- Start Script -->
    <script src="./../../resources/js/jquery-1.11.0.min.js"></script>
    <script src="./../../resources/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="./../../resources/js/bootstrap.bundle.min.js"></script>
    <script src="./../../resources/js/templatemo.js"></script>
    <script src="./../../resources/js/custom.js"></script>
    <!-- End Script -->
</body>
</html>
