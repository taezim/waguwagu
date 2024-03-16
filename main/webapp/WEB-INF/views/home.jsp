<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.springmvc.domain.Match" %>
<%@ page import="com.springmvc.domain.Game" %>
<%@ page import="com.springmvc.domain.TeamWinning" %>
<%@ page import="com.springmvc.domain.Product" %>
<%@ page import="com.springmvc.service.TeamWinningService" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>WAGUWAGU - Home</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="<c:url value='/resources/vendors/bootstrap/bootstrap.min.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/fontawesome/css/all.min.css'/>"/>
	<link rel="stylesheet" href="<c:url value='/resources/vendors/themify-icons/themify-icons.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/nice-select/nice-select.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.theme.default.min.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.css'/>"/>
  <script src="https://kit.fontawesome.com/c3566586b6.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>"/>
  <style>
    *{
      /* border:1px solid black; */
    }
    .rank_all{
      width: 100%;
      /* border: 1px solid black; */
      display: flex;
    }
    .rank_r{
      width: 60%;
      /* border: 1px solid black; */
    }
    .rank_l{
      width: 40%;
      /* border: 1px solid black; */
    }
    .rank_l table img
    {
      width: 32px;
    }
    .profile_t{
      border-radius: 50%;
      padding-right: 10px;
    }
    .profile_all{
      display: flex;
      padding: 20px 10px 10px 10px;
    }
    .alone_all{
      padding-left: 10px;
    }
    .more{
      padding-right: 5px;
    }
    .more_m{
      background-color: #384aeb;
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
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
	    <div class="main_menu">
	      <nav class="navbar navbar-expand-lg navbar-light">
	        <div class="container">
	          <a class="navbar-brand logo_h" href="/waguwagu/">
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

  <main class="site-main">
    
    <!--================ Hero banner start =================-->
    <section class="hero-banner">
      <div class="container">
        <div class="row no-gutters align-items-center pt-60px">
          <div class="col-5 d-none d-sm-block">
            <div class="hero-banner__img">
              <img class="img-fluid" src="<c:url value='/resources/images/공2.JPG" alt="'/>">
            </div>
          </div>
          <div class="col-sm-7 col-lg-6 offset-lg-1 pl-4 pl-md-5 pl-lg-0">
            <div class="hero-banner__content">
              <h4>Let's have fun playing baseball</h4>
              <h1>Find a team to join</h1>
              <p>If you want, you can get your own team to have fun playing baseball. We'll help you have fun playing</p>
              <a class="button button-hero" href="<c:url value='/team'/>">Find Team Now</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================ Hero banner start =================-->

    <!--================ Hero Carousel start =================-->
    <!-- <section class="section-margin mt-0">
      <div class="owl-carousel owl-theme hero-carousel">
        <div class="hero-carousel__slide">
          <img src="img/home/hero-slide1.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Wireless Headphone</h3>
            <p>Accessories Item</p>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="img/home/hero-slide2.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Wireless Headphone</h3>
            <p>Accessories Item</p>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="img/home/hero-slide3.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Wireless Headphone</h3>
            <p>Accessories Item</p>
          </a>
        </div>
      </div>
    </section> -->
    <!--================ Hero Carousel end =================-->
    <section>
      <div class="container">
        <div class="rank_all">
          <div class="rank_r ">
           <div class="pb-5">
            <div class="section-intro pb-5">
              <p>Today's MatchUp</p>
              <h2>오늘의 <span class="section-intro__style">매치업</span></h2>
            </div>
            <div class="d-flex justify-content-start" style="width: 90% quto;">
                <%
				    Connection conn = null;
				    Statement stmt = null;
				    ResultSet rs = null;
				
				    try {
				        // JDBC 드라이버를 로드합니다.
				        Class.forName("com.mysql.jdbc.Driver");
				
				        // DB에 연결합니다.
				        String url = "jdbc:mysql://localhost:3306/WAGUDB";
				        String username = "root";
				        String password = "1234";
				        conn = DriverManager.getConnection(url, username, password);
				
				        // SQL 쿼리를 실행합니다.
				        String SQL = "SELECT * FROM game g LEFT JOIN matching m ON g.g_id = m.g_id ORDER BY g.g_date DESC LIMIT 5";
				        stmt = conn.createStatement();
				        rs = stmt.executeQuery(SQL);
				
				        // 결과를 처리합니다.
				        while (rs.next()) {
				        	List<Game> gameList = new ArrayList<>();

				            // 결과를 처리합니다.
				            while (rs.next()) {
				                String gameId = rs.getString("g.g_id");

				                Game game = new Game();
				                game.setGameId(gameId);
				                game.setTeamId1(rs.getString("g.t_id1"));
				                game.setTeamName1(rs.getString("g.t_name1"));
				                game.setDate(rs.getString("g.g_date"));
				                game.setUserId(rs.getString("g.userid"));
				                game.setUserName(rs.getString("g.username"));
				                game.setUserNumber(rs.getString("g.userphone"));
				                game.setStadium(rs.getString("g.g_stadium"));
				                game.setFileName(rs.getString("g.g_filename"));

				                Match match = new Match();
				                match.setTeamId(rs.getString("m.t_id"));
				                match.setTeamName(rs.getString("m.t_name"));
				                match.setUserId(rs.getString("m.userid"));
				                match.setUserName(rs.getString("m.username"));
				                match.setUserNumber(rs.getString("m.userphone"));
				                match.setFileName(rs.getString("m.g_filename"));

				                game.getMatches().add(match);

				                // 생성된 게임 객체를 리스트에 추가
				                gameList.add(game);
				            }

				            // 각 행의 데이터를 설정합니다.
				            request.setAttribute("gameList", gameList);
				%>
				            <!-- HTML 출력 부분 -->
			    <% int count = 0; %>
    <% for (Game game : gameList) { %>
        <% if (count % 2 == 0) { %>
            <div class="col-md-6 pl-0">
        <% } %>

        <div class="shadow p-3 mb-5 bg-body-tertiary rounded">
            <span><%= game.getDate() %></span> | <span><%= game.getStadium() %></span>
            <div class="d-flex justify-content-center">
                <div>
                    <img src="<%= "/waguwagu/resources/images/" + game.getFileName() %>" style="width:50px; height:50px;">
                    <p><%= game.getTeamName1() %></p>
                </div>
                <h4 style="padding: 0 10px 0 0;">VS</h4>
                <div>
                <c:choose>
				    <c:when test="<%= game.getMatches().get(0).getTeamName() != null %>">
				        <img src="<%= "/waguwagu/resources/images/" + game.getMatches().get(0).getFileName() %>" style="width:50px; height:50px;">
				        <p><%= game.getMatches().get(0).getTeamName() %></p>
				    </c:when>
				    <c:otherwise>
				        <h4>매칭 전입니다.</h4>
				    </c:otherwise>
				</c:choose>
				</div>
            </div>
            <div class="mt-2 d-flex justify-content-between text-center">
                <i class="fa-regular fa-heart heart"></i>
                <a href="<%= request.getContextPath() %>/games/game?id=<%= game.getGameId() %>" class="btn btn-primary btn-sm">경기 상세보기</a>
            </div>
        </div>

        <% if (count % 2 == 1 || count == gameList.size() - 1) { %>
            </div> <!-- Close col-md-6 -->
        <% } %>

        <% count++; %>
    <% } %>
			<%
			        }
			    } catch (Exception e) {
			        e.printStackTrace();
			    } finally {
			        // 사용한 자원을 정리합니다.
			        if (rs != null) {
			            try { rs.close(); } catch (SQLException e) { }
			        }
			        if (stmt != null) {
			            try { stmt.close(); } catch (SQLException e) { }
			        }
			        if (conn != null) {
			            try { conn.close(); } catch (SQLException e) { }
			        }
			    }
			%>
            </div>
          </div>
          <div class=" pr-5 pl-0" >
            <div class="section-intro mb-4">
              <p>Today's MatchUp</p>
              <h2>오늘의 <span class="section-intro__style">매치업</span></h2>
            </div>
            <!-- calendar -->
            <div id="calendar" style="max-width: 100%;" >
              
            </div>
          </div>
        </div>
          <div class="rank_l">
            <div class="section-intro pb-60px shadow p-3 mb-5 bg-body-tertiary rounded">
              <p>Club Rankings</p>
              <h2>구단 <span class="section-intro__style">순위</span></h2>
              <div class="mt-5 container table-responsive" >
                <table  class="table table-sm">
                    <thead class="table-light">
                      <tr>
                        <th scope="col">순위</th>
                        <th scope="col"></th>                                                      
                        <th scope="col">팀명</th>
                        <th scope="col">승</th>
                        <th scope="col">무</th>
                        <th scope="col">패</th>
                        <th scope="col">승률</th>
                      </tr>
                      <%
              
					    List<TeamWinning> uniqueWinningList = new ArrayList<>();
					
					    try {
					        // JDBC 드라이버를 로드합니다.
					        Class.forName("com.mysql.jdbc.Driver");
					
					        // DB에 연결합니다.
					        String url = "jdbc:mysql://localhost:3306/WAGUDB";
					        String username = "root";
					        String password = "1234";
					        conn = DriverManager.getConnection(url, username, password);
					
					        // SQL 쿼리를 실행합니다.
					        String SQL = "SELECT * FROM team";
					        stmt = conn.createStatement();
					        rs = stmt.executeQuery(SQL);
					        
					        // 결과를 처리합니다.
					        while (rs.next()) {
					            String teamId = rs.getString(1);
					
					            // 팀별 승률 계산
					            int totalWins = totalWins(teamId, conn);
					            int totalLose = totalLose(teamId, conn);
					            int totalTie = totalTie(teamId, conn);
					            double winningRate = calculateWinningRate(teamId, conn);
					            int totalGames = totalGames(teamId, conn);
					            
					            String teamName = rs.getString(2);
					            String fileName = rs.getString(7);
								
					            // TeamWinning 객체에 값 설정
					            TeamWinning teamWinning = new TeamWinning();
					            teamWinning.setTeamId(teamId);
					            teamWinning.setTotalWins(totalWins);
					            teamWinning.setTotalLose(totalLose);
					            teamWinning.setTotalTie(totalTie);
					            teamWinning.setRate(winningRate);
					            teamWinning.setMatches(totalGames); 
					            teamWinning.setTeamName(teamName);
					            teamWinning.setFileName(fileName);
					
					            // 중복을 제거하고 계산한 결과를 저장
					            uniqueWinningList.add(teamWinning);
					        }
					
					        // 승률을 기준으로 내림차순으로 정렬
					        Collections.sort(uniqueWinningList, Comparator.comparingDouble(TeamWinning::getRate).reversed());
					
					        // 순위 부여
					        int rank = 1;
					        for (TeamWinning teamWinning : uniqueWinningList) {
					            teamWinning.setRank(rank++);
					        }
					        
					        for (TeamWinning teamWinning : uniqueWinningList) {
				     %>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row"><%= teamWinning.getRank() %></th>
                        <td>
                            <img src="<%= "/waguwagu/resources/images/" + teamWinning.getFileName() %>">
                        </td>
                        <td><%= teamWinning.getTeamName() %></td>
                        <td><%= teamWinning.getTotalWins() %></td>
                        <td><%= teamWinning.getTotalTie() %></td>
                        <td><%= teamWinning.getTotalLose() %></td>
                        <td><%= teamWinning.getRate() %></td>
                      </tr>
                    </tbody>
                    <% }
                          // JDBC 리소스 해제
					        rs.close();
					        stmt.close();
					        conn.close();
					
					    } catch (Exception e) {
					        e.printStackTrace();
					    }

					%>
                    <caption>
                        <div  class="d-flex justify-content-between" >
                        <p>※ 시즌 1 기준</p>
                        </div>
                    </caption>
                  </table>          
					<%!
						// 팀별 승리 횟수 조회 메서드
						public int totalWins(String teamId, Connection conn) throws SQLException {
						    String SQL = "SELECT COUNT(*) AS totalWins FROM t_score WHERE teamId=? AND ts_result='Win'";
						    PreparedStatement pstmt = conn.prepareStatement(SQL);
						    pstmt.setString(1, teamId);
						    ResultSet rs = pstmt.executeQuery();
						    int totalWins = 0;
						    if (rs.next()) {
						        totalWins = rs.getInt("totalWins");
						    }
						    rs.close();
						    pstmt.close();
						    return totalWins;
						}
						
						// 팀별 무승부 횟수 조회 메서드
						public int totalTie(String teamId, Connection conn) throws SQLException {
						    String SQL = "SELECT COUNT(*) AS totalTie FROM t_score WHERE teamId=? AND ts_result='Tie'";
						    PreparedStatement pstmt = conn.prepareStatement(SQL);
						    pstmt.setString(1, teamId);
						    ResultSet rs = pstmt.executeQuery();
						    int totalTie = 0;
						    if (rs.next()) {
						        totalTie = rs.getInt("totalTie");
						    }
						    rs.close();
						    pstmt.close();
						    return totalTie;
						}
						
						// 팀별 패배 횟수 조회 메서드
						public int totalLose(String teamId, Connection conn) throws SQLException {
						    String SQL = "SELECT COUNT(*) AS totalLose FROM t_score WHERE teamId=? AND ts_result='Lose'";
						    PreparedStatement pstmt = conn.prepareStatement(SQL);
						    pstmt.setString(1, teamId);
						    ResultSet rs = pstmt.executeQuery();
						    int totalLose = 0;
						    if (rs.next()) {
						        totalLose = rs.getInt("totalLose");
						    }
						    rs.close();
						    pstmt.close();
						    return totalLose;
						}
						
						// 팀별 전체 게임 횟수 조회 메서드
						public int totalGames(String teamId, Connection conn) throws SQLException {
						    String SQL = "SELECT COUNT(*) FROM t_score WHERE teamId=?";
						    PreparedStatement pstmt = conn.prepareStatement(SQL);
						    pstmt.setString(1, teamId);
						    ResultSet rs = pstmt.executeQuery();
						    int totalGames = 0;
						    if (rs.next()) {
						        totalGames = rs.getInt(1);
						    }
						    rs.close();
						    pstmt.close();
						    return totalGames;
						}
						
						// 팀별 승률 계산 메서드
						public double calculateWinningRate(String teamId, Connection conn) throws SQLException {
						    String SQL = "SELECT COUNT(*) FROM t_score WHERE teamId=? AND ts_result='Win'";
						    PreparedStatement pstmtWins = conn.prepareStatement(SQL);
						    pstmtWins.setString(1, teamId);
						    ResultSet rsWins = pstmtWins.executeQuery();
						    int totalWins = 0;
						    if (rsWins.next()) {
						        totalWins = rsWins.getInt(1);
						    }
						    rsWins.close();
						    pstmtWins.close();
						
						    String totalGamesSQL = "SELECT COUNT(*) FROM t_score WHERE teamId=?";
						    PreparedStatement pstmtTotalGames = conn.prepareStatement(totalGamesSQL);
						    pstmtTotalGames.setString(1, teamId);
						    ResultSet rsTotalGames = pstmtTotalGames.executeQuery();
						    int totalGames = 0;
						    if (rsTotalGames.next()) {
						        totalGames = rsTotalGames.getInt(1);
						    }
						    rsTotalGames.close();
						    pstmtTotalGames.close();
						
						    double rate = (totalGames > 0) ? ((double) totalWins / totalGames) * 100 : 0.0;
						    return Math.round(rate * 1000.0) / 1000.0;
						}
						%>
                </div>
            </div>
            <div class="section-intro pb-60px shadow p-3 mb-5 bg-body-tertiary rounded">
              <p>Club Rankings</p>
              <h2>나의 <span class="section-intro__style">기록</span></h2>
              <div class="alone_all">
                <div class="profile_all">
                  <div>
                    <img class="profile_t" src="<c:url value='/resources/img/blog/야옹.jpg'/>">
                  </div>
                  <div>
                    <p><strong>이름 </strong>야옹 이</p>
                    <p><strong>소속구단 </strong>두산베어스</p>
                  </div>
                </div>
                <div>
                  <table class="table alone">
                    <tr>
                      <th scope="row">타율</th>
                      <td>0.318</td>
                    </tr>
                    <tr>
                      <th scope="row">경기수</th>
                      <td>100</td>
                    </tr>
                    <tr>
                      <th scope="row">홈런</th>
                      <td>15</td>
                    </tr>
                    <tr>
                      <th scope="row">타점</th>
                      <td>80</td>
                    </tr>
                    <tr>
                      <th scope="row">도루</th>
                      <td>10</td>
                    </tr>
                    <tr>
                      <th scope="row">득점</th>
                      <td>70</td>
                    </tr>
                    <tr>
                      <th scope="row">2루타</th>
                      <td>36</td>
                    </tr>
                    <tr>
                      <th scope="row">3루타</th>
                      <td>20</td>
                    </tr>
                  </table>
                  <div class="d-flex flex-row-reverse btn-group more" role="group" aria-label="Basic example">
                    <button type="button" class="btn btn-primary more_m">더보기</button>
                  </div>
                </div>
              </div>
            </div>
          </div>   
        </div>
      </div>  
    </section>

    <!-- ================ offer section start ================= --> 
    <section class="offer" id="parallax-1" data-anchor-target="#parallax-1" data-300-top="background-position: 20px 30px" data-top-bottom="background-position: 0 20px">
      <div class="container">
        <div class="row">
          <div class="col-xl-5">
            <div class="offer__content text-center">
              <h3>Up To 50% Off</h3>
              <h4>Winter Sale</h4>
              <p>Him she'd let them sixth saw light</p>
              <a class="button button--active mt-3 mt-xl-4" href="<c:url value='/products'/>">Shop Now</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ================ offer section end ================= --> 

    <!-- ================ Best Selling item  carousel ================= --> 
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>Popular Item in the market</p>
          <h2>Best <span class="section-intro__style">Sellers</span></h2>
        </div>
        
        <div class="owl-carousel owl-theme" id="bestSellerCarousel">
        <%
              
	        List<Product> listOfProducts = new ArrayList<>();
	
	        try {
	            // JDBC 드라이버를 로드합니다.
	            Class.forName("com.mysql.jdbc.Driver");
	
	            // DB에 연결합니다.
	            String url = "jdbc:mysql://localhost:3306/WAGUDB";
	            String username = "root";
	            String password = "1234";
	            conn = DriverManager.getConnection(url, username, password);
	
	            // SQL 쿼리를 실행합니다.
	            String SQL = "SELECT * FROM product";
	            stmt = conn.createStatement();
	            rs = stmt.executeQuery(SQL);
	
	            // 결과를 처리합니다.
	            while (rs.next()) {
	                Product pd = new Product();
	                pd.setProductId(rs.getString(1));  //상품아이디
	                pd.setProductName(rs.getString(2));  //상품이름
	                pd.setUnitPrice(rs.getInt(3));  //가격
	                pd.setDescription(rs.getString(4));  //설명긴거
	                pd.setCategory(rs.getString(5));  //카테고리
	                pd.setUnitsInStock(rs.getInt(6));  //재고수
	                pd.setCondition(rs.getString(7));  //상태  
	                pd.setRating(rs.getInt(8));
	                pd.setFileName(rs.getString(9));
	                pd.setModelName(rs.getString(10));
	                pd.setSize(rs.getString(11));
	                pd.setPosition(rs.getString(12));
	                pd.setMaterial(rs.getString(13));
	                pd.setWeb(rs.getString(14));
	                pd.setColor(rs.getString(15));
	                pd.setManufacturCountry(rs.getString(16));
	                pd.setHandling(rs.getString(17));
	                pd.setBriedfDescription(rs.getString(18));
	                pd.setBrand(rs.getString(19));
	                
	                listOfProducts.add(pd); // Product를 리스트에 추가합니다.
	            }
				
	            for (Product Product : listOfProducts) {
				         
		  %>
          <div class="card text-center card-product">
            <div class="card-product__img">
              <img class="img-fluid" src="<%= "/waguwagu/resources/images/" + Product.getFileName() %>"/>
              <ul class="card-product__imgOverlay">
                <li><button><i class="ti-search"></i></button></li>
                <li><button><i class="ti-shopping-cart"></i></button></li>
                <li><button><i class="ti-heart"></i></button></li>
              </ul>
            </div>
            <div class="card-body">
              <p><%=Product.getCategory() %></p>
              <h4 class="card-product__title"><a href="single-product.html"><%=Product.getProductName() %></a></h4>
              <p class="card-product__price"><%=Product.getUnitPrice() %></p>
            </div>
          </div>

          
          <% 
	            }
                          // JDBC 리소스 해제
					        rs.close();
					        stmt.close();
					        conn.close();
					
					    } catch (Exception e) {
					        e.printStackTrace();
					    }

					%>
        </div>
      </div>
    </section>
    <!-- ================ Best Selling item  carousel end ================= --> 

  </main>


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
 <!-- calendar.io -->
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js"></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    const calendarEl = document.getElementById('calendar')
    const calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth'
    })
    calendar.render()
  })

</script>

  <script src="<c:url value='/resources/vendors/jquery/jquery-3.2.1.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/bootstrap/bootstrap.bundle.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/skrollr.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/owl-carousel/owl.carousel.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/nice-select/jquery.nice-select.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/jquery.ajaxchimp.min.js'/>"/></script>
  <script src="<c:url value='/resources/vendors/mail-script.js'/>"/></script>
  <script src="<c:url value='/resources/js/main.js'/>"/></script>
</body>
</html>