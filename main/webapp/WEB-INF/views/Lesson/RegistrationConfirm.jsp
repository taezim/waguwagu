<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>          
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>Registration Confirm</title>
</head>
<body>
	<h3>수강 신청 확인 페이지</h3>
	<form:form modelAttribute="registration" action="./confirm" method="post">
		<div>
			신청하는 클래스
			<h3>클래스명 :<form:input path="lessonName" value="${regist.lessonName}"/></h3>
			<h4>코치(담당자)이름 :<form:input path="coachName" value="${regist.coachName}"/></h4>
			<form:input  path="lessonId" value="${regist.lessonId}"/> <!-- path 는 DTO 객체의 변수 -->
	 		<form:input path="coachId" value="${regist.coachId}"/> <!-- path 는 DTO 객체의 변수 -->
		</div>
		<p> 신청 날짜 : <form:input path="registDate" value="${regist.registDate}"/>
		<p> 신청자 아이디 : <form:input path="studentId" value="${regist.studentId}"/>
		<p> 신청자 이름 : <form:input path="studentName" value="${regist.studentName}"/>
		<p> 신청자 전화번호 : <form:input path="phone" value="${regist.phone}"/>
		<p> 결제하기 <form:input path="paymentStatus" value="${regist.paymentStatus}" />
		<p> 비고란/ 요청사항: <form:textarea value="${regist.notes}" path="notes" cols="50" rows="2"/>
			<input type="submit" value="등록"/>
	</form:form>
</body>
</html>

