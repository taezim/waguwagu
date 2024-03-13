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
<h3>평균점수 : ${avgScore }</h3>
<c:forEach var="hospitalReview" items="${hospitalReviews}">
---------------------------------------------------------------
    <div>
        <p>리뷰 ID: ${hospitalReview.reviewId}</p>
        <p>병원 ID: ${hospitalReview.hospitalId}</p>
        <p>사용자 ID : ${hospitalReview.userId}</p>
		<p>작성날짜 : ${hospitalReview.reviewDate}</p>
		<p>리뷰점수 : ${hospitalReview.reviewRating}</p>
	</div>	
</c:forEach>
	<%-- <div class="col-md-4">
		<c:choose>
			<c:when test="${review.getReviewImage() == null}">
				<img src="<c:url value='/resources/images/${review.fileName}'/>" style="width: 50%"/>
			</c:when>
			<c:otherwise>
				<img src="<c:url value='/resources/images/${review.fileName}'/>" style="width: 50%"/>
			</c:otherwise>
		</c:choose>
	</div>
    <div>
        <p>리뷰 ID: ${review.reviewId}</p>
        <p>병원 ID: ${review.hospitalId}</p>
        <p>사용자 ID : ${review.userId}</p>
		<p>작성날짜 : ${review.reviewDate}</p>
		<p>리뷰점수 : ${review.reviewRating}</p>
		<p>리뷰내용 : ${review.reviewContent}</p>		
 --%>
		<form:form name="addForm" method="put">        	
		    <a href='<c:url value="/hospital/review/update?id=${review.reviewId}"/>' class="btn btn-success">수정&raquo;</a>
		    <a href="<c:url value='/hospital/review/delete?id=${review.reviewId}'/>" class="btn btn-danger" onclick="return deleteConfirm('${hospital.hospitalId}')">삭제 &raquo;</a>
		    <a href="<c:url value='/hospital/review/review?id=${review.reviewId}'/>" class="btn btn-success">리뷰&raquo;</a>    
		</form:form>
	</div>
    <hr>
		
</body>
</html>