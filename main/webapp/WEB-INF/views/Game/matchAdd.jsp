<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>          
    
<!DOCTYPE html>
<html lang="kr">

<head>
  <title>Soccer &mdash; Website by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
					<h1>경기등록</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Game</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
	  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img h-100">
						<div class="hover">
							<h4>New to our website?</h4>
							<p>There are advances being made in science and technology everyday, and a good example of this is the</p>
							<a class="button button-account" href="register.html">Create an Account</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>게임등록</h3>
						<form:form class="row login_form" id="contactForm" modelAttribute="addMatch" enctype="multipart/form-data">
							<div class="col-md-12 form-group">
								<form:input path="teamId" class="form-control" id="name" name="name" placeholder="팀아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '팀아이디'" value="${match.teamId}" />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="teamName" type="text" class="form-control" id="name" name="name" placeholder="팀명" onfocus="this.placeholder = ''" onblur="this.placeholder = '팀명'" value="${match.teamName}"/>
							</div>
							
							<div class="col-md-12 form-group">
								<form:input path="userId" type="text" class="form-control" id="name" name="name" placeholder="예약자 아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '예약자 아이디'" value="${match.userId}"/>
							</div>
							<div class="col-md-12 form-group">
								<form:input path="userName" type="text" class="form-control" id="name" name="name" placeholder="예약자 이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '예약자 이름'" value="${match.userName}"/>
							</div>
							<div class="col-md-12 form-group">
								<form:input path="userNumber" type="text" class="form-control" id="name" name="name" placeholder="전화번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '전화번호'" value="${match.userNumber}"/>
							</div>
							<div class="col-md-12 form-group">
								<form:input path="gameImage" type="file" class="form-control" id="name" name="name" placeholder="구단사진" onfocus="this.placeholder = ''" onblur="this.placeholder = '구단사진'" />
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-login w-100">경기 등록</button>
								<a href="<c:url value="/games"/>"> 취소</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
	
</body>
</html>