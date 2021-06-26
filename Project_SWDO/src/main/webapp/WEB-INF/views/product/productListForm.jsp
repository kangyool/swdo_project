<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Zay Shop - Product Listing Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="./../../../resources/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="./../../../resources/img/favicon.ico">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="./../../../resources/css/templatemo.css">
    <link rel="stylesheet" href="./../../../resources/css/custom.css?abc">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="./../../../resources/css/fontawesome.min.css">

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
	console.log(page);
	console.log
}

function userImageUpload(){

	var userImageUpload = document.getElementById("userImageUpload");

	userImageUpload.submit();

	document.getElementById("upload").value = "";
} 

$(function(){

	function productSelectAll(data){

		console.log(data);
		var content = '';

		$.each(data.productList, function(index, item){
			content += '<div class="col-md-4">';
			content += '<div class="card mb-4 product-wap rounded-0">'
			content += '<div class="card rounded-0">'
			content += '<a href="?????????"><img class="card-img rounded-0 img-fluid" name="' + item.productDisplayName + '" id="' + item.productId + '" alt="" src="' + item.uri + '"></a>';
			content += '<div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">'
			content += '<ul class="list-unstyled"> <li><a class="btn btn-success text-white" href="shop-single.html"><i class="far fa-heart"></i></a></li> <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="far fa-eye"></i></a></li> <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="fas fa-cart-plus"></i></a></li> </ul>'
			content += '</div>'
			content += '</div>'
			content += '<div class="card-body">'
			content += '<a href="??????????" class="h3 text-decoration-none">' + item.productDisplayName + '</a>'
			content += '<ul class="w-100 list-unstyled d-flex justify-content-between mb-0"> <li>M/L/X/XL</li> <li class="pt-2"> <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span> <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span> <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span> <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span> <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span> </li> </ul>'
			content += '<ul class="list-unstyled d-flex justify-content-center mb-1"><li><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-warning fa fa-star"></i><i class="text-muted fa fa-star"></i><i class="text-muted fa fa-star"></i></li></ul>'
			content += '<p class="text-center mb-0">$250.00</p>'
			content += '</div>'
			content += '</div>'
			content += '</div>'			
										 			
		});

		$("#productDisplay").append(content);
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
		console.log("currentPage! : " + currentPage);
		console.log("totalPageCount : " + totalPageCount);
		
		if((scrollHeight) >= (documentHeight - 300) && currentPage <= totalPageCount){ 
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
            <!-- <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button> -->
            
	            <div class="cc-display-flex cc-justify-content-space-between" id="" style="flex-grow: 1">
	                
	                    <ul class="nav" >
	                        <li class="nav-item" >
	                            <a class="nav-link" href="index.html" style="color: #212529; margin-right: 10px; margin-left: 10px">Home</a>
	                        </li>
	                        <li class="nav-item">
	                            <a class="nav-link" href="about.html" style="color: #212529; margin-right: 10px; margin-left: 10px">About</a>
	                        </li>
	                        <li class="nav-item">
	                            <a class="nav-link" href="shop.html" style="color: #212529; margin-right: 10px; margin-left: 10px">Shop</a>
	                        </li>
	                        <li class="nav-item">
	                            <a class="nav-link" href="contact.html" style="color: #212529; margin-right: 10px; margin-left: 10px">Contact</a>
	                        </li>
	                    </ul>
	 
	           	</div>
           		 
                <div class="" >
                   
                    <!-- <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div> 
                    </div> -->
                    
                    <a class="nav-icon" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search" style="color: #212529; margin-right: 5px; margin-left: 5px">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#" style="margin-right: 5px; margin-left: 5px">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#" style="margin-right: 5px; margin-left: 5px">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span>
                    </a>
                </div>
        </div>
    </nav>
    <!-- Close Header -->
    
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row" >

            <div class="col-lg-3">
                <h1 class="h2 pb-4">Categories</h1>
                <ul class="list-unstyled templatemo-accordion">
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Gender
                            <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul class="collapse show list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Men</a></li>
                            <li><a class="text-decoration-none" href="#">Women</a></li>
                        </ul>
                    </li>
                   <!--  <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Sale
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Sport</a></li>
                            <li><a class="text-decoration-none" href="#">Luxury</a></li>
                        </ul>
                    </li> -->
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Product
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Shoes</a></li>
                            <li><a class="text-decoration-none" href="#">Accessory</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

            <div class="col-lg-9">
               <div class="row" id="productDisplay">
               
	               <c:forEach var="productList" items="${productList }">
	                    <div class="col-md-4"> <!-- 여기부터 1개 아이템 시작 -->
	                        <div class="card mb-4 product-wap rounded-0">
	                            <div class="card rounded-0">
	                                <a href="????????????"><img class="card-img rounded-0 img-fluid" name="${productList.productDisplayName }" id="${productList.productId }" src="${productList.uri }"></a>  <!-- 이미지 부분 -->
	                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
	                                    <ul class="list-unstyled">
	                                        <li><a class="btn btn-success text-white" href="shop-single.html"><i class="far fa-heart"></i></a></li>
	                                        <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="far fa-eye"></i></a></li>
	                                        <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="fas fa-cart-plus"></i></a></li>
	                                    </ul>
	                                </div>
	                            </div>
	                            <div class="card-body">
	                                <a href="???????????" class="h3 text-decoration-none">${productList.productDisplayName }</a> <!-- 이름 부분 -->
	                                <ul class="w-100 list-unstyled d-flex justify-content-between mb-0">
	                                    <li>M/L/X/XL</li>
	                                    <li class="pt-2">
	                                        <span class="product-color-dot color-dot-red float-left rounded-circle ml-1"></span>
	                                        <span class="product-color-dot color-dot-blue float-left rounded-circle ml-1"></span>
	                                        <span class="product-color-dot color-dot-black float-left rounded-circle ml-1"></span>
	                                        <span class="product-color-dot color-dot-light float-left rounded-circle ml-1"></span>
	                                        <span class="product-color-dot color-dot-green float-left rounded-circle ml-1"></span>
	                                    </li>
	                                </ul>
	                                <ul class="list-unstyled d-flex justify-content-center mb-1">
	                                    <li>
	                                        <i class="text-warning fa fa-star"></i>
	                                        <i class="text-warning fa fa-star"></i>
	                                        <i class="text-warning fa fa-star"></i>
	                                        <i class="text-muted fa fa-star"></i>
	                                        <i class="text-muted fa fa-star"></i>
	                                    </li>
	                                </ul>
	                                <p class="text-center mb-0">$250.00</p>
	                            </div>
	                        </div>
	                    </div> <!-- 1개 아이템 끝 -->
	                </c:forEach>    
	                
                </div>
            </div>
            
        </div>
    </div>
    <!-- End Content -->
    
    

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

	<input type="hidden" value="${searchText }" id="st">
	<input type="hidden" value="${navi.currentPage }" id="cp">	
	<input type="hidden" value="${navi.totalPageCount }" id="tpc">
	
	<!-- <div style="float:right">
			<form action="/product/productListForm" method="get" id="searchForm" style="display:inline">
				<input type="text" name="searchText">
				<input type="hidden" name="currentPage" id="currentPage">
				<input type="button" value="검색" onclick="searchProduct(1)">
			</form>
			
			<form action="/product/userImageUpload" method="post" id="userImageUpload" enctype="multipart/form-data" style="display:inline">
				<input type = "file" name="upload" id="upload" onchange="userImageUpload()"> 
			</form>
			
			<input type="button" value="홈" onclick="moveToHome()"style="display:inline">
	</div> -->
	

	<%-- <div id = "productDiv">
	
		<c:forEach var="productList" items="${productList }">
			
			<div style="display:block">
				<img name="${productList.productDisplayName }" alt="" src="${productList.uri }" width = 300 height = 500 style="block">
				<a style="display:block">${productList.productDisplayName }</a> 
			</div>
		
		</c:forEach>
		
	</div>  --%>

	
	<!-- Start Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="./../../../resources/js/templatemo.js"></script>
    <script src="./../../../resources/js/custom.js"></script>
    <!-- End Script -->
	
</body>
</html>