<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>[ 회원 가입 폼 ]</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
function formCheck(){
	
	var id = document.getElementById("user_id").value;
	var pw = document.getElementById("user_pw").value;
	var pwCheck = document.getElementById("user_pwCheck").value;
	var name = document.getElementById("user_name").value;
	
	if(id == "" || id.length == 0){
		alert("아이디를 입력해주세요");
		return false;
	}else if(id.length < 3 || id.length > 8){
		alert("아이디는 3~8글자 사이로 입력해주세요");
		return false;
	}

	if(pw == "" || pw.length == 0){
		alert("비밀번호를 입력해주세요");
		return false;
	}

	if(pwCheck != pw){
		alert("동일한 비밀번호를 입력해주세요");
		return false;
	}
	
	if(name == "" || name.length == 0){
		alert("이름을 입력해주세요");
		return false;		
	}
	
	return true;
}
</script>
</head>
<body>

	<!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
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
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="index.html">
                Zay
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.html">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.html">Shop</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.html">Contact</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">7</span>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="#">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
                        <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+99</span>
                    </a>
                </div>
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
            <form action="/user/join" method="post" onsubmit="return formCheck();" class="col-md-9 m-auto" role="form">
                <div class="row">
                    <div class="" style="width:10%; visibility: hidden"></div>
                    <div class="form-group col-md-6 mb-3" style="width:75%">
                        <label for="inputid">아이디</label>
                        <input type="text" class="form-control mt-1" id="user_id" name="user_id" placeholder="아이디">
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
                    <div class="form-group col-md-6 mb-3" style="width:75%">
                        <label for="inputpassword">비밀번호 확인</label>
                        <input type="password" class="form-control mt-1" id="user_pwCheck" name="user_pwCheck" placeholder="비밀번호 확인">
                    </div>
                    <div class="" style="width:10%;visibility: hidden"></div>
                </div>
                <div class="row">
                    <div class="" style="width:10%;visibility: hidden"></div>
                    <div class="form-group col-md-6 mb-3" style="width:75%">
                        <label for="inputname">이름</label>
                        <input type="text" class="form-control mt-1" id="user_name" name="user_name" placeholder="이름">
                    </div>
                    <div class="" style="width:10%;visibility: hidden"></div>
                </div>
                <div class="row">
                    <div class="" style="width:10%;visibility: hidden"></div>
                    <div class="form-group col-md-6 mb-3" style="width:75%;margin-top:10px">
                        <button type="submit" class="btn btn-success px-3" style="width:100%">회원 가입</button>
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
                            123 Consectetur at ligula 10660
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
                        <li><a class="text-decoration-none" href="#">Luxury</a></li>
                        <li><a class="text-decoration-none" href="#">Sport Wear</a></li>
                        <li><a class="text-decoration-none" href="#">Men's Shoes</a></li>
                        <li><a class="text-decoration-none" href="#">Women's Shoes</a></li>
                        <li><a class="text-decoration-none" href="#">Popular Dress</a></li>
                        <li><a class="text-decoration-none" href="#">Gym Accessories</a></li>
                        <li><a class="text-decoration-none" href="#">Sport Shoes</a></li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Home</a></li>
                        <li><a class="text-decoration-none" href="#">About Us</a></li>
                        <li><a class="text-decoration-none" href="#">Shop Locations</a></li>
                        <li><a class="text-decoration-none" href="#">FAQs</a></li>
                        <li><a class="text-decoration-none" href="#">Contact</a></li>
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
                            <a class="text-light text-decoration-none" target="_blank" href="http://facebook.com/"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a>
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
                            | Designed by <a rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a>
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
	
	<!-- <form action="/user/join" method="post" onsubmit="return formCheck();">
		<table border="1">
			<thead>
			</thead>
			<tbody>
				<tr>
					<td><label for="user_id">아이디</label></td>
					<td>
						<input type="text" id="user_id" name="user_id">		
					</td>
				</tr>
				<tr>
					<td><label for="user_pw">비밀번호</label></td>
					<td><input type="password" id="user_pw" name="user_pw"></td>
				</tr>
				<tr>
					<td><label for="user_pwCheck">비밀번호 확인</label></td>
					<td><input type="password" id="user_pwCheck" name="user_pwCheck"></td>
				</tr>
				
				<tr>
					<td><label for="user_name">이름</label></td>
					<td><input type="text" id="user_name" name="user_name"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="submit" value="가입">
						<input type="reset" value="취소">
					</td>
				</tr>	
			</tfoot>
		</table>
	</form> -->
</body>
</html>