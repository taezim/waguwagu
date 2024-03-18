<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>����� ��� ������</h3>
	<form:form modelAttribute="addStadium" action="./update?id=${std.stadiumId}" class="form-horizontal" enctype="multipart/form-data">
		<p> ��ǰ ���̵� : <form:input path="stadiumId" value="${std.stadiumId}"/> <!-- path �� DTO ��ü�� ���� -->
		<p> ��ǰ �̸� : <form:input path="city" value="${std.city}"/>
		<p> ��ǰ ��� : <form:input path="stdName" value="${std.stdName}"/>
		<p> ��ǰ ���� : <form:textarea path="countryside" cols="50" rows="2" value="${std.countryside}"/>
		<p> ���� : <form:input path="siteArea"  value="${std.siteArea}"/>
		<p> ���� : <form:input path="buildingArea"  value="${std.buildingArea}"/>
		<p> ���� : <form:input path="totalArea"  value="${std.totalArea}"/>
		<p> ���� �ֹ��� : <form:input path="infieldMaterial" value="${std.infieldMaterial}"/>
		<p> ���� �ֹ��� : <form:input path="outfieldMaterial" value="${std.outfieldMaterial}"/>
		<p> ���� : <form:input path="centerLength" value="${std.centerLength}"/>	
		<p> ���� : <form:input path="baseLength" value="${std.baseLength}"/>
		<p> ���� : <form:input path="seatsNumber" value="${std.seatsNumber}"/>
		<p> ����: <form:input path="capacity" value="${std.capacity}"/>
		<p> �̹��� ���ε�: <form:input type="file" path="stdImage" value="${std.stdImage}"/>
		<p> �ذ����� : <form:input path="builtYear" value="${std.builtYear}"/>
			<input type="submit" value="���"/>
	</form:form>
</body>
</html>