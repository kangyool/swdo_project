<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<title>[ 로그인 폼 ]</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 앱의 클라이언트 ID 지정 -->
<meta name="google-signin-client_id" content="261892034263-rlce7a8c3tkb54ou04mkegf8kcgkroll.apps.googleusercontent.com">
<!-- google login&out 관련 js를 받아옴 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>

<link rel="apple-touch-icon" href="./../../../resources/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon" href="./../../../resources/img/favicon.ico">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="./../../../resources/css/templatemo.css">
<link rel="stylesheet" href="./../../../resources/css/custom.css?after">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="./../../../resources/css/fontawesome.min.css">


<script type="text/javascript" src = "/resources/js/jquery-3.6.0.js"></script>   
<script type="text/javascript">

function searchProduct(page){
	document.getElementById("currentPage").value = page;
	var searchForm = document.getElementById("searchForm");

	searchForm.submit();
	console.log(page);
}

function userImageUpload(){

	var userImageUpload = document.getElementById("userImageUpload");

	userImageUpload.submit();

	document.getElementById("upload").value = "";
}

function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
}

$(function(){

	//Code to click "imageUpload button"
	$('#btn-upload').on("click", function(){
		$("#upload").click();
	});

	$(document).ready(function(){

		$.ajax({

			url : "/product/likeSum",
			type : "get",
			success : function(data){
				console.log(data);
				$("#like_sum").html(data.like_sum); 
			},
			error : function(e){
				console.log(e);
			}
			
		})
		
	});

});
</script>

</head>
<body>

 <!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-lg-block cc-flex-wrap-nowrap" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <i class="fa fa-envelope mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                </div>
                <div>
                    <a class="text-light" href="https://fb.com/templatemo" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->


    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow cc-flex-wrap-nowrap">
        <div class="container d-flex justify-content-between align-items-center">
				<div class="cc-display-flex " style="flex-grow: 1">
		            <a class="navbar-brand text-success logo h1 align-self-center" href="/">
		                Zay
		            </a> 
				</div>
            
	            <div class="cc-display-flex cc-justify-content-space-between" id="" style="flex-grow: 1">
	                
	                    <ul class="nav" >
	                        <li class="nav-item" >
	                            <a class="nav-link" href="/company/index.html" style="color: #212529; margin-right: 10px; margin-left: 10px">Home</a>
	                        </li>
	                        <li class="nav-item">
	                            <a class="nav-link" href="/company/about.html" style="color: #212529; margin-right: 10px; margin-left: 10px">About</a>
	                        </li>	
	                        <li class="nav-item">
	                            <a class="nav-link" href="/company/contact.html" style="color: #212529; margin-right: 10px; margin-left: 10px">Contact</a>
	                        </li>
	                    </ul>
	 
	           	</div>
           		 
                <div class="" >
                   
                    <a class="nav-icon" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search" style="color: #212529; margin-right: 5px; margin-left: 5px">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <c:choose>
						<c:when test="${empty sessionScope.loginVO }">			
							<a href="/user/loginForm" style="color: #212529; font-size: 35px; margin:0 5px" title="로그인">
								<i class="fa fa-fw fa-sign-in-alt text-dark" title="로그인"></i>
							</a>								
							<a href="/user/joinForm" style="color: #212529; font-size: 35px; margin:0 5px" title="회원 가입">
								<i class="fa fa-fw fa-user-plus text-dark" title="회원 가입"></i>
							</a>														
						</c:when>				
						<c:otherwise>
							<c:if test="${sessionScope.loginVO.user_id ne 'admin'}">
							    <a class="nav-icon position-relative text-decoration-none" href="#" style="margin-right: 5px; margin-left: 5px" title="장바구니">
			                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
			                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
	                  			</a>
	                  			<a class="nav-icon position-relative text-decoration-none" href="/product/likeProduct" style="margin-right: 5px; margin-left: 5px" title="찜한상품">
			                        <i class="fa fa-fw fa-heart text-dark mr-1"></i>
			                        <span id="like_sum" class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span>
	                  			</a>				
								<a href="/user/detail?user_id=${sessionScope.loginVO.user_id }" style="font-size: 35px; margin:0 5px; color: #212529;" title="회원 정보">					
									<i class="fa fa-fw fa-user-edit text-dark"></i>
								</a>
							</c:if>
							<c:if test="${sessionScope.loginVO.user_id eq 'admin'}">	
								<a href="/product/listForm" style="font-size: 35px; margin:0 5px" title="제품 목록">
									<i class="fa fa-fw fa-folder-open text-dark" title="제품 목록"></i>
								</a>				
								<a href="/product/enrollForm" style="font-size: 35px; margin:0 5px" title="제품 등록">
									<i class="fa fa-fw fa-folder-plus text-dark" title="제품 등록"></i>
								</a>
								<a href="/user/listForm" style="font-size: 35px; margin:0 5px" title="전체 회원 관리">
									<i class="fa fa-fw fa-users-cog text-dark" title="전체 회원 관리"></i>
								</a>	
							</c:if>	
								<a href="/user/logout" style="color: #212529;font-size: 35px; margin:0 5px" title="로그아웃">
									<i class="fa fa-fw fa-sign-out-alt text-dark"></i>
								</a>
						</c:otherwise>						
					</c:choose>	
                </div>
        </div>
    </nav>
    <!-- Close Header -->
    
        <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg cc-display-flex cc-flex-direction-column" role="document">
	            
	            
	            <div class="w-100 pt-1 mb-5 text-right cc-display-flex ">                
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
	            </div>

                <div class="cc-display-flex cc-flex-wrap-nowrap">
                	<div class="cc-display-flex" style="flex-grow:0.5"></div>
                		
                    <form action="/product/productListForm" method="get" id="searchForm" class="cc-display-flex modal-content modal-body border-0 p-0 cc-flex-direction-row" style="width: auto">
						<input type="text" name="searchText" placeholder="   Search ..." class="cc-focus-border-none shadow" style="flex-grow: 1;border-top-left-radius: 10px;border-bottom-left-radius: 10px; border-right:0px; border-top:1px solid #E2E2E2; border-left:1px solid #E2E2E2; border-bottom:1px solid #E2E2E2;">
						<input type="hidden" name="currentPage" id="currentPage">
						<button type="button" onclick="searchProduct(1)" class="bg-success" style="border-right:0px; border-top:1px solid #E2E2E2; border-left:0px; border-bottom:1px solid #E2E2E2">
							<i class="fa fa-fw fa-search" style="color: #202124"></i>
						</button>
					</form>
            
	           		<form action="/product/userImageUpload" method="post" id="userImageUpload" enctype="multipart/form-data" style="width:0" class="cc-display-flex modal-content modal-body border-0 p-0 cc-flex-direction-row">
						<input type = "file" name="upload" id="upload" onchange="userImageUpload()" class="cc-display-none"> 
						<button type="button" class="bg-warning" id="btn-upload" style="border-right:0px; border-top:1px solid #E2E2E2; border-left:0px; border-bottom:1px solid #E2E2E2;border-top-right-radius: 10px;border-bottom-right-radius: 10px">
		                    <i class="fa fa-fw fa-camera-retro" style="color: #202124"></i>					
						</button>
					</form>
                </div>
         		
        </div>
    </div>

  
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row py-5">
            <form action="/user/login" method="post" class="col-md-9 m-auto" role="form">
                <div class="row">
                    <div class="" style="width:10%; visibility: hidden"></div>
                    <div class="form-group col-md-6 mb-3" style="width:75%">
                        <label for="inputid">아이디</label>
                        <input type="text" class="form-control mt-1" id="user-id" name="user_id" placeholder="아이디">
                    </div>
                    <div class="" style="width:15%;visibility: hidden"></div>
                </div>
                <div class="row">
                    <div class="" style="width:10%;visibility: hidden"></div>
                    <div class="form-group col-md-6 mb-3" style="width:75%">
                        <label for="inputpassword">비밀번호</label>
                        <input type="password" class="form-control mt-1" id="user_pw" name="user_pw" placeholder="비밀번호">
                    </div>
                    <div class="" style="width:10%;visibility: hidden"></div>
                </div>
                <div class="row">
                    <div class="" style="width:10%;visibility: hidden"></div>
                    <div class="form-group col-md-6 mb-3 cc-display-flex" style="width:75%;margin-top:10px">
                        <button type="submit" class="btn btn-success px-3" style="width:100%;">로그인</button>
                    </div>
                    <div class="" style="width:10%;visibility: hidden"></div>
                </div>
                <div class="row">
                    <div class="" style="width:10%;visibility: hidden"></div>
                    <div class="form-group col-md-6 mb-3" style="width:75%;margin-top:10px" >
                        <div class="g-signin2" data-onsuccess="onSignIn"></div>
                    </div>
                    <div class="" style="width:10%;visibility: hidden"></div>
                </div>
                
                <!-- <div class="mb-3">
                    <label for="inputsubject">Subject</label>
                    <input type="text" class="form-control mt-1" id="subject" name="subject" placeholder="Subject">
                </div>
                <div class="mb-3">
                    <label for="inputmessage">Message</label>
                    <textarea class="form-control mt-1" id="message" name="message" placeholder="Message" rows="8"></textarea>
                </div> 
                <div class="row">
                    <div class="col text-end mt-2">
                        <button type="submit" class="btn btn-success btn-lg px-3">Let’s Talk</button>
                    </div>
                </div> -->
                
            </form>
        </div>
    </div>
    <!-- End Content -->


	  <!-- Start Footer -->
    <footer class="bg-dark" id="tempaltemo_footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-success border-bottom pb-3 border-light logo">Zay Shop</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li>
                            <i class="fas fa-map-marker-alt fa-fw"></i>
                            광주광역시 광산구 무진대로 282
                        </li>
                        <li>
                            <i class="fa fa-phone fa-fw"></i>
                            <a class="text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                        </li>
                        <li>
                            <i class="fa fa-envelope fa-fw"></i>
                            <a class="text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="/product/productListForm?searchText=남성">Men</a></li>
                        <li><a class="text-decoration-none" href="/product/productListForm?searchText=여성">Women</a></li>
                        <li><a class="text-decoration-none" href="/product/productListForm?searchText=신발">Shoes</a></li>
                        <li><a class="text-decoration-none" href="/product/productListForm?searchText=가방">Bag</a></li>
                        <li><a class="text-decoration-none" href="/product/productListForm?searchText=악세서리">Accessory</a></li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="/company/index.html">Home</a></li>
                        <li><a class="text-decoration-none" href="/company/about.html">About Us</a></li>
                        <li><a class="text-decoration-none" href="/company/contact.html">Contact</a></li>
                    </ul>
                </div>

            </div>

            <div class="row text-light mb-4">
                <div class="col-12 mb-3">
                    <div class="w-100 my-3 border-top border-light"></div>
                </div>
                <div class="col-auto me-auto">
                    <ul class="list-inline text-left footer-icons">
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a rel="nofollow" class="text-light text-decoration-none" target="_blank" href="http://fb.com/templatemo"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.linkedin.com/"><i class="fab fa-linkedin fa-lg fa-fw"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-auto">
                    <label class="sr-only" for="subscribeEmail">Email address</label>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address">
                        <div class="input-group-text btn-success text-light">Subscribe</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="w-100 bg-black py-3">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left text-light">
                            Copyright &copy; 2021 Company Name 
                            | Designed by <a rel="sponsored" href="https://templatemo.com/page/1" target="_blank">TemplateMo</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- End Footer -->
    
    <!-- Start Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="./../../../resources/js/templatemo.js"></script>
    <script src="./../../../resources/js/custom.js"></script>
    <!-- End Script -->
</body>
</html>