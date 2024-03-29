<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Medical</title>
<link rel="icon" href="resources/images/Fevicon.png" type="image/png">
<link rel="stylesheet"
	href="resources/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="resources/vendors/linericon/style.css">
<link rel="stylesheet"
	href="resources/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="resources/vendors/owl-carousel/owl.carousel.min.css">
<script type="text/javascript" src="resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<style>
.fade {
	/* text-align: center; */
	
}

.fade-1 {
	display: flex;
	align-items: center;
}

.breadhospital {
	background-color: transparent;
	border-bottom: 1px solid #777;
}

#pagination {
	display: flex;
	justify-content: center;
	margin-top: 20px; /* Adjust as needed */
}

#pagination button {
	margin: 0 5px; /* Adjust as needed */
	padding: 5px 10px;
	cursor: pointer;
	border: 1px solid #ccc;
	background-color: #f9f9f9;
}

#pagination {
	display: flex;
	justify-content: center;
	overflow-x: auto; /* 가로 스크롤을 가능하게 함 */
	white-space: nowrap; /* 탭이 한 줄에 나열되도록 함 */
	margin-top: 20px; /* 원하는 만큼 여백 설정 */
}

#pagination button {
	margin: 0 5px; /* 버튼 간격 설정 */
	padding: 5px 10px;
	cursor: pointer;
	border: 1px solid #ccc;
	background-color: #f9f9f9;
}

.rowmapper {
	display: flex;
	flex-direction: column;
}

.rowmappertow {
	display: flex;
}


/* 수정이 필요한 것들 */

/* 답변완료, 수정, 삭제 css */
.edit_button, .delete_button, .answer_button {
	padding: 8px 16px;
	margin: 4px;
	background-color: white; /* 초기 배경색을 하얀색으로 설정 */
	border: none;
	color: #384aeb; /* 텍스트 색상을 파란색으로 설정 */
	cursor: pointer;
	border-radius: 30px;
	text-decoration: none;
	transition: background-color 0.3s; /* 배경색 변경에 대한 전환 효과 추가 */
	border: 1px solid #e0e0e0;
	color: black;
}

.edit_button:hover, .delete_button:hover, .answer_button:hover {
	background-color: #384aeb; /* 호버시 배경색을 파란색으로 변경 */
	color: white;
}
</style>
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<a class="navbar-brand logo_h" href="index.html"><img
						src="resources/images/logo.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
							<li class="nav-item"><a class="nav-link" href="index.html">홈</a></li>
							<li class="nav-item"><a class="nav-link" href="index.html">쇼핑</a></li>
							<li class="nav-item active submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">구단</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link"
										href="category.html">구단등록</a></li>
									<li class="nav-item"><a class="nav-link"
										href="single-product.html">구단목록</a></li>
									<li class="nav-item"><a class="nav-link"
										href="checkout.html">구단랭킹</a></li>
									<li class="nav-item"><a class="nav-link"
										href="confirmation.html">나의구단</a></li>
								</ul></li>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">클래스</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="blog.html">클래스</a></li>
									<li class="nav-item"><a class="nav-link"
										href="single-blog.html">클래스목록</a></li>
								</ul></li>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">경기장</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="blog.html">경기장목록</a></li>
									<li class="nav-item"><a class="nav-link"
										href="single-blog.html">경기장예약</a></li>
								</ul></li>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">관광</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="blog.html">맛집</a></li>
									<li class="nav-item"><a class="nav-link"
										href="single-blog.html">둘러볼곳</a></li>
								</ul></li>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">의료</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="login.html">병원목록</a></li>
									<li class="nav-item"><a class="nav-link"
										href="register.html">병원예약</a></li>
									<li class="nav-item"><a class="nav-link"
										href="tracking-order.html">재활추천</a></li>
								</ul></li>
						</ul>

						<ul class="nav-shop">
							<li class="nav-item"><button>
									<i class="ti-search"></i>
								</button></li>
							<li class="nav-item"><button>
									<i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span>
								</button></li>
							<li class="nav-item"><button>
									<i class="fas fa-user"></i>
								</button></li>
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
					<h1>Medical</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">hospital</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->
	<div class="container">
		<nav class="bread_c" style="--bs-breadcrumb-divider: '>';"
			aria-label="breadcrumb">
			<ol class="breadcrumb breadhospital">
				<li class="breadcrumb-item"><a href="#">병원목록</a></li>
				<li class="breadcrumb-item active" aria-current="page">졍형외과</li>
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
							<img class="img-fluid"
								src="resources/images/category/hospital3.jpg" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid"
								src="resources/images/category/hospital2.jpg" alt="">
						</div>
						<!-- <div class="single-prd-item">
							<img class="img-fluid" src="resources/images/category/s-p1.jpg" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="resources/images/category/s-p1.jpg" alt="">
						</div> -->
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>행복정형외과</h3>
						<h2>정형외과</h2>
						<ul class="list">
							<li><a class="active" href="#"><span>Number</span> :
									055-264-3333</a></li>
							<li><a href="#"><span>Availibility</span> : Orthopedics</a></li>
						</ul>

						<p>경상남도 창원시 마산회원구</p>
						<div class="product_count">
							<label>예약날짜 : </label> <input type="date" name="birth" id="b"
								min="1996-12-30" style="width: 150px; font-size: 15px;">
							<a class="button primary-btn" href="#">예약</a>
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
				<li class="nav-item"><a class="nav-link" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">병원정보</a></li>
				<li class="nav-item"><a class="nav-link" id="contact-tab"
					data-toggle="tab" href="#contact" role="tab"
					aria-controls="contact" aria-selected="false">QnA</a></li>
				<li class="nav-item"><a class="nav-link active" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">리뷰</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<p>~~~~~전문으로 하는 정형외과</p>
					<div class="col-lg-12">
						<div class="feature-img">
							<img class="img-fluid" src="resources/images/category/정형외과.jpg"
								alt="">
						</div>
					</div>
					<div class="col-lg-9 col-md-9 blog_details">
						<h2>Astronomy Binoculars A Great Alternative</h2>
						<p class="excert">MCSE boot camps have its supporters and its
							detractors. Some people do not understand why you should have to
							spend money on boot camp when you can get the MCSE study
							materials yourself at a fraction.</p>
						<p>Boot camps have its supporters and its detractors. Some
							people do not understand why you should have to spend money on
							boot camp when you can get the MCSE study materials yourself at a
							fraction of the camp price. However, who has the willpower to
							actually sit through a self-imposed MCSE training. who has the
							willpower to actually sit through a self-imposed</p>
						<p>Boot camps have its supporters and its detractors. Some
							people do not understand why you should have to spend money on
							boot camp when you can get the MCSE study materials yourself at a
							fraction of the camp price. However, who has the willpower to
							actually sit through a self-imposed MCSE training. who has the
							willpower to actually sit through a self-imposed</p>
					</div>
					<div class="col-lg-12">
						<div class="quotes">MCSE boot camps have its supporters and
							its detractors. Some people do not understand why you should have
							to spend money on boot camp when you can get the MCSE study
							materials yourself at a fraction of the camp price. However, who
							has the willpower to actually sit through a self-imposed MCSE
							training.</div>
						<div class="row">
							<div class="col-6">
								<img class="img-fluid"
									src="resources/images/category/usman-yousaf-pTrhfmj2jDA-unsplash.jpg"
									alt="">
							</div>
							<div class="col-6">
								<img class="img-fluid" src="resources/images/category/새우아님.jpg"
									alt="">
							</div>
							<div class="col-lg-12 mt-4">
								<p>MCSE boot camps have its supporters and its detractors.
									Some people do not understand why you should have to spend
									money on boot camp when you can get the MCSE study materials
									yourself at a fraction of the camp price. However, who has the
									willpower.</p>
								<p>MCSE boot camps have its supporters and its detractors.
									Some people do not understand why you should have to spend
									money on boot camp when you can get the MCSE study materials
									yourself at a fraction of the camp price. However, who has the
									willpower.</p>
							</div>
						</div>
					</div>
				</div>
					<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					    <div class="row rowmapper">
					        <div class="rowmappertow">
					            <div class="col-lg-6">
					                <div id="comment_list">
					                    <c:forEach items="${hospitalqnaList}" var="hospitalqna">
					                        <div class="review_item">
					                            <div class="media">
					                                <div class="d-flex">
					                                    <img src="resources/images/product/review2.png" alt="#">
					                                </div>
					                                <div class="media-body">
					                                    <h4 class="number" style="cursor: pointer;">${hospitalqna.name}</h4>
					                                    <h5>${hospitalqna.date}</h5>
					                                    <a class='reply_btn' href='/waguwagu/hospitalanswers/hospitaladd?hospitalid=${hospitalqna.hospitalid}'>Reply</a>
					                                </div>
					                            </div>
					                            <p>${hospitalqna.content}</p>
					                            <div class="edit_delete_buttons" style="display: none;">
					                                <!-- 답변 완료 버튼 추가 -->
					                                <c:set var="hasAnswer" value="false" />
					                                <c:forEach items="${hospitalanslistkey}" var="ansItem">
					                                    <c:if test="${hospitalqna.hospitalid eq ansItem.hospitalid}">
					                                        <c:set var="hasAnswer" value="true" />
					                                    </c:if>
					                                </c:forEach>
					                                <c:if test="${hasAnswer eq 'true'}">
					                                    <button class="answer_button">답변 완료</button>
					                                    <div class="answer_info" style="display: none;">
					                                        <c:forEach items="${hospitalanslistkey}" var="ansItem">
					                                            <c:if test="${hospitalqna.hospitalid eq ansItem.hospitalid}">
					                                                <p>답변 날짜 : ${ansItem.replaydate}</p>
					                                                <p>답변 : ${ansItem.answercontent }</p>
					                                                <!-- 다른 필드 정보도 추가 -->
					                                            </c:if>
					                                        </c:forEach>
					                                    </div>
					                                </c:if>
					                                <a href="javascript:void(0);" class="edit_button" data-hospitalid="${hospitalqna.hospitalid}">수정하기</a>
					                                 <a href="<c:url value="javascript:deleteConfirm('${hospitalqna.hospitalid}')" />" class="edit_button">삭제</a>
					                            </div>
					                        </div>
					                    </c:forEach>
					                </div>
					                <div class="col-lg-6">
					                    <div class="pagination-container"></div>
					                </div>
					            </div>
							<div class="col-lg-6">
								<div class="review_box">
									<h4>QnA 작성</h4>
									<form:form modelAttribute="hospitalplus" method="post"
										action="/waguwagu/hospitalquestion/add" id="contactForm"
										novalidate="novalidate">
										<div class="col-md-12">
											<div class="form-group">
												<!-- hospitalplus 객체의 number 필드를 바인딩합니다. -->
												<input type="text" class="form-control" id="name"
													name="name" placeholder="이름을 입력하세요." />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<!-- hospitalplus 객체의 email 필드를 바인딩합니다. -->
												<input type="email" class="form-control" id="email"
													name="email" placeholder="이메일을 입력하세요." />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<!-- hospitalplus 객체의 date 필드를 바인딩합니다. -->
												<input type="text" class="form-control" id="hospitalid"
													name="hospitalid" placeholder="아이디를 입력해주세요." />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<!-- hospitalplus 객체의 content 필드를 바인딩합니다. -->
												<textarea class="form-control" name="content" id="content"
													rows="1" placeholder="글을 작성하세요."></textarea>
											</div>
										</div>
										<div class="col-md-12 text-right">
											<!-- "등록" 버튼을 클릭하면 hospitalplus 객체를 서버로 전송합니다. -->
											<input type="submit" value="등록" class="btn primary-btn">
										</div>
									</form:form>
									<div id="editFormWrapper" style="display: none;">
										<form:form modelAttribute="hospitalupdateqna" method="post"
											action="/waguwagu/hospitalquestion/hospitalupdate"
											id="editForm" novalidate="novalidate">
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" class="form-control" id="editName"
														readonly="true" name="name" value="${hospital123.name}">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" class="form-control" id="editEmail"
														readonly="true" name="email" placeholder="이메일을 입력하세요."
														value="${hospital123.email}">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" class="form-control" id="editHospitalid"
														readonly="true" name="hospitalid" placeholder="id를 입력하세요"
														value="${hospital123.hospitalid}">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<textarea class="form-control" name="content"
														id="editContent" rows="1" placeholder="글을 작성하세요.">${hospital123.content}</textarea>
												</div>
											</div>
											<div class="col-md-12 text-right">
												<input type="submit" value="수정하기" class="btn primary-btn">
											</div>
										</form:form>
									</div>
								</div>
							</div>

						</div>
						<div id="pagination" class="pagination"></div>
					</div>
				</div>
				<div class="tab-pane fade show active" id="review" role="tabpanel"
					aria-labelledby="review-tab">
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
											<li><a href="#">5 Star <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">4 Star <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">3 Star <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">2 Star <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">1 Star <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="resources/images/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>서의정</h4>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="resources/images/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>강도영</h4>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="resources/images/product/review2.png" alt="">
										</div>
										<div class="media-body">
											<h4>이태림</h4>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
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
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
								</ul>
								<!-- <p>Outstanding</p> -->
								<form action="#/" class="form-contact form-review mt-3">
									<div class="form-group">
										<input class="form-control" name="name" type="text"
											placeholder="이름을 입력하세요." required>
									</div>
									<div class="form-group">
										<input class="form-control" name="email" type="email"
											placeholder="이메일을 입력하세요." required>
									</div>
									<div class="form-group">
										<input class="form-control" name="subject" type="text"
											placeholder="제목을 입력하세요.">
									</div>
									<div class="form-group">
										<textarea class="form-control different-control w-100"
											name="textarea" id="textarea" cols="30" rows="5"
											placeholder="글을 작성하세요."></textarea>
									</div>
									<div class="form-group text-center text-md-right mt-3">
										<button type="submit"
											class="button button--active button-review">등록</button>
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
				<h2>
					추천 <span class="section-intro__style">상품</span>
				</h2>
			</div>
			<div class="row mt-30">
				<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
					<div class="single-search-product-wrapper">
						<div class="single-search-product d-flex">
							<a href="#"><img
								src="resources/images/product/product-sm-1.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img
								src="resources/images/product/product-sm-2.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img
								src="resources/images/product/product-sm-3.png" alt=""></a>
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
							<a href="#"><img
								src="resources/images/product/product-sm-4.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img
								src="resources/images/product/product-sm-5.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img
								src="resources/images/product/product-sm-6.png" alt=""></a>
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
							<a href="#"><img
								src="resources/images/product/product-sm-7.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img
								src="resources/images/product/product-sm-8.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img
								src="resources/images/product/product-sm-9.png" alt=""></a>
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
							<a href="#"><img
								src="resources/images/product/product-sm-1.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img
								src="resources/images/product/product-sm-2.png" alt=""></a>
							<div class="desc">
								<a href="#" class="title">Gray Coffee Cup</a>
								<div class="price">$170.00</div>
							</div>
						</div>
						<div class="single-search-product d-flex">
							<a href="#"><img
								src="resources/images/product/product-sm-3.png" alt=""></a>
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

	<script>
/* 3개 글 보기 */
var list = document.getElementById('comment_list').getElementsByClassName('review_item');
  var pageNum = document.getElementById('pagination');
  var limitPerPage = 3;
  var totalPages = Math.ceil(list.length / limitPerPage);

  for (var i = limitPerPage; i < list.length; i++) {
    list[i].style.display = 'none';
  }

  for (var i = 1; i <= totalPages; i++) {
    pageNum.innerHTML += "<button onclick='changePage(" + i + ")'>" + i + "</button>";
  }

  window.changePage = function(page) {
    var start = (page - 1) * limitPerPage;
    var end = start + limitPerPage;

    for (var i = 0; i < list.length; i++) {
      list[i].style.display = 'none';
    }

    for (var i = start; i < end; i++) {
      if (list[i]) {
        list[i].style.display = 'block';
      }
    }
  }
  
  var numbers = document.getElementsByClassName('number');
  for (var i = 0; i < numbers.length; i++) {
    numbers[i].addEventListener('click', function(e) {
      var buttons = e.target.parentNode.parentNode.getElementsByClassName('edit_delete_buttons')[0];
      if (buttons) {
        buttons.style.display = buttons.style.display === 'none' ? 'block' : 'none';
      }
    });
  }

  var editButtons = document.getElementsByClassName('edit_button');
  for (var i = 0; i < editButtons.length; i++) {
    editButtons[i].addEventListener('click', function(e) {
      // Edit 버튼 클릭 시 동작 정의
      console.log('Edit button clicked');
    });
  }

  var deleteButtons = document.getElementsByClassName('delete_button');
  for (var i = 0; i < deleteButtons.length; i++) {
    deleteButtons[i].addEventListener('click', function(e) {
      // Delete 버튼 클릭 시 동작 정의
      console.log('Delete button clicked');
    });
  }
  
  document.getElementById('comment_list').addEventListener('click', function(e) {
	  if (e.target && e.target.classList.contains('number')) {
	    var buttons = e.target.parentNode.parentNode.parentNode.getElementsByClassName('edit_delete_buttons')[0];
	    buttons.style.display = buttons.style.display === 'none' ? 'block' : 'none';
	  }

	  if (e.target && e.target.classList.contains('edit_button')) {
	    // Edit 버튼 클릭 시 동작 정의
	    console.log('Edit button clicked');
	  }

	  if (e.target && e.target.classList.contains('delete_button')) {
	    // Delete 버튼 클릭 시 동작 정의
	    console.log('Delete button clicked');
	  }
	});
  
  document.addEventListener('DOMContentLoaded', function() {
	    var pagination = document.getElementById('pagination');
	    var buttons = pagination.getElementsByTagName('button');

	    // 각 버튼에 대한 클릭 이벤트 추가
	    for (var i = 0; i < buttons.length; i++) {
	        buttons[i].addEventListener('click', function() {
	            // 현재 선택된 버튼의 인덱스 확인
	            var currentIndex = Array.from(buttons).indexOf(this);

	            // 다음 버튼의 인덱스 계산
	            var nextIndex = currentIndex + 1;
	            if (nextIndex >= buttons.length) {
	                nextIndex = 0; // 마지막 버튼일 경우 첫 번째 버튼으로 이동
	            }

	            // 다음 버튼으로 이동
	            buttons[nextIndex].scrollIntoView({ behavior: 'smooth', block: 'nearest' });
	        });
	    }
	});
  
  
  /* 삭제 */
  function deleteConfirm(hospitalid) {
	    if (confirm("삭제하시겠습니까?") == true) 
	    {
	        // 직접 URL을 생성하여 이동합니다.
	        location.href = "/waguwagu/hospitalquestion/hospitaldelete?hospitalid=" + hospitalid;
	    } 
	    else 
	    {
	        return;
	    }
	}
  
  /* 수정하기 */
// 수정 버튼 클릭 시 동작하는 부분
$(document).ready(function() {
    // 수정하기 버튼에 대한 클릭 이벤트 핸들러 설정
    $('.edit_button').click(function() {
        var hospitalid = $(this).data('hospitalid');
        
        $('#contactForm').hide(); // 등록 폼 숨기기
        $('#editFormWrapper').show();

        $.ajax({
            url: '/waguwagu/hospitalquestion/hospitalupdate',
            type: 'GET',
            data: { hospitalparamid: hospitalid }, // 수정 필요
            success: function(hospitalqna) {
                $('#editName').val(hospitalqna.name); // 수정 폼에 이름 채우기
                $('#editEmail').val(hospitalqna.email); // 수정 폼에 이메일 채우기
                $('#editHospitalid').val(hospitalqna.hospitalid); // 수정 폼에 상품 ID 채우기
                $('#editContent').val(hospitalqna.content); // 수정 폼에 내용 채우기
            }
        });
    });
});
</script>

<!-- 답변 완료 버튼 -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var answerButtons = document.querySelectorAll('.answer_button');
    
        answerButtons.forEach(function(button) {
            button.addEventListener('click', function() {
                var answerInfo = this.nextElementSibling;
                if (answerInfo.style.display === 'none') {
                    answerInfo.style.display = 'block';
                } else {
                    answerInfo.style.display = 'none';
                }
            });
        });
    });
    </script>
    <!-- 수정폼 취소버튼 -->
    <script>
    $(document).ready(function() {
        // 취소 버튼 클릭 시 등록 폼 표시
        $('#cancelEdit').click(function(event) {
            event.preventDefault(); // 기본 동작 막기
            $('#editFormWrapper').hide(); // 수정 폼 숨기기
            $('#contactForm').show(); // 등록 폼 표시
        });
    });
    </script>


	<script src="resources/vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="resources/vendors/skrollr.min.js"></script>
	<script src="resources/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="resources/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="resources/vendors/jquery.ajaxchimp.min.js"></script>
	<script src="resources/vendors/mail-script.js"></script>
	<script src="resources/js/main.js"></script>
</body>
</html>