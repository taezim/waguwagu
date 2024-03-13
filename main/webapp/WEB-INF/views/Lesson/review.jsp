<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- form 사용을 위한 선언 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet" />
<script src="${pageContext.request.contextPath }/resources/js/controllers.js"></script>
<!-- 스크립트 사용을 위해 선언 -->
<title>리뷰</title>
</head>
<body>
<h2>리뷰</h2>


	<div class="col-md-4">
		<c:choose>
			<c:when test="${review.getReviewImage() == null}">
				<img src="<c:url value='/resources/images/${review.fileName}'/>" style="width: 20%"/>
			</c:when>
			<c:otherwise>
				<img src="<c:url value='/resources/images/${review.fileName}'/>" style="width: 20%"/>
			</c:otherwise>
		</c:choose>
	</div>
    <div>
        <p>리뷰 ID: ${review.reviewId}</p>
        <p>병원 ID: ${review.lessonId}</p>
        <p>사용자 ID : ${review.userId}</p>
		<p>작성날짜 : ${review.date}</p>
		<p>리뷰점수 : ${review.score}</p>
		<p>리뷰내용 : ${review.content}</p>		

		<form:form name="addForm" method="put">        	
		    <a href='<c:url value="/lesson/review/update?id=${review.reviewId}"/>' class="btn btn-success">수정&raquo;</a>
		    <a href="<c:url value='/lesson/review/delete?id=${review.reviewId}'/>" class="btn btn-danger" onclick="return deleteConfirm('${review.lessonId}')">삭제 &raquo;</a>
		    <a href="<c:url value='/lesson/review/review?id=${review.reviewId}'/>" class="btn btn-success">리뷰&raquo;</a>    
		</form:form>
	</div>
    <hr>
		
</body>
</html>