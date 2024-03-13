<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- form 사용을 위한 선언 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<script src="${pageContext.request.contextPath }/resources/js/controllers.js"></script>
<!-- 스크립트 사용을 위해 선언 -->
<title>구단 승리 정보</title>
</head>
<body>
 <h2>최근 경기 결과</h2>
 
 	<h2>경기 횟수</h2>
 	<p>총 경기 횟수 : ${totalGames}</p>
    <p>최근 10경기 승패 결과: ${recentMatchesResult}</p>

    <h2>승리 횟수</h2>
    <p>총 승리 횟수: ${totalWins}</p>
    
    <h2>무승부 횟수</h2>
    <p>총 패배 횟수: ${totalTies}</p>

    <h2>패배 횟수</h2>
    <p>총 패배 횟수: ${totalLosses}</p>

    <h2>승률</h2>
    <p>팀의 승률: ${winningRate}%</p>
	<p><a href="<c:url value="/Team/result/update?id=${winning.winningId}"/>"class="btn btn-secondary" role="button">수정 &raquo;</a>
	<p><a href="<c:url value='/team/result'/>" class="btn btn-secondary" role="button">목록 &raquo;</a></p>	
	<p><a href="<c:url value="/Team/result/winning?id=${winning.winningId}"/>"class="btn btn-secondary" role="button">상세정보 &raquo;</a>
</body>
</html>