<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="KR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

</head>
<style>
    /* *{border: 1px solid black;} */
    td
    {
        font-size: rem;
    }
    td img
    {
       width: 32px;
    }
    .shadow-md 
    {
        
        padding: 1rem;
        box-shadow: 0 4px 6px -1px rgba(0,0,0,.1), 0 2px 4px -1px rgba(0,0,0,.06);
    }

    .card i
    {
        /* border: 1px solid black; */
        background-color:rgb(192, 212, 255);
        padding: 17%;
        border-radius: 50%;
        transform: translatex(-10%);
        transform: translatey(10%);
    }
    .table-sm td
    {
        padding: 0.875rem !important ;
        
    }
    td:last-child, th:last-child
    {
        /* border: 1px solid red; */
        padding: 0px !important;
        width: 5%;
    }

    /* #sec
    {
        background-color: rgb(250, 196, 116) !important;
    }
    #thir
    {
        background-color: rgb(144, 194, 144);
    } */
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
	<section  class="blog-banner-area" id="category">
		<div class="container h-100" style="background: url(/img/board.jpg) bottom /100% no-repeat; ">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Team Lanking</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Checkout</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
    <!-- ================ end banner area ================= -->
   	
    <!-- ================ start view-div ================= -->	
    <div  class="container shadow-md text-bg-primary p-3 rounded my-3 ">
        <a>
            <div >
            <span>Star this project on GitHub</span>
            </div>
            <span>View more →</span>
        </a>
    </div>
     <!-- ================ end view-div ================= -->

      <!-- ================ start Cards section ================= -->	
    <section class="mt-3  container d-flex justify-content-between">
       <!-- card-->
        <div class="card mb-3 " style="width: 30%; ">
            <div class="row g-0">
                <div class="col-md-4">
                    <!-- <img src="..." class="img-fluid rounded-start" alt="..."> -->
                    <i id="fir" class="m-4 fa-solid fa-users"></i>
                </div>
                <div class="col-md-8">
                    <div class="card-body">           
                    <p class="card-text">Total clients</p>
                    <span class="fw-semibold">6389</span>
                    </div>
                </div>
            </div>
        </div>
         <!-- card-->
        <div class="card mb-3" style="width: 30%;">
            <div class="row g-0">
            <div class="col-md-4 ">
                <!-- <img src="..." class="img-fluid rounded-start" alt="..."> -->
                <i id="sec" class="m-4 fa-solid fa-medal"></i>
            </div>
            <div class="col-md-8">
                <div class="card-body">           
                <p class="card-text">Total clients</p>
                <span class="fw-semibold">6389</span>
                </div>
            </div>
            </div>
        </div>
         <!-- card-->
        <div class="card mb-3" style="width: 30%;">
            <div class="row g-0">
            <div class="col-md-4">
                <!-- <img src="..." class="img-fluid rounded-start" alt="..."> -->
                <i id="thir" class="m-4 fa-solid fa-baseball"></i>
            </div>
            <div class="col-md-8">
                <div class="card-body">           
                <p class="card-text">Total clients</p>
                <span class="fw-semibold">6389</span>
                </div>
            </div>
            </div>
        </div>
    </section>
    <!-- ================ end Cards section ================= -->	

    <div class=" container table-responsive" >
        <table  class="table table-sm">
            <thead class="table-light">
              <tr>  
                <th scope="col">#</th>
                <th scope="col"></th>                                                      
                <th scope="col">팀명</th>
                <th scope="col">경기수</th>
                <th scope="col">승</th>
                <th scope="col">무</th>
                <th scope="col">패</th>
                <th scope="col">승률</th>
                <th scope="col">연속</th>
                <th scope="col">최근 10 경기</th>
                <th scope="col"></th>      
              </tr>
            </thead>
            <tbody>
             <c:forEach var="teamWinning" items="${winningList}">
              <tr>
                <th scope="row">${teamWinning.rank}</th>
                <td>
                    <img src="<c:url value='/resources/images/${teamWinning.fileName}'/>" alt="${teamWinning.teamName} Image"  />
                </td> 
                <td>${teamWinning.teamName}</td>
                <td>${teamWinning.matches}</td>
                <td>${teamWinning.totalWins}</td>
                <td>${teamWinning.totalTie}</td>
                <td>${teamWinning.totalLose}</td>
                <td>${teamWinning.rate}</td>
                <td>2</td>
                <td>${teamWinning.recent}</td>
                <td>
                    <a href="<c:url value='/team/team?id=${teamWinning.teamId}'/>" class="btn-sm btn btn-outline-warning">상세보기</a>
                </td>
              </tr>           
              </c:forEach>
            </tbody>
            <caption>
                <div  class="d-flex justify-content-between" >
                <p>List of ranks</p>
                <nav  aria-label="Page navigation example">
                    <ul class="pagination " style="justify-content: center;">
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
                  </nav>
                </div>
            </caption>
            
          </table>
    </div>
</body>
</html>