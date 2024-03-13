<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="kr">

<head>
  <title>Soccer &mdash; Website by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<link rel="icon" href="img/Fevicon.png" type="image/png">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendors/bootstrap/bootstrap.min.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendors/fontawesome/css/all.min.css'/>"/>
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/themify-icons/themify-icons.css">
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/linericon/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/owl-carousel/owl.theme.default.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/owl-carousel/owl.carousel.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/nice-select/nice-select.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendors/nouislider/nouislider.min.css">
	<script src="https://kit.fontawesome.com/c3566586b6.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style.css">
 	


<style>
*
{
 /* border: 0.1px solid black; */
 margin: 0;
 padding: 0;

  }

  .score
  {
    position: absolute;
    top: 50%;
    left: 48%;
    transform: translate(-40%, -50%);
    /* color: #fff; */
    color: #644848;
    font-size: 3rem;
    font-weight: 700;
    z-index: 2;
    letter-spacing: .2em;
  }
  .team-1
  {
    /* background-color: red; */
  }
  .team-2
  {
    /* background-color: blue; */
  }

  li
  {
    text-decoration: white;
  }

 .team-vs > div
 {
    padding: 2rem;
 }

#countdown li {
  display: inline-block;
  font-size: 1.5em;
  list-style-type: none;
  padding: 1em;
  text-transform: uppercase;
  font-size: 2rem;
  text-decoration: white !important;
}

.hero
{
  height: 100%;
  color: white;
}

.heading::before
{
  
  position: absolute;
    content: "";
    width: 10px;
    top: 0;
    left: 0;
    bottom: 0;
    background: #1e3dee;
}
.hero{

	background-color:#1e3dee;
	padding-top:30px;
	
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
   <div>
   </div>
    <div class="hero">
      <div class="container">
        <div class="row align-items-center"> 
            <h1 class="text-white">Tournament Event</h1>
            <p class="date-all"><strong>${game.date}</strong> <!-- Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta, molestias repudiandae pariatur. --></p>
            <div id="date-countdown" class="mt-5">
              <div class="container p-0">
                <h1 class="text-white" >경기까지 남은 시간</h1>
                <div id="countdown">
				  <ul>
				    <li><span id="days"></span>days</li>
				    <li><span id="hours"></span>Hours</li>
				    <li><span id="minutes"></span>Minutes</li>
				    <li><span id="seconds"></span>Seconds</li>
				  </ul>
				</div>
              </div>
            </div>
        </div>
      </div>
    </div>
    <div class="shadow-sm bg-body-tertiary rounded">
    <div class="container ">
      <div class="row">
        <div class="col-lg-12">
          <div class="col-md-5 mt-5">
           <h1 class="heading">Team Match</h1>
          </div>
          <div class="d-flex team-vs">
            <span class="score">VS</span>
            <div class="team-1 w-50">
              <div class="team-details w-100 text-center shadow p-3 mb-5 bg-body-tertiary rounded">                
	                <img src="<c:url value='/resources/images/${game.fileName}'/>" alt="${game.teamName1} Image" style="width:50px" class="img-fluid">	                
	                <h3>${game.teamName1}</h3>
	                <ul class="list-unstyled">
	                  <li>Anja Landry (7)</li>
	                  <li>Eadie Salinas (12)</li>
	                  <li>Ashton Allen (10)</li>
	                  <li>Baxter Metcalfe (5)</li>
	                </ul>
	              </div>
	            </div>
	            <div class="team-2 w-50">
	            <div class="team-details w-100 text-center shadow p-3 mb-5 bg-body-tertiary rounded"> 
	              <c:forEach var="match" items="${game.matches}">	             
	                <img src="<c:url value='/resources/images/${match.fileName}'/>" alt="${match.teamName} Image" style="width:50px" class="img-fluid">	                
	                <h3>${match.teamName}</h3>
	                <ul class="list-unstyled">
	                  <li>Macauly Green (3)</li>
	                  <li>Arham Stark (8)</li>
	                  <li>Stephan Murillo (9)</li>
	                  <li>Ned Ritter (5)</li>
	                </ul>
               	</c:forEach>
              </div>
            </div>   
          </div>
        </div>
      </div>
    </div>

    <div class="site-section mt-5">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <div class="widget-next-match">
              <div class="widget-title col-md-6">
                <h3 class="heading">이전 경기</h3>
              </div>
              <div class="widget-body mb-3">
                <div class="widget-vs">
                  <div class="d-flex align-items-center justify-content-around justify-content-between w-100">
                    <div class="team-1 text-center">
                      <!-- <img src="images/logo_1.png" alt="Image"> -->
                      <h3>${game.teamName1}(win)</h3>
                    </div>
                    <div>
                      <span class="vs"><span>VS</span></span>
                    </div>
                    <div class="team-2 text-center">
                      <!-- <img src="images/logo_2.png" alt="Image"> -->
                      <h3>${match.teamName } (loss)</h3>
                    </div>
                  </div>
                </div>
              </div>

              <div class="text-center widget-vs-contents mb-4">
                <h4>Tournament Event</h4>
                <p class="mb-5">
                  <span class="d-block">December 20th, 2020</span>
                  <span class="d-block">9:30 AM GMT+0</span>
                  <h1><strong class="text-primary"><span>4</span> : <span style="color:#185da7!important;">3</span></strong></h1>
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            
             <div>
              <table class="table custom-table">
                <thead>
                  <tr>  
	                <th scope="col">순위</th>
	                <th scope="col"></th>                                                      
	                <th scope="col">경기수</th>
	                <th scope="col">승</th>
	                <th scope="col">무</th>
	                <th scope="col">패</th>
	                <th scope="col">승률</th>
	                    
	              </tr>
                </thead>
                <tbody>
                	<c:forEach var="teamWinning" items="${winningList}">
                  <tr>
                    <td><strong>${teamWinning.rank}</strong></td>
                    <td><img src="<c:url value='/resources/images/${teamWinning.fileName}'/>" alt="${teamWinning.teamName} Image" style="width: 1.6rem;"><strong>${teamWinning.teamName}</strong> </td>
	                <td>${teamWinning.matches}</td>
	                <td>${teamWinning.totalWins}</td>
	                <td>${teamWinning.totalTie}</td>
	                <td>${teamWinning.totalLose}</td>
	                <td>${teamWinning.rate}</td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div> <!-- .site-section -->
          </div>
        </div>
      </div>
    </div> <!-- .site-section -->

    <div class="site-section p-5 shadow-sm bg-body-tertiary rounded">
      <div class="container">
        <div class="row">
          <div class="col-6 title-section">
            <h2 class="heading">Score Board</h2>
          </div>
            <table class="table table-borderless" style="width: 100%;">
              <thead>
                <tr>
                  <th scope="col">팀명</th>
                  <th scope="col">1</th>
                  <th scope="col">2</th>
                  <th scope="col">3</th>
                  <th scope="col">4</th>
                  <th scope="col">5</th>
                  <th scope="col">6</th>
                  <th scope="col">7</th>
                  <th scope="col">8</th>
                  <th scope="col">9</th>
                  <th scope="col">R</th>
                  <th scope="col">H</th>
                  <th scope="col">E</th>
                  <th scope="col">B</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row">${game.teamName1}</th>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                </tr>
                <tr>
                  <th scope="row">${match.teamName }</th>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>


        <div class="owl-4-slider owl-carousel">
          <div class="item">
            <div class="video-media">
              <img src="images/img_1.jpg" alt="Image" class="img-fluid">
              <a href="https://vimeo.com/139714818" class="d-flex play-button align-items-center" data-fancybox>
                <span class="icon mr-3">
                  <span class="icon-play"></span>
                </span>
                <div class="caption">
                  <h3 class="m-0">Dogba set for Juvendu return?</h3>
                </div>
              </a>
            </div>
          </div>
          <div class="item">
            <div class="video-media">
              <img src="images/img_2.jpg" alt="Image" class="img-fluid">
              <a href="https://vimeo.com/139714818" class="d-flex play-button align-items-center" data-fancybox>
                <span class="icon mr-3">
                  <span class="icon-play"></span>
                </span>
                <div class="caption">
                  <h3 class="m-0">Kai Nets Double To Secure Comfortable Away Win</h3>
                </div>
              </a>
            </div>
          </div>
          <div class="item">
            <div class="video-media">
              <img src="images/img_3.jpg" alt="Image" class="img-fluid">
              <a href="https://vimeo.com/139714818" class="d-flex play-button align-items-center" data-fancybox>
                <span class="icon mr-3">
                  <span class="icon-play"></span>
                </span>
                <div class="caption">
                  <h3 class="m-0">Romolu to stay at Real Nadrid?</h3>
                </div>
              </a>
            </div>
          </div>

          <div class="item">
            <div class="video-media">
              <img src="images/img_1.jpg" alt="Image" class="img-fluid">
              <a href="https://vimeo.com/139714818" class="d-flex play-button align-items-center" data-fancybox>
                <span class="icon mr-3">
                  <span class="icon-play"></span>
                </span>
                <div class="caption">
                  <h3 class="m-0">Dogba set for Juvendu return?</h3>
                </div>
              </a>
            </div>
          </div>
          <div class="item">
            <div class="video-media">
              <img src="images/img_2.jpg" alt="Image" class="img-fluid">
              <a href="https://vimeo.com/139714818" class="d-flex play-button align-items-center" data-fancybox>
                <span class="icon mr-3">
                  <span class="icon-play"></span>
                </span>
                <div class="caption">
                  <h3 class="m-0">Kai Nets Double To Secure Comfortable Away Win</h3>
                </div>
              </a>
            </div>
          </div>
          <div class="item">
            <div class="video-media">
              <img src="images/img_3.jpg" alt="Image" class="img-fluid">
              <a href="https://vimeo.com/139714818" class="d-flex play-button align-items-center" data-fancybox>
                <span class="icon mr-3">
                  <span class="icon-play"></span>
                </span>
                <div class="caption">
                  <h3 class="m-0">Romolu to stay at Real Nadrid?</h3>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    <!-- <footer class="footer-section">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;
                <script>
                  document.write(new Date().getFullYear());
                </script> All rights reserved | This template is made with <i class="icon-heart"
                  aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              </p>
            </div>
          </div>

        </div>
      </div>
    </footer> -->



  </div>
  <!-- .site-wrap -->
<!--   <script>
    // (function () {
  const second = 1000,
        minute = second * 60,
        hour = minute * 60,
        day = hour * 24;

  //I'm adding this section so I don't have to keep updating this pen every year :-)
  //remove this if you don't need it
  let today = new Date(),
      dd = String(today.getDate()).padStart(2, "0"),
      mm = String(today.getMonth() + 1).padStart(2, "0"),
      yyyy = today.getFullYear(),
      nextYear = yyyy + 1,
      dayMonth = "09/30/",
      birthday = dayMonth + yyyy;
  
  today = mm + "/" + dd + "/" + yyyy;
  if (today > birthday) {
    birthday = dayMonth + nextYear;
  }
  //end
  
  const countDown = new Date(birthday).getTime(),
      x = setInterval(function() {    

        const now = new Date().getTime(),
              distance = countDown - now;

        document.getElementById("days").innerText = Math.floor(distance / (day)),
          document.getElementById("hours").innerText = Math.floor((distance % (day)) / (hour)),
          document.getElementById("minutes").innerText = Math.floor((distance % (hour)) / (minute)),
          document.getElementById("seconds").innerText = Math.floor((distance % (minute)) / second);

        //do something later when date is reached
        if (distance < 0) {
          document.getElementById("headline").innerText = "It's my birthday!";
          document.getElementById("countdown").style.display = "none";
          document.getElementById("content").style.display = "block";
          clearInterval(x);
        }
        //seconds
      }, 0)
  }());
  </script> -->
  
  <script scr="<c:url value ='/resources/js/jquery-3.3.1.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery-migrate-3.0.1.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery-ui.js'/>"></script>
  <script scr="<c:url value ='/resources/js/popper.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/bootstrap.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/owl.carousel.min.js'/>"></script>
  <script src="<c:url value ='/resources/js/jquery.stellar.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.countdown.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/bootstrap-datepicker.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.easing.1.3.js'/>"></script>
  <script scr="<c:url value ='/resources/js/aos.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.fancybox.min.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.sticky.js'/>"></script>
  <script scr="<c:url value ='/resources/js/jquery.mb.YTPlayer.min.js'/>"></script>

  <script src="<c:url value ='/resources/js/main.js'/>"></script>
	<script src="<c:url value ='/resources/js/app.js'/>"></script> 
</body>

</html>