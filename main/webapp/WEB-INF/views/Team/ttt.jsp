<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="KR">
<head>
  <title>Soccer &mdash; Website by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <link rel="icon" href="img/Fevicon.png" type="image/png">

	<link rel="stylesheet" href="<c:url value='/resources/vendors/bootstrap/bootstrap.min.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/fontawesome/css/all.min.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/themify-icons/themify-icons.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/linericon/style.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.theme.default.min.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/nice-select/nice-select.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/vendors/nouislider/nouislider.min.css' />">
	<script src="https://kit.fontawesome.com/c3566586b6.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">

<style>
    *{
      /* border:0.1px solid black; */
      list-style: none;
    }
    .heart
    {
      position: absolute;
      bottom: 5%;
      left: 3%;
      font-size: 1.2rem;
      color: rgb(79, 155, 253);
    }
    .hospital-img
    {
      position: relative;
    }
    .fa-solid
    {
      display: none;
    }
    
    .fa-regular:hover ~ .fa-solid
    {
      display: block;
    }
    .teamMatch{
    display:flex;
    }
    .tm{
    	display:flex;
    }
   
	.fade{
		/* text-align: center; */
	}
	.fade-1{
		display: flex;
		align-items: center;
	}
	.breadhospital{
		background-color: transparent; 
		border-bottom: 1px solid #777;
	}
  
    .text-md-right{}
    
    .table-sm td
    {
        padding: 0.875rem !important ;
        
    }
    td:last-child, th:last-child
    {
        /* border: 1px solid red; */
        padding: 0px !important;
        width: 5%;
    }

  </style>

</head>
<body>
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
                  <li class="nav-item"><a class="nav-link" href="/waguwagu/team/add">구단등록</a></li>
                  <li class="nav-item"><a class="nav-link" href="/waguwagu/team">구단목록</a></li>
                  <li class="nav-item"><a class="nav-link" href="/waguwagu/games">경기목록</a></li>
                  <li class="nav-item"><a class="nav-link" href="/waguwagu/team/result/ranks">구단랭킹</a></li>
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
            <c:if test="${empty sessionScope.memberId }">
            	<a href="/waguwagu/member/login">로그인</a>
            </c:if>
            <c:if test="${not empty sessionScope.memberId }">
            	<a href="/waguwagu/member/logout">로그아웃</a>
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
					<h1>${tb.teamName}</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shop Category</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->

	<!-- ================ end banner area ================= -->
	<div class="container">
		<nav class="bread_c" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			<ol class="breadcrumb breadhospital">
			  <li class="breadcrumb-item"><a href="#">팀목록</a></li>
			  <li class="breadcrumb-item active" aria-current="page">${tb.teamName}</li>
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
							<img src="<c:url value='/resources/images/${tb.fileName}'/>" style="width: 50%"/>
						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${tb.teamId}</h3>
						<h2>${tb.teamName }</h2>
						<ul class="list">
							<li>대표번호 : ${tb.phoneNumber }</li>
							<li>선호지역 : ${tb.prefArea }</li>
						</ul>                       
						<p>${tb.description }</p>
						<div class="product_count">
                            <input type="date" name="birth" id="b" min="1996-12-30"  style="width:150px;font-size:15px;">
							<a href='<c:url value="/team/result/winning?id=${tb.teamId}"/>' class="btn btn-sm btn-primary" >경기결과</a>      
							<a href="<c:url value='/team/result/add?id=${tb.teamId}'/>" class="btn btn-sm btn-primary" >가입신청</a>
							<a href='<c:url value="/team/result/recent?id=${tb.teamId}"/>' class="btn btn-sm btn-primary" >최근경기결과</a>
							<c:if test="${sessionScope.memberId == 'teamadmin'}"> 			    
						    	<a href='<c:url value="/team/update?id=${tb.teamId}"/>' class="btn btn-success">수정&raquo;</a>
						    	<a href="<c:url value='/team/delete?id=${tb.teamId}'/>" class="btn btn-danger" onclick="return deleteConfirm('${tb.teamId}')">삭제 &raquo;</a>
						    	<a href="<c:url value='/team/result/add?id=${tb.teamId}'/>" class="btn btn-success">경기결과</a>
						    </c:if>
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
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">병원정보</a>
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
					<p>~~~~~전문으로 하는 정형외과</p>
                    <div class="col-lg-12">
                        <div class="feature-img">
                                <img class="img-fluid" src="img/category/정형외과.jpg" alt="">
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9 blog_details">
                        <h2>Astronomy Binoculars A Great Alternative</h2>
                        <p class="excert">
                                MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money
                                on boot camp when you can get the MCSE study materials yourself at a fraction.
                        </p>
                        <p>
                                Boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot
                                camp when you can get the MCSE study materials yourself at a fraction of the camp price.
                                However, who has the willpower to actually sit through a self-imposed MCSE training. who
                                has the willpower to actually sit through a self-imposed
                        </p>
                        <p>
                                Boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money on boot
                                camp when you can get the MCSE study materials yourself at a fraction of the camp price.
                                However, who has the willpower to actually sit through a self-imposed MCSE training. who
                                has the willpower to actually sit through a self-imposed
                        </p>
                    </div>	
                    <div class="col-lg-12">
                        <div class="quotes">
                                MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money
                                on boot camp when you can get the MCSE study materials yourself at a fraction of the camp
                                price. However, who has the willpower to actually sit through a self-imposed MCSE training.
                        </div>
                        <div class="row">
                                <div class="col-6">
                                        <img class="img-fluid" src="img/category/usman-yousaf-pTrhfmj2jDA-unsplash.jpg" alt="">
                                </div>
                                <div class="col-6">
                                        <img class="img-fluid" src="img/category/새우아님.jpg" alt="">
                                </div>
                                <div class="col-lg-12 mt-4">
                                        <p>
                                                MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money
                                                on boot camp when you can get the MCSE study materials yourself at a fraction of
                                                the camp price. However, who has the willpower.
                                        </p>
                                        <p>
                                                MCSE boot camps have its supporters and its detractors. Some people do not understand why you should have to spend money
                                                on boot camp when you can get the MCSE study materials yourself at a fraction of
                                                the camp price. However, who has the willpower.
                                        </p>
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
									<img src="<c:url value='/resources/images/${tb.fileName}'/>" style="width: 50%"/>
										<h5>${tb.teamName}</h5>
										<!-- <h4>4.0</h4> -->
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
							<br>
							<!-- card-->
					        <div class="card mb-3" style="width: 60%;">
					            <div class="row g-0">
						            <div class="col-md-4 ">
						                <!-- <img src="..." class="img-fluid rounded-start" alt="..."> -->
						                <i class="fa fa-star"></i>
						            </div>
						            <div class="col-md-8">
						                <div class="card-body">           
						                <p class="card-text">총 게임수</p>
						                <span class="fw-semibold">${totalGames}</span>
						                </div>
						            </div>
					            </div>
    					    </div>
    					    <div class="card mb-3" style="width: 60%;">
					            <div class="row g-0">
						            <div class="col-md-4 ">
						                <!-- <img src="..." class="img-fluid rounded-start" alt="..."> -->
						                <i class="fa fa-star"></i>
						            </div>
						            <div class="col-md-8">
						                <div class="card-body">           
						                <p class="card-text">총 이긴 게임 수</p>
						                <span class="fw-semibold">${totalWins}</span>
						                </div>
						            </div>
					            </div>
    					    </div>
    					    <div class="card mb-3" style="width: 60%;">
					            <div class="row g-0">
						            <div class="col-md-4 ">
						                <!-- <img src="..." class="img-fluid rounded-start" alt="..."> -->
						                <i class="fa fa-star"></i>
						            </div>
						            <div class="col-md-8">
						                <div class="card-body">           
						                <p class="card-text">무승부</p>
						                <span class="fw-semibold">${totalTies}</span>
						                </div>
						            </div>
					            </div>
    					    </div>
    					    <div class="card mb-3" style="width: 60%;">
					            <div class="row g-0">
						            <div class="col-md-4 ">
						                <!-- <img src="..." class="img-fluid rounded-start" alt="..."> -->
						                <i class="fa fa-star"></i>
						            </div>
						            <div class="col-md-8">
						                <div class="card-body">           
						                <p class="card-text">패배</p>
						                <span class="fw-semibold">${totalLosses}</span>
						                </div>
						            </div>
					            </div>
    					    </div>
    					    <div class="card mb-3" style="width: 60%;">
					            <div class="row g-0">
						            <div class="col-md-4 ">
						                <!-- <img src="..." class="img-fluid rounded-start" alt="..."> -->
						                <i class="fa fa-star"></i>
						            </div>
						            <div class="col-md-8">
						                <div class="card-body">           
						                <p class="card-text">승률</p>
						                <span class="fw-semibold">${winningRate}</span>
						                </div>
						            </div>
					            </div>
    					    </div>
							<!-- <div class="review_list">
								<div class="review_item">
								
								</div>
							</div> -->
						</div>
						
						<div class="col-lg-6">
							<div class="review_box">
								<h4>가입신청</h4>
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
  
  <script href="<c:url value ='/resources/js/jquery-3.3.1.min.js'/>"></script>
  <script href="<c:url value ='/resources/js/jquery-migrate-3.0.1.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery-ui.js'/>"></script>
  <script scr="<c:url value ='/resources/js/popper.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/bootstrap.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/owl.carousel.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.stellar.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.countdown.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/bootstrap-datepicker.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.easing.1.3.js'/>"></script>
  <script scr="<c:url value ='/resources/js/aos.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.fancybox.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.sticky.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.mb.YTPlayer.min.js'/>"></script>

  <script scr="<c:url value ='/resources/js/main.js'/>"></script>



	
</body>
</html>