<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<%@ page import="java.util.List" %> 
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

	<script type="text/javascript">
    function checkAndNavigate(event, matches) {
        // 여기에서 매칭 정보가 있는지 확인하는 로직을 수행
        // 예시: 매칭 정보가 있는지 확인하는 조건
        if (!matches || matches.length === 0) {
            alert('매치 정보가 없습니다.'); // 매칭 정보가 있으면 페이지로 넘어가지 않도록 막기
            event.preventDefault(); // 페이지 이동 막기
        } else {
            // 매칭 정보가 없으면 페이지로 이동
            return;
        }
    }

    function checkAndNavigateMatch(event, gameId, isMatched) {
        if (isMatched) {
            alert('이미 매칭된 게임입니다.');
            event.preventDefault(); // 페이지 이동 막기
        } else {
            // 매칭되지 않은 경우에 원하는 동작 수행
        }
    }
	</script>
	
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

<script>
	function checkAndNavigate(event, matches) {
	    if (!matches) {
	        //event.preventDefault(); // 이벤트 기본 동작 막기 (페이지 이동 방지)
	        alert("매칭 전입니다!");
	    }
	    // 매칭 정보가 있으면 페이지로 이동
	    // 여기에 필요한 다른 로직 추가 가능
	}
	
	function checkAndNavigateMatch(event, matches){
		if(matches){
			event.preventDefault();
			alert("이미 매칭된 게임입니다!");
		}
	}
</script>

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
<!-- <script>
    document.addEventListener('DOMContentLoaded', function () {
        const matchLink = document.querySelector('.btn.btn-sm.btn-primary.taetaes');

        matchLink.addEventListener('click', function (event) {
            // 여기서 myteam 값을 가져옵니다. 이 값이 비어 있는지 확인합니다.
            const myteamValue = "${myteam}"; // myteam 값을 설정하는 방식에 따라 다르게 가져와야 합니다.

            // matches 값을 가져옵니다.
            const matchesValue = ${not empty game.matches[0].teamName}; // matches 값을 가져오는 방식에 따라 다르게 설정되어야 합니다.

            if (!myteamValue) {
                alert('가입된 구단이 없습니다!');
                event.preventDefault(); // 페이지 이동을 막습니다.
            } else if (matchesValue) {
                alert('이미 매칭된 게임입니다!');
                event.preventDefault(); // 페이지 이동을 막습니다.
            }
        });
    });
</script> -->
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
	            	<a href="/waguwagu/member/login">로그인</a>|
	            	<a href="/waguwagu/member/createmember">회원가입</a>
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
                    <li class="filter-list"><input class="pixel-radio" type="radio" id="food" name="brand"><label for="food">충청북도</label></li>
                  	<li class="filter-list"><input class="pixel-radio" type="radio" id="food" name="brand"><label for="food">제주도</label></li>
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
                <option value="1">최근날짜</option>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
              </select>
            </div>
            <div class="sorting mr-auto">
              <select>
                <option value="1">Show 5</option>
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
		    <div class="container" id="game-list">
		        <c:forEach items="${list}" var="game">
		        	<div class="row game-list">
			       		 <%-- <c:out value="game: ${game}" /> --%> 
			            <div class="">
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
					                                    <c:choose>
													        <c:when test="${not empty game.matches[0].teamName}">
													            <img src="<c:url value='/resources/images/${game.getMatches().get(0).fileName}'/>" alt="${game.getMatches().get(0).teamName} Image" style="width:50px" alt="Image" class="img-fluid">
													            <h2 class=""> ${game.matches[0].teamName}</h2>
													        </c:when>
													        <c:otherwise>
													            <h2>매칭 전입니다.</h2>
													        </c:otherwise>
													    </c:choose>
				                                    </div>
			                                    </div>
			                                    <div class="subheading mb-3">날짜 : ${game.date}</div>
			                                    <p>경기장 : ${game.stadium}</p>
			                                </div>
			                            </div>
			                        </div>
			                       <div class="text-md-right">
			                        	<a href="<c:url value='/games/game?id=${game.gameId}'/>" onclick="checkAndNavigate(event, ${not empty game.matches[0].teamName})" class="btn btn-sm btn-primary">상세보기</a>										
	      								<a href="<c:url value='/match/add?id=${game.gameId}'/>" onclick="checkAndNavigateMatch(event, ${not empty game.matches[0].teamName})" class="btn btn-sm btn-primary taetaes">매칭</a>
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
          <div class="d-flex justify-content-center" id="pagination-container-location">
	        <div aria-label="Page navigation example">
	            <ul class="pagination" id="pagination">
	                <li class="page-item">
	                    <a class="page-link" href="#" aria-label="Previous">
	                        <span aria-hidden="true">&laquo;</span>
	                    </a>
	                </li>
	            </ul>
	        </div>
          </div>
        </div>
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  

	<!-- ================ top product area start ================= -->	
	
	<!-- ================ top product area end ================= -->		

  <script>
	    var list = document.getElementById('game-list').getElementsByClassName('game-list');
	    var pageNum = document.getElementById('pagination'); // 페이지 번호를 표시할 엘리먼트
	    var limitPerPage = 5;
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
	
	        var startPage = Math.max(1, currentPage - 2); // 시작 페이지 번호
	        var endPage = Math.min(startPage + 4, totalPages); // 종료 페이지 번호
	
	        // 시작 페이지부터 종료 페이지까지 번호 표시
	        for (var i = startPage; i <= endPage; i++) {
	            pageNum.innerHTML += "<li class='page-item'><a class='page-link' href='#' onclick='changePage(" + i + ")'>" + i + "</a></li>";
	        }
	
	        // 이전 페이지로 이동할 수 있는 버튼 표시
	        if (startPage > 1) {
	            pageNum.innerHTML = "<li class='page-item'><a class='page-link' href='#' onclick='prevPage()'>&laquo;</a></li>" + pageNum.innerHTML;
	        }
	
	        // 다음 페이지로 이동할 수 있는 버튼 표시
	        if (endPage < totalPages) {
	            pageNum.innerHTML += "<li class='page-item'><a class='page-link' href='#' onclick='nextPage()'>&raquo;</a></li>";
	        }
	    }
	
	    function changePage(page) {
	        currentPage = page;
	        showPage(currentPage);
	        updatePagination();
	    }
	
	    function nextPage() {
	        if (currentPage < totalPages) {
	            currentPage++;
	            showPage(currentPage);
	            updatePagination();
	        }
	    }
	
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
  
	<script src="<c:url value='/resources/vendors/jquery/jquery-3.2.1.min.js'/>"/></script>
	<script src="<c:url value='/resources/vendors/bootstrap/bootstrap.bundle.min.js'/>"/></script>
	<script src="<c:url value='/resources/vendors/skrollr.min.js'/>"/></script>
	<script src="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.js'/>"/></script>
	<script src="<c:url value='/resources/vendors/nice-select/jquery.nice-select.min.js'/>"/></script>
	<script src="<c:url value='/resources/vendors/nouislider/nouislider.min.js'/>"/></script>
	<script src="<c:url value='/resources/vendors/jquery.ajaxchimp.min.js'/>"/></script>
	<script src="<c:url value='/resources/vendors/mail-script.js'/>"/></script>
	<script src="<c:url value='/resources/js/main.js'/>"/></script>
	<script src="<c:url value='/resources/js/test.js'/>"/></script>
  

	
</body>
</html>