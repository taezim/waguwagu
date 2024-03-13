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
<title>병원 정보</title>
</head>
<body>
    <h1>Result Page</h1>
    
	<c:forEach items="${dataList}" var="dataList">
	    <div>
	   		<p>-----------------------------------</p>
	        <!-- 필요한 내용 출력 -->
	        <p>병원명 : ${dataList.yadmNm }
	        <p>주소 : ${dataList.addr}</p>
	        <p>병원종류 : ${dataList.clCdNm}</p>
	        <p>전화번호 : ${dataList.telno}</p>
	    </div>
	</c:forEach>

    <div>
	    <!-- 페이지 전환을 위한 링크 -->
		<c:if test="${currentPage > 1}">
		    <a href="/sample?page=${currentPage - 1}">이전 페이지</a>
		</c:if>
		
		<span>현재 페이지: ${currentPage}</span>
		
		<c:if test="${(currentPage + 1) * 10 <= totalItemCount}">
		    <a href="/waguwagu/sample/list?page=${currentPage + 1}">다음 페이지</a>
		</c:if>
	</div>
</body>
</html>