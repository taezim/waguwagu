<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>회원</title>
</head>
<body>
	<p>아이디 : ${member.memberId }
	<p>비밀번호 : ${member.password }
	<p>생년월일 : ${member.birth }
	<p>성별 : ${member.sex }
	<p>${member.fileName }
	<a href="<c:url value='/member/update?id=${member.memberId }'/>" class="btn btn-success">수정</a>
</body>
</html>