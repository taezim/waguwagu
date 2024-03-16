<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>          
    
<!DOCTYPE html>
<html lang="kr">

<head>
  <title>waguwagu &mdash; Website by Colorlib</title>
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
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>상품등록</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Products</li>
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
			  <li class="breadcrumb-item"><a href='<c:url value="/lessons"/>'>클래스목록</a></li>
			  <li class="breadcrumb-item active" aria-current="page">클래스 등록</li>
			</ol>
		</nav>
	</div>	
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
						<h3>상품 등록</h3>
						<form:form class="row login_form" id="contactForm" modelAttribute="addProduct" enctype="multipart/form-data">
							<div class="col-md-12 form-group">
								<form:input path="productId" type="text" class="form-control" id="productId" name="productId" placeholder="상품아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '상품아이디'" />
							</div>							
							<div class="col-md-12 form-group">
								<form:input path="productName" type="text" class="form-control" id="productName" name="productName" placeholder="상품이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '상품이름'" />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="brand" type="text" class="form-control" id="brand" name="brand" placeholder="브랜드" onfocus="this.placeholder = ''" onblur="this.placeholder = '브랜드'" />
							</div>							
							<div class="col-md-12 form-group">
								가격<form:input path="unitPrice" type="text" class="form-control" id="unitPrice" name="unitPrice" placeholder="가격" onfocus="this.placeholder = ''" onblur="this.placeholder = '가격'" />
							</div>
							<div class="col-md-12 form-group">
								재고수<form:input type="number" path="unitsInStock" class="form-control" id="unitsInStock" name="unitsInStock" placeholder="재고수" onfocus="this.placeholder = ''" onblur="this.placeholder = '재고수'" />
							</div>
							<%-- <div class="col-md-12 form-group">
								<form:input path="subject" type="text" class="form-control" id="subject" name="subject" placeholder="클래스 종류" onfocus="this.placeholder = ''" onblur="this.placeholder = '클래스 종류'" />
							</div> --%>
							<div class="col-md-12 form-group">
							<p>종류</p>
								<div class="creat_account">
									<form:radiobutton path="category" value="글러브" />글러브
									<form:radiobutton path="category" value="야구화" />야구화									
									<form:radiobutton path="category" value="배트" />배트
									<form:radiobutton path="category" value="가방" />가방
									<form:radiobutton path="category" value="보호장비" />보호장비
									<form:radiobutton path="category" value="장갑" />장갑
									<form:radiobutton path="category" value="의류" />의류
								</div>
							</div>
							<div class="col-md-12 form-group">
								<form:input path="condition" type="text" class="form-control" id="condition" name="condition" placeholder="상태" onfocus="this.placeholder = ''" onblur="this.placeholder = '상태'" />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="modelName" type="text" class="form-control" id="modelName" name="modelName" placeholder="모델이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '모델이름'" />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="size" type="text" class="form-control" id="size" name="size" placeholder="상품사이즈" onfocus="this.placeholder = ''" onblur="this.placeholder = '상품사이즈'" />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="position" type="text" class="form-control" id="position" name="position" placeholder="포지션" onfocus="this.placeholder = ''" onblur="this.placeholder = '포지션'" />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="material" type="text" class="form-control" id="material" name="material" placeholder="소재" onfocus="this.placeholder = ''" onblur="this.placeholder = '소재'" />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="web" type="text" class="form-control" id="web" name="web" placeholder="웹" onfocus="this.placeholder = ''" onblur="this.placeholder = '웹'" />
							</div>	
							<div class="col-md-12 form-group">
								<form:input path="color" type="text" class="form-control" id="color" name="color" placeholder="색상" onfocus="this.placeholder = ''" onblur="this.placeholder = '색상'" />
							</div>	
							<div class="col-md-12 form-group">
								<form:input path="manufacturCountry" type="text" class="form-control" id="manufacturCountry" name="manufacturCountry" placeholder="제조국" onfocus="this.placeholder = ''" onblur="this.placeholder = '제조국'" />
							</div>	
							<div class="col-md-12 form-group">
								<form:textarea path="handling" type="textarea" cols="50" rows="2" class="form-control" id="handling" name="handling" placeholder="주의사항" onfocus="this.placeholder = ''" onblur="this.placeholder = '주의사항'" />
							</div>														
							<div class="col-md-12 form-group">
								<form:textarea path="description" cols="50" rows="4" class="form-control" id="description" name="description" placeholder="긴 설명" onfocus="this.placeholder = ''" onblur="this.placeholder = '긴 설명'" />
							</div>
							<div class="col-md-12 form-group">
								<form:textarea path="briedfDescription" type="text" cols="50" rows="2" class="form-control" id="briedfDescription" name="briedfDescription" placeholder="설명" onfocus="this.placeholder = ''" onblur="this.placeholder = '설명'" />
							</div>
							<div class="col-md-12 form-group">
								<form:input path="productImage" type="file" class="form-control" id="productImage" name="productImage" placeholder="구단사진" onfocus="this.placeholder = ''" onblur="this.placeholder = '구단사진'" />
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-login w-100">상품 등록</button>
								<a href="<c:url value="/products"/>"> 취소</a>
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