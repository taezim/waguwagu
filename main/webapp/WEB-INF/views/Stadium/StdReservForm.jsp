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

<title>Reservation Form</title>
</head>
<body>

<h2>Reservation Form</h2>

<form:form modelAttribute="stdReservation"  method="post" >
	<h1>대여할 경기장 정보</h1>
	<div class="col-md-4">
     <c:choose>
         <c:when test="${std.getStdImage() == null}">
            <img src="<c:url value='/resources/images/${std.fileName}'/>" style="width: 50%"/>
         	<form:input type="hidden" path="stdFilename" value="${std.fileName}"/>
         </c:when>
         <c:otherwise>
            <img src="<c:url value='/resources/images/${std.fileName}'/>" style="width: 50%"/>
         	<form:input type="hidden" path="stdFilename" value="${std.fileName}"/>
         </c:otherwise>
      </c:choose>
	</div>

<form:input path="stdId" placeholder="Stadium ID" type="text" value="${std.stadiumId}" /><br/>
<form:input path="stdName" placeholder="Stadium Name" type="text" value="${std.stdName}"/><br/>


<form:input type='text' class='datetimepicker' path="reservDate"  style='width:140px;'/>

<form:input path="userId" placeholder="User ID" type="text"  value="${id}" /><br/>
<form:input path="userName" placeholder="User Name" type="text" /><br/>
<form:input path="userPhone" placeholder="User Phone" type="text" /><br/>

<form:input path="teamId" placeholder="Team ID" type="text" /><br/>
<form:input path="teamName" placeholder="Team Name" type="text" /><br/>

<form:input path="memNumber" placeholder="Member Number" type="number" /><br/>
<form:input path="bookingFee" placeholder="Booking Fee" type="number" /><br/>

<form:input path="bookingStatus" placeholder="Booking Status" type="text" /><br/>
<form:checkbox path="isPaid" /> Paid<br/>
<input type="submit" value="Submit Reservation" />
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