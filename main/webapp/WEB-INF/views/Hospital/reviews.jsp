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
<title>리뷰 목록</title>
</head>
<body>
<h2>리뷰 목록</h2>

<c:forEach var="hospitalReview" items="${reviewList}">
    <div>
		<c:choose>
			<c:when test="${hospitalReview.getReviewImage() == null}">
				<img src="<c:url value='/resources/images/${hospitalReview.fileName}'/>" style="width: 50%"/>
			</c:when>
			<c:otherwise>
				<img src="<c:url value='/resources/images/${hospitalReview.fileName}'/>" style="width: 50%"/>
			</c:otherwise>
		</c:choose>
	</div>
    <div>
        <p>리뷰 ID: ${hospitalReview.reviewId}</p>
        <p>병원 ID: ${hospitalReview.hospitalId}</p>
        <p>사용자 ID : ${hospitalReview.userId}</p>
		<p>작성날짜 : ${hospitalReview.reviewDate}</p>
		<p>리뷰점수 : ${hospitalReview.reviewRating}</p>		
		<p><a href="<c:url value="/hospital/review/review?id=${hospitalReview.reviewId}"/>"class="btn btn-secondary" role="button">상세정보 &raquo;</a>
		<p><a href="<c:url value="/hospital/review/reviews?id=${hospitalReview.hospitalId}"/>"class="btn btn-secondary" role="button">병원리뷰 &raquo;</a>	    
	    </div>
	    <hr>
</c:forEach>
</body>
</html>