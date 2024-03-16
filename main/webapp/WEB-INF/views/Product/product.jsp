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
<!--================ Start Header Menu Area =================-->
	<header class="header_area">
	    <div class="main_menu">
	      <nav class="navbar navbar-expand-lg navbar-light">
	        <div class="container">
	          <a class="navbar-brand logo_h"  href="/waguwagu/">
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
	              <li class="nav-item"><a class="nav-link" href="/waguwagu/">홈</a></li>
	              <li class="nav-item submenu dropdown">
	                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
	                  aria-expanded="false">쇼핑</a>
	                <ul class="dropdown-menu">
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/products">쇼핑</a></li>
	                  <c:if test="${sessionScope.memberId == 'admin'}">
	                  	<li class="nav-item"><a class="nav-link" href="/waguwagu/products/add">상품등록</a></li>
	                  </c:if>
	                </ul>
	              </li>
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
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/lessons/add">클래스등록</a></li>
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
	                  <li class="nav-item"><a class="nav-link" href="/waguwagu/hospitalinfo/list">예약확인</a></li>
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
			  <li class="breadcrumb-item"><a href="/waguwagu/products">상품목록</a></li>
			  <li class="breadcrumb-item active" aria-current="page">${pd.category }</li>
			</ol>
		</nav>
	</div>
  <!--================Single Product Area =================-->
	<div class="product_image_area" style="padding-top:20px;">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="<c:url value='/resources/images/${pd.fileName}'/>" alt=""/>
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="<c:url value='/resources/images/${pd.fileName}'/>" alt=""/>
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
						<h3>[${pd.brand }] ${pd.productName}</h3>
						<h2>${pd.unitPrice }</h2>
						<ul class="list">
							<li><a class="active" href="#"><span>Category</span> : ${pd.category }</a></li>
							<li><a href="#"><span>Condition</span> : ${pd.condition }</a></li>
						</ul>
						<p>${pd.briedfDescription }</p>
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
					<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">제품설명</a>
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
					<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
					 aria-selected="false">리뷰</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p><!-- 채은성(한화), 전의산(SSG), 이형종(키움), 정훈(롯데) --> 2023 시즌 선수 지급 모델</p>
					<div class="fade-1">
						<img class="img-fluid" src="img/category/a2k진.jpg" alt="">
						<div>
							<h5>Best of ${pd.material }</h5>
							<p>기존 가죽보다 2배 뛰어난 내구성과 방습 기능을 제공하는 수퍼 스킨으로 필드의 선수들이 글러브를 자유롭게 컨트롤 하고 최고의 퍼포먼스를 발휘할 수 있도록 가벼운 무게를 구현한다.</p>
						</div>
					</div>
					<div class="fade-1">
						<div>
							<h5><strong>${pd.category} 제조의 선도국 ${pd.manufacturCountry }</strong></h5>
							<p>${pd.description }</p>
						</div>
						<img class="img-fluid" src="<c:url value='/resources/images/${pd.fileName}'/>" alt=""/>
					</div>
					<div class="fade-1">
						<img class="img-fluid" src="<c:url value='/resources/images/${pd.fileName}'/>" alt=""/>
						<div>
							<h5><strong>최고의 품질</strong></h5>
							<p>${pd.briedfDescription }</p>
						</div>
					</div>	
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<h5>상품번호</h5>
									</td>
									<td>
										<h5>${pd.productId }</h5>
									</td>
								</tr>							
								<tr>
									<td>
										<h5>모델</h5>
									</td>
									<td>
										<h5>${pd.modelName }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>크기</h5>
									</td>
									<td>
										<h5>${pd.size }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>포지션</h5>
									</td>
									<td>
										<h5>${pd.position }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>소재</h5>
									</td>
									<td>
										<h5>${pd.material }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>웹</h5>
									</td>
									<td>
										<h5>${pd.web }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>색상</h5>
									</td>
									<td>
										<h5>${pd.color}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>제조국</h5>
									</td>
									<td>
										<h5>${pd.manufacturCountry }</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>취급시 유의사항</h5>
									</td>
									<td>
										<ul>
											<c:forEach items="${handling }" var="handling">
												<h5>- ${handling}</h5>
											</c:forEach>
										</ul>
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
				<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>총점</h5>
										<h4>${avgScore }</h4>
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
							<div class="review_list" id="review_list">
								<c:forEach var="review" items="${productReviews}">
								    <div class="review_item" >
								        <div class="media">
								            <div class="d-flex">
								                <img src="<c:url value='/resources/img/product/review2.png" alt="'/>"/>
								            </div>
								            <div class="media-body">
								                <h4>${review.name}</h4>
								                <i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
								            </div>
								        </div>
								        <p>${review.reviewContent}</p>
								        <div class="text-md-right">
		      								<a href="javascript:void(0);" class="taeredit_button" data-reviewid="${review.reviewId}" data-productid="${review.productId}">수정하기</a>
		      								<a href="<c:url value='/products/review/delete?id=${review.reviewId}&productId=${review.productId}'/>" class="btn" onclick="return deleteConfirm('${review.reviewId}')" style="color:red">삭제</a>			                        
				                        </div>
								    </div>
							    </c:forEach>
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
								<div id="taeeditFormWrapper" style="display:none;">
									<form:form id="editForm" action="/waguwagu/product/review/add" method="post" class="form-contact form-review mt-3" modelAttribute="addReview" >
					                  <div class="form-group">
					                    <input path="name" id="editName" class="form-control" name="name" type="text" placeholder="이름을 입력하세요." value="${review.name}">
					                  </div>
					                  <div class="form-group">
					                    <input type="text" id="editproductid" path="productId" class="form-control" name="productId" value="${review.productid}" >
					                  </div>
					                  <div class="form-group">
					                    <input type="date" path="reviewDate" id="eidtdate" class="form-control" name="reviewDate" value="${review.reviewDate}">
					                  </div>
					                  <div class="form-group">
					                    <input type="text" id="editscore" path="reviewRating" class="form-control" name="reviewRating" placeholder="평점을 입력하세요." value="${review.reviewRating}">
					                  </div>
					                  <div class="form-group">
					                    <input path="userId" id="editemail" class="form-control" name="userId" type="email" value="${review.userId}" placeholder="이메일을 입력하세요." required>
					                  </div>
					                  <div class="form-group">
					                    <input path="title" id="edittitle" class="form-control" name="title" type="text" placeholder="제목을 입력하세요." value="${review.title}">
					                  </div>
					                  <div class="form-group">
					                    <textarea path="reviewContent" id="editContent" class="form-control different-control w-100" name="reviewContent" id="textarea" cols="30" rows="5" placeholder="글을 작성하세요." value="${review.reviewContent}"></textarea>
					                  </div>
					                  <div class="form-group text-center text-md-right mt-3">
					                    <button type="submit" class="button button--active button-review">수정하기</button>
					                  </div>
					                </form:form>
								</div>
				                <form:form id="taerealForm" method="post" action="/waguwagu/products/review/add" class="form-contact form-review mt-3" modelAttribute="addReview">
				                  <div class="form-group">
				                    <input path="name" class="form-control" name="name" type="text" placeholder="이름을 입력하세요." />
				                  </div>
				                  <div class="form-group">
				                    <input path="productId" class="form-control" name="productId" type="text" placeholder="상품아이디" value="${productId}" />
				                  </div>
				                  <div class="form-group">
				                    <input path="reviewDate" class="form-control" name="reviewDate" type="date"  />
				                  </div>
				                  <div class="form-group">
				                    <input path="reviewRating" class="form-control" name="reviewRating" type="text" placeholder="평점을 입력하세요" />
				                  </div>
				                  <div class="form-group">
				                    <input path="userId" class="form-control" name="userId" type="email" placeholder="이메일을 입력하세요." value="${userid}" />
				                  </div>
				                  <div class="form-group">
				                    <input path="title" class="form-control" name="title" type="text" placeholder="제목을 입력하세요." />
				                  </div>				                  				                  				                  
				                  <div class="form-group">
				                    <textarea path="reviewContent" class="form-control different-control w-100" name="reviewContent" cols="30" rows="5" placeholder="글을 작성하세요."></textarea>
				                  </div>
				                  <div class="form-group text-center text-md-right mt-3">
				                    <button type="submit" class="button button--active button-review">등록</button>
				                  </div>
				                </form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->

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
								<li><a href="/waguwagu">Home</a></li>
								<li><a href="/waguwagu/products">Shop</a></li>
								<li><a href="/waguwagu/teams">Team</a></li>
								<li><a href="/waguwagu/games">Games</a></li>
								<li><a href="/waguwagu/lessons">Class</a></li>
								<li><a href="/waguwagu/hospitalinfo/list">Hospital</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Gallery</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="<c:url value='/resources/images/gallery/r1.jpg" alt="'/>"/></li>
								<li><img src="<c:url value='/resources/images/gallery/r2.jpg" alt="'/>"/></li>
								<li><img src="<c:url value='/resources/images/gallery/r3.jpg" alt="'/>"/></li>
								<li><img src="<c:url value='/resources/images/gallery/r5.jpg" alt="'/>"/></li>
								<li><img src="<c:url value='/resources/images/gallery/r7.jpg" alt="'/>"/></li>
								<li><img src="<c:url value='/resources/images/gallery/r8.jpg" alt="'/>"/></li>
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
	</footer>
	<!--================ End footer Area  =================-->	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<script>
	
	    $('.taeredit_button').click(function() {
	        console.log("xx");
	        var reviewId = $(this).data('reviewid');
	        var productId = $(this).data('productid'); // lessonId 가져오기
	       	console.log("reviewId",reviewId);
	        console.log("productId",productId)
	        $('#taerealForm').hide(); // 등록 폼 숨기기
	        $('#taeeditFormWrapper').show();
	
	
	        $.ajax({
	            url: '/waguwagu/products/review/update',
	            type: 'GET',
	            data: { id: reviewId, productId: productId }, //파라미터 
	            success: function(result) {  // 수정 필요한 부분
	            	//console.log(result.review.reviewId);
	                $('#editName').val(result.name);
	                $('#editproductid').val(result.productId);
	                $('#eidtdate').val(result.reviewDate);
	                $('#editscore').val(result.reviewRating);
	                $('#editemail').val(result.userId);
	                $('#edittitle').val(result.title);
	                $('#editContent').val(result.reviewContent);
	            }
	        });
	    });
	
	</script>	

  <script src="<c:url value='/resources/vendors/jquery/jquery-3.2.1.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/bootstrap/bootstrap.bundle.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/skrollr.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/nice-select/jquery.nice-select.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/jquery.ajaxchimp.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/mail-script.js'/>"/></script>
  <script src="<c:url value='/resources/js/main.js'/>"/></script>

</body>
</html>