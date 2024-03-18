<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>          
<%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />

<title>Insert title here</title>
</head>
<body>
	<form:form  modelAttribute="stdReservation" action="./confirm" method="post">

    <form:input path="stdId" value="${sr.stdId}" /><br/>
    <form:input path="stdName" value="${sr.stdName}" /><br/>
    <form:input path="stdFilename" value="${sr.stdFilename}" /><br/>

    <form:input path="reservDate" id="datepicker" value="${sr.reservDate}" /><br/>
    <form:input path="userId" value="${sr.userId}" /><br/>
    <form:input path="userName" value="${sr.userName}" /><br/>
    <form:input path="userPhone" value="${sr.userPhone}" /><br/>

    <form:input path="teamId" value="${sr.teamId}" /><br/>
    <form:input path="teamName" value="${sr.teamName}" /><br/>

    <form:input path="memNumber" type="number" value="${sr.memNumber}" /><br/>
    <form:input path="bookingFee" type="number" value="${sr.bookingFee}" /><br/>

    <form:input path="bookingStatus" value="${sr.bookingStatus}" /><br/>
    <form:checkbox path="isPaid" /> Paid<br/>
    <input type="submit" value="Confirm Reservation" />
</form:form>
 <script>
 $(function() {
 	$(".datetimepicker").datetimepicker({ 
 		format: "Y-m-d H:i",
 		minDate : 0,
 		minTime: '09:00', // 9시부터 선택 가능
        maxTime: '18:00', // 18시까지 선택 가능
 	});
 });
 </script>
</body>
</html>