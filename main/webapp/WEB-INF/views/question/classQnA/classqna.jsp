<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
     
<!DOCTYPE html>

<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/controllers.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
      <div class="row">
		<div class="col-md-8">
			<br>
			<p><b>번호 : </b><span class="badge badge-info">${classqna.number}</span>
			<p><b>내용 : ${classqna.content}</b>
			<p><b>email</b> : ${classqna.email}
			<h4>날짜 : ${classqna.date}</h4>
			<br>
			<form:form name="addForm" method="put">
			<p><a href="javascript:addToCart('../cart/add/${classqna.classid}')" class="btn btn-primary">도서주문 &raquo;</a>
			<a href="<c:url value="/cart"/>" class="btn btn-warning">장바구니 &raquo;</a>
			<a href="<c:url value="/classquestion"/>" class="btn btn-secondary">도서 목록 &raquo;</a>
			<sec:authorize access="isAuthenticated()">
				<a href="<c:url value="/classquestion/classupdate?classid=${classqna.classid}" />" class="btn btn-success">수정&raquo;</a>
				<a href="<c:url value="javascript:deleteConfirm('${classqna.classid}')" />" class="btn btn-danger">삭제 &raquo;</a>
				
			</sec:authorize>
			</form:form>
		</div>
		</div>
		<hr>

	</div>
	<script>
	function deleteConfirm(classid)
	{
		if(confirm("삭제하시겠습니까?")==true) location.href = "./classdelete?classid=" +classid;
		else return;	
	}
	</script>
</body>
</html>