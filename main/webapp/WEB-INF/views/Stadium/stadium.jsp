<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	${std.stadiumId}<br/>
${std.city}<br/>
${std.stdName}<br/>
${std.countryside}<br/>
${std.ownership}<br/>
${std.manager}<br/>
${std.siteArea}<br/>
${std.buildingArea}<br/>
${std.totalArea}<br/>
${std.infieldMaterial}<br/>
${std.outfieldMaterial}<br/>
${std.centerLength}<br/>
${std.baseLength}<br/>
${std.seatsNumber}<br/>
${std.capacity}<br/>
${std.builtYear}<br/>
  <a href="<c:url value='/stadium/reserve?stadiumId=${std.stadiumId}'/>"class="btn btn-warning">경기장 예약 &raquo;</a>
</body>
</html>