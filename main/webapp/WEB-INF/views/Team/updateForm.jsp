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
  <script>
    function updatePrefArea(checkbox) {
      var prefAreaInput = document.getElementById("prefArea");

      // 현재 선택된 값
      var currentValue = checkbox.value;

      // 기존 값
      var currentValues = prefAreaInput.value.split(',');

      if (checkbox.checked) {
        // 체크된 경우 값 추가
        if (currentValues.indexOf(currentValue) === -1) {
          // 중복된 값이 아닌 경우에만 추가
          currentValues.push(currentValue);
        }
      } else {
        // 체크 해제된 경우 값 제거
        var index = currentValues.indexOf(currentValue);
        if (index !== -1) {
          currentValues.splice(index, 1);
        }
      }

      // 최종 값을 hidden input에 설정
      prefAreaInput.value = currentValues.join(',');
    }
  </script>
  <style>
  	.login_box_img{
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
                  <li class="nav-item"><a class="nav-link" href="blog.html">클래스</a></li>
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
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>팀 수정</h1>
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
						<h3>팀 수정</h3>
						<form:form class="row login_form" id="contactForm" modelAttribute="updateTeam" enctype="multipart/form-data">
							<div class="col-md-12 form-group">
								<form:input path="teamId" class="form-control" id="name" name="name" value="${team.teamId}" placeholder="구단아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '팀아이디'" />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="teamName" type="text" class="form-control" id="name" name="name" value="${team.teamName}" placeholder="팀명" onfocus="this.placeholder = ''" onblur="this.placeholder = '팀명'" />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="memberNumber" type="number" class="form-control" id="name" name="name" value="${team.memberNumber}" placeholder="인원수" onfocus="this.placeholder = ''" onblur="this.placeholder = '인원수'" />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="phoneNumber" type="text" class="form-control" id="name" name="name" value="${team.phoneNumber}" placeholder="대표자번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '대표자번호'" />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="leaderName" type="text" class="form-control" id="name" name="name" value="${team.leaderName}" placeholder="대표자이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '대표자이름'" />
							</div>
							<div class="col-md-12 form-group">
							    선호지역
							    <div class="creat_account" >
							        <input type="checkbox" id="f-option2" name="selector" onclick="updatePrefArea(this)" value="서울" />서울
							        <input type="checkbox" name="selector" value="인천" onclick="updatePrefArea(this)"/>인천
							        <input type="checkbox" name="selector" value="부산" onclick="updatePrefArea(this)"/>부산
							        <input type="checkbox" name="selector" value="대구" onclick="updatePrefArea(this)"/>대구
							        <input type="checkbox" name="selector" value="대전" onclick="updatePrefArea(this)"/>대전
							        <input type="checkbox" name="selector" value="경상남도" onclick="updatePrefArea(this)"/>경상남도
							        <input type="checkbox" name="selector" value="경상북도" onclick="updatePrefArea(this)"/>경상북도
							        <input type="checkbox" name="selector" value="강원도" onclick="updatePrefArea(this)"/>강원도
							        <input type="checkbox" name="selector" value="전라남도" onclick="updatePrefArea(this)"/>전라남도
							        <input type="checkbox" name="selector" value="전라북도" onclick="updatePrefArea(this)"/>전라북도
							        <input type="checkbox" name="selector" value="충청남도" onclick="updatePrefArea(this)"/>충청남도
							        <input type="checkbox" name="selector" value="충청북도" onclick="updatePrefArea(this)"/>충청북도
							        <input type="checkbox" name="selector" value="제주도" onclick="updatePrefArea(this)"/>제주도
							    </div>
							    <input type="hidden" id="prefArea" name="prefArea" value="${team.prefArea}"/>
							</div>
							<div class="col-md-12 form-group">
								<form:textarea path="description" value="${team.prefArea}" rows="4" cols="50" class="form-control" id="name" name="name"  />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="teamImage" type="file" value="${team.teamImage}" class="form-control" id="name" name="name" placeholder="구단사진" onfocus="this.placeholder = ''" onblur="this.placeholder = '구단사진'" />
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-login w-100">등록</button>
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