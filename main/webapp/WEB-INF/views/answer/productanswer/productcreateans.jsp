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
                     <c:if test="${not empty sessionScope.memberId}">
                        <li class="nav-item"><a class="nav-link" href="/waguwagu/hospital/myReserve">예약확인</a></li>
                     </c:if>
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
	<!--================ End Header Menu Area =================-->
	 <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>QnA 답변</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Lessons</li>
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
				<li class="breadcrumb-item"><a href="#">상품 QnA</a></li>
				<li class="breadcrumb-item active" aria-current="page">QnA 답변</li>
			</ol>
		</nav>
	</div>

	  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
			<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>QnA 답변</h3>
						<form:form class="row login_form" id="contactForm" modelAttribute="productcreateanswer" method="post"  novalidate="novalidate">
						    <div class="col-md-12">
						        <div class="col-md-12">
						            <div class="form-group">
						                <!-- productplus 객체의 email 필드를 바인딩합니다. -->
						                <input type="text"  class="form-control" id="questionnumber" name="questionnumber" readonly="true" name="questionnumber"  />
						            </div>
						        </div>
						        <div class="col-md-12">
						            <div class="form-group">
						                <!-- productplus 객체의 date 필드를 바인딩합니다. -->
						                <input type="text"  class="form-control" id="respondentid" name="respondentid" placeholder="답변자 id를 입력하세요"/>
						            </div>
						        </div>
						        <div class="col-md-12">
						            <div class="form-group">
						                <!-- productplus 객체의 content 필드를 바인딩합니다. -->
						                <textarea class="form-control"  name="answercontent" id="answercontent" rows="1"  placeholder="글을 작성하세요."></textarea>
						            </div>
						        </div>
						         <div class="col-md-12">
						            <div class="form-group">
						                <!-- productplus 객체의 content 필드를 바인딩합니다. -->
						                <input type="text" class="form-control"  name="productid" id="productid"  placeholder="productid를 작성하세요." readonly="true" value="${pd.productId }"  />
						            </div>
						        </div>
						        <div class="col-md-12 text-right">
						            <!-- "등록" 버튼을 클릭하면 productplus 객체를 서버로 전송합니다. -->
						            <input type="submit" value="등록" class="btn primary-btn">
						        </div>
						    </div>
						</form:form>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_box_img h-100">
						<div class="hover">
							<h4>New to our website?</h4>
							<p>There are advances being made in science and technology everyday, and a good example of this is the</p>
							<a class="button button-account" href="register.html">Create an Account</a>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
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
	<script>
    // questionnumber 필드에 무작위 11자리 숫자를 할당하는 함수
    function generateRandomNumber() {
        var randomNumber = Math.floor(10000000000 + Math.random() * 90000000000);
        document.getElementById("questionnumber").value = randomNumber.toString().substring(0, 11);
    }

    // 페이지 로드 시 자동으로 호출하여 questionnumber 필드에 무작위 숫자를 할당
    window.onload = function() {
        generateRandomNumber();
    };
</script>
</body>
</html>