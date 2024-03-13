<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Product Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<link rel="icon" href="img/Fevicon.png" type="image/png">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendors/bootstrap/bootstrap.min.css'/>"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/fontawesome/css/all.min.css">
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/themify-icons/themify-icons.css">
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/linericon/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/owl-carousel/owl.theme.default.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/owl-carousel/owl.carousel.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/nice-select/nice-select.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/nouislider/nouislider.min.css">
	<script src="https://kit.fontawesome.com/c3566586b6.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style.css">
  <style>
	.fade{
		/* text-align: center; */
	}
	.fade-1{
		display: flex;
		align-items: center;
	}
	.input-text{
		border: 1px solid black;
	}
	.bcbc{
		background-color: transparent; 
		border-bottom: 1px solid #777;
	}
  </style>
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
		<div class="main_menu">
		  <nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
			  <a class="navbar-brand logo_h" href="index.html"><img src="img/logo.png" alt=""></a>
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
					  <li class="nav-item"><a class="nav-link" href="category.html">구단등록</a></li>
					  <li class="nav-item"><a class="nav-link" href="single-product.html">구단목록</a></li>
					  <li class="nav-item"><a class="nav-link" href="checkout.html">구단랭킹</a></li>
					  <li class="nav-item"><a class="nav-link" href="confirmation.html">나의구단</a></li>
					</ul>
								</li>
				  <li class="nav-item submenu dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					  aria-expanded="false">클래스</a>
					<ul class="dropdown-menu">
					  <li class="nav-item"><a class="nav-link" href="blog.html">클래스?</a></li>
					  <li class="nav-item"><a class="nav-link" href="single-blog.html">클래스목록</a></li>
					</ul>
								</li>
				  <li class="nav-item submenu dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					  aria-expanded="false">경기장</a>
					<ul class="dropdown-menu">
					  <li class="nav-item"><a class="nav-link" href="blog.html">경기장목록</a></li>
					  <li class="nav-item"><a class="nav-link" href="single-blog.html">경기장예약</a></li>
					</ul>
								</li>
				  <li class="nav-item submenu dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					  aria-expanded="false">관광</a>
					<ul class="dropdown-menu">
					  <li class="nav-item"><a class="nav-link" href="blog.html">맛집</a></li>
					  <li class="nav-item"><a class="nav-link" href="single-blog.html">둘러볼곳</a></li>
					</ul>
								</li>
								<li class="nav-item submenu dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					  aria-expanded="false">의료</a>
					<ul class="dropdown-menu">
					  <li class="nav-item"><a class="nav-link" href="login.html">병원목록</a></li>
					  <li class="nav-item"><a class="nav-link" href="register.html">병원예약</a></li>
					  <li class="nav-item"><a class="nav-link" href="tracking-order.html">재활추천</a></li>
					</ul>
				  </li>
				</ul>
	
				<ul class="nav-shop">
				  <li class="nav-item"><button><i class="ti-search"></i></button></li>
				  <li class="nav-item"><button><i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span></button> </li>
				  <li class="nav-item"><button><i class="fas fa-user"></i></button></li>
				</ul>
			  </div>
			</div>
		  </nav>
		</div>
	  </header>
		<!--================ End Header Menu Area =================-->
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shop</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active" aria-current="page">Product Shop</li>
						</ol>
					</nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
	<div class="container">
		<nav class="bread_c" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			<ol class="breadcrumb bcbc">
			  <li class="breadcrumb-item"><a href="#">상품목록</a></li>
			  <li class="breadcrumb-item active" aria-current="page">글러브</li>
			</ol>
		</nav>
	</div>
  <!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p3.jpg" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="img/category/A2K1883.jpg" alt="">
						</div>
						<!-- <div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p1.jpg" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p1.jpg" alt="">
						</div> -->
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>[WILSON] 윌슨 2023 KOR A2K 1883 12.5" 1루수 미트</h3>
						<h2>₩560,000</h2>
						<ul class="list">
							<li><a class="active" href="#"><span>Category</span> : Household</a></li>
							<li><a href="#"><span>Availibility</span> : In Stock</a></li>
						</ul>
						<p>코리아 A2K 라인업은 한국 프로 선수들을 위해 윌슨의 숙련된 장인들의 손으로 높고 까다로운 품질 기준에 맞춰 제작하는 윌슨의 최상위 라인업 글러브 입니다.</p>
						<div class="product_count">
              <label for="qty">수량:</label>
              <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
							 class="increase items-count" type="button"><i class="ti-angle-left"></i></button>
							<input type="text" name="qty" id="sst" size="2" maxlength="12" value="1" title="Quantity:" class="input-text qty">
							<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
               class="reduced items-count" type="button"><i class="ti-angle-right"></i></button>
							<a class="button primary-btn" href="#">장바구니</a>               
						</div>
						<div class="card_area d-flex align-items-center">
							<a class="icon_btn" href="#"><i class="lnr lnr lnr-diamond"></i></a>
							<a class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">제품설명</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
					 aria-selected="false">상세정보</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
					 aria-selected="false">QnA</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
					 aria-selected="false">리뷰</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p>채은성(한화), 전의산(SSG), 이형종(키움), 정훈(롯데) 2023 시즌 선수 지급 모델</p>
					<div class="fade-1">
						<img class="img-fluid" src="img/category/a2k진.jpg" alt="">
						<div>
							<h5>Super Skin</h5>
							<p>기존 가죽보다 2배 뛰어난 내구성과 방습 기능을 제공하는 수퍼 스킨으로 필드의 선수들이 글러브를 자유롭게 컨트롤 하고 최고의 퍼포먼스를 발휘할 수 있도록 가벼운 무게를 구현한다.</p>
						</div>
					</div>
					<div class="fade-1">
						<div>
							<h5>Expert japanese craftsmanship</h5>
							<p>오른 글러브 제작 경험을 가진 윌슨의 장인들의 손으로 전체 제작 공정이 일본에서 진행되는 KOR A2K 글러브는 18시간 이상의 제작 시간을 통해 완벽한 형태로 만들어집니다.</p>
						</div>
						<img class="img-fluid" src="img/category/s진1.JPG" alt="">
					</div>
					<div class="fade-1">
						<img class="img-fluid" src="img/category/s진2.JPG" alt="">
						<div>
							<h5>Sensitive Leather</h5>
							<p>윌슨 글러브 특유의 부드러움에 더해진 견고함과의 조화, 한국 프로 선수들을 위해 준비된 센서티브 레더는 2017년 첫 선을 보인 후 프로 선수들의 호평과 만족을 이끌어내고 있습니다.
							압축 가공된 가볍고 단단한 가죽과 듀얼 웰팅의 조합은 글러브 끝까지 최상의 지지력을 제공하여 강한 타구를 받아 내기 용이합니다.</p>
						</div>
					</div>	
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<h5>모델</h5>
									</td>
									<td>
										<h5>KOREA A2K 1883 BN</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>크기</h5>
									</td>
									<td>
										<h5>12.5인치</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>포지션</h5>
									</td>
									<td>
										<h5>1루수</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>소재</h5>
									</td>
									<td>
										<h5>센서티브 레더(Navy) / 슈퍼 스킨(blonde)</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>웹</h5>
									</td>
									<td>
										<h5>듀얼포스트 웹</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>색상</h5>
									</td>
									<td>
										<h5>Multi Color</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>제조국</h5>
									</td>
									<td>
										<h5>일본</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>취급시 유의사항</h5>
									</td>
									<td>
										<h5>- 가죽 제품은 소재특성상 세탁이 불가능합니다.</h5>
										<h5>- 가죽전용 크리너 또는 보호제로 관리해 주시기 바라며, 오염된 부분은 천을 이용하여 닦아내시기 바랍니다.</h5>
										<h5>- 가죽제품의 경우 무리한 힘을 가할 경우 가죽 부분이 늘어나거나 봉재가 파손될 수 있습니다.</h5>
										<h5>- 다림질 및 드라이크리닝을 하지 마시길 바랍니다.</h5>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="comment_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>강도영</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item reply">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>이태림</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>서의정</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>QnA 작성</h4>
								<form class="row contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요.">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요.">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="number" name="number" placeholder="전화번호를 입력하세요.">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="message" id="message" rows="1" placeholder="글을 작성하세요."></textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" value="submit" class="btn primary-btn">등록</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>총점</h5>
										<h4>4.0</h4>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<ul class="list">
											<li><a href="#">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">1 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>서의정</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>손에 착 감기는게 공이 더 잘 잡혀요!</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>강도영</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>우와 좋네요! 이걸 쓰고 실력이 더 늘었어요!</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>이태림</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>예전에 쓰던 글로브는 생각도 안날정도로 좋아요~! 다음에도 이용할게요!!</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>리뷰작성</h4>
								<p>평점:</p>
								<ul class="list">
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a  href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
								</ul>
								<!-- <p>Outstanding</p> -->
                <form action="#/" class="form-contact form-review mt-3">
                  <div class="form-group">
                    <input class="form-control" name="name" type="text" placeholder="이름을 입력하세요." required>
                  </div>
                  <div class="form-group">
                    <input class="form-control" name="email" type="email" placeholder="이메일을 입력하세요." required>
                  </div>
                  <div class="form-group">
                    <input class="form-control" name="subject" type="text" placeholder="제목을 입력하세요.">
                  </div>
                  <div class="form-group">
                    <textarea class="form-control different-control w-100" name="textarea" id="textarea" cols="30" rows="5" placeholder="글을 작성하세요."></textarea>
                  </div>
                  <div class="form-group text-center text-md-right mt-3">
                    <button type="submit" class="button button--active button-review">등록</button>
                  </div>
                </form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->

	<!--================ Start related Product area =================-->  
	<section class="related-product-area section-margin--small mt-0">
		<div class="container">
			<div class="section-intro pb-60px">
        <p>Popular Item in the market</p>
        <h2>추천 <span class="section-intro__style">상품</span></h2>
      </div>
			<div class="row mt-30">
        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-4.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-5.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-6.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-7.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-8.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-9.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-1.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-2.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="img/product/product-sm-3.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>
      </div>
		</div>
	</section>
	<!--================ end related Product area =================-->  	




  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/skrollr.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="vendors/jquery.ajaxchimp.min.js"></script>
  <script src="vendors/mail-script.js"></script>
  <script src="js/main.js"></script>
</body>
</html>