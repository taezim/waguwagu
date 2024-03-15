<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Product Details</title>
	<link rel="icon" href="resources/resources/images/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="resources/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="resources/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="resources/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="resources/vendors/linericon/style.css">
  <link rel="stylesheet" href="resources/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/vendors/owl-carousel/owl.carousel.min.css">
<script type="text/javascript" src="resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.7.1.min.js"></script>
  <link rel="stylesheet" href="resources/css/style.css">
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
.rowmapper
{
	display: flex;
	flex-direction: column;
}
.rowmappertow
{
	display: flex;
}

  </style>
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
		<div class="main_menu">
		  <nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
			  <a class="navbar-brand logo_h" href="index.html"><img src="resources/images/logo.png" alt=""></a>
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
							<img class="img-fluid" src="resources/images/category/s-p3.jpg" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="resources/images/category/A2K1883.jpg" alt="">
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
						<img class="img-fluid" src="resources/images/category/a2k진.jpg" alt="">
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
						<img class="img-fluid" src="resources/images/category/s진1.JPG" alt="">
					</div>
					<div class="fade-1">
						<img class="img-fluid" src="resources/images/category/s진2.JPG" alt="">
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
				  <div class="row rowmapper">
				    <div class="rowmappertow">
				        <div class="col-lg-6">
				            <div id="comment_list">
				                <c:forEach items="${productqnaList}" var="productqna">
				                    <div class="review_item">
				                    <div class="media">
				                        <div class="d-flex">
				                        <img src="resources/images/product/review2.png" alt="#">
				                        </div>
				                        <div class="media-body">
				                        <h4 class="number" style="cursor:pointer;">${productqna.name}</h4>
				                        <h5>${productqna.date}</h5>
				                        <a class="reply_btn" href="#">Reply</a>
				                        </div>
				                    </div>
				                    <p>${productqna.content}</p>
				                    <div class="edit_delete_buttons" style="display:none;">
				                         <a href="javascript:void(0);" class="edit_button" data-productid="${productqna.productid}">수정하기</a>
				                    <a href="<c:url value="javascript:deleteConfirm('${productqna.productid}')" />" class="edit_button">삭제</a>
				                    </div>
				                    </div>
				                </c:forEach>
				            </div>http://localhost:8080/waguwagu/classquestion#contact

				        </div>
				      <div class="col-lg-6">
				      <div class="review_box">
				        <h4>QnA 작성</h4>
				        <form:form modelAttribute="productplus" method="post" action="/waguwagu/productquestion/add" id="contactForm" novalidate="novalidate">
				                <div class="col-md-12">
				                    <div class="form-group">
				                        <!-- productplus 객체의 number 필드를 바인딩합니다. -->
				                        <input type="text"  class="form-control" id="name" name="name" placeholder="이름을 입력하세요."/>
				                    </div>
				                </div>
				                <div class="col-md-12">
				                    <div class="form-group">
				                        <!-- productplus 객체의 email 필드를 바인딩합니다. -->
				                        <input type="email"  class="form-control" id="email" name="email" placeholder="이메일을 입력하세요."/>
				                    </div>
				                </div>
				                <div class="col-md-12">
				                    <div class="form-group">
				                        <!-- productplus 객체의 date 필드를 바인딩합니다. -->
				                        <input type="text"  class="form-control" id="productid" name="productid" placeholder="아이디를 입력해주세요."/>
				                    </div>
				                </div>
				                <div class="col-md-12">
				                    <div class="form-group">
				                        <!-- productplus 객체의 content 필드를 바인딩합니다. -->
				                        <textarea class="form-control"  name="content" id="content" rows="1" placeholder="글을 작성하세요."></textarea>
				                    </div>
				                </div>
				                <div class="col-md-12 text-right">
				                    <!-- "등록" 버튼을 클릭하면 productplus 객체를 서버로 전송합니다. -->
				                    <input type="submit" value="등록" class="btn primary-btn">
				                </div>
				            </form:form>
				          <div id="editFormWrapper" style="display:none;">
				                <form:form modelAttribute="productupdateqna" method="post" action="/waguwagu/productquestion/productupdate" id="editForm" novalidate="novalidate">
				                    <div class="col-md-12">
				                        <div class="form-group">
				                            <input type="text" class="form-control" id="editName" readonly="true" name="name" value="${product123.name}">
				                        </div>
				                    </div>
				                    <div class="col-md-12">
				                        <div class="form-group">
				                            <input type="text" class="form-control" id="editEmail" readonly="true" name="email" placeholder="이메일을 입력하세요." value="${product123.email}">
				                        </div>
				                    </div>
				                    <div class="col-md-12">
				                        <div class="form-group">
				                            <input type="text" class="form-control" id="editProductid" readonly="true" name="productid" placeholder="id를 입력하세요" value="${product123.productid}">
				                        </div>
				                    </div>
				                    <div class="col-md-12">
				                        <div class="form-group">
				                            <textarea class="form-control" name="content" id="editContent" rows="1" placeholder="글을 작성하세요.">${product123.content}</textarea>
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
											<img src="resources/images/product/review2.png" alt="">
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
											<img src="resources/images/product/review2.png" alt="">
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
											<img src="resources/images/product/review2.png" alt="">
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
              <a href="#"><img src="resources/images/product/product-sm-1.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="resources/images/product/product-sm-2.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="resources/images/product/product-sm-3.png" alt=""></a>
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
              <a href="#"><img src="resources/images/product/product-sm-4.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="resources/images/product/product-sm-5.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="resources/images/product/product-sm-6.png" alt=""></a>
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
              <a href="#"><img src="resources/images/product/product-sm-7.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="resources/images/product/product-sm-8.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="resources/images/product/product-sm-9.png" alt=""></a>
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
              <a href="#"><img src="resources/images/product/product-sm-1.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="resources/images/product/product-sm-2.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="resources/images/product/product-sm-3.png" alt=""></a>
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

window.changePage = function (page) {
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
    numbers[i].addEventListener('click', function (e) {
        var buttons = e.target.parentNode.parentNode.getElementsByClassName('edit_delete_buttons')[0];
        if (buttons) {
            buttons.style.display = buttons.style.display === 'none' ? 'block' : 'none';
        }
    });
}

var editButtons = document.getElementsByClassName('edit_button');
for (var i = 0; i < editButtons.length; i++) {
    editButtons[i].addEventListener('click', function (e) {
        // Edit 버튼 클릭 시 동작 정의
        console.log('Edit button clicked');
    });
}

var deleteButtons = document.getElementsByClassName('delete_button');
for (var i = 0; i < deleteButtons.length; i++) {
    deleteButtons[i].addEventListener('click', function (e) {
        // Delete 버튼 클릭 시 동작 정의
        console.log('Delete button clicked');
    });
}

document.getElementById('comment_list').addEventListener('click', function (e) {
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

document.addEventListener('DOMContentLoaded', function () {
    var pagination = document.getElementById('pagination');
    var buttons = pagination.getElementsByTagName('button');

    // 각 버튼에 대한 클릭 이벤트 추가
    for (var i = 0; i < buttons.length; i++) {
        buttons[i].addEventListener('click', function () {
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
function deleteConfirm(productid) {
    if (confirm("삭제하시겠습니까?") == true) {
        // 직접 URL을 생성하여 이동합니다.
        location.href = "/waguwagu/productquestion/productdelete?productid=" + productid;
    } else {
        return;
    }
}

/* 수정하기 */
// 수정 버튼 클릭 시 동작하는 부분
$(document).ready(function () {
    $('.edit_button').click(function () {
        var productid = $(this).data('productid');

        $('#contactForm').hide(); // 등록 폼 숨기기
        $('#editFormWrapper').show();

        $.ajax({
            url: '/waguwagu/productquestion/productupdate',
            type: 'GET',
            data: { productid: productid }, // 수정 필요
            success: function (productqna) {
                $('#editName').val(productqna.name); // 수정 폼에 이름 채우기
                $('#editEmail').val(productqna.email); // 수정 폼에 이메일 채우기
                $('#editProductid').val(productqna.productid); // 수정 폼에 상품 ID 채우기
                $('#editContent').val(productqna.content); // 수정 폼에 내용 채우기
            }
        });
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