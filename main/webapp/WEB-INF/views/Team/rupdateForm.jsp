<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
    <h3>결과 수정 페이지</h3>

    <form:form modelAttribute="updateWinning" action="./update?id=${winning.teamId}" class="form-horizontal" enctype="multipart/form-data">
        <p>승리정보 ID: <form:input path="winningId" value="${winning.winningId}"/></p>
        <p>구단 ID : <form:input path="teamId" value="${winning.teamId}"/></p>
        <p>날짜 : <form:input path="date" value="${winning.date}"/></p>	
        <div class="form-group row">
				<label class="col-sm-2 control-label">결과</label>
				<div class="col-sm-3">
					<form:radiobutton path="result" value="Win" class="form-control" />승리
					<form:radiobutton path="result" value="Tie" class="form-control" />무승부
					<form:radiobutton path="result" value="Lose" class="form-control" />패배
				</div>
		</div>
        <div class="form-group row">
            <input type="submit" class="btn btn-primary" value="수정"/>
            <a href="<c:url value='/team/result'/>" class="btn btn-primary">취소</a>
        </div>
    </form:form>
</body>
</html>