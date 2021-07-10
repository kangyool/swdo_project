<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
    <title>Zay Shop eCommerce</title>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
        <!-- 앱의 클라이언트 ID 지정 -->
<meta name="google-signin-client_id" content="261892034263-rlce7a8c3tkb54ou04mkegf8kcgkroll.apps.googleusercontent.com">
	<!-- google login&out 관련 js를 받아옴 -->
<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>

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
           		 
                <div class="icons" >
                   
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
								<a href="/user/logout" style="color: #212529;font-size: 35px; margin:0 5px" title="로그아웃" onclick="signOut();">
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




    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./../../../resources/img/banner_img_01.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1 text-success"><b>Zay</b> Apparel</h1>
                                <h3 class="h2">Simple and Perfect</h3>
                                <p>
                                    Zay는 다양한 패션 아이템을 취급하는 온라인 패션 쇼핑몰입니다.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./../../../resources/img/banner_img_02.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">Luxury Cosmatics</h1>
                                <h3 class="h2">Fancy but Affordable</h3>
                                <p>
                                  의류뿐만 아니라, 유행을 선도하는 화장품도 다양하게 만나볼 수 있습니다.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          <!--   <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="./../../../resources/img/banner_img_03.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1">Repr in voluptate</h1>
                                <h3 class="h2">Ullamco laboris nisi ut </h3>
                                <p>
                                    We bring you 100% free CSS templates for your websites. 
                                    If you wish to support TemplateMo, please make a small contribution via PayPal or tell your friends about our website. Thank you.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->


    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">Categories of The Month</h1>
                <p>
                    이번 달 인기 상품을 다양하게 만나보실 수 있습니다. 
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="./../../../resources/img/category_img_04.jpg" class="rounded-circle img-fluid border"></a>
                <h5 class="text-center mt-3 mb-3">Bags</h5>
                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="./../../../resources/img/category_img_02.jpg" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">Shoes</h2>
                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="./../../../resources/img/category_img_03.jpg" class="rounded-circle img-fluid border"></a>
                <h2 class="h5 text-center mt-3 mb-3">Accessories</h2>
                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
            </div>
        </div>
    </section>
    <!-- End Categories of The Month -->


    <!-- Start Featured Product -->
    <!-- <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">Featured Product</h1>
                    <p>
                        Reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                        Excepteur sint occaecat cupidatat non proident.
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="./../../../resources/img/feature_prod_01.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">$240.00</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">Gym Weight</a>
                            <p class="card-text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt in culpa qui officia deserunt.
                            </p>
                            <p class="text-muted">Reviews (24)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="./../../../resources/img/feature_prod_02.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                    <i class="text-muted fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">$480.00</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">Cloud Nike Shoes</a>
                            <p class="card-text">
                                Aenean gravida dignissim finibus. Nullam ipsum diam, posuere vitae pharetra sed, commodo ullamcorper.
                            </p>
                            <p class="text-muted">Reviews (48)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="./../../../resources/img/feature_prod_03.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                    <i class="text-warning fa fa-star"></i>
                                </li>
                                <li class="text-muted text-right">$360.00</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">Summer Addides Shoes</a>
                            <p class="card-text">
                                Curabitur ac mi sit amet diam luctus porta. Phasellus pulvinar sagittis diam, et scelerisque ipsum lobortis nec.
                            </p>
                            <p class="text-muted">Reviews (74)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- End Featured Product -->


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