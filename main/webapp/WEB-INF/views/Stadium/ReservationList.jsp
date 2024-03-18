<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>경기장 대여 목록</title>
</head>
<body>
<div class="container">
	<c:forEach items="${list}" var="list">
		<div class="col-md-4">
	     <c:choose>
	         <c:when test="${list.stdFilename == null}">
	            <img src="<c:url value='/resources/images/${list.stdFilename}'/>" style="width: 30%"/>
	         </c:when>
	         <c:otherwise>
	            <img src="<c:url value='/resources/images/${list.stdFilename}'/>" style="width: 30%"/>
	         </c:otherwise>
	      </c:choose>
	   </div>
		<div class="col-md-7">
			<p>대여번호 : ${list.reservId}
			<p>경기장 이름 : ${list.stdName}
			<p>경기장 대여일 : ${list.reservDate}
			<p>대여 시간: ${list.startTime} ~	 ${list.endTime}
			<p>대여자명 : ${list.userName}
			<p>대여 팀 명 : ${list.teamName}
			<p>예약 현황 : ${list.bookingStatus}
			<a href="<c:url value='/stadium/${list.reservId}'/>" class="btn btn-success">대여정보 상세보기</a>
		</div>
	</c:forEach>   
</div> 
</body>
</html>