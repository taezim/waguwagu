<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>경기장 등록</title>
</head>
<body>
	<h3>경기장 등록 페이지</h3>
	<form:form modelAttribute="addStadium"  enctype="multipart/form-data">
		<p> 상품 아이디 : <form:input path="stadiumId"/> <!-- path 는 DTO 객체의 변수 -->
		<p> 상품 이름 : <form:input path="city"/>
		<p> 상품 재고 : <form:input path="stdName"/>
		<p> 상품 설명 : <form:textarea path="countryside" cols="50" rows="2"/>
		<p> 숫자 : <form:input path="siteArea"/>
		<p> 숫자 : <form:input path="buildingArea"/>
		<p> 숫자 : <form:input path="totalArea"/>
		<p> 누적 주문수 : <form:input path="infieldMaterial"/>
		<p> 누적 주문수 : <form:input path="outfieldMaterial"/>
		<p> 숫자 : <form:input path="centerLength"/>	
		<p> 숫자 : <form:input path="baseLength"/>
		<p> 숫자 : <form:input path="seatsNumber"/>
		<p> 숫자: <form:input path="capacity"/>
		<p> 이미지 업로드: <form:input type="file" path="stdImage"/>
		<p> 준공연도 : <form:input path="builtYear"/>
			<input type="submit" value="등록"/>
	</form:form>
</body>
</html>