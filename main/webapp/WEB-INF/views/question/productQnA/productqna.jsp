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
			<p><b>번호 : </b><span class="badge badge-info">${productqna.number}</span>
			<p><b>내용 : ${productqna.content}</b>
			<p><b>email</b> : ${productqna.email}
			<h4>날짜 : ${productqna.date}</h4>
			<br>
			<form:form name="addForm" method="put">
			<p><a href="javascript:addToCart('../cart/add/${productqna.productid}')" class="btn btn-primary">도서주문 &raquo;</a>
			<a href="<c:url value="/cart"/>" class="btn btn-warning">장바구니 &raquo;</a>
			<a href="<c:url value="/productquestion"/>" class="btn btn-secondary">도서 목록 &raquo;</a>
			<sec:authorize access="isAuthenticated()">
				<a href="<c:url value="/productquestion/productupdate?productid=${productqna.productid}" />" class="btn btn-success">수정&raquo;</a>
				<a href="<c:url value="javascript:deleteConfirm('${productqna.productid}')" />" class="btn btn-danger">삭제 &raquo;</a>
				
			</sec:authorize>
			</form:form>
		</div>
		</div>
		<hr>

	</div>
	<script>
	function deleteConfirm(productid)
	{
		if(confirm("삭제하시겠습니까?")==true) location.href = "./productdelete?productid=" +productid;
		else return;	
	}
	</script>
</body>
</html>