<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>구단 등록</title>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./home">Home</a>
			</div>
		</div>
	</nav>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">구단 등록</h1>
		</div>
	</div>
	
	<div class="container">
		<form:form modelAttribute="member" enctype="multipart/form-data" class="form-horizontal">
		<fieldset>
			<div class="form-group row">
				<label class="col-sm-2 control-label">구단ID</label>
				<div class="col-sm-3">
					<form:input path="teamId" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">구단명</label>
				<div class="col-sm-3">
					<form:input path="teamName" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">생년월일</label>
				<div class="col-sm-3">
					<form:input type="date" path="birth" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">성별</label>
				<div class="col-sm-3">
					<form:radiobutton path="sex" value="남성" class="form-control" />남성
					<form:radiobutton path="sex" value="여성" class="form-control" />여성
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">인원수</label>
				<div class="col-sm-3">
					<form:input path="memberNumber" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">부상정보</label>
				<div class="col-sm-5">
					<form:textarea path="injury" cols="50" rows="2" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">수강강의</label>
				<div class="col-sm-3">
					<form:input path="classId" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">코치번호</label>
				<div class="col-sm-3">
					<form:input path="teacherId" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">개인성적</label>
				<div class="col-sm-3">
					<form:input path="personalRecord" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="등록하기" />
				<input type="reset" class="btn btn-primary" value="다시쓰기" />
				</div>
			</div>
		</fieldset>
		</form:form>
		<hr>
	<footer>
		<p>&copy; Member</p>
	</footer>	
	</div>
</body>
</html>