<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${stadiumList}" var="std">
	<div>
		<c:choose>
			<c:when test="${std.getStdImage()==null}">
				<img src="<c:url value='/resources/images/${std.fileName}.png'/>" style="width:50%"/>
			</c:when>
			<c:otherwise>
				<img src="<c:url value='/resources/images/${std.fileName}.png'/>" style="width:50%"/>
			</c:otherwise>
		</c:choose>
		${std.stadiumId}<br>
		${std.city}<br>
		${std.countryside}<br>
		${std.stdName}<br>
		${std.builtYear}
	 <p>
	 <a href="<c:url value="/stadiums/stadium?id=${std.stadiumId}"/>"class="btn btn-secondary" role="button">상세정보 &raquo;</a>
	</div>
</c:forEach>
</body>
</html>