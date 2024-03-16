<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- form 사용을 위한 선언 -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Medical</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet"
	href="<c:url value='/resources/vendors/bootstrap/bootstrap.min.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/vendors/fontawesome/css/all.min.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/vendors/themify-icons/themify-icons.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/vendors/linericon/style.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/vendors/nice-select/nice-select.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/vendors/owl-carousel/owl.theme.default.min.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.css'/>" />

<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>" />
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

.findRaod {
	font-size: 30px;
	color: #384aeb;
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
	          <a class="navbar-brand logo_h" href="/waguwagu/">
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
	<div class="product_image_area" style="padding-top: 30px;">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid"
								src="<c:url value='/resources/img/category/hospital3.jpg" alt="'/>" />

						</div>
						<div class="single-prd-item">
							<img class="img-fluid"
								src="<c:url value='/resources/img/category/hospital2.jpg" alt="'/>" />
						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text" style="margin: 10px;">
						<h3>${hospitalInfo.yadmNm }</h3>
						<h2>정형외과</h2>
						<ul class="list">
							<li><a class="active" href="#"><span>전화번호</span> :
									${hospitalInfo.telno }</a></li>
							<li><a href="#"><span>지역</span> :
									${hospitalInfo.sidoCdNm}</a></li>
							<li><a href="${hospitalInfo.hospUrl }">홈페이지 :
									${hospitalInfo.hospUrl }</a></li>
						</ul>

						<p>${hospitalInfo.addr }</p>
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
				<li class="nav-item"><a class="nav-link active" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true" onclick="handleTabClick('home-tab')"> 병원정보
				</a></li>
				<li class="nav-item"><a class="nav-link" id="contact-tab"
					data-toggle="tab" href="#contact" role="tab"
					aria-controls="contact" aria-selected="false"> QnA </a></li>
				<li class="nav-item"><a class="nav-link" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false"> 리뷰 </a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p>안녕하세요! <strong>${hospitalInfo.yadmNm }</strong> 입니다.</p>
                    <div class="col-lg-12">

                    </div>
                    <div class="col-lg-9 col-md-9 blog_details">
                        <h2>${hospitalInfo.yadmNm }</h2>
                        <p class="excert">
                                안녕하세요. 저희 ${hospitalInfo.yadmNm }은 환자에게 온마음 다 해 진심으로 환자를 대하는 병원입니다.
                                ${hospitalInfo.sidoCdNm} 지역에 위치한 병원으로 오랜 시간 전문성을 띄며 진료를 하고 있습니다.
                        </p>
                        <p>
                                우수한 의료진, 최첨단 고해상도의 MRI(지멘스 MAGNETOM VIDA), CT(GE Revolution™ APEX, GE Revolution™ Maxima), 
                                PET-CT, SPECT-CT (GE NMCT 870DR) 등 정확한 진단장비와 다빈치 로봇수술, 차세대심장혈관영상치료기, 
                                방사선치료기 Elekta Infinity HD 및 최첨단 노발리스 등 효과적인 치료 장비 그리고 Full PACS(영상정보저장전달시스템)과 HIS(통합병원정보시스템) 등
                                 편리한 의료시스템을 갖추고 있습니다.
                        </p>
                        <p>
                                4차 산업혁명시대를 맞아 ${hospitalInfo.sidoCdNm} 지역 유일 보건복지부 첨단재생의료실시기관 지정과 여러 기관들과의 업무협약을 통해 스마트병원 구축에도 최선을 다하고 있습니다.
                                ${hospitalInfo.yadmNm }은 "첨단 지능형 시스템 기반 중증치료 전문 ${hospitalInfo.clCdNm}의 역할에 더욱 매진하기 위해 우수한 의료인력 확보와 첨단 의료장비 도입 그리고 쾌적한 고품격 진료 공간 조성에 최선을 다하고 있습니다.
                        </p>
                    </div>	
                    <div class="col-lg-12">
                        <div class="quotes">
                                저희 병원에서 좋은 환경과 전문성 있는 치료를 받으시며 환자분들의 건강을 기원합니다.
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
                                                <strong>진료시간</strong>
                                        </p> 
                                        <p>
                                                평일 : 08:00 ~ 17:00
                                                <br>
                                                토요일 : 08:00 ~ 13:00
                                        </p>
                                </div>
                        </div>
                    </div>
				</div>
				<div class="tab-pane fade" id="contact" role="tabpanel"
					aria-labelledby="contact-tab">
					<div class="row rowmapper">
						<div class="rowmappertow">
							<div class="col-lg-6">
								<div id="comment_list">
									<c:forEach items="${hospitalqnalistkey}" var="hospitalqna">
										<div class="review_item">
											<div class="media">
												<div class="d-flex">
													<img src="<c:url value='/resources/img/product/review2.png" alt="'/>"  />
												</div>
												<div class="media-body">
													<h4 class="number" style="cursor: pointer;">${hospitalqna.name}</h4>
													<h5>${hospitalqna.date}</h5>
													<a class='reply_btn'
														href='/waguwagu/hospitalanswers/hospitaladd?hospitalid=${hospitalqna.hospitalid}'>Reply</a>
												</div>
											</div>
											<p>${hospitalqna.content}</p>
											<div class="edit_delete_buttons" style="display: none;">
												<!-- 답변 완료 버튼 추가 -->
												<c:set var="hasAnswer" value="false" />
												<c:forEach items="${hospitalanswerlistkey}" var="ansItem">
													<c:if
														test="${hospitalqna.hospitalid eq ansItem.hospitalid}">
														<c:set var="hasAnswer" value="true" />
													</c:if>
												</c:forEach>
												<c:if test="${hasAnswer eq 'true'}">
													<button class="answer_button">답변 완료</button>
													<div class="answer_info" style="display: none;">
														<c:forEach items="${hospitalanswerlistkey}" var="ansItem">
															<c:if
																test="${hospitalqna.hospitalid eq ansItem.hospitalid}">
																<p>답변 날짜 : ${ansItem.replaydate}</p>
																<p>답변 : ${ansItem.answercontent }</p>
																<!-- 다른 필드 정보도 추가 -->
															</c:if>
														</c:forEach>
													</div>
												</c:if>
												<a href="javascript:void(0);" class="tae"
													data-hospitalid="${hospitalqna.hospitalid}">수정하기</a> <a
													href="<c:url value="javascript:deleteConfirm('${hospitalqna.hospitalid}')" />"
													class="edit_button">삭제</a>
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
													name="name" placeholder="이름을 입력하세요."  />
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
													name="hospitalid" placeholder="아이디를 입력해주세요." readonly="true" value="${hospitalInfo.id }" />
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
														value="${hospitalInfo.id}">
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
												<button id="cancelEdit" class="btn primary-btn">취소</button>
											</div>
										</form:form>
									</div>
								</div>
							</div>

						</div>
						<div id="pagination" class="pagination"></div>
					</div>
				</div>
				<div class="tab-pane fade" id="review" role="tabpanel"
					aria-labelledby="review-tab">
					<div class="row rowmapper">
						<div class="rowmappertow">
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
								<div class="review_list" id="review_list">
									<c:forEach var="review" items="${hospitalReviews}">
										<div class="review_item">
											<div class="media">
												<div class="d-flex">
													<img
														src="<c:url value='/resources/img/product/review2.png" alt="'/>" />
												</div>
												<div class="media-body">
													<h4>${review.name}</h4>
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i>
												</div>
											</div>
											<p>${review.reviewContent}</p>
											<div class="text-md-right">
												<a href="javascript:void(0);" class="taeredit_button"
													data-reviewid="${review.reviewId}"
													data-hospitalid="${review.hospitalId}">수정하기</a> <a
													href="<c:url value='/hospital/review/delete?id=${review.reviewId}&hospitalId=${review.hospitalId}'/>"
													class="btn"
													onclick="return deleteConfirm('${review.reviewId}')"
													style="color: red">삭제</a>
											</div>
										</div>
									</c:forEach>
								</div>
								<!-- 페이지버튼 -->
								<div class="d-flex justify-content-center">
									<div aria-label="Page navigation example">
										<ul class="pagination" id="taepagination">
											<li class="page-item"><a class="page-link" href="#"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
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
								<div id="taeeditFormWrapper" style="display:none;">
									<form:form id="taeeditForm" action="/waguwagu/hospital/review/add" method="post" class="form-contact form-review mt-3" modelAttribute="addReview" >
					                  <div class="form-group">
					                    <input path="name" id="editName" class="form-control" name="name" type="text" placeholder="이름을 입력하세요." value="${review.name}">
					                  </div>
					                  <div class="form-group">
					                    <input type="text" id="edithospitalid" path="hospitalId" class="form-control" name="hospitalId" value="${review.hospitalId}" >
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
				                <form:form id="taerealForm" action="/waguwagu/hospital/review/add" method="post" class="form-contact form-review mt-3" modelAttribute="addReview" >
				                  <div class="form-group">
				                    <input path="name" class="form-control" name="name" type="text" placeholder="이름을 입력하세요." required>
				                  </div>
				                  <div class="form-group">
				                    <input type="text" path="hospitalId" class="form-control" name="hospitalId" value="${hospitalId}" >
				                  </div>
				                  <div class="form-group">
				                    <input type="date" path="reviewDate" class="form-control" name="reviewDate" >
				                  </div>
				                  <div class="form-group">
				                    <input type="text" path="reviewRating" class="form-control" name="reviewRating" placeholder="평점을 입력하세요.">
				                  </div>
				                  <div class="form-group">
				                    <input path="userId" class="form-control" name="userId" type="email" value="${id}" placeholder="이메일을 입력하세요." required>
				                  </div>
				                  <div class="form-group">
				                    <input path="title" class="form-control" name="title" type="text" placeholder="제목을 입력하세요.">
				                  </div>
				                  <div class="form-group">
				                    <textarea path="reviewContent" class="form-control different-control w-100" name="reviewContent" id="textarea" cols="30" rows="5" placeholder="글을 작성하세요."></textarea>
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
		</div>
	</section>
	<!--================End Product Description Area =================-->

	<!--================ Start related Product area =================-->
	<section class="related-product-area section-margin--small mt-0">
		<div class="container">
			<div class="section-intro pb-60px">
				<p>Road Map</p>
				<h1>
					오시는 <span class="section-intro__style">길</span>
				</h1>
			</div>
			<div class="">
				<div id="map" style="width: 100%; height: 500px;"
					class="feature-img"></div>
				<br>
				<h2>교통 정보</h2>
				<div id="map2" style="width: 100%; height: 400px;"
					class="feature-img"></div>
			</div>
			<br>
			<div class="d-flex justify-content-center mx-auto p-2">
				<a class="button primary-btn btn-check btn btn-outline-primary "
					style="width: 200px"
					href="https://map.kakao.com/link/to/${hospitalInfo.yadmNm},${hospitalInfo.YPos},${hospitalInfo.XPos}"
					target="_blank">길찾기</a>
			</div>
		</div>
	</section>
	<!--================ end related Product area =================-->  	
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


	<!-- 태림꺼 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5378af335c867b376e6f09fedae7f166"></script>

	<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(${hospitalInfo.YPos }, ${hospitalInfo.XPos }), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var markerPosition  = new kakao.maps.LatLng(${hospitalInfo.YPos }, ${hospitalInfo.XPos }); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	
	</script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 사용하세요"></script>
	<script>
        var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
            mapOption2 = {
                center: new kakao.maps.LatLng(${hospitalInfo.YPos }, ${hospitalInfo.XPos }), // 지도의 중심좌표
                level: 4 // 지도의 확대 레벨
            };

        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map2 = new kakao.maps.Map(mapContainer2, mapOption2);
    	
     	// 마커를 생성합니다
    	var marker = new kakao.maps.Marker({
    	    position: markerPosition
    	});
     	

    	// 마커가 지도 위에 표시되도록 설정합니다
    	marker.setMap(map2);
    	 // 지도에 교통정보를 표시하도록 지도타입을 추가합니다
        map2.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC); 
     // 지도에 추가된 지도타입정보를 가지고 있을 변수입니다
        var currentTypeId;

        // 버튼이 클릭되면 호출되는 함수입니다
        function setOverlayMapTypeId(maptype) {
            var changeMaptype;
            
            // maptype에 따라 지도에 추가할 지도타입을 결정합니다
            if (maptype === 'traffic') {            
                
                // 교통정보 지도타입
                changeMaptype = kakao.maps.MapTypeId.TRAFFIC;     
                
            } else if (maptype === 'roadview') {        
                
                // 로드뷰 도로정보 지도타입
                changeMaptype = kakao.maps.MapTypeId.ROADVIEW;    

            } else if (maptype === 'terrain') {
                
                // 지형정보 지도타입
                changeMaptype = kakao.maps.MapTypeId.TERRAIN;    

            } else if (maptype === 'use_district') {
                
                // 지적편집도 지도타입
                changeMaptype = kakao.maps.MapTypeId.USE_DISTRICT;           
            }
            
            // 이미 등록된 지도 타입이 있으면 제거합니다
            if (currentTypeId) {
                map.removeOverlayMapTypeId(currentTypeId);    
            }
            
            // maptype에 해당하는 지도타입을 지도에 추가합니다
            map.addOverlayMapTypeId(changeMaptype);
            
            // 지도에 추가된 타입정보를 갱신합니다
            currentTypeId = changeMaptype;        
        }
    </script>



	<!-- 페이징처리 -->
	<script>
    /* 3개 글 보기 */
    var list = document.getElementById('review_list').getElementsByClassName('review_item');
    var pageNum = document.getElementById('taepagination'); // 페이지 번호를 표시할 엘리먼트
    var limitPerPage = 3;
    var totalPages = Math.ceil(list.length / limitPerPage);
    var currentPage = 1; // 현재 페이지 번호

    function showPage(page) {
        console.log("쇼래");
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

    function updatePagination() {
        pageNum.innerHTML = ""; // 페이지 번호 엘리먼트 초기화

        for (var i = 1; i <= totalPages; i++) {
        	pageNum.innerHTML += "<li class='page-item'><a class='page-link' href='#' onclick='changePage(" + i + ")'>" + i + "</a></li>";
        }
    }

    function changePage(page) {
        currentPage = page;
        showPage(currentPage);
        updatePagination();
    }

    // 다음 페이지로 이동하는 함수
    function nextPage() {
        if (currentPage < totalPages) {
            currentPage++;
            showPage(currentPage);
            updatePagination();
        }
    }

    // 이전 페이지로 이동하는 함수
    function prevPage() {
        if (currentPage > 1) {
            currentPage--;
            showPage(currentPage);
            updatePagination();
        }
    }

    // 초기 페이지 로딩 시 첫 페이지 표시
    showPage(currentPage);
    updatePagination();
</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>

    $('.taeredit_button').click(function() {
        console.log("xx");
        var reviewId = $(this).data('reviewid');
        var hospitalId = $(this).data('hospitalid'); // lessonId 가져오기
       	console.log("reviewId",reviewId);
        console.log("hospitalId",hospitalId)
        $('#taerealForm').hide(); // 등록 폼 숨기기
        $('#taeeditFormWrapper').show();


        $.ajax({
            url: '/waguwagu/hospital/review/update',
            type: 'GET',
            data: { id: reviewId, hospitalId: hospitalId }, //파라미터 
            success: function(result) {  // 수정 필요한 부분
            	//console.log(result.review.reviewId);
                $('#editName').val(result.name);
                $('#edithospitalid').val(result.hospitalId);
                $('#eidtdate').val(result.reviewDate);
                $('#editscore').val(result.reviewRating);
                $('#editemail').val(result.userId);
                $('#edittitle').val(result.title);
                $('#editContent').val(result.reviewContent);
            }
        });
    });

</script>

	<!-- 도영꺼 -->

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



	<script
		src="<c:url value='/resources/vendors/jquery/jquery-3.2.1.min.js'/>" /></script>
	<script
		src="<c:url value='/resources/vendors/bootstrap/bootstrap.bundle.min.js'/>" /></script>
	<script src="<c:url value='/resources/vendors/skrollr.min.js'/>" /></script>
	<script
		src="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.js'/>" /></script>
	<script
		src="<c:url value='/resources/vendors/nice-select/jquery.nice-select.min.js'/>" /></script>
	<script
		src="<c:url value='/resources/vendors/jquery.ajaxchimp.min.js'/>" /></script>
	<script src="<c:url value='/resources/vendors/mail-script.js'/>" /></script>
	<script src="<c:url value='/resources/js/main.js'/>" /></script>
</body>
</html>