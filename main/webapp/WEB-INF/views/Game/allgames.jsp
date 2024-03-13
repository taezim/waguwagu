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
    .text-md-right{}

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
					<h1>경기 일정</h1>
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


	<!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">지역</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="#">
                  <ul>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="men" name="brand"><label for="men">서울</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="women" name="brand"><label for="women">인천</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="accessories" name="brand"><label for="accessories">경상남도</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="footwear" name="brand"><label for="footwear">경상북도</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="bayItem" name="brand"><label for="bayItem">전라남도</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="electronics" name="brand"><label for="electronics">전라북도</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="food" name="brand"><label for="food">충청남도</label></li>
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="food" name="brand"><label for="food">충청남도</label></li>
                  	<li class="filter-list"><input class="pixel-radio" type="radio" id="food" name="brand"><label for="food">충청남도</label></li>
                  </ul>
                </form>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <div class="filter-bar d-flex flex-wrap align-items-center">
            <div class="sorting">
              <select>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
              </select>
            </div>
            <div class="sorting mr-auto">
              <select>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
              </select>
            </div>
            <div>
              <div class="input-group filter-bar-search">
                <input type="text" placeholder="Search">
                <div class="input-group-append">
                  <button type="button"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          <!-- End Filter Bar -->
          <!-- Start Best Seller -->
		<section class="lattest-product-area pb-40 category-list">
		    <div class="container">
		        <c:forEach items="${list}" var="game">
		        	<div class="row hhh">
			       		 <%-- <c:out value="game: ${game}" /> --%> 
			            <div class="col-md-11">
			                <ul>
			                    <li class="d-f shadow-sm p-3 mb-5 bg-body-tertiary rounded" aria-current="true">
			                        <div class="card-product d-inline-flex">
			                            <div class="hospital-img">
			                                <input type="checkbox" style="display: none;">
			                                <i class="fa-regular fa-heart heart"></i>
			                                <i class="fa-solid fa-heart heart"></i>
			                            </div> 
			                            <div class="description d-flex flex-column flex-md-row">
			                                <div class="ml-3">
			                               		<div class="teamMatch">
				                                	<div class="tm">
					                                	<img src="<c:url value='/resources/images/${game.fileName}'/>" alt="${game.teamName1} Image" style="width:50px" class="img-fluid">				                                    
					                                    <h2 class="">${game.teamName1}</h2>				                                    	
				                                    </div>				                                  
				                                    <div>
				                                    	<h2>vs</h2>
				                                    </div>
				                                    <div class="tm">
					                                    <img src="<c:url value='/resources/images/${game.getMatches().get(0).fileName}'/>" alt="${game.getMatches().get(0).teamName} Image" style="width:50px" alt="Image" class="img-fluid">
					                                    <h2 class=""> ${game.matches[0].teamName}</h2>
				                                    </div>
			                                    </div>
			                                    <div class="subheading mb-3">날짜 : ${game.date}</div>
			                                    <p>경기장 : ${game.stadium}</p>
			                                </div>
			                            </div>
			                        </div>
			                        <div class="text-md-right">
			                        	<a href="<c:url value='/gs/game?id=${game.gameId}'/>" class="btn btn-sm btn-primary">상세보기</a>
	      								<a href="<c:url value='/match/add?id=${game.gameId}'/>" class="btn btn-sm btn-primary">매칭</a>
	      								<a href="<c:url value='/match/delete?id=${game.gameId}'/>" class="btn btn-sm btn-primary" onclick="return deleteConfirm('${game.gameId}')">매칭취소 &raquo;</a>			                        
			                        </div>
			                    </li>
			                </ul>
			            </div>
		            </div>
		        </c:forEach>
		    </div>
		</section>
          <!-- End Best Seller -->
        </div>
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  

	<!-- ================ top product area start ================= -->	
	
	<!-- ================ top product area end ================= -->		

  
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