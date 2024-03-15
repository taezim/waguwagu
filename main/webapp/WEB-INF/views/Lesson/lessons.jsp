<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- form 사용을 위한 선언 -->
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Category</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="<c:url value='/resources/vendors/bootstrap/bootstrap.min.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/fontawesome/css/all.min.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/resources/vendors/themify-icons/themify-icons.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/resources/vendors/linericon/style.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.theme.default.min.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/nice-select/nice-select.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/nouislider/nouislider.min.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/css/test.css'/>"/>
  <script src="https://kit.fontawesome.com/c3566586b6.js" crossorigin="anonymous"></script>
  <style>

  </style>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	 <script>
	  document.addEventListener('DOMContentLoaded', function () {
	    const myteamLink = document.querySelector('.nav-link[href="/waguwagu/team/team?id=${myteam}"]');
	
	    myteamLink.addEventListener('click', function (event) {
	      // 이 부분에서 myteam 값이 비어있는지 확인
	      const myteamValue = "${myteam}"; // 여기에 myteam 값을 설정하는 방식에 따라 다르게 가져와야 합니다.
	
	      if (!myteamValue) {
	        alert('가입된 구단이 없습니다!');
	        event.preventDefault(); // 페이지 이동을 막음
	      }
	    });
	  });
	</script>

</head>
<body>
	<header class="header_area">
	    <div class="main_menu">
	      <nav class="navbar navbar-expand-lg navbar-light">
	        <div class="container">
	          <a class="navbar-brand logo_h" href="index.html">
	          	<img src="<c:url value='/resources/img/baseball.png'/>" alt=''/>
	          </a>
	          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
	            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
	            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
	              <li class="nav-item"><a class="nav-link" href="index.html">홈</a></li>
	              <li class="nav-item"><a class="nav-link" href="index.html">쇼핑</a></li>
	              <li class="nav-item active submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">구단</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/team/add">구단등록</a></li>
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/team">구단목록</a></li>
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/team/result/ranks">구단랭킹</a></li>
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/team/team?id=${myteam}">나의구단</a></li>
	                </ul>
	              </li>
	              <li class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">경기</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/games/add">게임등록</a></li>
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/games">경기목록</a></li>
	                </ul>
	              </li>
	              <li class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">클래스</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/Lesson/lessons">클래스?</a></li>
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/lessons">클래스목록</a></li>
	                </ul>
								</li>
	              <li class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">경기장</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/">경기장목록</a></li>
	                  <li class="nav-item"><a class="nav-link" href="single-blog.html">경기장예약</a></li>
	                </ul>
				</li>
				<li class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">의료</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/hospitalinfo/list">병원목록</a></li>
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/Hospital/">병원예약</a></li>
	                  <li class="nav-item"><a class="nav-link" href="tracking-order.html">재활추천</a></li>
	                </ul>
	              </li>
	            </ul>
	
	            <ul class="nav-shop">
	              <li class="nav-item"><button><i class="ti-search"></i></button></li>
	              <li class="nav-item"><button><i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span></button> </li>
	              <li class="nav-item"><button><i class="fas fa-user"></i></button></li>
	            </ul>
	           <c:if test="${empty sessionScope.memberId }">
	            	<a href="/waguwagu/member/login">로그인</a>
	            </c:if>
	            <c:if test="${not empty sessionScope.memberId}">
				    <form action="/waguwagu/member/logout" method="post">
				        <input type="submit" value="로그아웃" style="border: none; background: none;  color:rgb(79, 155, 253)">
				    </form>
				</c:if>
	          </div>
	        </div>
	      </nav>
	    </div>
	  </header>
	<!--================ End Header Menu Area =================-->
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Hospital Category</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
			            <ol class="breadcrumb">
			              <li class="breadcrumb-item"><a href="#">Home</a></li>
			              <li class="breadcrumb-item active" aria-current="page">Hospital Category</li>
			            </ol>
			          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->


 
	<!-- ================ category section start ================= -->		  
  	<section class="section-margin--small mb-5">
    	<div class="container">
	      	<div class="row">
	      		<input class="pixel-radio" type="radio" id="all" name="position" value=" " class="radio_check">
	      		<input class="pixel-radio" type="radio" id="C" name="position" value="포수" class="radio_check">
				<input class="pixel-radio" type="radio" id="pitcher" name="position" value="투수" class="radio_check">
				<input class="pixel-radio" type="radio" id="DH" name="position" value="타자" class="radio_check">				
				<input class="pixel-radio" type="radio" id="SS" name="position" value="유격수" class="radio_check">
				<input class="pixel-radio" type="radio" id="LF" name="position" value="좌익수" class="radio_check">
				<input class="pixel-radio" type="radio" id="RF" name="position" value="우익수" class="radio_check">
				<input class="pixel-radio" type="radio" id="CF" name="position" value="중견수" class="radio_check">

	        
		        <div class="col-xl-3 col-lg-4 col-md-5">
		          <div class="sidebar-categories">
		            <div class="head">지역</div>
		            <ul class="main-categories">
		              <li class="common-filter">
		                <form action="#">
		                  <ul>
		                  	<li class="filter-list"><label for="all">전체보기</label></li>
		                    <li class="filter-list"><label for="C">포수</label></li>
		                    <li class="filter-list"><label for="pitcher">투수</label></li>
		                    <li class="filter-list"><label for="DH">타자</label></li>
		                    <li class="filter-list"><label for="SS">유격수</label></li>
		                    <li class="filter-list"><label for="LF">좌익수</label></li>
		                    <li class="filter-list"><label for="RF">우익수</label></li>
		                    <li class="filter-list"><label for="CF">중견수</label></li>
		                  </ul>
		                </form>
		              </li>
		            </ul>
		          </div>
		        </div>
		        <div id="hospitalist" class="col-xl-9 col-lg-8 col-md-7">
		          	<!-- Start Filter Bar -->
			        <div class="filter-bar d-flex flex-wrap align-items-center">
			            <div class="sorting">
			              <select>
			                <option value="1">Default sorting</option>
			                <option value="1">Default sorting</option>
			                <option value="1">Default sorting</option>
			              </select>
			            </div>
			            <div class="sorting mr-auto">
			              <select>
			                <option value="1">Show 12</option>
			                <option value="1">Show 12</option>
			                <option value="1">Show 12</option>
			              </select>
			            </div>
			            <div>
			              <div class="input-group filter-bar-search">
			                <input type="text" placeholder="Search">
			                <div class="input-group-append">
			                  <button type="button"><i class="ti-search"></i></button>
			                </div>
			              </div>
			            </div>
			          </div>
			        <!-- End Filter Bar -->
			        <!-- 1 Start Best Seller -->
			        <section class="lattest-product-area pb-40 category-list">
		            <div class="container"> 
		                <ul>
		                  <c:forEach var="list" items="${list}">
						    <li class="d-f shadow-sm p-3 mb-5 bg-body-tertiary rounded" aria-current="true" id="li-list">
						        <div class="card-product d-inline-flex">
						            <div class="hospital-img" >
						                <img class="img-fluid" src="/img/hospital.jpg" alt="">
						                <input type="checkbox" style="display: none;">
						                <i class="fa-regular fa-heart heart"></i>
						                <i class="fa-solid fa-heart heart"></i>
						            </div>
						            <div class="description d-flex flex-column flex-md-row">
						                <div class="ml-3">
						                    <h2 class="">${list.className}</h2>
						                    <div id="cityname" class="subheading mb-3 cityname">${list.subject}</div>
						                    
						                    <p align="left">${fn:substring(list.description, 0, 100)}...</p>
						                </div>
						            </div>
						        </div>
						        <div class="text-md-right">
						            <a href="<c:url value='/lessons/lesson?id=${list.classId}'/>" class="btn btn-sm btn-primary">상세보기</a>
						        </div>
						    </li>
						</c:forEach>
			           </ul>              
			        </div>
		          </section>
			      <!-- 페이지버튼 -->    
				  <div class="d-flex justify-content-center">
		            <div aria-label="Page navigation example">
		              <ul class="pagination">
		                <li class="page-item">
		                  <a class="page-link" href="#" aria-label="Previous">
		                    <span aria-hidden="true">&laquo;</span>
		                  </a>
	                	</li>
		                <li class="page-item"><a class="page-link" href="/waguwagu/hospitalinfo/list?page=1">1</a></li>
		                <li class="page-item"><a class="page-link" href="/waguwagu/hospitalinfo/list?page=2">2</a></li>
		                <li class="page-item"><a class="page-link" href="/waguwagu/hospitalinfo/list?page=3">3</a></li>
		                <li class="page-item">
		                <a class="page-link" href="/waguwagu/hospitalinfo/list?page=${currentPage + 1}" aria-label="Next">
	                    <span aria-hidden="true">&raquo;</span>
	                  	</a>
		                </li>
		              </ul>
		            </div>
		          </div>
			   </div>
			 </div>
		</div>
	</section>
	<!-- ================ category section end ================= -->		  

	<!-- ================ top product area start ================= -->	
	
	<!-- ================ top product area end ================= -->		
 <!--================ Start footer Area  =================-->	
	<footer class="footer">
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title large_title">Our Mission</h4>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no 
								divided deep moved us lan Gathering thing us land years living.
							</p>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved 
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Quick Links</h4>
							<ul class="list">
								<li><a href="#">Home</a></li>
								<li><a href="#">Shop</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Product</a></li>
								<li><a href="#">Brand</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Gallery</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="img/gallery/r1.jpg" alt=""></li>
								<li><img src="img/gallery/r2.jpg" alt=""></li>
								<li><img src="img/gallery/r3.jpg" alt=""></li>
								<li><img src="img/gallery/r5.jpg" alt=""></li>
								<li><img src="img/gallery/r7.jpg" alt=""></li>
								<li><img src="img/gallery/r8.jpg" alt=""></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Contact Us</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									Head Office
								</p>
								<p>123, Main Street, Your City</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									+123 456 7890 <br>
									+123 456 7890
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									free@infoexample.com <br>
									www.infoexample.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- <div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
						Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.</p>
				</div>
			</div>
		</div> -->
	</footer>
	<!--================ End footer Area  =================-->


<script>
    $(document).ready(function() {
        // 라디오 버튼 클릭 이벤트 처리
        $('input[type="radio"]').on('change', function() {
            // 선택된 라디오 버튼의 값 (포수, 투수, ...) 가져오기
            var selectedPosition = $('input[name="position"]:checked').val();
			console.log(selectedPosition);
            // URL 동적으로 변경
            var newUrl = '/waguwagu/lessons/position?position=' + encodeURIComponent(selectedPosition);
            window.location.href = newUrl;
        });
    });
</script>




  <script src="<c:url value='/resources/vendors/jquery/jquery-3.2.1.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/bootstrap/bootstrap.bundle.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/skrollr.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/nice-select/jquery.nice-select.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/nouislider/nouislider.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/jquery.ajaxchimp.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/mail-script.js'/>"/></script>
  <script src="<c:url value='/resources/js/main.js'/>"/></script>
  <script src="<c:url value='/resources/js/test.js'/>"/></script>

 
				               
</body>
</html>