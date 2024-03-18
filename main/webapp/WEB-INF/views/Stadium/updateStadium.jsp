<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>경기장 등록 페이지</h3>
	<form:form modelAttribute="addStadium" action="./update?id=${std.stadiumId}" class="form-horizontal" enctype="multipart/form-data">
		<p> 상품 아이디 : <form:input path="stadiumId" value="${std.stadiumId}"/> <!-- path 는 DTO 객체의 변수 -->
		<p> 상품 이름 : <form:input path="city" value="${std.city}"/>
		<p> 상품 재고 : <form:input path="stdName" value="${std.stdName}"/>
		<p> 상품 설명 : <form:textarea path="countryside" cols="50" rows="2" value="${std.countryside}"/>
		<p> 숫자 : <form:input path="siteArea"  value="${std.siteArea}"/>
		<p> 숫자 : <form:input path="buildingArea"  value="${std.buildingArea}"/>
		<p> 숫자 : <form:input path="totalArea"  value="${std.totalArea}"/>
		<p> 누적 주문수 : <form:input path="infieldMaterial" value="${std.infieldMaterial}"/>
		<p> 누적 주문수 : <form:input path="outfieldMaterial" value="${std.outfieldMaterial}"/>
		<p> 숫자 : <form:input path="centerLength" value="${std.centerLength}"/>	
		<p> 숫자 : <form:input path="baseLength" value="${std.baseLength}"/>
		<p> 숫자 : <form:input path="seatsNumber" value="${std.seatsNumber}"/>
		<p> 숫자: <form:input path="capacity" value="${std.capacity}"/>
		<p> 이미지 업로드: <form:input type="file" path="stdImage" value="${std.stdImage}"/>
		<p> 준공연도 : <form:input path="builtYear" value="${std.builtYear}"/>
			<input type="submit" value="등록"/>
	</form:form>
</body>
</html>