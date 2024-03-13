<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- login.html -->
<form action="/waguwagu/member/login" method="post">
    <label for="memberId">회원 ID:</label>
    <input type="text" id="memberId" name="memberId" required>
    <br>
    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" required>
    <br>
    <input type="submit" value="로그인">
</form>
</body>
</html>