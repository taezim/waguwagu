<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<title>리뷰 등록</title>
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
			<h1 class="display-3">리뷰 등록</h1>
		</div>
	</div>
	
	<div class="container">
		<form:form modelAttribute="addReview" enctype="multipart/form-data" class="form-horizontal">
		<fieldset>
			<div class="form-group row">
				<label class="col-sm-2 control-label">리뷰ID</label>
				<div class="col-sm-3">
					<form:input path="reviewId" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">병원아이디</label>
				<div class="col-sm-3">
					<form:input path="hospitalId" class="form-control" value="${hospital.id}"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">사용자아이디</label>
				<div class="col-sm-3">
					<form:input path="userId" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">리뷰작성날짜</label>
				<div class="col-sm-3">
					<form:input type="date" path="reviewDate" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">리뷰점수</label>
				<div class="col-sm-3">
					<form:input path="reviewRating" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
			    <label class="col-sm-2 control-label">리뷰내용</label>
			    <div class="col-sm-5">
					<form:textarea path="reviewContent" cols="50" rows="2" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">리뷰사진</label>
				<div class="col-sm-7">
					<form:input path="reviewImage" type="file" class="form-control" />
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
		<p>&copy; review</p>
	</footer>	
	</div>
</body>
</html>