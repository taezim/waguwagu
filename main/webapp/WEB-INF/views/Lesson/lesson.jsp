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
<script type="text/javascript" src="resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.7.1.min.js"></script>
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
					<h1>Lesson</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">lesson</li>
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
				<li class="breadcrumb-item"><a href="#">클래스목록</a></li>
				<li class="breadcrumb-item active" aria-current="page">${ls.subject}</li>
			</ol>
		</nav>
	</div>

	<!--================Single Product Area =================-->
	<div class="product_image_area" style="padding-top: 20px;">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid"
								src="<c:url value='/resources/img/category/야간연습.jpg" alt="'/>" />
						</div>
						<div class="single-prd-item">
							<img class="img-fluid"
								src="<c:url value='/resources/img/category/야간연습.jpg" alt="'/>" />
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
						<p>${ls.tel }
							<br> ${ls.description }
						</p>
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
					병원정보
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
					<p>
						안녕하세요! <strong>${ls.className}</strong> 강의입니다.
					</p>
					<div class="col-lg-12"></div>
					<div class="col-lg-9 col-md-9 blog_details">
						<h2>${ls.className}</h2>
						<p class="excert">본 강의는 선수출신 코치인 "${ls.managerName }"" 코치가 맡아서 강의를 하고 있습니다.</p>
						<p>
							취미로 하는 분들일수록 전문성이 떨어지기 때문에 부상을 당할 위험이 많은데요.
							원래 운동을 하는 선수도 아니고 강의를 들을 필요가 있나 생각하시는 분들도 많을 걸로 알고 있습니다.
							하지만 그럴수록 강의가 좋다는 거 아시나요?
							취미로 하는 분들일수록 전문성이 떨어지기 때문에 부상을 당할 위험이 많은데요.
							다들 부상 조심하셔야합니다. 나이가 들수록 근력이 없을수록 회복 속도는 더디기 때문입니다.</p>
						<p>앞서 말했던 것과 같이 선수가 아니기때문에 부상을 당해도 온전히 그것에 시간을 쏟을 수 없습니다.
							그렇다면 애초에 부상을 안당하는게 좋겠죠? 
							이것을 위해 강의를 들어야합니다. 강의를 들으면서 제대로된 자세를 알고 그러므로 부상의 가능성을 낮출 수 있기 때문입니다.
							부상뿐만 아니라 자세 교정을 하면 더욱 좋은 성적을 받을 수 있습니다.
							${ls.subject } 실력을 늘리면서 즐거운 야구하는 것 추천드립니다.
							</p>
					</div>
					<div class="col-lg-12">
						<div class="quotes">
							취미로 하는 운동이지만 잘하게 되면 더욱 더 재미를 보장할 수 있습니다.
							</div>
						<div class="row">
							<div class="col-6">
								<img class="img-fluid"
									src="<c:url value='/resources/img/category/진.jpg" alt="'/>" />
							</div>
							<div class="col-6">
								<img class="img-fluid"
									src="<c:url value='/resources/img/category/짜.jpg" alt="'/>" />
							</div>
							<div class="col-lg-12 mt-4">
								<p>코치 이름 : ${ls.managerName }</p>
								<p>전화 번호 : ${ls.tel }</p>
								<p>수강 인원 : ${ls.auditors }</p>
								<p>장소 : ${ls.venue }</p>
								<p>수강료 : ${ls.fees }</p>
							</div>
						</div>
					</div>
				</div>
				 <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
	                <!-- QnA 컨텐츠 -->
					<div class="row rowmapper">
						<div class="rowmappertow">
							<div class="col-lg-6">
								<div id="comment_list">
									<c:forEach items="${classqnalistkey}" var="classqna">
										<div class="review_item">
											<div class="media">
												<div class="d-flex">
													<img
														src="<c:url value='/resources/img/product/review2.png" alt="'/>" />
												</div>
												<div class="media-body">
													<h4 class="number" style="cursor: pointer;">${classqna.name}</h4>
													<h5>${classqna.date}</h5>
													<a class='reply_btn'
														href='/waguwagu/classanswers/classadd?sessionid=${ls.classId}'>Reply</a>
												</div>
											</div>
											<p>${classqna.content}</p>
											<div class="edit_delete_buttons" style="display: none;">
												<!-- 답변 완료 버튼 추가 -->
												<c:set var="hasAnswer" value="false" />
												<c:forEach items="${classanswerlistkey}" var="ansItem">
													<c:if test="${classqna.classid eq ansItem.classid}">
														<c:set var="hasAnswer" value="true" />
													</c:if>
												</c:forEach>
												<c:if test="${hasAnswer eq 'true'}">
													<button class="answer_button">답변 완료</button>
													<div class="answer_info" style="display: none;">
														<c:forEach items="${classanswerlistkey}" var="ansItem">
															<c:if test="${classqna.classid eq ansItem.classid}">
																<p>답변 날짜 : ${ansItem.replaydate}</p>
																<p>답변 : ${ansItem.answercontent }</p>
																<!-- 다른 필드 정보도 추가 -->
															</c:if>
														</c:forEach>
													</div>
												</c:if>
												<a href="javascript:void(0);" class="edit_button"
													data-classid="${classqna.classid}">수정하기</a> 
													<a href="<c:url value="javascript:deleteConfirm('${classqna.classid}', '${ls.classId}')" />" class="delete_button">삭제</a>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="col-lg-6">
									<div class="pagination-container"></div>
								</div>
							</div>
							<div class="col-lg-6">
								<!-- Content for the contact section -->
								<div class="review_box">
									<h4>QnA 작성</h4>
									<form:form modelAttribute="classplus" method="post"
										action="/waguwagu/classquestion/add" id="contactForm"
										novalidate="novalidate">
										<div class="col-md-12">
											<div class="form-group">
												<input type="text" class="form-control" id="name"
													name="name" placeholder="이름을 입력하세요." readonly="true"
													value="${ls.managerName }" />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input type="email" class="form-control" id="email"
													name="email" placeholder="이메일을 입력하세요." />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<input type="text" class="form-control" id="classid"
													name="classid" placeholder="id를 입력하세요" readonly="true"
													value="${ls.classId }" />
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<textarea class="form-control" name="content" id="content"
													rows="1" placeholder="글을 작성하세요."></textarea>
											</div>
										</div>
										<div class="col-md-12 text-right">
											<input type="submit" value="등록" class="btn primary-btn">
										</div>
									</form:form>
									<div id="editFormWrapper" style="display: none;">
										<form:form modelAttribute="classupdateqna" method="post"
											action="/waguwagu/classquestion/classupdate" id="editForm"
											novalidate="novalidate">
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" class="form-control" id="editName"
														readonly="true" name="name" value="${ls.managerName}">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" class="form-control" id="editEmail"
														readonly="true" name="email" placeholder="이메일을 입력하세요."
														value="${class123.email}">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" class="form-control" id="editClassid"
														readonly="true" name="classid" placeholder="id를 입력하세요"
														value="${ls.classId }">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<textarea class="form-control" name="content"
														id="editContent" rows="1" placeholder="글을 작성하세요.">${class123.content}</textarea>
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
					</div>
					<div id="pagination" class="pagination"></div>
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
								<c:forEach var="review" items="${reviewList}">
									<div class="review_item">
										<div class="media">
											<div class="d-flex">
												<img
													src="<c:url value='/resources/img/product/review2.png" alt="'/>" />
											</div>
											<div class="media-body">
												<h4>${review.title }</h4>
												<h5>${review.name}</h5>
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
										</div>
										<p>${review.content}</p>
										<div class="text-md-right">
											<a href="javascript:void(0);" class="taeredit_button"
												data-reviewid="${review.reviewId}"
												data-lessonid="${lessonId}">수정하기</a> <a
												href="<c:url value='/lessons/review/delete?id=${review.reviewId}&lessonId=${review.lessonId}'/>"
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

								<div id="taeeditFormWrapper" style="display: none;">
									<form:form modelAttribute="updateReview" method="post"
										class="form-contact form-review mt-3"
										action="/waguwagu/lessons/review/update" id="editForm"
										novalidate="novalidate">
										<div class="form-group">
											<!-- path 는 DTO 객체의 변수 -->
											<form:input path="name" class="form-control" name="name"
												type="text" id="editName" readonly="true"
												placeholder="이름을 입력하세요." value="${review.name}" />
										</div>
										<div class="form-group">
											<form:input type="text" path="lessonId" class="form-control"
												id="editlessonid" readonly="true" name="lessonId"
												value="${review.lessonId}" />
										</div>
										<div class="form-group">
											<form:input type="date" path="date" class="form-control"
												name="date" id="eidtdate" readonly="true"
												value="${review.date}" />
										</div>
										<div class="form-group">
											<form:input type="text" path="score" class="form-control"
												name="score" id="editscore" placeholder="평점을 입력하세요."
												value="${review.score}" />
										</div>
										<div class="form-group">
											<form:input path="userId" class="form-control" name="userId"
												type="email" id="editemail" readonly="true"
												placeholder="이메일을 입력하세요." value="${review.userId}" />
										</div>
										<div class="form-group">
											<form:input path="title" class="form-control" name="title"
												type="text" id="edittitle" placeholder="제목을 입력하세요."
												value="${review.title}" />
										</div>
										<div class="form-group">
											<form:textarea path="content" id="editContent"
												class="form-control different-control w-100" name="content"
												cols="30" rows="5" placeholder="글을 작성하세요."
												value="${review.content}" />
										</div>
										<div class="form-group text-center text-md-right mt-3">
											<input type="submit" value="수정하기"
												class="button button--active button-review">
										</div>
									</form:form>
								</div>
								<form:form id="taerealForm" action="/waguwagu/lessons/review/add"
									method="post" class="form-contact form-review mt-3"
									modelAttribute="review">
									<div class="form-group">
										<form:input path="name" class="form-control" name="name"
											type="text" placeholder="이름을 입력하세요." />
									</div>
									<div class="form-group">
										<form:input type="text" path="lessonId" class="form-control"
											name="lessonId" value="${lessonId}" />
									</div>
									<div class="form-group">
										<form:input type="date" path="date" class="form-control"
											name="date" />
									</div>
									<div class="form-group">
										<form:input type="text" path="score" class="form-control"
											name="score" placeholder="평점을 입력하세요." />
									</div>
									<div class="form-group">
										<form:input path="userId" class="form-control" name="userId"
											type="email" value="${id}" placeholder="이메일을 입력하세요." />
									</div>
									<div class="form-group">
										<form:input path="title" class="form-control" name="title"
											type="text" placeholder="제목을 입력하세요." />
									</div>
									<div class="form-group">
										<form:textarea path="content"
											class="form-control different-control w-100" name="content"
											cols="30" rows="5" id="textarea" placeholder="글을 작성하세요." />
									</div>
									<div class="form-group text-center text-md-right mt-3">
										<button type="submit"
											class="button button--active button-review">등록</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>
					<!-- <div id="pagination" class="pagination"></div> -->
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

	<!-- 태림꺼  -->
	<!-- 페이징처리 -->
	<script>
	/* 3개 글 보기 */
	     var list = document.getElementById('review_list').getElementsByClassName('review_item');
    var pageNum = document.getElementById('taepagination'); // 페이지 번호를 표시할 엘리먼트
    var limitPerPage = 3;
    var totalPages = Math.ceil(list.length / limitPerPage);
    var currentPage = 1; // 현재 페이지 번호

    function showPage(page) {
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
        var lessonId = $(this).data('lessonid'); // lessonId 가져오기
       	console.log("reviewid",reviewId);
        console.log("lessonId",lessonId)
        $('#taerealForm').hide(); // 등록 폼 숨기기
        $('#taeeditFormWrapper').show();


        $.ajax({
            url: '/waguwagu/lessons/review/update',
            type: 'GET',
            data: { id: reviewId, lessonId: lessonId }, //파라미터 
            success: function(result) {  // 수정 필요한 부분
            	console.log(result.review.reviewId);
                $('#editName').val(result.review.name);
                $('#editlessonid').val(result.review.lessonId);
                $('#eidtdate').val(result.review.date);
                $('#editscore').val(result.review.score);
                $('#editemail').val(result.review.userId);
                $('#edittitle').val(result.review.title);
                $('#editContent').val(result.review.content);
            }
        });
    });

</script>

	<!-- 도영꺼 -->
	<!-- 페이징처리 -->

	<script>
	/* 3개 글 보기 */
	// 페이지에 표시될 글 목록과 페이징할 영역을 가져옵니다.
	var list = document.getElementById('comment_list').getElementsByClassName('review_item');
	var pageNum = document.getElementById('pagination');
	var limitPerPage = 3; // 페이지 당 보여질 글의 수를 정의합니다.
	var totalPages = Math.ceil(list.length / limitPerPage); // 전체 페이지 수를 계산합니다.

	// 페이지 당 글 수를 초과하는 항목은 숨깁니다.
	for (var i = limitPerPage; i < list.length; i++) {
	    list[i].style.display = 'none';
	}

	// 페이지 버튼을 생성합니다.
	for (var i = 1; i <= totalPages; i++) {
	    pageNum.innerHTML += "<button onclick='changePage(" + i + ")'>" + i + "</button>";
	}

	// 페이지 변경 함수를 정의합니다.
	window.changePage = function(page) {
	    var start = (page - 1) * limitPerPage; // 시작 인덱스 계산
	    var end = start + limitPerPage; // 종료 인덱스 계산

	    // 페이지에 표시된 글 목록을 숨깁니다.
	    for (var i = 0; i < list.length; i++) {
	        list[i].style.display = 'none';
	    }

	    // 현재 페이지에 해당하는 글 목록을 표시합니다.
	    for (var i = start; i < end; i++) {
	        if (list[i]) {
	            list[i].style.display = 'block';
	        }
	    }
	}

		var numbers = document.getElementsByClassName('number');
		for (var i = 0; i < numbers.length; i++) {
			numbers[i]
					.addEventListener(
							'click',
							function(e) {
								var buttons = e.target.parentNode.parentNode
										.getElementsByClassName('edit_delete_buttons')[0];
								if (buttons) {
									buttons.style.display = buttons.style.display === 'none' ? 'block'
											: 'none';
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

		document
				.getElementById('comment_list')
				.addEventListener(
						'click',
						function(e) {
							if (e.target
									&& e.target.classList.contains('number')) {
								var buttons = e.target.parentNode.parentNode.parentNode
										.getElementsByClassName('edit_delete_buttons')[0];
								buttons.style.display = buttons.style.display === 'none' ? 'block'
										: 'none';
							}

							if (e.target
									&& e.target.classList
											.contains('edit_button')) {
								// Edit 버튼 클릭 시 동작 정의
								console.log('Edit button clicked');
							}

							if (e.target
									&& e.target.classList
											.contains('delete_button')) {
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
					buttons[nextIndex].scrollIntoView({
						behavior : 'smooth',
						block : 'nearest'
					});
				});
			}
		});

		</script>

	
	<script>
		
		
	function deleteConfirm(classid, lsClassId) {
	    if (confirm("삭제하시겠습니까?")) {
	        // classid와 lsClassId가 일치하는지 확인
	        if (classid === lsClassId) {
	            // 일치하는 경우, 삭제 요청 URL 생성하여 이동
	            location.href = "/waguwagu/classquestion/classdelete?classid=" + classid;
	        } else {
	            // 일치하지 않는 경우, 알림창 표시
	            alert("classid가 일치하지 않아 삭제할 수 없습니다.");
	        }
	    } else {
	        // 사용자가 취소를 선택한 경우, 아무런 동작 없음
	        return;
	    }
	}
	</script>


	<!-- 수정 폼 나타내면서 객체 가져오기.(Ajax) -->
	<script>
    $(document).ready(function() {
        $('.edit_buttons').click(function() {
            var classid = $(this).data('classid');
            var sessionid = '${ls.classId}'; // JSP에서 EL 표현식을 사용하여 세션 ID를 가져옵니다.

            // classid와 sessionid가 일치하는지 확인합니다.
            if (classid === sessionid) {
                // 일치하는 경우 수정 폼을 표시합니다.
                $('#contactForm').hide(); // 등록 폼 숨기기
                $('#editFormWrapper').show();

                $.ajax({
                    url: '/waguwagu/classquestion/classupdate',
                    type: 'GET',
                    data: {
                        classid: classid
                    },
                    success: function(classqna) {
                        // 수정 폼에 데이터를 채웁니다.
                        $('#editName').val(classqna.name);
                        $('#editEmail').val(classqna.email);
                        $('#editClassid').val(classqna.classid);
                        $('#editContent').val(classqna.content);
                    }
                });
            } else {
                // 일치하지 않는 경우 알림 창을 표시합니다.
                alert('수정 권한이 없습니다.');
            }
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

<script>

</script>

<!-- 수고했다 -->

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