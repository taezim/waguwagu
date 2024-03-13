<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- form 사용을 위한 선언 -->
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Medical</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="<c:url value='/resources/vendors/bootstrap/bootstrap.min.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/fontawesome/css/all.min.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/resources/vendors/themify-icons/themify-icons.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/resources/vendors/linericon/style.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/nice-select/nice-select.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.theme.default.min.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.css'/>"/>

  <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>"/>
  <style>
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
	.findRaod{
		font-size:30px;
		color:#384aeb;
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
		<nav class="bread_c" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			<ol class="breadcrumb breadhospital">
			  <li class="breadcrumb-item"><a href="#">클래스목록</a></li>
			  <li class="breadcrumb-item active" aria-current="page">${ls.subject}</li>
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
							<img class="img-fluid" src="<c:url value='/resources/img/category/야간연습.jpg" alt="'/>"/>
						</div>
                        <div class="single-prd-item">
                            <img class="img-fluid" src="<c:url value='/resources/img/category/야간연습.jpg" alt="'/>"/>
                        </div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text" style="margin: 10px;">
						<h3>${ls.className}</h3>
						<h2>${ls.subject}</h2>
						<ul class="list">
							<li><a href="#"><span>장소</span> : ${ls.venue}</a></li>
							<li><a href="#"><span>인원</span> : ${ls.auditors}</a></li>
						</ul>      
						<p>${ls.tel } <br>
						${ls.description }</p>
						<div class="product_count">
							<a class="button primary-btn" href="#">수강신청</a>               
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
					<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true" onclick="handleTabClick('home-tab')">
					클래스 정보
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">
					QnA
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">
					 리뷰
					 </a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p>안녕하세요! <strong>${hospitalInfo.yadmNm }</strong> 입니다.</p>
                    <div class="col-lg-12">

                    </div>
                    <div class="col-lg-9 col-md-9 blog_details">
                        <h2>${hospitalInfo.yadmNm }</h2>
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
                                        <img class="img-fluid" src="<c:url value='/resources/img/category/usman-yousaf-pTrhfmj2jDA-unsplash.jpg" alt="'/>"/>
                                </div>
                                <div class="col-6">
                                        <img class="img-fluid" src="<c:url value='/resources/img/category/새우아님.jpg" alt="'/>"/>
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
											<img src="img/product/review2.png" alt="'/>"/>
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
								<div class="review_item">
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
					<div class="row rowmapper">
					<div class="rowmappertow">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>총점</h5>
										<h4>${avgScore}</h4>
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
								<c:forEach var="review" items="${reviewList}">
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
								        <p>${review.content}</p>
								    </div>
							    </c:forEach>
							</div>
							<!-- 페이지버튼 -->    
						  <div class="d-flex justify-content-center">
				            <div aria-label="Page navigation example">
				              <ul class="pagination">
				                <li class="page-item">
				                  <a class="page-link" href="#" aria-label="Previous">
				                    <span aria-hidden="true">&laquo;</span>
				                  </a>
			                	</li>
				                <li class="page-item"><a class="page-link" href="#">1</a></li>
				                <li class="page-item"><a class="page-link" href="#">2</a></li>
				                <li class="page-item"><a class="page-link" href="#">3</a></li>
				                <li class="page-item">
				                <a class="page-link" href="#" aria-label="Next">
			                    <span aria-hidden="true">&raquo;</span>
			                  	</a>
				                </li>
				              </ul>
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
				                <form:form action="/waguwagu/lessons/review/add" method="post" class="form-contact form-review mt-3" modelAttribute="addReview" >
				                  <div class="form-group">
				                    <input path="name" class="form-control" name="name" type="text" placeholder="이름을 입력하세요." required>
				                  </div>
				                  <div class="form-group">
				                    <input type="text" path="lessonId" class="form-control" name="lessonId" value="${lessonId}" >
				                  </div>
				                  <div class="form-group">
				                    <input type="date" path="date" class="form-control" name="date" >
				                  </div>
				                  <div class="form-group">
				                    <input type="text" path="score" class="form-control" name="score" placeholder="평점을 입력하세요.">
				                  </div>
				                  <div class="form-group">
				                    <input path="userId" class="form-control" name="userId" type="email" value="${id}" placeholder="이메일을 입력하세요." required>
				                  </div>
				                  <div class="form-group">
				                    <input path="title" class="form-control" name="title" type="text" placeholder="제목을 입력하세요.">
				                  </div>
				                  <div class="form-group">
				                    <textarea path="content" class="form-control different-control w-100" name="content" id="textarea" cols="30" rows="5" placeholder="글을 작성하세요."></textarea>
				                  </div>
				                  <div class="form-group text-center text-md-right mt-3">
				                    <button type="submit" class="button button--active button-review">등록</button>
				                  </div>
				                </form:form>
							</div>
						</div>
					</div>
					<div id="pagination" class="pagination"></div>
				</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->



<!-- 페이징처리 -->
	<script>
	/* 3개 글 보기 */
	 var list = document.getElementsByClassName('review_list').getElementsByClassName('review_item');
	 console.log('ss',list); 
	 var pageNum = document.getElementsByClassName('pagination');
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
	      buttons.style.display = buttons.style.display === 'none' ? 'block' : 'none';
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
	       var pagination = document.getElementsByClassName('pagination');
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