<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>클래스 수정</title>
</head>
<body>
<div class="col-md-4 container">
   <form:form modelAttribute="updateLesson" action="./update?id=${lesson.classId}">
      <p> 클래스 이름 : <form:input path="className" value="${lesson.className}"/>
      <p> 클래스 종류 : <form:input path="subject" value="${lesson.subject}"/>
      <p> 개최 장소 : <form:input path="venue" value="${lesson.venue}"/>
      <p> 담당자 이름 : <form:input path="managerName" value="${lesson.managerName}"/>
      <p> 연락처 : <form:input path="tel" value="${lesson.tel}"/>
      <p> 청강 가능 인원 : <form:input path="auditors" value="${lesson.auditors}"/>
      <p> 수강료 : <form:input path="fees" value="${lesson.fees}"/>
      <p> 클래스 설명 : <form:textarea path="description" value="${lesson.description}" cols="50" rows="2"/>
         <input type="submit" value="등록"/>
   </form:form>
</div>
</body>
</html>