<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form modelAttribute="updatebattermodel" method="post">
		<p>선수 식별자: <form:input path="batterplayerID" value="${game12.getBatterplayerID()}" /></p>
		<p>경기 횟수: <form:input path="matches" value="${game12.getMatches()}" /></p>
		<p>타석 수: <form:input path="atBats" value="${game12.getAtBats()}" /></p>
		<p>타수 수: <form:input path="strokes" value="${game12.getStrokes()}" /></p>
		<p>득점 수: <form:input path="score" value="${game12.getScore()}" /></p>
		<p>안타 수: <form:input path="hits" value="${game12.getHits()}" /></p>
		<p>2루타 수: <form:input path="doubles" value="${game12.getDoubles()}" /></p>
		<p>3루타 수: <form:input path="triples" value="${game12.getTriples()}" /></p>
		<p>홈런 수: <form:input path="homeRuns" value="${game12.getHomeRuns()}" /></p>
		<p>타점 수: <form:input path="rbis" value="${game12.getRbis()}" /></p>
		<p>도루 수: <form:input path="stolenBases" value="${game12.getStolenBases()}" /></p>
		<p>병살타 수: <form:input path="doublePlays" value="${game12.getDoublePlays()}" /></p>
		<p>타율: <form:input path="battingAverage" value="${game12.getBattingAverage()}" /></p>
		<p>장타율: <form:input path="sluggingPercentage" value="${game12.getSluggingPercentage()}" /></p>
		<p>출루율: <form:input path="onBasePercentage" value="${game12.getOnBasePercentage()}" /></p>
		<input type="submit" value="등록" />
	</form:form>
</body>
</html>
