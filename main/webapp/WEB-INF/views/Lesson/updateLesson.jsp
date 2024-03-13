<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ŭ���� ����</title>
</head>
<body>
<div class="col-md-4 container">
   <form:form modelAttribute="updateLesson" action="./update?id=${lesson.classId}">
      <p> Ŭ���� �̸� : <form:input path="className" value="${lesson.className}"/>
      <p> Ŭ���� ���� : <form:input path="subject" value="${lesson.subject}"/>
      <p> ���� ��� : <form:input path="venue" value="${lesson.venue}"/>
      <p> ����� �̸� : <form:input path="managerName" value="${lesson.managerName}"/>
      <p> ����ó : <form:input path="tel" value="${lesson.tel}"/>
      <p> û�� ���� �ο� : <form:input path="auditors" value="${lesson.auditors}"/>
      <p> ������ : <form:input path="fees" value="${lesson.fees}"/>
      <p> Ŭ���� ���� : <form:textarea path="description" value="${lesson.description}" cols="50" rows="2"/>
         <input type="submit" value="���"/>
   </form:form>
</div>
</body>
</html>