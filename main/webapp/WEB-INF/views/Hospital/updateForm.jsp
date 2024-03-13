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
<div class="container">
<h3>리뷰 수정 페이지</h3>
	<div class="col-md-4">
		<img src="<c:url value='/resources/images/${review.fileName}'/>" alt="image" style="width: 50%"/>
	</div>
	<form:form modelAttribute="updateReview" action="./update?id=${review.reviewId}" class="form-horizontal" enctype="multipart/form-data">
		<p> 리뷰 아이디 : <form:input path="reviewId" value="${review.reviewId}"/> <!-- path 는 DTO 객체의 변수 -->
		<p> 병원 아이디 : <form:input path="hospitalId" value="${review.hospitalId}"/>
		<p> 사용자 아이디 : <form:input path="userId" value="${review.userId}"/>
		<p> 리뷰작성날짜 : <form:input path="reviewDate" value="${review.reviewDate}"/>
		<p> 리뷰내용 : <form:input path="reviewContent" value="${review.reviewContent}"/>
		<p> 리뷰점수 : <form:input path="reviewRating" value="${review.reviewRating}"/>
		<div class="col-sm-10">
			이미지<form:input path="reviewImage" type="file" class="form-control"/>
		</div>
		<div class="form-group row">
			<input type="submit" class="btn btn-primary" value="수정"/>
			<a href="<c:url value="/Hospital/reviews"/>" class="btn btn-primary">취소</a>
		</div>
	</form:form>
</div>
</body>
</html>