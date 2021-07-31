<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- 앱의 클라이언트 ID 지정 -->
<meta name="google-signin-client_id" content="261892034263-rlce7a8c3tkb54ou04mkegf8kcgkroll.apps.googleusercontent.com">
	<!-- google login&out 관련 js를 받아옴 -->
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

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
	$('#btn-upload').on("click", function(){
		$("#upload").click();
	});
});
    
/* function changeValue(obj){
	userImageUpload();
} */
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

//구글 로그아웃 시작
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
}

function onLoad() {
    gapi.load('auth2', function() {
      gapi.auth2.init();
    });
}
//구글 로그아웃 끝

</script>	
</head>
<body>
	
	<nav class="navbar cc-justify-content-flex-end"> 
	
		<div class="cc-display-flex" style=""> </div>
       	<div class="cc-display-flex cc-justify-content-space-between" id="" style="margin: 15px 50px">                

            <c:choose>
				<c:when test="${empty sessionScope.loginVO }">			
					<a href="/user/loginForm?" style="font-size: 35px; margin:0 5px" title="로그인">
						<i class="fa fa-fw fa-sign-in-alt text-dark" title="로그인"></i>
					</a>								
					<a href="/user/joinForm?" style="font-size: 35px; margin:0 5px" title="회원 가입">
						<i class="fa fa-fw fa-user-plus text-dark" title="회원 가입"></i>
					</a>														
				</c:when>				
				<c:otherwise>				
					<a href="/user/logout" style="font-size: 35px; margin:0 5px" title="로그아웃" onclick="signOut();">
						<i class="fa fa-fw fa-sign-out-alt text-dark" title="로그아웃"></i>
					</a>
				<c:if test="${sessionScope.loginVO.user_id ne 'admin'}">
					<a href="user/detail?user_id=${sessionScope.loginVO.user_id }" style="font-size: 35px; margin:0 5px" title="회원 정보">					
						<i class="fa fa-fw fa-user-edit text-dark" title="회원 정보"></i>
					</a>
				</c:if>	
				</c:otherwise>						
			</c:choose>	
			
			<c:choose>
				<c:when test="${sessionScope.loginVO.user_id eq 'admin'}">
					<a href="/product/listForm" style="font-size: 35px; margin:0 5px" title="제품 목록">
						<i class="fa fa-fw fa-folder-open text-dark" title="제품 목록"></i>
					</a>				
					<a href="/product/enrollForm" style="font-size: 35px; margin:0 5px" title="제품 등록">
						<i class="fa fa-fw fa-folder-plus text-dark" title="제품 등록"></i>
					</a>
					<a href="/user/listForm" style="font-size: 35px; margin:0 5px" title="전체 회원 관리">
						<i class="fa fa-fw fa-users-cog text-dark" title="전체 회원 관리"></i>
					</a>	
				</c:when>
			</c:choose>   
			   
         </div>
    </nav>
	
	<div class="cc-display-flex cc-disposition-center cc-flex-direction-column" >
		<div class="cc-display-flex">
			<img alt="" src="./../../resources/img/apple-icon.png" height="100px" width="110px">
		</div>
		
	    <div class="cc-display-flex cc-flex-wrap-nowrap">
            <form action="/product/productListForm" method="get" id="searchForm" class="cc-display-flex" style="width: 370px">
				<input type="text" name="searchText" placeholder="   Search ..." class="cc-focus-border-none shadow" style="flex-grow: 1;border-top-left-radius: 10px;border-bottom-left-radius: 10px; border-right:0px; border-top:1px solid #E2E2E2; border-left:1px solid #E2E2E2; border-bottom:1px solid #E2E2E2;">
				<input type="hidden" name="currentPage" id="currentPage">
				<button type="button" onclick="searchProduct(1)" class="bg-success" style="border-right:0px; border-top:1px solid #E2E2E2; border-left:0px; border-bottom:1px solid #E2E2E2">
					<i class="fa fa-fw fa-search" style="color: #202124"></i>
				</button>
			</form>
            
            <form action="/product/userImageUpload" method="post" id="userImageUpload" enctype="multipart/form-data" style="" class="cc-display-flex">
				<input type = "file" name="upload" id="upload" onchange="userImageUpload()" class="cc-display-none"> 
				<button type="button" class="bg-warning" id="btn-upload" style="border-right:0px; border-top:1px solid #E2E2E2; border-left:0px; border-bottom:1px solid #E2E2E2;border-top-right-radius: 10px;border-bottom-right-radius: 10px">
                    <i class="fa fa-fw fa-camera-retro" style="color: #202124"></i>					
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