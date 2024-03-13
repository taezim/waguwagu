<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>qna 페이지</h3>
	<form:form modelAttribute="classplus">
		<p> 번호 : <form:input path="number"/> <!-- path 는 DTO 객체의 변수 -->
		<p> 내용 : <form:input path="content" cols="50" rows="2"/>
		<p> email : <form:input path="email"/>
		<p> 날짜 : <form:textarea path="date"/>
		<p> classnum : <form:input path="classid"/>
			<input type="submit" value="등록"/>
	</form:form>
	
</body>
</html>