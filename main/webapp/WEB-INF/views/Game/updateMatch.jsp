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
	<h3>수정 페이지</h3>
	<div class="col-md-4">
		<img src="<c:url value='/resources/images/${match.fileName}'/>" alt="image" style="width: 20%"/>
	</div>
	<form:form modelAttribute="updateMatch" action="./update?id=${match.gameId}" class="form-horizontal" enctype="multipart/form-data" method="post">
		<p> 게임 아이디 : <form:input path="gameId" value="${match.gameId}" readonly="readonly"/>
		<p> 팀 아이디 : <form:input path="teamId" value="${match.teamId1}"/> <!-- path 는 DTO 객체의 변수 -->		
		<p> 팀 이름 : <form:input path="teamName" value="${match.teamName}"/>	
		<p> 예약자 아이디 : <form:input path="userId" value="${match.userId}"/>
		<p> 예약자명 : <form:input path="userName" value="${match.userName}"/>
		<p> 예약자 번호 : <form:input path="userNumber" value="${match.userNumber}"/>
		<div class="col-sm-10">
			이미지<form:input path="gameImage" type="file" class="form-control"/>
		</div>
		<div class="form-group row">
			<input type="submit" class="btn btn-primary" value="수정"/>
			<a href="<c:url value="/games"/>" class="btn btn-primary">취소</a>
		</div>
		${game }
	</form:form>

</body>
</html>