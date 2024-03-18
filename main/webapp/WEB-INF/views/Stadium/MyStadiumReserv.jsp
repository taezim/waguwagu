<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>MY Stadium Reservation</title>
</head>
<body>
<div class="container">
		<p>수강 신청 번호 : ${sr.reservId}
		<p>병원 아이디: ${sr.stdId}
		<p>병원 이름 : ${sr.stdName}
		<p>예약 등록한 날짜 : ${sr.stdFilename}
		<p>병원에 갈 날짜: ${sr.insertDate}
		<p>예약자 아이디 : ${sr.reservDate}
		<p>예약자 이름 : ${sr.startTime}
		<p>예약자 전화번호 : ${sr.endTime}
		<p>부상자 이름 : ${sr.userId}
		<p>부상자 나이: ${sr.userName}
		<p>부상자 전화번호 : ${sr.userPhone}
		<p>부상 부위 : ${sr.teamId}
		<p>부상 설명/ 비고란: ${sr.teamName}
		<p>부상 설명/ 비고란: ${sr.memNumber}
		<p>부상 설명/ 비고란: ${sr.bookingFee}
		<p>부상 설명/ 비고란: ${sr.bookingStatus}
		<p>부상 설명/ 비고란: ${sr.isPaid}
	<a href="<c:url value='/stadium/myReserve'/>" class="btn btn-success">목록으로 돌아가기</a>
</div> 
</body>
</html>