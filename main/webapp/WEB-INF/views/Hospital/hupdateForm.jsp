<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h3>병원 수정 페이지</h3>
	<div class="col-md-4">
		<img src="<c:url value='/resources/images/${hospital.fileName}'/>" alt="image" style="width: 50%"/>
	</div>
	<form:form modelAttribute="updateHospital" action="./update?id=${hospital.hospitalId}" class="form-horizontal" enctype="multipart/form-data">
		<p> 병원 아이디 : <form:input path="hospitalId" value="${hospital.hospitalId}"/> <!-- path 는 DTO 객체의 변수 -->
		<p> 병원 이름 : <form:input path="hospitalName" value="${hospital.hospitalName}"/>
		<p> 위치 : <form:input path="hospitalPlace" value="${hospital.hospitalPlace}"/>
		<p> 전화번호 : <form:input path="hospitalNumber" value="${hospital.hospitalNumber}"/>
		<p> 진료과목 : <form:input path="hospitalSubject" value="${hospital.hospitalSubject}"/>
		<div class="col-sm-10">
			이미지<form:input path="hospitalImage" type="file" class="form-control"/>
		</div>
		<div class="form-group row">
			<input type="submit" class="btn btn-primary" value="수정"/>
			<a href="<c:url value="/hospitals"/>" class="btn btn-primary">취소</a>
		</div>
	</form:form>
</div>
</body>
</html>