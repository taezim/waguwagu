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
  
    .table-sm td
    {
        padding: 1rem !important ;
        
    }
    .table-sm th{
    	padding: 0.8rem !important ;
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
  
  const addgame = document.querySelector('.nav-link[href="/waguwagu/games/add"]');

  addgame.addEventListener('click', function(event) {
      // 세션에서 myteam을 가져옵니다.
      const myTeam = sessionStorage.getItem('myteam');

      // myteam이 없는 경우 경고를 표시합니다.
      if (!myTeam) {
          event.preventDefault(); // 기본 동작을 취소합니다.
          alert('권한이 없습니다.'); // 사용자에게 경고를 표시합니다.
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
					<h1>${tb.teamName}</h1>
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

	<!-- ================ end banner area ================= -->
	<div class="container">
		<nav class="bread_c" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			<ol class="breadcrumb breadhospital">
			  <li class="breadcrumb-item"><a href="#">팀목록</a></li>
			  <li class="breadcrumb-item active" aria-current="page">${tb.teamName}</li>
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
							<img src="<c:url value='/resources/images/${tb.fileName}'/>" style="width: 100%"/>
						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${tb.teamId}</h3>
						<h2>${tb.teamName }</h2>
						<ul class="list">
							<li>대표번호 : ${tb.phoneNumber }</li>
							<li>선호지역 : ${tb.prefArea }</li>
						</ul>                       
						<p>${tb.description }</p>
						<div class="product_count">				
							<c:if test="${sessionScope.memberId == 'teamadmin'}"> 			    
						    	<div>
							    	<a href='<c:url value="/team/update?id=${tb.teamId}"/>' class="btn btn-sm btn-primary">수정</a>
							    	<a href="<c:url value='/team/delete?id=${tb.teamId}'/>" class="btn btn-sm btn-primary" onclick="return deleteConfirm('${tb.teamId}')">삭제</a>
							    	<a href="<c:url value='/team/result/add?id=${tb.teamId}'/>" class="btn btn-sm btn-primary">결과등록</a>
						    	</div>
						    </c:if>
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
					<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">팀 소개</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
					 aria-selected="false">가입신청</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
					
                    <div class="col-lg-12">
                        <div class="feature-img">
                                <img class="img-fluid" src="img/category/정형외과.jpg" alt="">
                        </div>
                    </div>
                    	<div style="text-align: center; padding: 20px 0;">
						    <img src="<c:url value='/resources/images/${tb.fileName}'/>" style="width: 40%;" />
						</div>
                    <div class="col-lg-9 col-md-9 blog_details">
                        <h2>안녕하세요! ${tb.teamName } 입니다!</h2>
                        <p class="excert">
                                저희는 ${tb.prefArea } 지역을 위주로 활동하는 야구 동호회 입니다!
                        </p>
                        <p>
                                ${tb.description }
                        </p>
                        <h4><strong>
                                팀 최근 성적
                        </strong></h4>
                    </div>	
                    <div class="col-lg-12">
                        <div class="quotes">
                           <table class="table table-sm">
							  <thead class="table-light">
							    <tr>
							      <th scope="col">팀이름</th>
							      <th scope="col">게임수</th>
							      <th scope="col">승리</th>
							      <th scope="col">무승부</th>
							      <th scope="col">패배</th>
							      <th scope="col">승률</th>
							      <th scope="col">최근 10경기</th>
							    </tr>
							  </thead>
							  <tbody class="table-group-divider">
							    <tr>
							      <td scope="row">${tb.teamName}</td>
							      <td>${totalGames}</td>
							      <td>${totalWins}</td>
							      <td>${totalTies}</td>
							      <td>${totalLosses}</td>
							      <td>${winningRate}</td>
							      <td>${recent }</td>
							    </tr>  
							  </tbody>
							</table>
                        </div>
                        <div class="row">                              
                            <div class="col-lg-12 mt-4">
		                     <!--   <h4><strong>
		                              팀 정보
		                       </strong></h4> -->
                               <p>
                                       대표 : ${tb.leaderName }
                               </p>
                               <p>
                                      대표번호 : ${tb.phoneNumber }
                               </p>
                               <p>
                                      선호지역 : ${tb.prefArea }
                               </p>
                               <p>
                                      인원수 : ${tb.memberNumber }
                               </p>
                            </div>                              
                        </div>
                    </div>
				</div>		
				<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="total_rate" style="height: 100%;">								
									<div class="box_total" style="height: 100%;">
									<img src="<c:url value='/resources/images/${tb.fileName}'/>" style="width: 50%; padding:20px;"/>
										<h5>${tb.teamName}</h5>										
									</div>																
							</div>
							<br>
						</div>
						
						<div class="col-lg-6">
							<div class="review_box">
								<h4>가입신청</h4>
				                <form action="/waguwagu/team/join" class="form-contact form-review mt-3" id="joinForm" method="post">
				                  <div class="form-group">
				                    <input class="form-control" name="userId" type="text" value="${memberId}" placeholder="아이디를 입력하세요." required>
				                  </div>
				                  <div class="form-group">
				                    <input class="form-control" name="teamId" type="text" value="${teamId}" placeholder="팀아이디를 입력하세요." required>
				                  </div>
				                  <div class="form-group">
				                    <textarea class="form-control different-control w-100" name="textarea" id="textarea" cols="30" rows="5" placeholder="글을 작성하세요."></textarea>
				                  </div>
				                  <div class="form-group text-center text-md-right mt-3">
				                    <button type="submit" class="button button--active button-review">가입신청</button>
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
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
	    $(document).ready(function() {
	        $("#joinForm").submit(function(e) {
	            e.preventDefault(); // 폼 제출 방지
	
	            // 폼 데이터를 직렬화하여 서버로 전송
	            $.ajax({
	                type: "POST",
	                url: "/waguwagu/team/join",
	                data: $(this).serialize(),
	                success: function(response) {
	                    if (response) {
	                        alert("가입 신청이 성공적으로 제출되었습니다!");
	                        window.location.href = '/team/team?id=' + teamId;
	                    } else {
	                        alert("이미 가입되었습니다!");
	                    }
	                }
	                
	            });
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

  <script scr="<c:url value ='/resources/js/main.js'/>"></script>



	
</body>
</html>